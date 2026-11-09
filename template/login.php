<?php

session_start();
if (isset($_SESSION['id_user'])) {
    session_destroy();
}

$errors = [
    1 => 'Invalid email or password.',
    2 => 'The user is not activate.',
];
$error = isset($_GET['error'], $errors[(int)$_GET['error']]) ? $errors[(int)$_GET['error']] : null;
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#0b0b0f">
    <title>Login - Pathe &amp; Rillettes</title>
    <link rel="stylesheet" type="text/css" href="/pathe_rillette/style/global.css">
</head>

<body>
    <main class="container">
        <header class="header">
            <h1>Pathe &amp; Rillettes</h1>
        </header>
        <section class="content">
            <?php if ($error): ?>
                <p class="error" role="alert"><?php echo htmlspecialchars($error); ?></p>
            <?php endif; ?>
            <form action="/pathe_rillette/dispatch/userDispatch.php" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" autocomplete="email" autofocus required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" autocomplete="current-password" required>
                </div>
                <input type="hidden" name="action" value="login">
                <button type="submit">Connexion</button>
                <p class="form-footer">
                    Don't have an account?
                    <a href="/pathe_rillette/register">Register here</a>
                </p>
            </form>
        </section>
    </main>
</body>

</html>
