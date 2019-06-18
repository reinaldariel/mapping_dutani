<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$str = "select l.ID_Lahan, p.Nama_Petani as nama,l.Koordinat_Y as longitude,l.Koordinat_X as latitude,l.Desa, tl.ID_User as id_user, t.Nama_Kelompok_Tani 
from master_petani p, master_peta_lahan l, trans_lahan tl, master_kel_tani t 
where t.ID_Kelompok_Tani = l.ID_Kelompok_Tani 
AND tl.ID_User = p.ID_User 
AND tl.ID_Lahan = l.ID_Lahan 
AND tl.ID_User not in('') 
AND l.ID_Lahan not in('') 
AND tl.status_aktif = 1
and tl.status_lahan = 'milik'";

if (isset($_GET['daerah']) and $_GET['daerah'] != ""){
    $str .= " and l.Desa = '".$_GET['daerah']."'";
}
if (isset($_GET['klptani']) and $_GET['klptani'] != ""){
    $str .= " and l.ID_Kelompok_Tani = '".$_GET['klptani']."'";
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