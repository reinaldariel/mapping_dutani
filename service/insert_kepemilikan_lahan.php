<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$id_lahan = $_POST['ID_Lahan'];
$id_user = $_POST['ID_User'];
$status_lahan = $_POST['status_lahan'];
$tanggal = $_POST['tanggal'];
try {
    $sql='';
    if (isset($tanggal) == false) {
        $sql = "INSERT INTO `trans_lahan` (`nomor`, `ID_User`, `ID_Lahan`, `tanggal`, `status_lahan`, `status_aktif`) VALUES (NULL, '" . $id_user . "', '" . $id_lahan . "', CURRENT_TIMESTAMP, '" . $status_lahan . "', '1');";
    }
    else
    {
        $sql = "INSERT INTO `trans_lahan` (`nomor`, `ID_User`, `ID_Lahan`, `tanggal`, `status_lahan`, `status_aktif`) VALUES (NULL, '" . $id_user . "', '" . $id_lahan . "', '".$tanggal."', '" . $status_lahan . "', '1');";
    }
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    echo '<script>alert("Berhasil menambah kepemilikan lahan"); history.go(-2);</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>