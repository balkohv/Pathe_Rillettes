<?php

if (!isset($_SESSION['id_user'])) {
    header('Location: template/login.php');
    exit;
}else{
    header('Location: template/dashboard/dashboard.php');
    exit;
}

?>