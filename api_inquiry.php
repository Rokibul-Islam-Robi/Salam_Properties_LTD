<?php
/**
 * API endpoint to receive contact form submissions from the frontend.
 * Saves inquiries to data/content.json so they appear in the admin panel.
 */
require_once __DIR__ . '/config.php';

header('Content-Type: application/json');

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['error' => 'Method not allowed']);
    exit;
}

$name = trim($_POST['name'] ?? '');
$email = trim($_POST['email'] ?? '');
$phone = trim($_POST['phone'] ?? '');
$subject = trim($_POST['subject'] ?? 'Website Inquiry');
$message = trim($_POST['message'] ?? '');

if ($name === '' || $email === '') {
    http_response_code(400);
    echo json_encode(['error' => 'Name and email are required.']);
    exit;
}

$data = cms_data();
if (!isset($data['inquiries'])) $data['inquiries'] = [];

$maxId = 0;
foreach ($data['inquiries'] as $inq) {
    if (($inq['id'] ?? 0) > $maxId) $maxId = $inq['id'];
}

$data['inquiries'][] = [
    'id' => $maxId + 1,
    'name' => $name,
    'email' => $email,
    'phone' => $phone,
    'subject' => $subject,
    'message' => $message,
    'date' => date('Y-m-d H:i'),
    'status' => 'new'
];

cms_save($data);

// Send Email Notification to Admin if mail is configured
$adminNotifyEmail = $data['settings']['company_email'] ?? 'info@salamproperties.com';
if (!empty($adminNotifyEmail)) {
    $mailSubject = "New Inquiry: " . ($subject ?: 'Website Lead from ' . $name);
    $mailBody = "New Lead Received from Website:\n\n"
              . "Name: $name\n"
              . "Email: $email\n"
              . "Phone: $phone\n"
              . "Subject: $subject\n"
              . "Message:\n$message\n\n"
              . "Time: " . date('Y-m-d H:i:s') . "\n";
    $headers = "From: webmaster@" . ($_SERVER['SERVER_NAME'] ?? 'localhost') . "\r\n"
             . "Reply-To: $email\r\n"
             . "X-Mailer: PHP/" . phpversion();
    @mail($adminNotifyEmail, $mailSubject, $mailBody, $headers);
}

echo json_encode(['success' => true, 'message' => 'Thank you! Your inquiry has been submitted successfully.']);
