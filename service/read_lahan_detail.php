<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$str = "SELECT d.ID_Lahan, d.lat, d.longt, k.col_hex from master_peta_lahan_detail d, master_peta_lahan l, trans_lahan tl, master_petani p, master_kel_tani k, trans_ang_petani tp where d.id_lahan = l.ID_Lahan and tl.ID_Lahan = l.ID_Lahan and p.ID_User = tl.ID_User and p.ID_User = tp.ID_User and tp.ID_Kelompok_Tani = k.ID_Kelompok_Tani";
try {

    if (isset($_GET['klptani'])) {
        $var = $_GET['klptani'];
        $str .= " and k.ID_Kelompok_Tani = '".$var."'";
    }
    if (isset($_GET['daerah'])) {
        $var = $_GET['daerah'];
        $str .= " and l.Desa = '".$var."'";
    }
    $stmt = $conn->prepare($str);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>