<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id_lahan = $_GET['id_lahan'];

try {
	$result = array();
    $stmt = $conn->prepare("SELECT * FROM master_peta_lahan_detail WHERE id_lahan = ? order by indeks asc");
    $stmt->bindParam(1, $id_lahan);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    if ($stmt->rowCount() > 0){
    	$result = $stmt->fetchAll();
    }else{
    	$stmt = $conn->prepare("SELECT '0' as id_detail, ID_Lahan as id_lahan,
        Koordinat_X as lat, Koordinat_Y as longt, '1' as indeks FROM master_peta_lahan WHERE ID_Lahan = ?");
	    $stmt->bindParam(1, $id_lahan);
	    $stmt->execute();
	    $stmt->setFetchMode(PDO::FETCH_ASSOC);
	    $result = $stmt->fetchAll();
    }
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>