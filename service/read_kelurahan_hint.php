<?php
include_once "../includes/config2.php";

$database = new Database();
$conn = $database->getConnection();
$p = $_GET['kec'];
$str = "";
try {

    $stmt = $conn->prepare("SELECT Nama_Desa from kelurahan_desa where Nama_Kecamatan = ?");
    $stmt->bindParam(1,$p);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    foreach ($result as $res){
        foreach ($res as $head=>$val){
            $str .= '<option value="'.$val.'">'.$val.'</option>' . ',';
        }

    }
    echo $str;
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}