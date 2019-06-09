<?php
include_once "../includes/config2.php";
$database = new Database();
$conn = $database->getConnection();

$str = "SELECT DISTINCT Desa from master_peta_lahan";
if (isset($_GET['desa'])){
    $str.= " WHERE Desa != '".$_GET['desa']."'";
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