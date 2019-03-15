<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$id_lahan = $_POST['id_lahan'];
$lat = $_POST['lat'];
$longt = $_POST['longt'];

try {
    $stmt = $conn->prepare("insert into master_peta_lahan_detail (id_lahan, lat, longt) values (?,?,?)");
    $stmt->bindParam(1, $id_lahan);
    $stmt->bindParam(2, $lat);
    $stmt->bindParam(3, $longt);
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