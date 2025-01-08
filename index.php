<?php

if (!isset($_SESSION['id_user'])) {
    header('Location: /pathe_rillette/login');
    exit;
}else{
    header('Location:/pathe_rillette/dashboard');
    exit;
}

?>