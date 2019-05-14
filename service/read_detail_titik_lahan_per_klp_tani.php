<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
if (isset($_GET['klp_tani'])) {
    $klp_tani = $_GET['klp_tani'];
}
try {
    if (isset($_GET['klp_tani'])) {
        $stmt = $conn->prepare("SELECT d.* FROM master_peta_lahan_detail d, master_peta_lahan l, master_petani p, trans_ang_petani k, trans_lahan tl where d.id_lahan = l.ID_Lahan and tl.ID_Lahan = l.ID_Lahan and tl.ID_User = p.ID_User AND p.ID_User = k.ID_User and k.ID_Kelompok_Tani = ?");
        $stmt->bindParam(1, $klp_tani);
    }else{
        $stmt = $conn->prepare("SELECT d.* FROM master_peta_lahan_detail d, master_peta_lahan l, master_petani p, trans_ang_petani k, trans_lahan tl where d.id_lahan = l.ID_Lahan and tl.ID_Lahan = l.ID_Lahan and tl.ID_User = p.ID_User AND p.ID_User = k.ID_User");
    }
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>