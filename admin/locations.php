<?php
require_once __DIR__ . '/../config.php';
require_admin();
$currentPage = 'locations';
$pageTitle = 'Locations';
$data = cms_data();

if (!isset($data['locations'])) $data['locations'] = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';

    if ($action === 'add') {
        $name = trim($_POST['name'] ?? '');
        $country = trim($_POST['country'] ?? '');
        if ($name !== '') {
            $maxId = 0;
            foreach ($data['locations'] as $l) { if ($l['id'] > $maxId) $maxId = $l['id']; }
            $data['locations'][] = ['id' => $maxId + 1, 'name' => $name, 'country' => $country, 'status' => 'active'];
            cms_save($data);
            header('Location: locations.php?msg=added'); exit;
        }
    } elseif ($action === 'edit') {
        $id = (int)($_POST['id'] ?? 0);
        foreach ($data['locations'] as &$l) {
            if ($l['id'] === $id) {
                $l['name'] = trim($_POST['name'] ?? $l['name']);
                $l['country'] = trim($_POST['country'] ?? $l['country']);
                break;
            }
        }
        unset($l);
        cms_save($data);
        header('Location: locations.php?msg=updated'); exit;
    } elseif ($action === 'toggle') {
        $id = (int)($_POST['id'] ?? 0);
        foreach ($data['locations'] as &$l) {
            if ($l['id'] === $id) {
                $l['status'] = ($l['status'] ?? 'active') === 'active' ? 'inactive' : 'active';
                break;
            }
        }
        unset($l);
        cms_save($data);
        header('Location: locations.php?msg=toggled'); exit;
    } elseif ($action === 'delete') {
        $id = (int)($_POST['id'] ?? 0);
        $data['locations'] = array_values(array_filter($data['locations'], fn($l) => $l['id'] !== $id));
        cms_save($data);
        header('Location: locations.php?msg=deleted'); exit;
    }
}

$msg = $_GET['msg'] ?? '';
require __DIR__ . '/includes/layout_header.php';
?>

<div class="page-title-box">
    <div>
        <h1 class="page-title">Locations</h1>
        <p class="page-subtitle">Manage property locations and regions for your listings.</p>
    </div>
    <button class="btn btn-primary-corporate" data-bs-toggle="modal" data-bs-target="#addLocationModal">
        <i class="bi bi-plus-lg me-1"></i> Add Location
    </button>
</div>

<?php if ($msg): ?>
<div class="alert alert-success alert-dismissible fade show" role="alert" style="border-radius:var(--radius-sm);font-size:13.5px;">
    <i class="bi bi-check-circle me-1"></i>
    <?php
        if ($msg === 'added') echo 'Location added successfully.';
        elseif ($msg === 'updated') echo 'Location updated.';
        elseif ($msg === 'toggled') echo 'Status updated.';
        elseif ($msg === 'deleted') echo 'Location deleted.';
    ?>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<?php endif; ?>

<div class="corp-card">
    <div class="corp-card-header">
        <h3 class="corp-card-title"><i class="bi bi-geo-alt text-success"></i> All Locations</h3>
        <span class="text-muted" style="font-size:13px;"><?= count($data['locations']) ?> location(s)</span>
    </div>
    <div class="corp-card-body p-0">
        <table class="table-corporate">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Location Name</th>
                    <th>Country</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($data['locations'])): ?>
                <tr><td colspan="5" class="text-center text-muted py-4">No locations found.</td></tr>
                <?php else: foreach ($data['locations'] as $idx => $loc): ?>
                <tr>
                    <td><?= $idx + 1 ?></td>
                    <td>
                        <div class="d-flex align-items-center gap-2">
                            <div class="rounded-circle d-flex align-items-center justify-content-center" style="width:32px;height:32px;background:#ecfdf5;color:#059669;font-size:14px;">
                                <i class="bi bi-geo-alt-fill"></i>
                            </div>
                            <strong><?= e($loc['name']) ?></strong>
                        </div>
                    </td>
                    <td><?= e($loc['country'] ?? '') ?></td>
                    <td>
                        <span class="badge-status <?= ($loc['status'] ?? 'active') === 'active' ? 'badge-active' : 'badge-inactive' ?>">
                            <?= ucfirst(e($loc['status'] ?? 'active')) ?>
                        </span>
                    </td>
                    <td>
                        <div class="d-flex gap-2">
                            <button class="btn btn-sm btn-outline-corporate" data-bs-toggle="modal" data-bs-target="#editLocModal<?= $loc['id'] ?>">
                                <i class="bi bi-pencil"></i>
                            </button>
                            <form method="post" style="display:inline;">
                                <input type="hidden" name="action" value="toggle">
                                <input type="hidden" name="id" value="<?= $loc['id'] ?>">
                                <button class="btn btn-sm <?= ($loc['status'] ?? 'active') === 'active' ? 'btn-success-corporate' : 'btn-outline-corporate' ?>">
                                    <i class="bi <?= ($loc['status'] ?? 'active') === 'active' ? 'bi-toggle-on' : 'bi-toggle-off' ?>"></i>
                                </button>
                            </form>
                            <form method="post" style="display:inline;" onsubmit="return confirm('Delete this location?');">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<?= $loc['id'] ?>">
                                <button class="btn btn-sm btn-danger-corporate"><i class="bi bi-trash"></i></button>
                            </form>
                        </div>
                    </td>
                </tr>
                <div class="modal fade" id="editLocModal<?= $loc['id'] ?>" tabindex="-1">
                    <div class="modal-dialog">
                        <form method="post" class="modal-content" style="border-radius:var(--radius-lg);">
                            <div class="modal-header border-0 pb-0">
                                <h5 class="modal-title fw-bold">Edit Location</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="action" value="edit">
                                <input type="hidden" name="id" value="<?= $loc['id'] ?>">
                                <div class="mb-3">
                                    <label class="form-label-corporate">Location Name</label>
                                    <input type="text" name="name" class="form-control form-control-corporate" value="<?= e($loc['name']) ?>" required>
                                </div>
                                <div class="mb-3">
                                    <label class="form-label-corporate">Country</label>
                                    <input type="text" name="country" class="form-control form-control-corporate" value="<?= e($loc['country'] ?? '') ?>">
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

<!-- Add Location Modal -->
<div class="modal fade" id="addLocationModal" tabindex="-1">
    <div class="modal-dialog">
        <form method="post" class="modal-content" style="border-radius:var(--radius-lg);">
            <div class="modal-header border-0 pb-0">
                <h5 class="modal-title fw-bold">Add New Location</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="action" value="add">
                <div class="mb-3">
                    <label class="form-label-corporate">Location Name</label>
                    <input type="text" name="name" class="form-control form-control-corporate" placeholder="e.g. Gulshan, Dhaka" required>
                </div>
                <div class="mb-3">
                    <label class="form-label-corporate">Country</label>
                    <input type="text" name="country" class="form-control form-control-corporate" placeholder="e.g. Bangladesh">
                </div>
            </div>
            <div class="modal-footer border-0 pt-0">
                <button type="button" class="btn btn-outline-corporate" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-primary-corporate">Add Location</button>
            </div>
        </form>
    </div>
</div>

<?php require __DIR__ . '/includes/layout_footer.php'; ?>
