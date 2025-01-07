<?php

session_start();
    if(isset($_SESSION['id_user'])){
        session_destroy();
    }
?>
<head>
    <title>Pathe rillette</title>
    <link rel="stylesheet" type="text/css" href="../style/global.css">
</head>

<body>
    <div class="container">
        <div class="header">
            <h1>Pathe & Rillettes</h1>
        </div>
        <div class="content">
            <?php 
            if(isset($_GET['error'])){
                if($_GET['error']==1){
                    echo "<p style='color:red'>Invalid email or password.</p>";
                }elseif($_GET['error']==2){
                    echo "<p style='color:red'>The user is not activate.</p>";
                }
            }
            ?>
            <form action="../dispatch/userDispatch.php" method="post">
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" name="password" id="password" required>
                </div>
                <div class="form-group">
                    <p>
                        Don't have an account?
                        <a href="register.php">Register here</a>
                    </p>
                </div>
                <input type="hidden" name="action" value="login">
                <button type="submit">Connexion</button>
            </form>
        </div>
    </div>
</body