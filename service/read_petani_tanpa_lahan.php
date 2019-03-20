<?php
include_once "../includes/config2.php";

$database = new Database();
$conn = $database->getConnection();
try {

    $stmt = $conn->prepare("SELECT ID_User, Nama_Petani, jml_lahan from master_petani where ID_user NOT IN (SELECT p.ID_User from master_petani p, master_peta_lahan l WHERE p.ID_User = l.ID_User GROUP BY p.ID_User)");
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}