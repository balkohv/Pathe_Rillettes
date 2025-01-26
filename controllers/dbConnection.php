<?php
class DbConnection
{
    public function getDbConnection()
    {
        $db = new mysqli('localhost:3306', 'root', '', 'pathe_rillettes');
        if ($db->connect_error) {
            die("Connection failed: " . $db->connect_error);
        }
        return $db;
    }
}
?>