<?php
include_once "../includes/config2.php";

$database = new Database();
$conn = $database->getConnection();
try {

    $stmt = $conn->prepare("SELECT nama_kelompok_tani from master_kel_tani");
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}