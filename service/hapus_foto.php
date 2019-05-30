<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id_foto = $_GET['id_foto'];
$id_lahan = '';
$stmt = $conn->prepare("SELECT ID_Lahan FROM master_peta_lahan_foto WHERE id_foto = ?");
$stmt->bindParam(1, $id_foto);
$stmt->execute();
$stmt->setFetchMode(PDO::FETCH_ASSOC);
while($id_lahan = $stmt->fetch(PDO::FETCH_ASSOC)){
    $id_lahan = $id_lahan['ID_Lahan'];
}

try {
    $stmt = $conn->prepare("DELETE FROM master_peta_lahan_foto WHERE id_foto = ?");
    $stmt->bindParam(1, $id_foto);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo '<script>alert("Foto berhasil dihapus"); window.location.assign("'.$BASE_URL.'detail_lahan.php?id_lahan='.$id_lahan.'");</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>