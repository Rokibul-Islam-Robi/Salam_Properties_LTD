# Salam Properties — PHP CMS

This package converts the supplied static website into a PHP-driven CMS while keeping the supplied frontend templates, CSS, JavaScript, fonts and visual structure intact.

## Requirements
- PHP 8.0+
- Apache (recommended) with PHP enabled
- Write permission for `data/content.json` and `uploads/`

No MySQL setup is required. Content is stored in JSON so the package can be uploaded directly to a normal PHP hosting account.

## Admin
Open `/admin/login.php`
- Username: `admin`
- Password: `admin123`

Change these credentials in `config.php` before production use.

## Frontend
- `/index.php`
- `/about.php`
- `/services.php`
- `/project.php`
- `/news.php`
- `/contact.php`

The original HTML files are retained as templates under `templates/`. The PHP renderer only injects saved CMS text/image values using `data-cms-*` markers; it does not redesign the site.
