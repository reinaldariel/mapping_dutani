<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$idp = $_GET['idp'];
$id_penanaman = $_GET['id_penanaman'];
$id_lahan = "";

$stmt = $conn->prepare("SELECT ID_Lahan FROM master_peta_lahan_tanaman WHERE id_detail_tanaman = ?");
$stmt->bindParam(1, $id_penanaman);
$stmt->execute();
$stmt->setFetchMode(PDO::FETCH_ASSOC);
$id_lahan = $stmt->fetchAll();
$id_lahan = $id_lahan[0]['ID_Lahan'];

try {
    $stmt = $conn->prepare("DELETE FROM master_peta_lahan_tanaman WHERE id_detail_tanaman = ?");
    $stmt->bindParam(1, $id_penanaman);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo '<script>alert("Data penanaman lahan berhasil dihapus"); window.location.assign("'.$BASE_URL.'detail_lahan.php?id_lahan='.$id_lahan.'&id_petani='.$idp.'");</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>