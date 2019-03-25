<?php
include_once "../includes/config2.php";

$database = new Database();
$conn = $database->getConnection();
try {

        $stmt = $conn->prepare("SELECT DISTINCT Desa from master_peta_lahan");
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}