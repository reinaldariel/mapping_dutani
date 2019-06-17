<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$idp = $_POST['id_pelaku'];
$id_lahan = $_POST['id_lahan'];
$ID_Spesies = $_POST['ID_Spesies'];
$kebutuhan_benih = $_POST['kebutuhan_benih'];
$kebutuhan_saprotan = $_POST['kebutuhan_saprotan'];
$satuan_saprotan = $_POST['satuan_saprotan'];
$bulan_tanam = $_POST['bulan_tanam'];
$bulan_panen =$_POST['bulan_panen'];
$rata_hasil_panen = $_POST['rata_hasil_panen'];

try {
    $sql = "INSERT INTO `master_peta_lahan_tanaman` (`id_detail_tanaman`,`ID_Lahan`, `ID_Spesies`, `kebutuhan_benih`, `kebutuhan_saprotan`, `satuan_saprotan`, `bulan_tanam`, `bulan_akhir`, `rata_hasil_panen`) VALUES (NULL, '".$id_lahan."', '".$ID_Spesies."', ".$kebutuhan_benih.", ".$kebutuhan_saprotan.", '".$satuan_saprotan."', '".$bulan_tanam."', '".$bulan_panen."', ".$rata_hasil_panen.");";

    $stmt = $conn->prepare($sql);
    $stmt->execute();
    echo '<script>alert("Berhasil menambah penanaman pada lahan"); window.location.assign("'.$BASE_URL.'detail_lahan.php?id_lahan='.$id_lahan.'&id_petani='.$idp.'");</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>