<?php
include_once "../includes/config2.php";

$database = new Database();
$conn = $database->getConnection();
try {

    $stmt = $conn->prepare("SELECT tl.ID_User, p.Nama_Petani, p.jml_lahan, COUNT(tl.ID_Lahan) as jml_tercatat, (p.jml_lahan-COUNT(tl.ID_Lahan)) as bisa from trans_lahan tl, master_petani p, master_peta_lahan l WHERE tl.ID_User = p.ID_User AND tl.ID_Lahan = l.ID_Lahan GROUP BY tl.ID_User");
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}