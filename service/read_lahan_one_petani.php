<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id_user = $_GET['id_user'];

try {
    $stmt = $conn->prepare("SELECT l.*, p.Nama_Petani as nama,l.Koordinat_Y as longitude,l.Koordinat_X as latitude, tl.ID_User as id_user, t.Nama_Kelompok_Tani 
FROM trans_lahan tl, master_peta_lahan l, master_petani p, master_kel_tani t 
WHERE tl.ID_Lahan = l.ID_Lahan 
AND tl.ID_User = ?
and tl.status_aktif = 1
AND t.ID_Kelompok_Tani = l.ID_Kelompok_Tani
AND tl.ID_User = p.ID_User 
AND l.ID_Lahan not in('')
ORDER BY l.ID_Lahan");
    $stmt->bindParam(1, $id_user);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>