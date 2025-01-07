<?php
// userMovieDispatch.php
ini_set('display_errors', 1);
// Include necessary files and initialize database connection
require_once '../controllers/userMovieController.php';
$userMovieController = new UserMovieController();
// Get the action from the request
$action = isset($_POST['action']) ? $_POST['action'] : '';

// Dispatch based on the action
switch ($action) {
    case 'add':
        echo json_encode($userMovieController->addUserMovie($_POST['id_user'], $_POST['id_movie']));
        break;
    case 'getUserMovie':
        echo json_encode($userMovieController->getUserMovie($_POST['id_user'], $_POST['id_movie']));
        break;
    case 'getUserMoviesByUser':
        echo json_encode($userMovieController->getUserMoviesByUser($_POST['id_user']));
        break;
    case 'delete':
        deleteUserMovie();
        break;
    case 'update':
        echo json_encode($userMovieController->updateUserMovie($_POST['id_user'], $_POST['id_movie'],$_POST["is_started"],$_POST['is_finished'], $_POST['in_list'], $_POST['time_code'], $_POST['duration']));
        break;
    case 'getUserRecommendations':
        echo json_encode($userMovieController->getUserRecommendations($_POST['id_user'], $_POST['limit']));
        break;
    case 'list':
        listUserMovies();
        break;
    default:
        echo "Invalid action.";
        break;
}

// Function to add a user movie
function addUserMovie() {
    // Your code to add a user movie
    echo "Add user movie.";
}

// Function to delete a user movie
function deleteUserMovie() {
    // Your code to delete a user movie
    echo "Delete user movie.";
}

// Function to update a user movie
function updateUserMovie() {
    // Your code to update a user movie
    echo "Update user movie.";
}

// Function to list user movies
function listUserMovies() {
    // Your code to list user movies
    echo "List user movies.";
}
?>