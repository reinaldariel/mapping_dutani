<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$desa = $_GET['desa'];

try {
    $stmt = $conn->prepare("SELECT l.*, k.col_hex FROM master_peta_lahan l, trans_lahan tl, master_petani p, master_kel_tani k, trans_ang_petani tp where tl.ID_Lahan = l.ID_Lahan and p.ID_User = tl.ID_User and p.ID_User = tp.ID_User and tp.ID_Kelompok_Tani = k.ID_Kelompok_Tani AND l.Desa = ?");
    $stmt->bindParam(1, $desa);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>