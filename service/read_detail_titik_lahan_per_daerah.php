<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$desa = $_GET['desa'];

try {
    $stmt = $conn->prepare("SELECT d.* FROM master_peta_lahan_detail d, master_peta_lahan l where d.id_lahan = l.ID_Lahan AND l.Desa = ?");
    $stmt->bindParam(1, $desa);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>