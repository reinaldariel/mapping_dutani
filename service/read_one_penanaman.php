<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id = $_GET['id'];

try {
    $stmt = $conn->prepare("SELECT t.*, s.Nama_Tanaman, l.nama_lahan FROM master_peta_lahan_tanaman t, master_spesies_tanaman s, master_peta_lahan l WHERE t.ID_Lahan = l.ID_Lahan AND t.ID_Spesies = s.ID_Spesies AND id_detail_tanaman = ?");
    $stmt->bindParam(1, $id);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>