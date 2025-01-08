<?php
ini_set('display_errors', 1);
require '../vendor/autoload.php';
require_once '../controllers/movieController.php';

$moviesController = new MovieController();
$client = new \GuzzleHttp\Client();

$action = isset($_POST['action']) ? $_POST['action'] : '';

switch ($action) {
    case 'upload_movie':
        uploadMovie($client);
        break;
    case 'getMovies':
        echo json_encode($moviesController->getAllMovies());
        break;
    case 'watch':
        echo json_encode($moviesController->add_views($_POST['id_movie']));
        break;
    case 'getMovieById':
        echo json_encode($moviesController->getMovieById($_POST['id_movie']));
        break;
    case 'getPopularMovies':
        echo json_encode($moviesController->getPopularMovies());
        break;
    case 'search':
        echo json_encode($moviesController->searchMovies($_POST['search']));
        break;
    default:
        echo 'Invalid action.';
        break;
}

function uploadMovie($client)
{
    $movieController = new MovieController();
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        if (isset($_FILES['movie']) && $_FILES['movie']['error'] === UPLOAD_ERR_OK) {
            $uploadDir = '../movies/'; // Répertoire de destination des fichiers
            if (!is_dir($uploadDir)) {
                mkdir($uploadDir, 0777, true); // Crée le dossier s'il n'existe pas
            }

            $fileTmpPath = $_FILES['movie']['tmp_name'];
            $fileName = basename($_FILES['movie']['name']);
            $destination = $uploadDir . $fileName;

            if (move_uploaded_file($fileTmpPath, $destination)) {
                $response = $client->request('GET', 'https://api.themoviedb.org/3/search/movie?query=' . $_POST['name'] . '&include_adult=true&language=fr-US&page=1', [
                    'headers' => [
                        'Authorization' => 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2OGRlZTliNDU0NzAyYTUyN2I2NGZiOTkzZGYzZWYxZiIsIm5iZiI6MTczNjA4NDU3OC40MjMsInN1YiI6IjY3N2E4YzYyODJjY2UxNWE3Njc0ZjY1ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.vUxSHTJb17jGKbuEmtIevhN8w5MpuYPg4b2iB4Fa5PQ',
                        'accept' => 'application/json',
                    ],
                ]);
                $servername = "localhost";
                $username = "root";
                $password = "root";
                $dbname = "pathe_rillettes";

                $conn = new mysqli($servername, $username, $password, $dbname);

                if ($conn->connect_error) {
                    die("Connection failed: " . $conn->connect_error);
                }

                // Decode the API response
                $movieData = json_decode($response->getBody(), true);
                if (isset($movieData['results'][0])) {
                    $movie = $movieData['results'][0];
                    $title = $conn->real_escape_string($movie['title']);
                    $categories = $conn->real_escape_string(implode(', ', $movie['genre_ids']));
                    $duration = 0;
                    $views = 0; // Default value
                    $ref = $destination;
                    $description = $conn->real_escape_string($movie['overview']);
                    $review = $conn->real_escape_string($movie['vote_average']);
                    $poster_ref = 'https://image.tmdb.org/t/p/w500/' . $conn->real_escape_string($movie['poster_path']);
                    $result = $movieController->getMovieByTitle($conn->real_escape_string($movie['title']));
                    if ($result) {
                        echo "Movie already exists.";
                        return;
                    }
                    // Insert into database
                    $sql = "INSERT INTO movies (title, categories, duration, views, ref, description, review, poster_ref) VALUES ('$title', '$categories', '$duration', '$views', '$ref', '$description', '$review', '$poster_ref')";
                    if ($conn->query($sql) === TRUE) {
                        echo "Movie added successfully.";
                    } else {
                        echo "Error: " . $sql . "<br>" . $conn->error;
                    }
                } else {
                    echo "No movie data found in API response.";
                }

                $conn->close();
            } else {
                echo 'Failed to move uploaded file.';
            }
        } else {
            echo 'No file uploaded or upload error.';
        }
    } else {
        echo 'Invalid request method.';
    }
}
