<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$lat = $_POST['lat'];
$longt = $_POST['longt'];
$nama_petani = $_POST['nama_petani'];
$nama_lahan = $_POST['nama_lahan'];
$luas_lahan = $_POST['luas_lahan'];
$jenis_lahan = $_POST['jenis_lahan'];
$provinsi = $_POST['provinsi'];
$Kabupaten = $_POST['Kabupaten'];
$Kecamatan = $_POST['Kecamatan'];
$desa = $_POST['Desa_Kelurahan'];
$status_organik = $_POST['status_organik'];

$id_user = $_POST['ID_User'];
$status_lahan = $_POST['status_lahan'];
//$ID_Spesies = $_POST['ID_Spesies'];
//$kebutuhan_benih = $_POST['kebutuhan_benih'];
//$kebutuhan_saprotan = $_POST['kebutuhan_saprotan'];
//$bulan_tanam = $_POST['bulan_tanam'];
//$bulan_panen =$_POST['bulan_panen'];
//$rata_hasil_panen = $_POST['rata_hasil_panen'];

////nama file
//$filename  = basename($_FILES['filenya']['name']);
////extensi file yang diupload
//$extension = pathinfo($filename, PATHINFO_EXTENSION);
////target directory
//$target_dir = $_SERVER["DOCUMENT_ROOT"]. "/mapping_dutani/images/foto_lahan/";
////nama dan target file untuk cek extensi setelah diupload
//$target_file = $target_dir . $ID_User . "-" . $nama_lahan . "." . $extension;
////status upload
//$uploadOk= 1;
////cek
//$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
////nama file yg disimpen di db
//if ($_FILES["filenya"]["name"] == "") {
//    $namaimage = "";
//} else {
//    $namaimage = $ID_User . "-" . $nama_lahan . "." . $extension;
//}
//
//if(isset($_POST["submit"])) {
//    if ($namaimage != "") {
//        $check = getimagesize($_FILES["filenya"]["tmp_name"]);
//        if($check !== false) {
//            echo "File is an image - " . $check["mime"] . ".";
//            $uploadOk = 1;
//        } else {
//            echo '<script>alert("File bukan image"); history.go(-1);</script>';
//            $uploadOk = 0;
//        }
//    }
//}
//// Check if file already exists
//
//if ($namaimage != "") {
//    // Check file size
//    if ($_FILES["filenya"]["size"] > 5000000) {
//        echo '<script>alert("Maaf ukuran gambar atau foto terlalu besar"); history.go(-1);</script>';
//        $uploadOk = 0;
//    }
//    // Allow certain file formats
//    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) {
//        echo '<script>alert("Maaf, hanya file JPG, JPEG, PNG, & GIF yang diperbolehkan"); history.go(-1);</script>';
//        $uploadOk = 0;
//    }
//    // Check if $uploadOk is set to 0 by an error
//    if ($uploadOk == 0) {
//        echo '<script>alert("Maaf file tidak terupload"); history.go(-1);</script>';
//        // if everything is ok, try to upload file
//    }
//    move_uploaded_file($_FILES["filenya"]["tmp_name"], $target_file);
//}

try {
//    $sql = "INSERT INTO `master_peta_lahan` (`ID_Lahan`, `ID_User`, `nama_lahan`, `Koordinat_X`, `Koordinat_Y`, `luas_lahan`, `jenis_lahan`, `Desa`, `Kecamatan`, `Kabupaten`, `Provinsi`, `status_organik`, `status_lahan`, `ID_Spesies`, `kebutuhan_benih`, `kebutuhan_saprotan`, `bulan_tanam`, `bulan_akhir`, `rata_hasil_panen`, `foto`) VALUES (NULL, '".$ID_User."', '".$nama_lahan."', '".$lat."', '".$longt."', ".$luas_lahan.", '".$jenis_lahan."', '".$desa."', '".$Kecamatan."', '".$Kabupaten."', '".$provinsi."', '".$status_organik."', '".$status_lahan."', '".$ID_Spesies."', ".$kebutuhan_benih.", ".$kebutuhan_saprotan.", '".$bulan_tanam."', '".$bulan_panen."', ".$rata_hasil_panen.", '".$namaimage."');";
    $sql = "INSERT INTO `master_peta_lahan` (`ID_Lahan`, `nama_lahan`, `Koordinat_X`, `Koordinat_Y`, `luas_lahan`, `jenis_lahan`, `Desa`, `Kecamatan`, `Kabupaten`, `Provinsi`, `status_organik`) VALUES (NULL, '".$nama_lahan."', '".$lat."', '".$longt."', ".$luas_lahan.", '".$jenis_lahan."', '".$desa."', '".$Kecamatan."', '".$Kabupaten."', '".$provinsi."', '".$status_organik."');";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    $str = file_get_contents($BASE_URL.'service/read_lahan_latest.php');
    $json = json_decode($str, true);

        $id_lahan = $json[0]['ID_Lahan'];

    $sql2 = "INSERT INTO `trans_lahan` (`nomor`, `ID_User`, `ID_Lahan`, `tanggal`, `status_lahan`, `status_aktif`) VALUES (NULL, '".$id_user."', '".$id_lahan."', CURRENT_TIMESTAMP, '".$status_lahan."', '1');";
    $stmt = $conn->prepare($sql2);
    $stmt->execute();

    echo '<script>alert("Berhasil menambah lahan"); window.location.assign("'.$BASE_URL.'daftar_lahan_per_petani.php?id='.$id_user.'");;</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>