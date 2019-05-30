<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$ID_User = $_POST['ID_User'];
$id_lahan = $_POST['id_lahan'];

//nama file
$filename  = basename($_FILES['filenya']['name']);
//extensi file yang diupload
//$extension = pathinfo($filename, PATHINFO_EXTENSION);
//target directory
$target_dir = $_SERVER["DOCUMENT_ROOT"]. "/mapping_dutani/images/foto_lahan/";
//nama dan target file untuk cek extensi setelah diupload
$target_file = $target_dir . $ID_User . "-" . $id_lahan . "-" . $filename;
//status upload
$uploadOk= 1;
//cek
$imageFileType = pathinfo($target_file,PATHINFO_EXTENSION);
//nama file yg disimpen di db
if ($_FILES["filenya"]["name"] == "") {
    $namaimage = "";
} else {
    $namaimage = $ID_User . "-" . $id_lahan . "-" . $filename;
}

if(isset($_POST["submit"])) {
    if ($namaimage != "") {
        $check = getimagesize($_FILES["filenya"]["tmp_name"]);
        if($check !== false) {
            echo "File is an image - " . $check["mime"] . ".";
            $uploadOk = 1;
        } else {
            echo '<script>alert("File bukan image"); history.go(-1);</script>';
            $uploadOk = 0;
        }
    }
}
// Check if file already exists

if ($namaimage != "") {
    // Check file size
    if ($_FILES["filenya"]["size"] > 5000000) {
        echo '<script>alert("Maaf ukuran gambar atau foto terlalu besar"); history.go(-1);</script>';
        $uploadOk = 0;
    }
    // Allow certain file formats
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) {
        echo '<script>alert("Maaf, hanya file JPG, JPEG, PNG, & GIF yang diperbolehkan"); history.go(-1);</script>';
        $uploadOk = 0;
    }
    // Check if $uploadOk is set to 0 by an error
    if ($uploadOk == 0) {
        echo '<script>alert("Maaf file tidak terupload"); history.go(-1);</script>';
        // if everything is ok, try to upload file
    }
    move_uploaded_file($_FILES["filenya"]["tmp_name"], $target_file);
}

try {
    $sql = "INSERT INTO `master_peta_lahan_foto` (`id_foto`, `ID_Lahan`, `foto`) VALUES (NULL, '".$id_lahan."', '".$namaimage."');";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    echo '<script>alert("Berhasil menambah foto"); window.location.assign("'.$BASE_URL.'detail_lahan.php?id_lahan='.$id_lahan.'");</script>';
} catch (PDOException $e) {
    echo "Error. ". $e->getMessage();
}
?>