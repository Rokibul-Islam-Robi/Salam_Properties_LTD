<?php
require_once __DIR__ . '/../config.php';
require_admin();
$currentPage = 'settings';
$pageTitle = 'Corporate Settings';
$data = cms_data();

if (!isset($data['settings'])) {
    $data['settings'] = [
        'site_name' => 'Salam Properties',
        'site_title' => 'Salam Properties — Real Estate & Construction',
        'company_email' => 'info@salmaproperties.com.bd',
        'company_phone' => '+(084) 123 - 456 88',
        'company_address' => '401 Broadway, 24th Floor, Orchard View, London',
        'company_about' => 'We are creators of transformative spaces that inspire, innovate, and endure.',
        'copyright_text' => '© 2026 Salam Properties. All Rights Reserved.',
        'facebook_url' => 'https://facebook.com',
        'twitter_url' => 'https://twitter.com',
        'instagram_url' => 'https://instagram.com',
        'linkedin_url' => 'https://linkedin.com',
        'site_logo' => 'assets/images/Logo_Four.png',
        'admin_logo' => 'assets/images/Logo_Four.png'
    ];
    cms_save($data);
}

$settings = $data['settings'];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data['settings'] = [
        'site_name' => trim($_POST['site_name'] ?? $settings['site_name']),
        'site_title' => trim($_POST['site_title'] ?? $settings['site_title']),
        'company_email' => trim($_POST['company_email'] ?? $settings['company_email']),
        'company_phone' => trim($_POST['company_phone'] ?? $settings['company_phone']),
        'company_address' => trim($_POST['company_address'] ?? $settings['company_address']),
        'company_about' => trim($_POST['company_about'] ?? $settings['company_about']),
        'copyright_text' => trim($_POST['copyright_text'] ?? $settings['copyright_text']),
        'facebook_url' => trim($_POST['facebook_url'] ?? ''),
        'twitter_url' => trim($_POST['twitter_url'] ?? ''),
        'instagram_url' => trim($_POST['instagram_url'] ?? ''),
        'linkedin_url' => trim($_POST['linkedin_url'] ?? ''),
        'site_logo' => $settings['site_logo'],
        'admin_logo' => $settings['admin_logo']
    ];

    // Auto-sync with pages text keys (index, header, footer)
    $newPhone = $data['settings']['company_phone'];
    $newEmail = $data['settings']['company_email'];
    $newAddress = $data['settings']['company_address'];
    
    if (isset($data['pages']['index']['text'])) {
        foreach ($data['pages']['index']['text'] as &$item) {
            if ($item['key'] === 'index.text.10' || $item['key'] === 'index.text.88') {
                $item['value'] = $newPhone;
            } elseif ($item['key'] === 'index.text.89') {
                $item['value'] = $newEmail;
            }
        }
        unset($item);
    }

    // Handle logo upload
    if (isset($_FILES['site_logo']) && $_FILES['site_logo']['error'] === UPLOAD_ERR_OK) {
        $name = $_FILES['site_logo']['name'];
        $tmp = $_FILES['site_logo']['tmp_name'];
        $ext = strtolower(pathinfo($name, PATHINFO_EXTENSION));
        if (in_array($ext, ['jpg','jpeg','png','webp','gif','svg'])) {
            $safe = preg_replace('/[^a-zA-Z0-9._-]/', '-', pathinfo($name, PATHINFO_FILENAME));
            $dest = 'uploads/logo-' . substr(sha1(microtime(true)), 0, 10) . '-' . $safe . '.' . $ext;
            if (move_uploaded_file($tmp, BASE_PATH . '/' . $dest)) {
                $data['settings']['site_logo'] = $dest;
            }
        }
    }

    if (isset($_FILES['admin_logo']) && $_FILES['admin_logo']['error'] === UPLOAD_ERR_OK) {
        $name = $_FILES['admin_logo']['name'];
        $tmp = $_FILES['admin_logo']['tmp_name'];
        $ext = strtolower(pathinfo($name, PATHINFO_EXTENSION));
        if (in_array($ext, ['jpg','jpeg','png','webp','gif','svg'])) {
            $safe = preg_replace('/[^a-zA-Z0-9._-]/', '-', pathinfo($name, PATHINFO_FILENAME));
            $dest = 'uploads/admin-logo-' . substr(sha1(microtime(true)), 0, 10) . '-' . $safe . '.' . $ext;
            if (move_uploaded_file($tmp, BASE_PATH . '/' . $dest)) {
                $data['settings']['admin_logo'] = $dest;
            }
        }
    }

    cms_save($data);
    header('Location: settings.php?saved=1');
    exit;
}

$settings = $data['settings'];
require __DIR__ . '/includes/layout_header.php';
?>

<div class="page-title-box">
    <div>
        <h1 class="page-title">Corporate Settings</h1>
        <p class="page-subtitle">Manage your company information, branding, and social media links.</p>
    </div>
</div>

<?php if (isset($_GET['saved'])): ?>
<div class="alert alert-success alert-dismissible fade show" role="alert" style="border-radius:var(--radius-sm);font-size:13.5px;">
    <i class="bi bi-check-circle me-1"></i> Settings saved successfully.
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<?php endif; ?>

<form method="post" enctype="multipart/form-data">
    <!-- Company Information -->
    <div class="corp-card">
        <div class="corp-card-header">
            <h3 class="corp-card-title"><i class="bi bi-building text-primary"></i> Company Information</h3>
        </div>
        <div class="corp-card-body">
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label-corporate">Company Name *</label>
                    <input type="text" name="site_name" class="form-control form-control-corporate" value="<?= e($settings['site_name'] ?? '') ?>" required>
                </div>
                <div class="col-md-6">
                    <label class="form-label-corporate">Site Title (SEO)</label>
                    <input type="text" name="site_title" class="form-control form-control-corporate" value="<?= e($settings['site_title'] ?? '') ?>">
                </div>
                <div class="col-md-6">
                    <label class="form-label-corporate"><i class="bi bi-telephone-outbound text-primary me-1"></i> Phone / Call Us Number *</label>
                    <input type="text" name="company_phone" class="form-control form-control-corporate" value="<?= e($settings['company_phone'] ?? '') ?>" placeholder="e.g. 01796000000" required>
                    <small class="text-muted" style="font-size:11px;">This updates the header "Call Us" number and footer contact.</small>
                </div>
                <div class="col-md-6">
                    <label class="form-label-corporate"><i class="bi bi-envelope-at text-danger me-1"></i> Official Email Address *</label>
                    <input type="email" name="company_email" class="form-control form-control-corporate" value="<?= e($settings['company_email'] ?? '') ?>" placeholder="e.g. info@salamproperties.com" required>
                    <small class="text-muted" style="font-size:11px;">Inquiries notification and client reply will be routed here.</small>
                </div>
                <div class="col-12">
                    <label class="form-label-corporate">Office Address</label>
                    <input type="text" name="company_address" class="form-control form-control-corporate" value="<?= e($settings['company_address'] ?? '') ?>">
                </div>
                <div class="col-12">
                    <label class="form-label-corporate">About the Company</label>
                    <textarea name="company_about" class="form-control form-control-corporate" rows="3"><?= e($settings['company_about'] ?? '') ?></textarea>
                </div>
                <div class="col-12">
                    <label class="form-label-corporate">Copyright Text</label>
                    <input type="text" name="copyright_text" class="form-control form-control-corporate" value="<?= e($settings['copyright_text'] ?? '') ?>">
                </div>
            </div>
        </div>
    </div>

    <!-- Brand & Logo -->
    <div class="corp-card">
        <div class="corp-card-header">
            <h3 class="corp-card-title"><i class="bi bi-image text-success"></i> Branding & Logo</h3>
        </div>
        <div class="corp-card-body">
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label-corporate">Site Logo</label>
                    <input type="file" name="site_logo" class="form-control form-control-corporate" accept="image/*">
                    <?php if (!empty($settings['site_logo'])): ?>
                    <div class="mt-2 p-3 bg-light rounded d-inline-block">
                        <img src="/<?= e(ltrim($settings['site_logo'], '/')) ?>" style="max-height:60px;" alt="Site Logo">
                    </div>
                    <?php endif; ?>
                </div>
                <div class="col-md-6">
                    <label class="form-label-corporate">Admin Logo</label>
                    <input type="file" name="admin_logo" class="form-control form-control-corporate" accept="image/*">
                    <?php if (!empty($settings['admin_logo'])): ?>
                    <div class="mt-2 p-3 rounded d-inline-block" style="background:var(--sidebar-bg);">
                        <img src="/<?= e(ltrim($settings['admin_logo'], '/')) ?>" style="max-height:60px;" alt="Admin Logo">
                    </div>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>

    <!-- Social Media -->
    <div class="corp-card">
        <div class="corp-card-header">
            <h3 class="corp-card-title"><i class="bi bi-share text-purple"></i> Social Media Links</h3>
        </div>
        <div class="corp-card-body">
            <div class="row g-3">
                <div class="col-md-6">
                    <label class="form-label-corporate"><i class="bi bi-facebook text-primary me-1"></i> Facebook URL</label>
                    <input type="url" name="facebook_url" class="form-control form-control-corporate" value="<?= e($settings['facebook_url'] ?? '') ?>" placeholder="https://facebook.com/yourpage">
                </div>
                <div class="col-md-6">
                    <label class="form-label-corporate"><i class="bi bi-twitter-x me-1"></i> X (Twitter) URL</label>
                    <input type="url" name="twitter_url" class="form-control form-control-corporate" value="<?= e($settings['twitter_url'] ?? '') ?>" placeholder="https://twitter.com/yourhandle">
                </div>
                <div class="col-md-6">
                    <label class="form-label-corporate"><i class="bi bi-instagram text-danger me-1"></i> Instagram URL</label>
                    <input type="url" name="instagram_url" class="form-control form-control-corporate" value="<?= e($settings['instagram_url'] ?? '') ?>" placeholder="https://instagram.com/yourpage">
                </div>
                <div class="col-md-6">
                    <label class="form-label-corporate"><i class="bi bi-linkedin text-primary me-1"></i> LinkedIn URL</label>
                    <input type="url" name="linkedin_url" class="form-control form-control-corporate" value="<?= e($settings['linkedin_url'] ?? '') ?>" placeholder="https://linkedin.com/company/yourcompany">
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex gap-2 mb-4">
        <button type="submit" class="btn btn-primary-corporate"><i class="bi bi-check-lg me-1"></i> Save Settings</button>
    </div>
</form>

<?php require __DIR__ . '/includes/layout_footer.php'; ?>
