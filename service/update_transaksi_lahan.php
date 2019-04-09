<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$nomor = $_POST['nomor'];
$status_lahan = $_POST['status_lahan'];
$tanggal = $_POST['tanggal'];
try {
    $sql = "UPDATE `trans_lahan` SET `tanggal` = '".$tanggal."', `status_lahan` = '".$status_lahan."' WHERE `trans_lahan`.`nomor` = ".$nomor.";";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    echo '<script>alert("Berhasil mengubah kepemilikan lahan"); history.go(-2);</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>