<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$idp = $_POST['id_pelaku'];
$id_lahan = $_POST['id_lahan'];
$id_detail = $_POST['id_detail'];
$lat = $_POST['lat'];
$longt = $_POST['longt'];

try {
    if(isset($id_detail) && $id_detail != 0){
        $stmt = $conn->prepare("update master_peta_lahan_detail set lat = ?, longt = ? where id_detail = ?");
        $stmt->bindParam(1, $lat);
        $stmt->bindParam(2, $longt);
        $stmt->bindParam(3, $id_detail);
    }
    else{
        //get max indeks
        $stmt = $conn->prepare("select max(indeks) as indeks from master_peta_lahan_detail where id_lahan = ?");
        $stmt->bindParam(1, $id_lahan);
        $stmt->execute();
        $result = $stmt->fetchAll();

        if (isset($result[0]['indeks']) && $result[0]['indeks'] > 0){
            $indeks = $result[0]['indeks']+1;
        }
        else{
            $indeks = 1;
        }


        $stmt = $conn->prepare("insert into master_peta_lahan_detail (id_lahan, lat, longt, indeks) values (?,?,?,?)");
        $stmt->bindParam(1, $id_lahan);
        $stmt->bindParam(2, $lat);
        $stmt->bindParam(3, $longt);
        $stmt->bindParam(4, $indeks);
    }

    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
//    echo json_encode($result);
    echo '<script>alert("Berhasil menambah titik lahan"); window.location.assign("'.$BASE_URL.'detail_titik_lahan.php?id_lahan='.$id_lahan.'&idp='.$idp.'");</script>';
//    echo "<div class='box box-primary row callout callout-info' style='text-align: right'><h4>Sukses!</h4></div>";
//    echo "<meta http-equiv='refresh' content='1;url=../detail_titik_lahan.php?id_lahan=".$id_lahan."'>";
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>