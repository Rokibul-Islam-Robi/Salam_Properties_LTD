<?php
require_once __DIR__ . '/../config.php';
require_admin();
$currentPage = 'inquiries';
$pageTitle = 'Client Inquiries';
$data = cms_data();

if (!isset($data['inquiries'])) $data['inquiries'] = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'] ?? '';

    if ($action === 'update_status') {
        $id = (int)($_POST['id'] ?? 0);
        $newStatus = $_POST['new_status'] ?? 'new';
        foreach ($data['inquiries'] as &$inq) {
            if ($inq['id'] === $id) {
                $inq['status'] = $newStatus;
                break;
            }
        }
        unset($inq);
        cms_save($data);
        header('Location: inquiries.php?msg=updated'); exit;
    } elseif ($action === 'delete') {
        $id = (int)($_POST['id'] ?? 0);
        $data['inquiries'] = array_values(array_filter($data['inquiries'], fn($i) => $i['id'] !== $id));
        cms_save($data);
        header('Location: inquiries.php?msg=deleted'); exit;
    } elseif ($action === 'send_reply') {
        $id = (int)($_POST['id'] ?? 0);
        $toEmail = trim($_POST['to_email'] ?? '');
        $replySubject = trim($_POST['reply_subject'] ?? 'Response from Salam Properties Ltd.');
        $replyMessage = trim($_POST['reply_message'] ?? '');
        
        if (!empty($toEmail) && !empty($replyMessage)) {
            $companyEmail = $data['settings']['company_email'] ?? 'info@salamproperties.com';
            $companyName = $data['settings']['site_name'] ?? 'Salam Properties Ltd.';
            $headers = "From: $companyName <$companyEmail>\r\n"
                     . "Reply-To: $companyEmail\r\n"
                     . "MIME-Version: 1.0\r\n"
                     . "Content-Type: text/plain; charset=UTF-8\r\n"
                     . "X-Mailer: PHP/" . phpversion();
            
            @mail($toEmail, $replySubject, $replyMessage, $headers);
            
            // Mark status as contacted
            foreach ($data['inquiries'] as &$inq) {
                if ($inq['id'] === $id) {
                    $inq['status'] = 'contacted';
                    $inq['last_reply'] = [
                        'date' => date('Y-m-d H:i'),
                        'subject' => $replySubject,
                        'message' => $replyMessage
                    ];
                    break;
                }
            }
            unset($inq);
            cms_save($data);
            header('Location: inquiries.php?msg=email_sent'); exit;
        } else {
            header('Location: inquiries.php?msg=email_error'); exit;
        }
    }
}

$search = trim($_GET['q'] ?? '');
$filtered = $data['inquiries'];
if ($search) {
    $filtered = array_filter($filtered, function($inq) use ($search) {
        return stripos($inq['name'] ?? '', $search) !== false 
            || stripos($inq['email'] ?? '', $search) !== false 
            || stripos($inq['message'] ?? '', $search) !== false;
    });
    $filtered = array_values($filtered);
}

$msg = $_GET['msg'] ?? '';
require __DIR__ . '/includes/layout_header.php';
?>

<div class="page-title-box">
    <div>
        <h1 class="page-title">Client Inquiries</h1>
        <p class="page-subtitle">Manage property inquiries and client communications.</p>
    </div>
    <div class="d-flex gap-2">
        <form method="get" class="d-flex gap-2">
            <input type="text" name="q" class="form-control form-control-corporate" style="width:220px;" value="<?= e($search) ?>" placeholder="Search inquiries...">
            <button class="btn btn-outline-corporate"><i class="bi bi-search"></i></button>
        </form>
    </div>
</div>

<?php if ($msg): ?>
<div class="alert alert-success alert-dismissible fade show" role="alert" style="border-radius:var(--radius-sm);font-size:13.5px;">
    <i class="bi bi-check-circle me-1"></i>
    <?php
        if ($msg === 'updated') echo 'Inquiry status updated successfully.';
        elseif ($msg === 'deleted') echo 'Inquiry deleted.';
        elseif ($msg === 'email_sent') echo 'Email reply sent successfully to the client!';
        elseif ($msg === 'email_error') echo 'Error sending email: please ensure recipient and message are filled.';
    ?>
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
</div>
<?php endif; ?>

<div class="corp-card">
    <div class="corp-card-header">
        <h3 class="corp-card-title"><i class="bi bi-chat-left-dots text-warning"></i> All Inquiries</h3>
        <span class="text-muted" style="font-size:13px;"><?= count($filtered) ?> inquiry(ies)</span>
    </div>
    <div class="corp-card-body p-0">
        <table class="table-corporate">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Client Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Subject</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <?php if (empty($filtered)): ?>
                <tr><td colspan="8" class="text-center text-muted py-4">No inquiries found.</td></tr>
                <?php else: foreach ($filtered as $idx => $inq): ?>
                <tr>
                    <td><?= $idx + 1 ?></td>
                    <td>
                        <div class="d-flex align-items-center gap-2">
                            <div class="rounded-circle d-flex align-items-center justify-content-center" style="min-width:34px;height:34px;background:#eff6ff;color:var(--corp-accent);font-weight:700;font-size:14px;">
                                <?= strtoupper(substr($inq['name'] ?? 'U', 0, 1)) ?>
                            </div>
                            <strong style="font-size:13px;"><?= e($inq['name'] ?? '') ?></strong>
                        </div>
                    </td>
                    <td style="font-size:12.5px;"><?= e($inq['email'] ?? '') ?></td>
                    <td style="font-size:12.5px;"><?= e($inq['phone'] ?? '') ?></td>
                    <td style="font-size:12.5px;max-width:180px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;"><?= e($inq['subject'] ?? $inq['message'] ?? '') ?></td>
                    <td style="font-size:12.5px;"><?= e($inq['date'] ?? '') ?></td>
                    <td>
                        <?php
                        $statusClass = 'badge-active';
                        if (($inq['status'] ?? '') === 'new') $statusClass = 'badge-active';
                        elseif (($inq['status'] ?? '') === 'contacted') $statusClass = 'badge-status';
                        elseif (($inq['status'] ?? '') === 'closed') $statusClass = 'badge-inactive';
                        ?>
                        <span class="badge-status <?= $statusClass ?>"><?= ucfirst(e($inq['status'] ?? 'new')) ?></span>
                    </td>
                    <td>
                        <div class="d-flex gap-1">
                            <button class="btn btn-sm btn-outline-corporate" data-bs-toggle="modal" data-bs-target="#viewInq<?= $inq['id'] ?>">
                                <i class="bi bi-eye"></i>
                            </button>
                            <form method="post" style="display:inline;" onsubmit="return confirm('Delete this inquiry?');">
                                <input type="hidden" name="action" value="delete">
                                <input type="hidden" name="id" value="<?= $inq['id'] ?>">
                                <button class="btn btn-sm btn-danger-corporate"><i class="bi bi-trash"></i></button>
                            </form>
                        </div>
                    </td>
                </tr>

                <!-- View Modal -->
                <div class="modal fade" id="viewInq<?= $inq['id'] ?>" tabindex="-1">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content" style="border-radius:var(--radius-lg);">
                            <div class="modal-header border-0 pb-0">
                                <h5 class="modal-title fw-bold">Inquiry Details</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label-corporate">Name</label>
                                        <div class="p-2 bg-light rounded"><?= e($inq['name'] ?? '') ?></div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label-corporate">Email</label>
                                        <div class="p-2 bg-light rounded"><?= e($inq['email'] ?? '') ?></div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label-corporate">Phone</label>
                                        <div class="p-2 bg-light rounded"><?= e($inq['phone'] ?? '') ?></div>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label-corporate">Date</label>
                                        <div class="p-2 bg-light rounded"><?= e($inq['date'] ?? '') ?></div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label-corporate">Subject</label>
                                        <div class="p-2 bg-light rounded"><?= e($inq['subject'] ?? '') ?></div>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label-corporate">Message</label>
                                        <div class="p-2 bg-light rounded"><?= nl2br(e($inq['message'] ?? '')) ?></div>
                                    </div>
                                    <div class="col-12">
                                        <hr class="my-2">
                                        <h6 class="fw-bold text-primary mb-2"><i class="bi bi-reply-fill"></i> Send Direct Email Reply</h6>
                                        <form method="post">
                                            <input type="hidden" name="action" value="send_reply">
                                            <input type="hidden" name="id" value="<?= $inq['id'] ?>">
                                            <div class="mb-2">
                                                <label class="form-label-corporate">Recipient Email</label>
                                                <input type="email" name="to_email" class="form-control form-control-corporate" value="<?= e($inq['email'] ?? '') ?>" required>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label-corporate">Email Subject</label>
                                                <input type="text" name="reply_subject" class="form-control form-control-corporate" value="Re: <?= e($inq['subject'] ?? 'Your Inquiry at Salam Properties') ?>" required>
                                            </div>
                                            <div class="mb-2">
                                                <label class="form-label-corporate">Message Body</label>
                                                <textarea name="reply_message" class="form-control form-control-corporate" rows="4" placeholder="Write your professional corporate reply here..." required>Dear <?= e($inq['name'] ?? 'Client') ?>,&#13;&#10;&#13;&#10;Thank you for reaching out to Salam Properties Ltd. Regarding your inquiry...&#13;&#10;&#13;&#10;Best regards,&#13;&#10;Salam Properties Ltd. Corporate Team</textarea>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center mt-3">
                                                <button type="submit" class="btn btn-primary-corporate">
                                                    <i class="bi bi-send-fill me-1"></i> Send Corporate Email
                                                </button>
                                                <span class="text-muted" style="font-size:12px;">Sending as: <?= e($data['settings']['company_email'] ?? 'info@salamproperties.com') ?></span>
                                            </div>
                                        </form>
                                    </div>

                                    <?php if (!empty($inq['last_reply'])): ?>
                                    <div class="col-12 mt-2">
                                        <div class="p-3 bg-light rounded border">
                                            <small class="text-success fw-bold"><i class="bi bi-check2-all"></i> Last Replied on <?= e($inq['last_reply']['date'] ?? '') ?>:</small>
                                            <div class="mt-1" style="font-size:12.5px;"><?= nl2br(e($inq['last_reply']['message'] ?? '')) ?></div>
                                        </div>
                                    </div>
                                    <?php endif; ?>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <?php endforeach; endif; ?>
            </tbody>
        </table>
    </div>
</div>

<?php require __DIR__ . '/includes/layout_footer.php'; ?>
