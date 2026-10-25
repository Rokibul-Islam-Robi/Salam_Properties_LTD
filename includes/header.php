<?php
/**
 * Shared header for all inner pages (about, services, project, contact, news).
 * Requires $page (string) to be set by render_page() for the active nav state.
 * CMS keys are stable names: header.0 .. header.14 and header.logo.
 */
$ip_page = isset($page_nav) && $page_nav !== '' ? (string)$page_nav : (isset($page) ? (string)$page : '');
$ip_nav = [
    'home'     => ['href' => './index.php',   'label' => 'Home',     'key' => 'header.1'],
    'about'    => ['href' => './about.php',   'label' => 'About',    'key' => 'header.2'],
    'services' => ['href' => './services.php','label' => 'Services', 'key' => 'header.3'],
    'project'  => ['href' => './project.php', 'label' => 'Projects', 'key' => 'header.4'],
    'news'     => ['href' => './news.php',    'label' => 'News',     'key' => 'header.5'],
    'contact'  => ['href' => './contact.php', 'label' => 'Contact',  'key' => 'header.6'],
];

// Append custom pages configured to display in menu
$cmsHeaderData = cms_data();
if (!empty($cmsHeaderData['custom_pages'])) {
    foreach ($cmsHeaderData['custom_pages'] as $cSlug => $cPage) {
        if (!empty($cPage['show_in_menu'])) {
            $ip_nav[$cSlug] = [
                'href' => './' . $cSlug . '.php',
                'label' => $cPage['title'] ?? ucfirst($cSlug),
                'key' => $cSlug . '.menu'
            ];
        }
    }
}
$ip_active = $ip_page;
?><a class="skip-link" data-cms-key="header.0" href="#main">Skip to content</a>
<!-- Shared header (includes/header.php) -->
<header class="site-header">
<div class="header-wrap">
<a aria-label="Spaciaz home" class="brand" href="index.php">
<img alt="Salam Properties" data-cms-image-key="header.logo" src="assets/images/Logo_Four.png"/>
</a>
<nav aria-label="Primary navigation" class="desktop-nav">
<?php foreach($ip_nav as $slug=>$item): if($slug==='about'):
$ip_dd_active = in_array($ip_active, ['about','leadership','why-choose-us']); ?>
<div class="nav-dd">
<a<?php echo $ip_dd_active?' class="active"':''; ?> data-cms-key="<?php echo e($item['key']); ?>" href="<?php echo e($item['href']); ?>"><?php echo e($item['label']); ?></a>
<div class="nav-dd-menu">
<a<?php echo $ip_active==='about'?' class="active"':''; ?> data-cms-key="header.about.1" href="./about.php">About Us</a>
<a<?php echo $ip_active==='leadership'?' class="active"':''; ?> data-cms-key="header.about.2" href="./leadership.php">Our Leadership</a>
<a<?php echo $ip_active==='why-choose-us'?' class="active"':''; ?> data-cms-key="header.about.3" href="./why-choose-us.php">Why Choose Us</a>
</div>
</div>
<?php else: ?>
<a<?php echo $slug===$ip_active?' class="active"':''; ?> data-cms-key="<?php echo e($item['key']); ?>" href="<?php echo e($item['href']); ?>"><?php echo e($item['label']); ?></a>
<?php endif; endforeach; ?>
</nav>
<div class="header-contact">
<span data-cms-key="header.7">Call Us:</span>
<a data-cms-key="header.8" href="tel:01796000000">01796000000</a>
<a class="quote-btn" href="contact.php">Get In Touch <i class="bi bi-arrow-right"></i></a>
<button aria-expanded="false" aria-label="Open menu" class="menu-btn" id="menuBtn">
<i class="bi bi-list"></i>
</button>
</div>
</div>
<div class="mobile-nav" id="mobileNav">
<a<?php echo $ip_active==='home'?' class="active"':''; ?> data-cms-key="header.9" href="index.php">Home</a>
<a<?php echo $ip_active==='about'?' class="active"':''; ?> data-cms-key="header.10" href="about.php">About</a>
<a class="mobile-sub<?php echo $ip_active==='leadership'?' active':''; ?>" data-cms-key="header.about.2" href="leadership.php">Our Leadership</a>
<a class="mobile-sub<?php echo $ip_active==='why-choose-us'?' active':''; ?>" data-cms-key="header.about.3" href="why-choose-us.php">Why Choose Us</a>
<a<?php echo $ip_active==='services'?' class="active"':''; ?> data-cms-key="header.11" href="services.php">Services</a>
<a<?php echo $ip_active==='project'?' class="active"':''; ?> data-cms-key="header.12" href="project.php">Projects</a>
<a<?php echo $ip_active==='news'?' class="active"':''; ?> data-cms-key="header.13" href="news.php">News</a>
<a<?php echo $ip_active==='contact'?' class="active"':''; ?> data-cms-key="header.14" href="contact.php">Contact</a>
<a class="mobile-quote" href="contact.php">Get In Touch <i class="bi bi-arrow-right"></i></a>
</div>
</header>
