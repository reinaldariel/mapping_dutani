<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id_trans = $_GET['id_trans'];
$id_lahan = '';
$stmt = $conn->prepare("SELECT ID_Lahan FROM trans_lahan WHERE nomor = ?");
$stmt->bindParam(1, $id_trans);
$stmt->execute();
$stmt->setFetchMode(PDO::FETCH_ASSOC);
$id_lahan = $stmt->fetchAll();
$id_lahan = $id_lahan[0]['ID_Lahan'];

try {
    $stmt = $conn->prepare("UPDATE `trans_lahan` SET `status_aktif` = '0' WHERE `trans_lahan`.`nomor` = ?;");
    $stmt->bindParam(1, $id_trans);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo '<script>alert("Berhasil menghapus status kepemilikan lahan"); window.location.assign("'.$BASE_URL.'detail_lahan.php?id_lahan='.$id_lahan.'");</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>