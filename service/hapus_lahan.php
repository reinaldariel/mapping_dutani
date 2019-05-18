<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();
$id_lahan = $_GET['id_lahan'];

try {
    //hapus kepemilikan lahan
    $stmt = $conn->prepare("DELETE FROM trans_lahan WHERE ID_Lahan = ?");
    $stmt->bindParam(1, $id_lahan);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();

    //hapus detil titik lahan
    $stmt = $conn->prepare("DELETE FROM master_peta_lahan_detail WHERE id_lahan = ?");
    $stmt->bindParam(1, $id_lahan);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();

    //hapus penanaman lahan
    $stmt = $conn->prepare("DELETE FROM master_peta_lahan_tanaman WHERE ID_Lahan = ?");
    $stmt->bindParam(1, $id_lahan);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();

    //hapus foto lahan
    $stmt = $conn->prepare("DELETE FROM master_peta_lahan_foto WHERE ID_Lahan = ?");
    $stmt->bindParam(1, $id_lahan);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();

    //hapus lahan
    $stmt = $conn->prepare("DELETE FROM master_peta_lahan WHERE ID_Lahan = ?");
    $stmt->bindParam(1, $id_lahan);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    $result = $stmt->fetchAll();
    echo '<script>alert("Kepemilikan lahan berhasil dihapus"); history.go(-1);</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>