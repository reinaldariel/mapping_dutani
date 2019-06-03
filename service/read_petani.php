<?php
include_once "../includes/config2.php";
//membaca semua petani yang memiliki lahan
$database = new Database();
$conn = $database->getConnection();
try {

    $stmt = $conn->prepare("SELECT p.ID_User as ID_User, p.Nama_Petani, p.jml_lahan, 0 as jml_tercatat, 0 as bisa from master_petani p where p.ID_User NOT IN (SELECT DISTINCT ID_User from trans_lahan)
UNION ALL
SELECT tl.ID_User as ID_User, p.Nama_Petani, p.jml_lahan, COUNT(tl.ID_Lahan), (p.jml_lahan-COUNT(tl.ID_Lahan)) from trans_lahan tl, master_petani p WHERE tl.ID_User = p.ID_User GROUP BY ID_User
ORDER by bisa DESC, ID_User ASC");
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}