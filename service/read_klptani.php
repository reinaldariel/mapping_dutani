<?php
include_once "../includes/config2.php";

$database = new Database();
$conn = $database->getConnection();
$str = "SELECT DISTINCT tp.ID_Kelompok_Tani as id, k.nama_kelompok_tani from master_kel_tani k, trans_ang_petani tp, master_petani p, trans_lahan tl, master_peta_lahan l where k.ID_Kelompok_Tani = tp.ID_Kelompok_Tani AND tp.ID_User = p.ID_User AND p.ID_User = tl.ID_User AND tl.ID_Lahan = l.ID_Lahan";
if (isset($_GET['klptani'])){
    $str.= " and tp.ID_Kelompok_Tani != '".$_GET['klptani']."'";
}
try {
    $stmt = $conn->prepare($str);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}