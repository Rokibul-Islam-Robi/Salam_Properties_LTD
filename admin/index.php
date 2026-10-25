<?php
require_once __DIR__ . '/../config.php';
require_admin();
$currentPage = 'dashboard';
$pageTitle = 'Dashboard';
$data = cms_data();

$totalProperties = count($data['properties'] ?? []);
$totalTypes = count($data['property_types'] ?? []);
$totalLocations = count($data['locations'] ?? []);
$totalInquiries = count($data['inquiries'] ?? []);
$totalPages = count($data['pages'] ?? []);

$activeProperties = 0;
$featuredProperties = 0;
foreach ($data['properties'] ?? [] as $p) {
    if (($p['status'] ?? '') === 'active') $activeProperties++;
    if (!empty($p['featured'])) $featuredProperties++;
}

$newInquiries = 0;
foreach ($data['inquiries'] ?? [] as $inq) {
    if (($inq['status'] ?? '') === 'new') $newInquiries++;
}

$recentProperties = array_slice(array_reverse($data['properties'] ?? []), 0, 5);
$recentInquiries = array_slice(array_reverse($data['inquiries'] ?? []), 0, 5);

require __DIR__ . '/includes/layout_header.php';
?>

<!-- Dashboard Stats -->
<div class="page-title-box">
    <div>
        <h1 class="page-title">Dashboard Overview</h1>
        <p class="page-subtitle">Welcome back, <?= e(ADMIN_USER) ?>. Here's your real estate portfolio summary.</p>
    </div>
    <span class="text-muted" style="font-size:13px;">
        <i class="bi bi-calendar3 me-1"></i> <?= date('l, F j, Y') ?>
    </span>
</div>

<div class="stats-grid">
    <a href="properties.php" class="stat-card-modern text-decoration-none">
        <div class="stat-info">
            <div class="stat-label">Total Properties</div>
            <div class="stat-number"><?= $totalProperties ?></div>
        </div>
        <div class="stat-icon-wrapper icon-blue">
            <i class="bi bi-house-door-fill"></i>
        </div>
    </a>
    <a href="types.php" class="stat-card-modern text-decoration-none">
        <div class="stat-info">
            <div class="stat-label">Property Types</div>
            <div class="stat-number"><?= $totalTypes ?></div>
        </div>
        <div class="stat-icon-wrapper icon-purple">
            <i class="bi bi-collection-fill"></i>
        </div>
    </a>
    <a href="locations.php" class="stat-card-modern text-decoration-none">
        <div class="stat-info">
            <div class="stat-label">Locations</div>
            <div class="stat-number"><?= $totalLocations ?></div>
        </div>
        <div class="stat-icon-wrapper icon-green">
            <i class="bi bi-geo-alt-fill"></i>
        </div>
    </a>
    <a href="inquiries.php" class="stat-card-modern text-decoration-none">
        <div class="stat-info">
            <div class="stat-label">Client Inquiries</div>
            <div class="stat-number"><?= $totalInquiries ?></div>
        </div>
        <div class="stat-icon-wrapper icon-amber">
            <i class="bi bi-chat-left-dots-fill"></i>
        </div>
    </a>
</div>

<div class="stats-grid" style="grid-template-columns: repeat(auto-fit, minmax(200px,1fr));">
    <a href="properties.php?status=active" class="stat-card-modern text-decoration-none">
        <div class="stat-info">
            <div class="stat-label">Active Listings</div>
            <div class="stat-number"><?= $activeProperties ?></div>
        </div>
        <div class="stat-icon-wrapper icon-green"><i class="bi bi-check-circle-fill"></i></div>
    </a>
    <a href="properties.php?featured=1" class="stat-card-modern text-decoration-none">
        <div class="stat-info">
            <div class="stat-label">Featured</div>
            <div class="stat-number"><?= $featuredProperties ?></div>
        </div>
        <div class="stat-icon-wrapper icon-purple"><i class="bi bi-star-fill"></i></div>
    </a>
    <a href="inquiries.php?q=new" class="stat-card-modern text-decoration-none">
        <div class="stat-info">
            <div class="stat-label">New Inquiries</div>
            <div class="stat-number"><?= $newInquiries ?></div>
        </div>
        <div class="stat-icon-wrapper icon-amber"><i class="bi bi-bell-fill"></i></div>
    </a>
    <a href="pages.php" class="stat-card-modern text-decoration-none">
        <div class="stat-info">
            <div class="stat-label">CMS Pages</div>
            <div class="stat-number"><?= $totalPages ?></div>
        </div>
        <div class="stat-icon-wrapper icon-blue"><i class="bi bi-file-earmark-richtext-fill"></i></div>
    </a>
</div>

<!-- Recent Properties & Inquiries in Two Columns -->
<div class="row g-4">
    <div class="col-lg-7">
        <div class="corp-card">
            <div class="corp-card-header">
                <h3 class="corp-card-title"><i class="bi bi-house-door text-primary"></i> Latest Properties</h3>
                <a href="properties.php" class="btn btn-sm btn-outline-corporate">View All</a>
            </div>
            <div class="corp-card-body p-0">
                <table class="table-corporate">
                    <thead>
                        <tr>
                            <th>Property</th>
                            <th>Type</th>
                            <th>Location</th>
                            <th>Price</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (empty($recentProperties)): ?>
                        <tr><td colspan="5" class="text-center text-muted py-4">No properties added yet.</td></tr>
                        <?php else: foreach ($recentProperties as $prop): ?>
                        <tr>
                            <td>
                                <div class="d-flex align-items-center gap-2">
                                    <img src="/<?= e(ltrim($prop['image'] ?? 'assets/images/project_9.jpg', '/')) ?>" style="width:40px;height:40px;object-fit:cover;border-radius:8px;" alt="">
                                    <strong style="font-size:13px;"><?= e($prop['title'] ?? '') ?></strong>
                                </div>
                            </td>
                            <td><span class="badge bg-light text-dark"><?= e($prop['type'] ?? '') ?></span></td>
                            <td><?= e($prop['location'] ?? '') ?></td>
                            <td><strong style="color:var(--corp-accent);"><?= e($prop['price'] ?? '') ?></strong></td>
                            <td>
                                <span class="badge-status <?= ($prop['status'] ?? '') === 'active' ? 'badge-active' : 'badge-inactive' ?>">
                                    <?= ucfirst(e($prop['status'] ?? 'active')) ?>
                                </span>
                            </td>
                        </tr>
                        <?php endforeach; endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="col-lg-5">
        <div class="corp-card">
            <div class="corp-card-header">
                <h3 class="corp-card-title"><i class="bi bi-chat-left-dots text-warning"></i> Recent Inquiries</h3>
                <a href="inquiries.php" class="btn btn-sm btn-outline-corporate">View All</a>
            </div>
            <div class="corp-card-body p-0">
                <?php if (empty($recentInquiries)): ?>
                    <div class="text-center text-muted py-4">No inquiries yet.</div>
                <?php else: foreach ($recentInquiries as $inq): ?>
                <div class="d-flex align-items-start gap-3 p-3 border-bottom" style="border-color:#f1f5f9 !important;">
                    <div class="rounded-circle d-flex align-items-center justify-content-center" style="min-width:40px;height:40px;background:#eff6ff;color:var(--corp-accent);font-weight:700;font-size:15px;">
                        <?= strtoupper(substr($inq['name'] ?? 'U', 0, 1)) ?>
                    </div>
                    <div style="flex:1;min-width:0;">
                        <div class="d-flex justify-content-between align-items-start">
                            <strong style="font-size:13px;"><?= e($inq['name'] ?? '') ?></strong>
                            <span class="badge-status <?= ($inq['status'] ?? '') === 'new' ? 'badge-active' : 'badge-inactive' ?>" style="font-size:10px;"><?= ucfirst(e($inq['status'] ?? 'new')) ?></span>
                        </div>
                        <p class="text-muted mb-0" style="font-size:12px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis;">
                            <?= e($inq['message'] ?? '') ?>
                        </p>
                        <small class="text-muted"><?= e($inq['date'] ?? '') ?></small>
                    </div>
                </div>
                <?php endforeach; endif; ?>
            </div>
        </div>

        <!-- Quick Links -->
        <div class="corp-card">
            <div class="corp-card-header">
                <h3 class="corp-card-title"><i class="bi bi-lightning-fill text-primary"></i> Quick Actions</h3>
            </div>
            <div class="corp-card-body">
                <div class="d-grid gap-2">
                    <a href="properties.php?action=add" class="btn btn-primary-corporate"><i class="bi bi-plus-lg me-2"></i>Add New Property</a>
                    <a href="pages.php" class="btn btn-outline-corporate"><i class="bi bi-pencil-square me-2"></i>Edit Website Content</a>
                    <a href="settings.php" class="btn btn-outline-corporate"><i class="bi bi-gear me-2"></i>Corporate Settings</a>
                </div>
            </div>
        </div>
    </div>
</div>

<?php require __DIR__ . '/includes/layout_footer.php'; ?>
