<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id_lahan = $_GET['id_lahan'];

try {
    //$stmt = $conn->prepare("SELECT p.*, l.* FROM master_petani p, master_peta_lahan l WHERE p.ID_User = l.ID_User AND ID_Lahan = ?");
    $stmt = $conn->prepare("SELECT p.*, l.* FROM master_petani p, master_peta_lahan l, trans_lahan t WHERE p.ID_User = t.ID_User and t.ID_Lahan = l.ID_Lahan AND t.ID_Lahan = ?");
    $stmt->bindParam(1, $id_lahan);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>