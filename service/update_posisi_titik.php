<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$idp = $_POST['id_pelaku'];
$id_indeks_start = $_POST['id_indeks_start']+1;
$id_indeks_end = $_POST['id_indeks_end']+1;
$id_lahan = $_POST['id_lahan'];

try {
    //ambil id_detail dari indeks yang berubah
    $stmt = $conn->prepare("select id_detail from master_peta_lahan_detail where indeks = ?");
    $stmt->bindParam(1, $id_indeks_start);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();

    //cek apakah indeks baru lebih besar atau lebih kecil
    if($id_indeks_end > $id_indeks_start){
        //update id_detail lain yang indeksnya antara indeks awal dan indeks tujuan --
        $stmt = $conn->prepare("update master_peta_lahan_detail set indeks = indeks-1 where indeks between ? and ?");
        $stmt->bindParam(1, $id_indeks_start);
        $stmt->bindParam(2, $id_indeks_end);
    }else{
        //update id_detail lain yang indeksnya antara indeks awal dan indeks tujuan ++
        $stmt = $conn->prepare("update master_peta_lahan_detail set indeks = indeks+1 where indeks between ? and ?");
        $stmt->bindParam(1, $id_indeks_end);
        $stmt->bindParam(2, $id_indeks_start);
    }
    $stmt->execute();

    $stmt = $conn->prepare("update master_peta_lahan_detail set indeks = ? where id_detail = ?");
    $stmt->bindParam(1, $id_indeks_end);
    $stmt->bindParam(2, $result[0]['id_detail']);
    $stmt->execute();

    echo '<script>alert("Berhasil mengubah posisi titik lahan"); window.location.assign("'.$BASE_URL.'detail_titik_lahan.php?id_lahan='.$id_lahan.'&idp='.$idp.'");</script>';
    // echo "<div class='box box-primary row callout callout-info' style='text-align: right'><h4>Sukses!</h4></div>";
    // echo "<meta http-equiv='refresh' content='1;url=../detail_titik_lahan.php?id_lahan=".$id_lahan."'>";

} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>