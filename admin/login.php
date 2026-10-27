<?php require_once __DIR__.'/../config.php';
if(logged_in()){header('Location: index.php');exit;}
$error=''; 
if($_SERVER['REQUEST_METHOD']==='POST'){
  $u=$_POST['username']??''; 
  $p=$_POST['password']??'';
  if(hash_equals(ADMIN_USER,$u) && hash_equals(ADMIN_PASS,$p)){
      $_SESSION['cms_admin']=true; 
      header('Location: index.php');
      exit;
  }
  $error='Invalid username or password.';
}
?><!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Salam Properties — Enterprise Admin Login</title>
    <link rel="stylesheet" href="<?= base_url('assets/vendor/bootstrap-icons.min.css') ?>">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body {
            font-family: 'Plus Jakarta Sans', system-ui, -apple-system, sans-serif;
            min-height: 100vh;
            background: #060b14;
            color: #1e293b;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            padding: 0 7vw;
            position: relative;
            overflow: hidden;
        }

        /* Crystal Clear & Bright Background Video */
        .bg-video {
            position: fixed;
            inset: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: -3;
            filter: brightness(1.22) contrast(1.18) saturate(1.2);
            -webkit-filter: brightness(1.22) contrast(1.18) saturate(1.2);
        }

        /* Subtle Vignette & Gradient Overlay - Keeps Left Video Ultra Sharp */
        .bg-overlay {
            position: fixed;
            inset: 0;
            z-index: -2;
            background: linear-gradient(
                90deg, 
                rgba(6, 11, 20, 0.0) 0%, 
                rgba(6, 11, 20, 0.15) 50%, 
                rgba(6, 11, 20, 0.5) 100%
            );
        }



        /* Premium Pure White Corporate Card */
        .login-card {
            width: 100%;
            max-width: 440px;
            padding: 44px 38px;
            border-radius: 26px;
            background: #ffffff;
            border: 1px solid rgba(255, 255, 255, 0.95);
            box-shadow: 
                0 30px 70px -15px rgba(0, 0, 0, 0.45), 
                0 15px 35px -5px rgba(15, 23, 42, 0.25),
                0 0 0 1px rgba(0, 0, 0, 0.04);
            position: relative;
            z-index: 1;
            animation: slideInRight 0.65s cubic-bezier(0.16, 1, 0.3, 1) forwards;
        }

        @keyframes slideInRight {
            from { opacity: 0; transform: translateX(35px) scale(0.97); }
            to { opacity: 1; transform: translateX(0) scale(1); }
        }

        .brand-header {
            display: flex;
            align-items: center;
            justify-content: flex-start;
            margin-bottom: 24px;
            padding-bottom: 18px;
            border-bottom: 1px solid #f1f5f9;
        }
        .brand-header .site-login-logo {
            height: 62px;
            width: auto;
            max-width: 270px;
            object-fit: contain;
            display: block;
        }

        .welcome-text {
            margin-bottom: 24px;
        }
        .welcome-text h2 {
            font-size: 25px;
            font-weight: 800;
            color: #0f172a;
            letter-spacing: -0.5px;
        }
        .welcome-text p {
            font-size: 13.5px;
            color: #64748b;
            margin-top: 4px;
            font-weight: 500;
        }

        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            display: block;
            font-size: 13px;
            font-weight: 700;
            color: #334155;
            margin-bottom: 8px;
        }
        .input-wrap {
            position: relative;
            display: flex;
            align-items: center;
        }
        .input-icon {
            position: absolute;
            left: 15px;
            color: #94a3b8;
            font-size: 17px;
            pointer-events: none;
            transition: color 0.25s ease;
        }
        .input-field {
            width: 100%;
            padding: 13px 16px 13px 44px;
            border-radius: 12px;
            font-size: 14px;
            font-family: inherit;
            color: #0f172a;
            font-weight: 600;
            background: #f8fafc;
            border: 1.5px solid #e2e8f0;
            outline: none;
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .input-field::placeholder {
            color: #94a3b8;
            font-weight: 500;
        }
        .input-field:focus {
            background: #ffffff;
            border-color: #2563eb;
            box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.12);
        }
        .input-wrap:focus-within .input-icon {
            color: #2563eb;
        }

        .toggle-password {
            position: absolute;
            right: 14px;
            background: none;
            border: none;
            color: #94a3b8;
            font-size: 18px;
            cursor: pointer;
            padding: 0;
            display: flex;
            align-items: center;
            transition: color 0.2s;
        }
        .toggle-password:hover {
            color: #334155;
        }

        .row-options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 13px;
            color: #64748b;
            margin: -4px 0 24px;
            font-weight: 500;
        }
        .remember-wrap {
            display: flex;
            align-items: center;
            gap: 8px;
            cursor: pointer;
            user-select: none;
        }
        .remember-wrap input[type="checkbox"] {
            accent-color: #2563eb;
            width: 16px;
            height: 16px;
            cursor: pointer;
            border-radius: 4px;
        }

        .btn-submit {
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            font-size: 15px;
            font-weight: 700;
            font-family: inherit;
            background: #d6f045;
            color: #11140e;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            box-shadow: 0 8px 22px rgba(214, 240, 69, 0.4);
            transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .btn-submit i {
            font-size: 16px;
            transition: transform 0.2s ease;
        }
        .btn-submit:hover {
            background: #e2f85e;
            color: #000000;
            transform: translateY(-2px);
            box-shadow: 0 12px 28px rgba(214, 240, 69, 0.55);
        }
        .btn-submit:hover i {
            transform: translateX(3px);
        }
        .btn-submit:active {
            transform: translateY(0);
        }

        .error-message {
            background: #fef2f2;
            border: 1px solid #fecaca;
            color: #b91c1c;
            padding: 12px 14px;
            border-radius: 12px;
            font-size: 13.5px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
            animation: shake 0.4s ease-in-out;
        }
        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            20%, 60% { transform: translateX(-5px); }
            40%, 80% { transform: translateX(5px); }
        }

        .card-footer {
            margin-top: 24px;
            padding-top: 18px;
            border-top: 1px solid #f1f5f9;
            text-align: center;
            font-size: 12px;
            color: #64748b;
            line-height: 1.6;
        }
        .card-footer strong {
            color: #0f172a;
        }

        @media (max-width: 860px) {
            body {
                justify-content: center;
                padding: 20px;
            }
            .bg-overlay {
                background: rgba(6, 11, 20, 0.65);
            }
        }

        @media (prefers-reduced-motion: reduce) {
            .bg-video { display: none; }
            body { background: #060b14 url('<?= base_url('admin/assets/login_poster.jpg') ?>') center/cover no-repeat; }
        }
    </style>
</head>
<body>

    <!-- Real Estate Video Background (Enhanced Brightness & Ultra-Clear Text) -->
    <video class="bg-video" autoplay muted loop playsinline preload="auto" poster="<?= base_url('admin/assets/login_poster.jpg') ?>">
        <source src="<?= base_url('admin/assets/salam_realestate_bg.mp4') ?>" type="video/mp4">
    </video>
    
    <!-- Light Soft Overlay so Video & Salam Properties Text are clearly visible -->
    <div class="bg-overlay"></div>



    <!-- Premium Pure White Corporate Login Card -->
    <form class="login-card" method="POST" action="">
        <div class="brand-header">
            <img src="<?= base_url('assets/images/salam_official_logo.png') ?>" alt="Salam Properties" class="site-login-logo">
        </div>

        <div class="welcome-text">
            <h2>Welcome Back</h2>
            <p>Enter your credentials to access the management portal</p>
        </div>

        <?php if (!empty($error)): ?>
        <div class="error-message">
            <i class="bi bi-exclamation-octagon-fill"></i>
            <span><?= e($error) ?></span>
        </div>
        <?php endif; ?>

        <div class="form-group">
            <label class="form-label" for="username">Username</label>
            <div class="input-wrap">
                <i class="bi bi-person input-icon"></i>
                <input class="input-field" id="username" name="username" type="text" placeholder="Enter username" value="<?= e($_POST['username'] ?? '') ?>" required autofocus autocomplete="username">
            </div>
        </div>

        <div class="form-group">
            <label class="form-label" for="password">Password</label>
            <div class="input-wrap">
                <i class="bi bi-lock input-icon"></i>
                <input class="input-field" id="password" name="password" type="password" placeholder="••••••••" required autocomplete="current-password">
                <button type="button" class="toggle-password" id="togglePasswordBtn" aria-label="Toggle password visibility">
                    <i class="bi bi-eye" id="passwordEyeIcon"></i>
                </button>
            </div>
        </div>

        <div class="row-options">
            <label class="remember-wrap">
                <input type="checkbox" name="remember" checked>
                <span>Remember session</span>
            </label>
            <span style="font-size:12px; color:#16a34a; font-weight:600;"><i class="bi bi-shield-check"></i> SSL Secured</span>
        </div>

        <button type="submit" class="btn-submit">
            <span>Sign In to Dashboard</span>
            <i class="bi bi-arrow-right"></i>
        </button>

        <div class="card-footer">
            <p>Default Access: <strong>admin</strong> / <strong>admin123</strong></p>
            <p>&copy; <?= date('Y') ?> Salam Properties Ltd. All rights reserved.</p>
        </div>
    </form>

    <script>
        const toggleBtn = document.getElementById('togglePasswordBtn');
        const passwordInput = document.getElementById('password');
        const eyeIcon = document.getElementById('passwordEyeIcon');

        if (toggleBtn && passwordInput && eyeIcon) {
            toggleBtn.addEventListener('click', function() {
                const isPassword = passwordInput.getAttribute('type') === 'password';
                passwordInput.setAttribute('type', isPassword ? 'text' : 'password');
                eyeIcon.classList.toggle('bi-eye', !isPassword);
                eyeIcon.classList.toggle('bi-eye-slash', isPassword);
            });
        }
    </script>
</body>
</html>
