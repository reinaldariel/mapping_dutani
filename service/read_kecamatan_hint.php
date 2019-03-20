<?php
include_once "../includes/config2.php";

$database = new Database();
$conn = $database->getConnection();
$p = $_GET['kab'];

try {

    $stmt = $conn->prepare("SELECT Nama_Kecamatan from kecamatan where Nama_Kabupaten = ?");
    $stmt->bindParam(1,$p);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    $str = "";
    foreach ($result as $res){
        foreach ($res as $head=>$val){
            $str .= '<option value="'.$val.'">'.$val.'</option>' . ',';

        }

    }
    echo $str;
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}