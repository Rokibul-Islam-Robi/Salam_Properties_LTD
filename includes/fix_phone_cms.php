<?php
require_once __DIR__ . '/../config.php';
$data = cms_data();

if (isset($data['pages']['index']['text'])) {
    foreach ($data['pages']['index']['text'] as &$t) {
        if ($t['key'] === 'index.text.10') {
            $t['value'] = '01796000000';
            break;
        }
    }
    unset($t);
}

cms_save($data);
echo "index.text.10 updated to '01796000000'\n";
