<?php
include_once "../includes/config2.php";

$database = new Database();
$conn = $database->getConnection();
try {

    $stmt = $conn->prepare("SELECT p.ID_User, p.Nama_Petani, p.jml_lahan, COUNT(l.ID_Lahan) as jml_tercatat, (p.jml_lahan-COUNT(l.ID_Lahan)) as bisa from master_petani p, master_peta_lahan l WHERE p.ID_User = l.ID_User GROUP BY p.ID_User");
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}