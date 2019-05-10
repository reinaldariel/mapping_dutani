<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id_user = $_GET['id_user'];

try {
    $stmt = $conn->prepare("SELECT l.ID_Lahan, l.nama_lahan, l.luas_lahan,
    	l.jenis_lahan, l.Desa, l.status_organik 
    	FROM trans_lahan tl, master_peta_lahan l WHERE tl.ID_Lahan = l.ID_Lahan AND tl.ID_User = ? and tl.status_aktif = 1");
    $stmt->bindParam(1, $id_user);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>