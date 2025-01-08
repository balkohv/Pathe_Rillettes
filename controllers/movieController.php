<?php
require_once 'dbConnection.php';
class MovieController
{
    private $db;

    public function __construct()
    {
        $dbConnection = new DbConnection();
        $this->db = $dbConnection->getDbConnection();
    }

    public function getAllMovies()
    {
        $query = "SELECT * FROM movies";
        $result = $this->db->query($query);
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function getMovieById($id)
    {
        $query = "SELECT * FROM movies WHERE id_movie = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    public function getMovieByTitle ($title)
    {
        $query = "SELECT * FROM movies WHERE title = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("s", $title);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    public function createMovie($title, $categories, $duration, $views, $ref, $description, $review, $poster_ref)
    {
        $query = "INSERT INTO movies (title, categories, duration, views, ref, description, review, poster_ref) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param(
            "ssiiisds",
            $title,
            $categories,
            $duration,
            $views,
            $ref,
            $description,
            $review,
            $poster_ref
        );
        return $stmt->execute();
    }

    public function getPopularMovies()
    {
        $query = "SELECT * FROM movies ORDER BY views DESC LIMIT 9";
        $result = $this->db->query($query);
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function add_views($id)
    {
        $query = "UPDATE movies SET views = views + 1 WHERE id_movie = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $id);
        return $stmt->execute();
    }

    public function updateMovie($id, $title, $categories, $duration, $views, $ref, $description, $review, $poster_ref)
    {
        $query = "UPDATE movies SET title = ?, categories = ?, duration = ?, views = ?, ref = ?, description = ?, review = ?, poster_ref = ? WHERE id_movie = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ssiiisdsi", $title, $categories, $duration, $views, $ref, $description, $review, $poster_ref, $id);
        return $stmt->execute();
    }

    public function deleteMovie($id)
    {
        $query = "DELETE FROM movies WHERE id_movie = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $id);
        return $stmt->execute();
    }

    public function searchMovies($search)
    {
        $query = "SELECT * FROM movies WHERE title LIKE ? ";
        $stmt = $this->db->prepare($query);
        $searchTerm = "%" . $search . "%";
        $stmt->bind_param("s", $searchTerm);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }
}
