<?php
require_once 'dbConnection.php';

class UserMovieController
{
    private $db;

    public function __construct()
    {
        $dbConnection = new DbConnection();
        $this->db = $dbConnection->getDbConnection();
    }

    public function getUserMovie($id_user, $id_movie)
    {
        $query = "SELECT * FROM user_movie WHERE id_user = ? AND id_movie = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ii", $id_user, $id_movie);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }

    public function getUserMoviesByUser($id_user)
    {
        $query = "SELECT * FROM user_movie WHERE id_user = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $id_user);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    public function getUserMovieByMovie($id_movie)
    {
        $query = "SELECT * FROM user_movie WHERE id_movie = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $id_movie);
        $stmt->execute();
        $result = $stmt->get_result();
        return $result->fetch_assoc();
    }
    
    public function getUserRecommendations($id_user, $limit)
    {
        $query = "SELECT movies.categories FROM user_movie INNER JOIN movies ON user_movie.id_movie = movies.id_movie WHERE user_movie.id_user = ? AND user_movie.duration > 0";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("i", $id_user);
        $stmt->execute();
        $result = $stmt->get_result();
        $categories = [];
        foreach ($result as $row) {
            array_push($categories, ...explode(",", $row['categories']));
        }
        $recommendations = [];
        foreach ($categories as $category) {
            $query = "SELECT movies.*
                        FROM movies
                        WHERE FIND_IN_SET(?, movies.categories)
                        ORDER BY movies.review DESC 
                        LIMIT ?";
            $stmt = $this->db->prepare($query);
            $stmt->bind_param("si", $category, $limit);
            $stmt->execute();
            $result = $stmt->get_result();
            foreach ($result as $row) {
                $recommendations[] = $row;
            }
        }
        $recommendations = array_map("unserialize", array_unique(array_map("serialize", $recommendations)));
        return $recommendations;
    }

    public function addUserMovie($id_user, $id_movie)
    {
        $query = "INSERT INTO user_movie (id_user, id_movie) VALUES (?, ?)";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ii", $id_user, $id_movie);
        return $stmt->execute();
    }

    public function deleteUserMovie($id_user, $id_movie)
    {
        $query = "DELETE FROM user_movie WHERE id_user = ? AND id_movie = ?";
        $stmt = $this->db->prepare($query);
        $stmt->bind_param("ii", $id_user, $id_movie);
        return $stmt->execute();
    }

    public function updateUserMovie($id_user, $id_movie, $is_started, $is_finished, $in_list, $time_code, $duration)
    {
        var_dump($id_user, $id_movie, $is_started, $is_finished, $in_list, $time_code, $duration);
        $query = "UPDATE user_movie SET id_user = ?, id_movie = ?, is_started = ?, is_finished= ?, in_list = ?, time_code = ?, duration = ?, watch_date = ? WHERE id_user = ? AND id_movie = ?";
        $stmt = $this->db->prepare($query);
        $watch_date = (new DateTime())->format('Y-m-d H:i:s');
        $stmt->bind_param("iiiiiiisii", $id_user, $id_movie, $is_started, $is_finished, $in_list, $time_code, $duration, $watch_date, $id_user, $id_movie);
        var_dump($stmt);
        return $stmt->execute();
    }
}
