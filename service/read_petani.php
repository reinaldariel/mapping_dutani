<?php
include_once "../includes/config2.php";
//membaca semua petani yang memiliki lahan
$database = new Database();
$conn = $database->getConnection();
$str = "SELECT p.ID_User as ID_User, p.Nama_Petani, p.jml_lahan, 0 as jml_tercatat, 0 as bisa from master_petani p, trans_ang_petani t where p.ID_User NOT IN (SELECT DISTINCT ID_User from trans_lahan)";
$str2 = " UNION
SELECT tl.ID_User as ID_User, p.Nama_Petani, p.jml_lahan, COUNT(tl.ID_Lahan), (p.jml_lahan-COUNT(tl.ID_Lahan)) from trans_lahan tl, master_petani p, trans_ang_petani t WHERE tl.ID_User = p.ID_User";

if (isset($_GET['klptani']) and $_GET['klptani'] != ""){
    $str .= " and t.ID_Kelompok_Tani == '".$_GET['klptani']."'";
    $str2 .= " and t.ID_Kelompok_Tani == '".$_GET['klptani']."'";
}
if (isset($_GET['daerah']) and $_GET['daerah'] != ""){
    $str .= " and p.Desa_Kelurahan == '".$_GET['daerah']."'";
    $str2 .= " and p.Desa_Kelurahan == '".$_GET['daerah']."'";
}
if (isset($_GET['nama']) and $_GET['nama'] != ""){
    $str .= " and (p.Nama_Petani LIKE '%".$_GET['nama']."%' OR p.ID_User LIKE '%".$_GET['nama']."%')";
    $str2 .= " and (p.Nama_Petani LIKE '%".$_GET['nama']."%' OR p.ID_User LIKE '%".$_GET['nama']."%')";
}
$str .= $str2." GROUP BY ID_User
ORDER by bisa DESC, ID_User ASC";
try {
    $stmt = $conn->prepare($str);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}