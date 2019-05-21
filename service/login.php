<?php
include_once '../includes/config2.php';


// $db = new Database();
//$conn = $db->getConnection();

// username and password sent from form login
if($_SERVER["REQUEST_METHOD"] == "POST"){
    $db = new Database();
    $conn = $db->getConnection();


    $myusername = $_POST['id_user'];
    $mypassword = hash('SHA1', $_POST['password']);

    $sql = "SELECT m.ID_User as 'ID_User',m.Password as 'Password',k.ID_Kategori as 'Kategori' FROM master_user m, master_user_kat k WHERE m.ID_User = k.ID_User AND m.ID_User = '$myusername' AND m.password = '$mypassword' AND k.ID_Kategori in ('PET','ADP') LIMIT 1";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    if ($stmt->rowCount() == 1){
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            session_start();
            $_SESSION["user"] = $row["ID_User"];
            $_SESSION["kategori"] = $row["Kategori"];
        }
    }

    if ($_SESSION['kategori'] == 'PET'){
        $sql = "SELECT Nama_Petani as 'Nama' FROM master_petani WHERE ID_User = '".$_SESSION["user"]."'";
        $stmt = $conn->prepare($sql);
        $stmt->execute();
        if ($stmt->rowCount() == 1){
            while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            $_SESSION['nama'] = $row['Nama'];
            }
        }
    }
    header("location: ../index.php");
}
?>

