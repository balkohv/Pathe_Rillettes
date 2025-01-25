<?php
require_once 'dbConnection.php';
require '../vendor/autoload.php';
ini_set('display_errors', 1);


class UserController
{
    public function createUser($email, $password)
    {
        
        // Hash the password
        $hashedPassword = password_hash($password, PASSWORD_DEFAULT);

        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
            return "Invalid email.";
        }
        if (strlen($password) < 8) {
            return "Invalid password.";
        }
        if ($password != $_POST['confirm_password']) {
            return "Passwords do not match.";
        }

        // Insert user into the database (assuming you have a database connection)
        $token = bin2hex(random_bytes(50));
        $url = "http://localhost/Pathe_rillette/dispatch/userDispatch.php?action=validation&token=" . $token;
        $dbConnection = new DbConnection();
        $db = $dbConnection->getDbConnection();
        $stmt = $db->prepare("SELECT id_user FROM users WHERE mail = ?");
        $stmt->bind_param("s", $email);
        $stmt->execute();
        $stmt->bind_result($id_user);
        $stmt->fetch();
        $stmt->close();
        if ($id_user) {
            return "User already exists.";
        }
        $stmt = $db->prepare("INSERT INTO users (mail, password, token) VALUES (?, ?, ?)");
        if (!$stmt) {
            die("Prepare failed: (" . $db->errno . ") " . $db->error);
        }
        $stmt->bind_param("sss", $email, $hashedPassword, $token);
        $stmt->execute();
        $stmt->close();
        return "User created.";
    }

    // User login
    public function loginUser($mail, $password)
    {
        // Retrieve user from the database
        $dbConnection = new DbConnection();
        $db = $dbConnection->getDbConnection();
        $stmt = $db->prepare("SELECT id_user,active, password FROM users WHERE mail = ?");
        $stmt->bind_param("s", $mail);
        $stmt->execute();
        $stmt->bind_result($id_user, $active, $hashedPassword);
        $stmt->fetch();
        $stmt->close();

        // Verify the password
        if (password_verify($password, $hashedPassword)) {
            if ($active != 1) {
                return "The user is not activate.";
            }else{
                return ["Login successful.", $id_user];
            }
        } else {
            return "Invalid username or password.";
        }
    }

    // Archive a user
    public function archiveUser($username)
    {
        // Update user status to archived in the database
        $dbConnection = new DbConnection();
        $db = $dbConnection->getDbConnection();
        $stmt = $db->prepare("UPDATE users SET status = 'archived' WHERE username = ?");
        $stmt->bind_param("s", $username);
        $stmt->execute();
        $stmt->close();

        return "User archived successfully.";
    }

    public function validateUser($token)
    {
        $dbConnection = new DbConnection();
        $db = $dbConnection->getDbConnection();
        $stmt = $db->prepare("UPDATE users SET active = 1 WHERE token = ?");
        var_dump($token, $stmt);
        $stmt->bind_param("s", $token);
        $stmt->execute();
        $stmt->close();
        header('Location: /pathe_rillette/login');
    }
}
