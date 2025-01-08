<?php
// /c:/MAMP/htdocs/Pathe_rillette/dispatch/userDispatch.php

// Include the UserController
require_once '../controllers/UserController.php';

// Create an instance of the UsersController
$usersController = new UserController();

// Check the request method
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Handle POST request
    if (isset($_POST['action'])) {
        switch ($_POST['action']) {
            case 'register':
                $result = $usersController->createUser($_POST['email'], $_POST['password']);
                if ($result == "User created.") {
                    header('Location: /pathe_rillette/login');
                } elseif ($result == "User already exists.") {
                    header('Location: /pathe_rillette/register/1');
                } elseif ($result == "Passwords do not match.") {
                    header('Location: /pathe_rillette/register/2');
                } elseif ($result == "Invalid email.") {
                    header('Location: /pathe_rillette/register/3');
                } elseif ($result == "Invalid password.") {
                    header('Location: /pathe_rillette/register/4');
                }
                break;
            case 'login':
                $result = $usersController->loginUser($_POST['email'], $_POST['password']);
                if ($result[0] == "Login successful.") {
                    session_set_cookie_params(0, '/', '', false, true);
                    session_start();
                    $_SESSION['id_user'] = $result[1];
                    session_write_close();
                    header('Location: /pathe_rillette/dashboard');
                } elseif($result == "The user is not activate.") {
                    header('Location: /pathe_rillette/login/2');
                }
                else {
                    header('Location: /pathe_rillette/login/1');
                }
                break;
            case 'archive':
                $usersController->archiveUser($_POST['id']);
                break;
            default:
                echo "Invalid action";
        }
    }
} elseif ($_SERVER['REQUEST_METHOD'] === 'GET') {
    switch ($_GET['action']) {
        case 'validation':
            $usersController->validateUser($_GET['token']);
            break;
        default:
            echo "Invalid action";
    }
} else {
    echo "Unsupported request method";
}
