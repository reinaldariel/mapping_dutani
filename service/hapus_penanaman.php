<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id_penanaman = $_GET['id_penanaman'];

try {
    $stmt = $conn->prepare("DELETE FROM master_peta_lahan_tanaman WHERE id_detail_tanaman = ?");
    $stmt->bindParam(1, $id_penanaman);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo '<script>alert("Data penanaman lahan berhasil dihapus"); history.go(-1);</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>