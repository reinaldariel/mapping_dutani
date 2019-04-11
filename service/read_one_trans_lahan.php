<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$nomor = $_GET['nomor'];

try {
    $stmt = $conn->prepare("SELECT tl.*,p.Nama_Petani FROM trans_lahan tl, master_petani p WHERE tl.ID_User = p.ID_User AND tl.nomor = ?");
    $stmt->bindParam(1, $nomor);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>