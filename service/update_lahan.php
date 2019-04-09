<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$id_lahan = $_POST['id_lahan'];
$lat = $_POST['lat'];
$longt = $_POST['longt'];
$nama_lahan = $_POST['nama_lahan'];
$luas_lahan = $_POST['luas_lahan'];
$jenis_lahan = $_POST['jenis_lahan'];
$provinsi = $_POST['provinsi'];
$Kabupaten = $_POST['Kabupaten'];
$Kecamatan = $_POST['Kecamatan'];
$desa = $_POST['Desa_Kelurahan'];
$status_organik = $_POST['status_organik'];
try {
    $sql = "UPDATE `master_peta_lahan` SET `nama_lahan` = '".$nama_lahan."', `Koordinat_X` = '".$lat."', `Koordinat_Y` = '".$longt."', `luas_lahan` = ".$luas_lahan.", `jenis_lahan` = '".$jenis_lahan."', `Desa` = '".$desa."', `Kecamatan` = '".$Kecamatan."', `Kabupaten` = '".$Kabupaten."', `Provinsi` = '".$provinsi."', `status_organik` = '".$status_organik."' WHERE `master_peta_lahan`.`ID_Lahan` = '".$id_lahan."';";
//    $stmt->bindParam(1, $id_lahan);
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    echo '<script>alert("Berhasil mengubah lahan"); window.location.assign("'.$BASE_URL.'detail_lahan.php?id_lahan='.$id_lahan.'");</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>