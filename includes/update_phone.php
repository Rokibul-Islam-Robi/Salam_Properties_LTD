<?php
require_once __DIR__ . '/../config.php';
$data = cms_data();

// Update phone number across all pages
foreach ($data['pages'] as $pageKey => &$pageVal) {
    if (isset($pageVal['text'])) {
        foreach ($pageVal['text'] as &$t) {
            if ($t['key'] === 'header.8') {
                $t['value'] = '01796000000';
            }
            if ($t['key'] === 'index.text.10') {
                $t['value'] = 'Call us: 01796000000';
            }
        }
        unset($t);
    }
}
unset($pageVal);

if (isset($data['settings'])) {
    $data['settings']['company_phone'] = '01796000000';
}

cms_save($data);
echo "Phone number updated to 01796000000 in all pages and settings!\n";
