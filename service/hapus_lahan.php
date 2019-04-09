<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id_lahan = $_GET['id_lahan'];

try {
    $stmt = $conn->prepare("DELETE FROM master_peta_lahan WHERE ID_Lahan = ?");
    $stmt->bindParam(1, $id_lahan);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo '<script>alert("Kepemilikan lahan berhasil dihapus"); history.go(-1);</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>