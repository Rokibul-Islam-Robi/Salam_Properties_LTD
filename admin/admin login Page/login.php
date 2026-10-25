<?php
// login.php  — Salam Properties login page (video background)
session_start();

// ---------- CSRF token ----------
if (empty($_SESSION['csrf'])) {
    $_SESSION['csrf'] = bin2hex(random_bytes(32));
}

// Already logged in? go to dashboard
if (!empty($_SESSION['user'])) {
    header('Location: dashboard.php');
    exit;
}

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {

    if (!hash_equals($_SESSION['csrf'], $_POST['csrf'] ?? '')) {
        $error = 'Invalid request. Please try again.';
    } else {
        $email    = trim($_POST['email'] ?? '');
        $password = $_POST['password'] ?? '';

        if (!filter_var($email, FILTER_VALIDATE_EMAIL) || $password === '') {
            $error = 'Please enter a valid email and password.';
        } else {

            /* ===== OPTION A: Database (PDO) — recommended =====
            $pdo  = new PDO('mysql:host=localhost;dbname=YOUR_DB;charset=utf8mb4', 'DB_USER', 'DB_PASS', [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            ]);
            $stmt = $pdo->prepare('SELECT id, name, password FROM users WHERE email = ? LIMIT 1');
            $stmt->execute([$email]);
            $user = $stmt->fetch(PDO::FETCH_ASSOC);
            ================================================== */

            // ===== OPTION B: Demo user (testing only) =====
            // Real hash generate korte: echo password_hash('123456', PASSWORD_DEFAULT);
            $user = null;
            if ($email === 'admin@example.com') {
                $user = [
                    'id'       => 1,
                    'name'     => 'Admin',
                    'password' => password_hash('123456', PASSWORD_DEFAULT),
                ];
            }

            if ($user && password_verify($password, $user['password'])) {
                session_regenerate_id(true);
                $_SESSION['user'] = ['id' => $user['id'], 'name' => $user['name']];
                unset($_SESSION['csrf']);
                header('Location: dashboard.php');
                exit;
            } else {
                $error = 'Invalid email or password.';
            }
        }
    }
}

function e($v) { return htmlspecialchars($v, ENT_QUOTES, 'UTF-8'); }
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login | Salam Properties</title>
<style>
  *{box-sizing:border-box;margin:0;padding:0}
  body{font-family:system-ui,-apple-system,"Segoe UI",Roboto,sans-serif;min-height:100vh;
       background:#0b1220;color:#fff;display:flex;align-items:center;justify-content:flex-end;
       padding:0 8vw;overflow:hidden}

  .bg-video{position:fixed;inset:0;width:100%;height:100%;object-fit:cover;z-index:-2}
  .bg-overlay{position:fixed;inset:0;z-index:-1;
       background:linear-gradient(90deg,rgba(8,13,23,.15) 0%,rgba(8,13,23,.55) 100%)}

  .card{width:100%;max-width:400px;padding:36px 32px;border-radius:16px;
        background:rgba(15,24,41,.72);backdrop-filter:blur(14px);-webkit-backdrop-filter:blur(14px);
        border:1px solid rgba(255,255,255,.10);box-shadow:0 20px 50px rgba(0,0,0,.45)}
  .card h1{font-size:24px;font-weight:600;margin-bottom:6px}
  .card p.sub{font-size:14px;color:#9fb0c8;margin-bottom:24px}
  label{display:block;font-size:13px;color:#b9c6da;margin-bottom:6px}
  input[type=email],input[type=password]{width:100%;padding:12px 14px;margin-bottom:18px;border-radius:10px;
        font-size:15px;color:#fff;background:rgba(255,255,255,.06);
        border:1px solid rgba(255,255,255,.14);outline:none;transition:.2s}
  input:focus{border-color:#f2b84b;box-shadow:0 0 0 3px rgba(242,184,75,.18)}
  .row{display:flex;justify-content:space-between;align-items:center;font-size:13px;margin:-4px 0 22px;color:#9fb0c8}
  .row a{color:#f2b84b;text-decoration:none}
  .row a:hover{text-decoration:underline}
  .remember{display:flex;gap:6px;align-items:center;margin:0}
  button{width:100%;padding:13px;border:0;border-radius:10px;cursor:pointer;font-size:15px;font-weight:600;
         background:#f2b84b;color:#111827;transition:.2s}
  button:hover{background:#ffc965;transform:translateY(-1px)}
  .error{background:rgba(239,68,68,.15);border:1px solid rgba(239,68,68,.5);color:#fecaca;
         padding:10px 12px;border-radius:10px;font-size:14px;margin-bottom:18px}

  @media (max-width:800px){ body{justify-content:center;padding:0 20px} }
  @media (prefers-reduced-motion:reduce){
    .bg-video{display:none}
    body{background:#0b1220 url(poster.jpg) center/cover}
  }
</style>
</head>
<body>

  <video class="bg-video" autoplay muted loop playsinline preload="auto" poster="poster.jpg">
    <source src="salam_realestate_bg.mp4" type="video/mp4">
  </video>
  <div class="bg-overlay"></div>

  <form class="card" method="POST" action="">
    <h1>Welcome back</h1>
    <p class="sub">Sign in to your account</p>

    <?php if ($error): ?>
      <div class="error"><?= e($error) ?></div>
    <?php endif; ?>

    <input type="hidden" name="csrf" value="<?= e($_SESSION['csrf']) ?>">

    <label for="email">Email</label>
    <input id="email" name="email" type="email" placeholder="you@example.com"
           value="<?= e($_POST['email'] ?? '') ?>" required>

    <label for="password">Password</label>
    <input id="password" name="password" type="password" placeholder="••••••••" required>

    <div class="row">
      <label class="remember"><input type="checkbox" name="remember"> Remember me</label>
      <a href="forgot-password.php">Forgot password?</a>
    </div>

    <button type="submit">Login</button>
  </form>

</body>
</html>
