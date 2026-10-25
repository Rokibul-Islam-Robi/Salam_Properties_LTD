<?php
require_once __DIR__ . '/../config.php';
require_admin();
$currentPage = 'types';
$pageTitle = 'Property Types';
$data = cms_data();

if (!isset($data['property_types'])) $data['property_types'] = [];

$icons_list = ['bi-houses','bi-building','bi-building-fill','bi-house-heart','bi-briefcase','bi-geo-alt','bi-shop','bi-hospital','bi-building-fill-gear','bi-tree','bi-signpost-2'];

// Handle Actions
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';

    if ($action === 'add') {
        $name = trim($_POST['name'] ?? '');
        $icon = trim($_POST['icon'] ?? 'bi-houses');
        if ($name !== '') {
            $maxId = 0;
            foreach ($data['property_types'] as $t) { if ($t['id'] > $maxId) $maxId = $t['id']; }
            $data['property_types'][] = ['id' => $maxId + 1, 'name' => $name, 'icon' => $icon, 'status' => 'active'];
            cms_save($data);
            header('Location: types.php?msg=added'); exit;
        }
    } elseif ($action === 'edit') {
        $id = (int)($_POST['id'] ?? 0);
        $name = trim($_POST['name'] ?? '');
        $icon = trim($_POST['icon'] ?? 'bi-houses');
        foreach ($data['property_types'] as &$t) {
            if ($t['id'] === $id) {
                $t['name'] = $name;
                $t['icon'] = $icon;
                break;
            }
        }
        unset($t);
        cms_save($data);
        header('Location: types.php?msg=updated'); exit;
    } elseif ($action === 'toggle') {
        $id = (int)($_POST['id'] ?? 0);
        foreach ($data['property_types'] as &$t) {
            if ($t['id'] === $id) {
                $t['status'] = ($t['status'] ?? 'active') === 'active' ? 'inactive' : 'active';
                break;
            }
        }
        unset($t);
        cms_save($data);
        header('Location: types.php?msg=toggled'); exit;
    } elseif ($action === 'delete') {
        $id = (int)($_POST['id'] ?? 0);
        $data['property_types'] = array_values(array_filter($data['property_types'], fn($t) => $t['id'] !== $id));
        cms_save($data);
        header('Location: types.php?msg=deleted'); exit;
    }
}

$msg = $_GET['msg'] ?? '';
require __DIR__ . '/includes/layout_header.php';
?>

<div class="page-title-box">
    <div>
        <h1 class="page-title">Property Types</h1>
        <p class="page-subtitle">Manage property categories for your real estate listings.</p>
    </div>
    <button class="btn btn-primary-corporate" data-bs-toggle="modal" data-bs-target="#addTypeModal">
        <i class="bi bi-plus-lg me-1"></i> Add Type
    </button>
</div>

<?php if ($msg): ?>
<div class="alert alert-success alert-dismissible fade show" role="alert" style="border-radius:var(--radius-sm);font-size:13.5px;">
    <i class="bi bi-check-circle me-1"></i>
    <?php
        if ($msg === 'added') echo 'Property type added successfully.';
        elseif ($msg === 'updated') echo 'Property type updated.';
        elseif ($msg === 'toggled') echo 'Status updated.';
        elseif ($msg === 'deleted') echo 'Property type deleted.';
    ?>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<?php endif; ?>

<div class="corp-card">
    <div class="corp-card-header">
        <h3 class="corp-card-title"><i class="bi bi-collection text-primary"></i> All Property Types</h3>
        <span class="text-muted" style="font-size:13px;"><?= count($data['property_types']) ?> type(s)</span>
    </div>
    <div class="corp-card-body p-0">
        <table class="table-corporate">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Icon</th>
                    <th>Type Name</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($data['property_types'])): ?>
                <tr><td colspan="5" class="text-center text-muted py-4">No property types found.</td></tr>
                <?php else: foreach ($data['property_types'] as $idx => $type): ?>
                <tr>
                    <td><?= $idx + 1 ?></td>
                    <td><i class="bi <?= e($type['icon'] ?? 'bi-houses') ?>" style="font-size:22px;color:var(--corp-accent);"></i></td>
                    <td><strong><?= e($type['name']) ?></strong></td>
                    <td>
                        <span class="badge-status <?= ($type['status'] ?? 'active') === 'active' ? 'badge-active' : 'badge-inactive' ?>">
                            <?= ucfirst(e($type['status'] ?? 'active')) ?>
                        </span>
                    </td>
                    <td>
                        <div class="d-flex gap-2">
                            <button class="btn btn-sm btn-outline-corporate" data-bs-toggle="modal" data-bs-target="#editTypeModal<?= $type['id'] ?>">
                                <i class="bi bi-pencil"></i>
                            </button>
                            <form method="post" style="display:inline;">
                                <input type="hidden" name="action" value="toggle">
                                <input type="hidden" name="id" value="<?= $type['id'] ?>">
                                <button class="btn btn-sm <?= ($type['status'] ?? 'active') === 'active' ? 'btn-success-corporate' : 'btn-outline-corporate' ?>">
                                    <i class="bi <?= ($type['status'] ?? 'active') === 'active' ? 'bi-toggle-on' : 'bi-toggle-off' ?>"></i>
                                </button>
                            </form>
                            <form method="post" style="display:inline;" onsubmit="return confirm('Delete this type?');">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<?= $type['id'] ?>">
                                <button class="btn btn-sm btn-danger-corporate"><i class="bi bi-trash"></i></button>
                            </form>
                        </div>
                    </td>
                </tr>

                <!-- Edit Modal -->
                <div class="modal fade" id="editTypeModal<?= $type['id'] ?>" tabindex="-1">
                    <div class="modal-dialog">
                        <form method="post" class="modal-content" style="border-radius:var(--radius-lg);">
                            <div class="modal-header border-0 pb-0">
                                <h5 class="modal-title fw-bold">Edit Property Type</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="id" value="<?= $type['id'] ?>">
                                <div class="mb-3">
                                    <label class="form-label-corporate">Type Name</label>
                                    <input type="text" name="name" class="form-control form-control-corporate" value="<?= e($type['name']) ?>" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label-corporate">Icon</label>
                                    <select name="icon" class="form-select form-select-corporate">
                                        <?php foreach ($icons_list as $ic): ?>
                                        <option value="<?= $ic ?>" <?= ($type['icon'] ?? '') === $ic ? 'selected' : '' ?>><?= $ic ?></option>
                                        <?php endforeach; ?>
                                    </select>
                                </div>
                            </div>
                            <div class="modal-footer border-0 pt-0">
                                <button type="button" class="btn btn-outline-corporate" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary-corporate">Save Changes</button>
                            </div>
                        </form>
                    </div>
                </div>
                <?php endforeach; endif; ?>
            </tbody>
        </table>
    </div>
</div>

<!-- Add Type Modal -->
<div class="modal fade" id="addTypeModal" tabindex="-1">
    <div class="modal-dialog">
        <form method="post" class="modal-content" style="border-radius:var(--radius-lg);">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold">Add New Property Type</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="action" value="add">
                <div class="mb-3">
                    <label class="form-label-corporate">Type Name</label>
                    <input type="text" name="name" class="form-control form-control-corporate" placeholder="e.g. Residential, Commercial, Villa" required>
                </div>
                <div class="mb-3">
                    <label class="form-label-corporate">Icon</label>
                    <select name="icon" class="form-select form-select-corporate">
                        <?php foreach ($icons_list as $ic): ?>
                        <option value="<?= $ic ?>"><?= $ic ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
            </div>
            <div class="modal-footer border-0 pt-0">
                <button type="button" class="btn btn-outline-corporate" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary-corporate">Add Type</button>
            </div>
        </form>
    </div>
</div>

<?php require __DIR__ . '/includes/layout_footer.php'; ?>
