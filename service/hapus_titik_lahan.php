<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$id_lahan = $_GET['id_lahan'];
$id_detail = $_GET['id_detail'];

try {
    if(isset($id_detail)){
        $stmt = $conn->prepare("delete from master_peta_lahan_detail where id_detail = ?");
        $stmt->bindParam(1, $id_detail);
    }

    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo json_encode($result);
    echo "<div class='box box-primary row callout callout-info' style='text-align: right'><h4>Sukses!</h4></div>";
    echo "<meta http-equiv='refresh' content='1;url=../detail_titik_lahan.php?id_lahan=".$id_lahan."'>";
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>