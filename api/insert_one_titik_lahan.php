<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

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

    $result = array();
    $stmt = $conn->prepare("SELECT * FROM master_peta_lahan_detail WHERE id_lahan = ? order by indeks asc");
    $stmt->bindParam(1, $id_lahan);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    if ($stmt->rowCount() > 0){
        $result = $stmt->fetchAll();
    }else{
        $stmt = $conn->prepare("SELECT '0' as id_detail, ID_Lahan as id_lahan,
        Koordinat_X as lat, Koordinat_Y as longt, '1' as indeks FROM master_peta_lahan WHERE ID_Lahan = ?");
        $stmt->bindParam(1, $id_lahan);
        $stmt->execute();
        $stmt->setFetchMode(PDO::FETCH_ASSOC);
        $result = $stmt->fetchAll();
    }
    echo json_encode($result);
    
    /*$result = array('status' => 'berhasil');
    echo json_encode($result);*/
} catch (PDOException $e) {
    $result= array('status' => 'gagal');
    echo json_encode($result);
}
?>