<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id_user = $_GET['id_user'];

try {
    $stmt = $conn->prepare("SELECT * FROM master_petani WHERE ID_User = ?");
    $stmt->bindParam(1, $id_user);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>