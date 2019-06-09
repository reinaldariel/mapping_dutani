<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$lat = $_POST['lat'];
$longt = $_POST['longt'];
$nama_petani = $_POST['nama_petani'];
$nama_lahan = $_POST['nama_lahan'];
if (isset($_POST['luas_lahan']) and $_POST['luas_lahan'] != "") {
    $luas_lahan = $_POST['luas_lahan'];
}
else{
    $luas_lahan = 0;
}
$jenis_lahan = $_POST['jenis_lahan'];
$provinsi = $_POST['provinsi'];
$Kabupaten = $_POST['Kabupaten'];
$Kecamatan = $_POST['Kecamatan'];
$desa = $_POST['Desa_Kelurahan'];
$status_organik = $_POST['status_organik'];

$id_user = $_POST['ID_User'];
$status_lahan = $_POST['status_lahan'];

try {
    $sql = "INSERT INTO `master_peta_lahan` (`ID_Lahan`, `nama_lahan`, `Koordinat_X`, `Koordinat_Y`, `luas_lahan`, `jenis_lahan`, `Desa`, `Kecamatan`, `Kabupaten`, `Provinsi`, `status_organik`) VALUES (NULL, '".$nama_lahan."', '".$lat."', '".$longt."', ".$luas_lahan.", '".$jenis_lahan."', '".$desa."', '".$Kecamatan."', '".$Kabupaten."', '".$provinsi."', '".$status_organik."');";
        $stmt = $conn->prepare($sql);
    $stmt->execute();

    $str = file_get_contents($BASE_URL.'service/read_lahan_latest.php');
    $json = json_decode($str, true);

        $id_lahan = $json[0]['ID_Lahan'];

    $sql2 = "INSERT INTO `trans_lahan` (`nomor`, `ID_User`, `ID_Lahan`, `tanggal`, `status_lahan`, `status_aktif`) VALUES (NULL, '".$id_user."', '".$id_lahan."', CURRENT_TIMESTAMP, '".$status_lahan."', '1');";
    $stmt = $conn->prepare($sql2);
    $stmt->execute();

    echo '<script>alert("Berhasil menambah lahan"); window.location.assign("'.$BASE_URL.'daftar_lahan_per_petani.php?id='.$id_user.'");;</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>