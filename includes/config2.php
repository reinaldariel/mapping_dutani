<?php
class Database{
    // specify your own database credentials
    private $host = "localhost";
    private $db_name = "iais_ukdw";
    private $username = "root";
    private $password = "";
    public $conn;

    // get the database connection
    public function getConnection(){
        $this->conn = null;

        try{
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->exec("set names utf8");
        }catch(PDOException $exception){
            echo "Connection error: " . $exception->getMessage();
        }

        return $this->conn;
    }
}

//$BASE_URL="http://localhost/mapping_dutani/";
$BASE_URL="http://localhost/dutatani_mapping/";
$def_lat="-7.9314509";
$def_long="110.3002641";