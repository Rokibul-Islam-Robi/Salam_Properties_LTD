<?php
$cmsSiteSettings = $cmsAll['settings'] ?? [];
$cmsLogo = !empty($cmsSiteSettings['site_logo']) ? $cmsSiteSettings['site_logo'] : 'assets/images/Logo_Four.png';
$cmsCompanyName = !empty($cmsSiteSettings['site_name']) ? $cmsSiteSettings['site_name'] : 'Salam Properties';
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= e($cmsCompanyName) ?> — Premium Admin Portal</title>
    <link rel="stylesheet" href="../assets/vendor/bootstrap.min.css">
    <link rel="stylesheet" href="../assets/vendor/bootstrap-icons.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/admin-modern.css">
</head>
<body>
    <div class="admin-wrapper">
        <!-- Sidebar Navigation -->
        <aside class="admin-sidebar" id="adminSidebar">
            <div class="sidebar-header">
                <a href="index.php" class="brand-link">
                    <div class="brand-logo-wrap">
                        <img src="../<?= e($cmsLogo) ?>" alt="<?= e($cmsCompanyName) ?>" class="site-main-logo" onerror="this.src='../assets/images/Logo_Four.png'">
                    </div>
                    <div class="brand-text">
                        <span class="brand-title"><?= e($cmsCompanyName) ?></span>
                        <span class="brand-subtitle">Enterprise Real Estate CMS</span>
                    </div>
                </a>
            </div>

            <div class="sidebar-menu">
                <div class="menu-section">
                    <i class="bi bi-speedometer2 me-1"></i> OVERVIEW & ANALYTICS
                </div>
                <a href="index.php" class="menu-item <?= ($currentPage ?? '') === 'dashboard' ? 'active' : '' ?>">
                    <div class="menu-icon-wrap icon-blue">
                        <i class="bi bi-grid-1x2-fill"></i>
                    </div>
                    <span>Dashboard</span>
                    <i class="bi bi-chevron-right menu-arrow ms-auto"></i>
                </a>

                <div class="menu-section">
                    <i class="bi bi-buildings me-1"></i> PROPERTIES & INVENTORY
                </div>
                <a href="properties.php" class="menu-item <?= ($currentPage ?? '') === 'properties' ? 'active' : '' ?>">
                    <div class="menu-icon-wrap icon-teal">
                        <i class="bi bi-house-door-fill"></i>
                    </div>
                    <span>All Properties</span>
                    <?php 
                    $propCount = count($cmsAll['properties'] ?? []);
                    if ($propCount > 0): ?>
                        <span class="badge rounded-pill bg-primary ms-auto" style="font-size:11px;"><?= $propCount ?></span>
                    <?php else: ?>
                        <i class="bi bi-chevron-right menu-arrow ms-auto"></i>
                    <?php endif; ?>
                </a>
                <a href="types.php" class="menu-item <?= ($currentPage ?? '') === 'types' ? 'active' : '' ?>">
                    <div class="menu-icon-wrap icon-indigo">
                        <i class="bi bi-collection-fill"></i>
                    </div>
                    <span>Property Types</span>
                    <i class="bi bi-chevron-right menu-arrow ms-auto"></i>
                </a>
                <a href="locations.php" class="menu-item <?= ($currentPage ?? '') === 'locations' ? 'active' : '' ?>">
                    <div class="menu-icon-wrap icon-emerald">
                        <i class="bi bi-geo-alt-fill"></i>
                    </div>
                    <span>Project Locations</span>
                    <i class="bi bi-chevron-right menu-arrow ms-auto"></i>
                </a>

                <div class="menu-section">
                    <i class="bi bi-envelope-paper-heart me-1"></i> LEADS & CLIENT INQUIRIES
                </div>
                <a href="inquiries.php" class="menu-item <?= ($currentPage ?? '') === 'inquiries' ? 'active' : '' ?>">
                    <div class="menu-icon-wrap icon-amber">
                        <i class="bi bi-chat-left-dots-fill"></i>
                    </div>
                    <span>Client Inquiries</span>
                    <?php 
                    $inqCount = 0;
                    foreach ($cmsAll['inquiries'] ?? [] as $iq) {
                        if (($iq['status'] ?? '') === 'new') $inqCount++;
                    }
                    if ($inqCount > 0): ?>
                        <span class="badge rounded-pill bg-danger ms-auto" style="font-size:11px; animation: pulse 2s infinite;"><?= $inqCount ?> NEW</span>
                    <?php else: ?>
                        <span class="badge rounded-pill bg-secondary ms-auto" style="font-size:11px;"><?= count($cmsAll['inquiries'] ?? []) ?></span>
                    <?php endif; ?>
                </a>

                <div class="menu-section">
                    <i class="bi bi-window-sidebar me-1"></i> WEBSITE CMS & MEDIA
                </div>
                <a href="pages.php" class="menu-item <?= ($currentPage ?? '') === 'pages' ? 'active' : '' ?>">
                    <div class="menu-icon-wrap icon-violet">
                        <i class="bi bi-file-earmark-richtext-fill"></i>
                    </div>
                    <span>Pages Content Editor</span>
                    <i class="bi bi-chevron-right menu-arrow ms-auto"></i>
                </a>
                <a href="gallery.php" class="menu-item <?= ($currentPage ?? '') === 'gallery' ? 'active' : '' ?>">
                    <div class="menu-icon-wrap icon-rose">
                        <i class="bi bi-images"></i>
                    </div>
                    <span>Media Library</span>
                    <i class="bi bi-chevron-right menu-arrow ms-auto"></i>
                </a>

                <div class="menu-section">
                    <i class="bi bi-sliders me-1"></i> CONFIGURATION & COMPANY
                </div>
                <a href="settings.php" class="menu-item <?= ($currentPage ?? '') === 'settings' ? 'active' : '' ?>">
                    <div class="menu-icon-wrap icon-cyan">
                        <i class="bi bi-gear-fill"></i>
                    </div>
                    <span>Company & Call Us Settings</span>
                    <i class="bi bi-chevron-right menu-arrow ms-auto"></i>
                </a>
            </div>

            <div class="sidebar-footer">
                <div class="admin-profile-compact">
                    <div class="admin-avatar">
                        <i class="bi bi-person-fill"></i>
                    </div>
                    <div class="admin-info">
                        <strong><?= e(ADMIN_USER) ?></strong>
                        <span class="text-success"><i class="bi bi-dot"></i> Super Admin</span>
                    </div>
                    <a href="logout.php" class="logout-link" title="Logout">
                        <i class="bi bi-box-arrow-right"></i>
                    </a>
                </div>
            </div>
        </aside>

        <!-- Main Content Area -->
        <div class="admin-main">
            <!-- Top Navbar -->
            <header class="admin-topbar">
                <div class="topbar-left">
                    <button class="sidebar-toggle btn btn-light" id="sidebarToggle">
                        <i class="bi bi-list"></i>
                    </button>
                    <div class="page-breadcrumb">
                        <span class="breadcrumb-root">Portal</span>
                        <i class="bi bi-chevron-right breadcrumb-separator"></i>
                        <span class="breadcrumb-active"><?= e($pageTitle ?? 'Dashboard') ?></span>
                    </div>
                </div>

                <div class="topbar-right">
                    <a href="../index.php" target="_blank" class="btn btn-live-site">
                        <i class="bi bi-globe me-1"></i> Live Website
                    </a>

                    <div class="dropdown">
                        <button class="btn btn-user-profile dropdown-toggle user-btn" type="button" data-bs-toggle="dropdown">
                            <span class="user-avatar-badge"><i class="bi bi-person-fill"></i></span>
                            <span class="user-name"><?= e(ADMIN_USER) ?></span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end shadow-sm">
                            <li><a class="dropdown-item" href="settings.php"><i class="bi bi-gear me-2"></i> Settings</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item text-danger" href="logout.php"><i class="bi bi-box-arrow-right me-2"></i> Logout</a></li>
                        </ul>
                    </div>
                </div>
            </header>

            <!-- Page Body -->
            <main class="admin-content">
