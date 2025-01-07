<?php
    session_start();
    if(isset($_SESSION['id_user'])){
        session_destroy();
    }
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="../style/global.css">
</head>

<body>
    <div class="container">
        <div class="header">
            <h1>Pathe & Rillettes</h1>
        </div>
        <div class="content">
            <h2>Sign Up</h2>
            <?php 
            if(isset($_GET['error'])){
                if($_GET['error']==1){
                    echo "<p style='color:red'>User already exists</p>";
                }elseif($_GET['error']==2){
                    echo "<p style='color:red'>Passwords do not match</p>";
                }elseif($_GET['error']==3){
                    echo "<p style='color:red'>Invalid email</p>";
                }elseif($_GET['error']==4){
                    echo "<p style='color:red'>Invalid password (must be at least 8 characters)</p>";
                }
            }
            ?>
            <form action="../dispatch/userDispatch.php" method="POST">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" required>
                </div>
                <div class="form-group">
                    <label for="confirm_password">Confirm Password</label>
                    <input type="password" name="confirm_password" id="confirm_password" required>
                </div>
                <div class="login-link">
                    <p>Already have an account? <a href="login.php">Sign In</a></p>
                </div>
                <input type="hidden" name="action" value="register">
                <button type="submit">Register</button>
            </form>
        </div>
    </div>
</body>

</html>