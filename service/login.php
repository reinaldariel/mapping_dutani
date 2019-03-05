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

    $sql = "SELECT * FROM master_user WHERE id_user = '$myusername' AND password = '$mypassword' LIMIT 1";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    if ($stmt->rowCount() == 1){
        while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
            session_start();
            $_SESSION["user"] = $row["ID_User"];
        }
    }
    header("location: ../index.php");
}
?>

