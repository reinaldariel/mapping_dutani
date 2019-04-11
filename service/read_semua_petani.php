<?php
include_once "../includes/config2.php";
//membaca semua petani
$database = new Database();
$conn = $database->getConnection();
try {

    $stmt = $conn->prepare("SELECT * from master_petani");
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}