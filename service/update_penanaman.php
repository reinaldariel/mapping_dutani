<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$id_lahan = $_POST['id_lahan'];
$id_penanaman = $_POST['id_detail_tanaman'];
$ID_Spesies = $_POST['ID_Spesies'];
$kebutuhan_benih = $_POST['kebutuhan_benih'];
$kebutuhan_saprotan = $_POST['kebutuhan_saprotan'];
$satuan_saprotan = $_POST['satuan_saprotan'];
$bulan_tanam = $_POST['bulan_tanam'];
$bulan_panen =$_POST['bulan_panen'];
$rata_hasil_panen = $_POST['rata_hasil_panen'];

try {
    $sql = "UPDATE `master_peta_lahan_tanaman` SET `ID_Spesies` = '".$ID_Spesies."', `kebutuhan_benih` = ".$kebutuhan_benih.", `kebutuhan_saprotan` = ".$kebutuhan_saprotan.", `satuan_saprotan` = '".$satuan_saprotan."', `bulan_tanam` = '".$bulan_tanam."', `bulan_akhir` = '".$bulan_panen."', `rata_hasil_panen` = ".$rata_hasil_panen." WHERE `master_peta_lahan_tanaman`.`id_detail_tanaman` = '".$id_penanaman."';";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    echo '<script>alert("Berhasil mengubah penanaman pada lahan"); window.location.assign("'.$BASE_URL.'detail_lahan.php?id_lahan='.$id_lahan.'");</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>