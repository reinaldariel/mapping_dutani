<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
if (isset($_GET['desa'])){
    $desa = $_GET['desa'];
}

try {
    if (isset($_GET['desa'])) {
        $stmt = $conn->prepare("SELECT d.* FROM master_peta_lahan_detail d, master_peta_lahan l where d.id_lahan = l.ID_Lahan AND l.Desa = ?");
        $stmt->bindParam(1, $desa);
    }
    else{
        $stmt = $conn->prepare("SELECT d.* FROM master_peta_lahan_detail d, master_peta_lahan l where d.id_lahan = l.ID_Lahan");
    }
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>