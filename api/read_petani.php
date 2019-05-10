<?php
include_once "../includes/config2.php";
//membaca semua petani yang memiliki lahan
$database = new Database();
$conn = $database->getConnection();
try {

    $stmt = $conn->prepare("SELECT p.ID_User, p.Nama_Petani, p.jml_lahan, COUNT(tl.ID_Lahan) as jml_tercatat, (p.jml_lahan-COUNT(tl.ID_Lahan)) as bisa 
    	from master_petani p left join trans_lahan tl on tl.ID_User = p.ID_User GROUP BY p.ID_User");
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}