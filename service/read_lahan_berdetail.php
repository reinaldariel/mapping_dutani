<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$str = "SELECT DISTINCT d.id_lahan as ID_Lahan, p.Nama_Petani as nama,l.Desa as desa,tl.ID_User as id_user, k.Nama_Kelompok_Tani, k.col_hex, l.Koordinat_X as lat,l.Koordinat_Y as longt FROM master_peta_lahan_detail d, master_peta_lahan l, trans_lahan tl, master_petani p, master_kel_tani k, trans_ang_petani tp where d.id_lahan = l.ID_Lahan and tl.ID_Lahan = l.ID_Lahan and p.ID_User = tl.ID_User and p.ID_User = tp.ID_User and tp.ID_Kelompok_Tani = k.ID_Kelompok_Tani and tl.status_aktif = 1 and tl.status_lahan = 'milik'";

if (isset($_GET['klptani']) and $_GET['klptani'] != ""){
    $str .= " and k.ID_Kelompok_Tani = '".$_GET['klptani']."'";
}
if (isset($_GET['daerah']) and $_GET['daerah'] != ""){
    $str .= " and l.Desa = '".$_GET['daerah']."'";
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
?>