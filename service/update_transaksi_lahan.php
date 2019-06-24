<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$nomor = $_POST['nomor'];
$status_lahan = $_POST['status_lahan'];
$tanggal = $_POST['tanggal'];
$idp = $_POST['id_pelaku'];
$iduser = $_POST['ID_User'];
$id_lahan = '';
$stmt = $conn->prepare("SELECT ID_Lahan FROM trans_lahan WHERE nomor = ?");
$stmt->bindParam(1, $nomor);
$stmt->execute();
$stmt->setFetchMode(PDO::FETCH_ASSOC);
$id_lahan = $stmt->fetchAll();
$id_lahan = $id_lahan[0]['ID_Lahan'];

try {
    $sql = "UPDATE `trans_lahan` SET `tanggal` = '".$tanggal."', `status_lahan` = '".$status_lahan."', `ID_User` = '".$iduser."' WHERE `trans_lahan`.`nomor` = ".$nomor.";";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    echo '<script>alert("Berhasil mengubah kepemilikan lahan"); window.location.assign("'.$BASE_URL.'detail_lahan.php?id_lahan='.$id_lahan.'&id_petani='.$idp.'");</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>