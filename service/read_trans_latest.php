<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

try {
    $stmt = $conn->prepare("SELECT * FROM `trans_lahan` ORDER by nomor DESC limit 1");
    $stmt->bindParam(1, $id_lahan);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>