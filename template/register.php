<?php
session_start();
if (isset($_SESSION['id_user'])) {
    session_destroy();
}

$errors = [
    1 => 'User already exists',
    2 => 'Passwords do not match',
    3 => 'Invalid email',
    4 => 'Invalid password (must be at least 8 characters)',
];
$error = isset($_GET['error'], $errors[(int)$_GET['error']]) ? $errors[(int)$_GET['error']] : null;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#0b0b0f">
    <title>Register - Pathe &amp; Rillettes</title>
    <link rel="stylesheet" type="text/css" href="/pathe_rillette/style/global.css">
</head>

<body>
    <main class="container">
        <header class="header">
            <h1>Pathe &amp; Rillettes</h1>
        </header>
        <section class="content">
            <h2>Sign Up</h2>
            <?php if ($error): ?>
                <p class="error" role="alert"><?php echo htmlspecialchars($error); ?></p>
            <?php endif; ?>
            <form action="/pathe_rillette/dispatch/userDispatch.php" method="POST">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" autocomplete="email" autofocus required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" autocomplete="new-password" minlength="8" required>
                </div>
                <div class="form-group">
                    <label for="confirm_password">Confirm Password</label>
                    <input type="password" name="confirm_password" id="confirm_password" autocomplete="new-password" minlength="8" required>
                </div>
                <input type="hidden" name="action" value="register">
                <button type="submit">Register</button>
                <p class="form-footer">
                    Already have an account?
                    <a href="/pathe_rillette/login">Sign In</a>
                </p>
            </form>
        </section>
    </main>
</body>

</html>
