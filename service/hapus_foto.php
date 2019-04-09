<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id_foto = $_GET['id_foto'];

try {
    $stmt = $conn->prepare("DELETE FROM master_peta_lahan_foto WHERE id_foto = ?");
    $stmt->bindParam(1, $id_foto);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo '<script>alert("Foto berhasil dihapus"); history.go(-1);</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>