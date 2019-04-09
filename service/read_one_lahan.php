<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id_lahan = $_GET['id_lahan'];

try {
    $stmt = $conn->prepare("SELECT l.ID_Lahan, p.Nama_Petani, l.nama_lahan, l.Koordinat_X as lat, l.Koordinat_Y as longt, l.luas_lahan, l.jenis_lahan, l.Desa, l.Kecamatan, l.Kabupaten, l.Provinsi, l.status_organik FROM master_peta_lahan l, master_petani p WHERE ID_Lahan = ? limit 1");
    $stmt->bindParam(1, $id_lahan);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>