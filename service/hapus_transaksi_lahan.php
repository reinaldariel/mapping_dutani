<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id_trans = $_GET['id_trans'];

try {
    $stmt = $conn->prepare("UPDATE `trans_lahan` SET `status_aktif` = '0' WHERE `trans_lahan`.`nomor` = ?;");
    $stmt->bindParam(1, $id_trans);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo '<script>alert("Berhasil menghapus status kepemilikan lahan"); history.go(-1);</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>