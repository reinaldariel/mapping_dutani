<?php
include_once '../includes/config2.php';
$database = new Database();
$conn = $database->getConnection();

$nama_petani = $_POST['nama_petani'];
$id_user = $_POST['ID_User'];

try {

    /*insert into master_user values('ngalimun','7c4a8d09ca3762af61e59520943dc26494f8941b','123456',0);

insert into master_petani (ID_User,Nama_Petani,Alamat_Petani,Kabupaten,Kecamatan,Provinsi,Desa_Kelurahan,Status,jns_kelamin)
values('ngalimun',
'Ngalimun',
'Yogyakarta',
'Bantul',
'Pandak',
'Daerah Istimewa Yogyakarta',
'Gilangharjo',
1,
1)*/
    $sql = "insert into master_user values('".$id_user."',
        '7c4a8d09ca3762af61e59520943dc26494f8941b','123456',0);";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    $sql2 = "insert into master_petani (ID_User,Nama_Petani,Alamat_Petani,Kabupaten,Kecamatan,Provinsi,Desa_Kelurahan,Status,jns_kelamin)
    values('".$id_user."',
        '".$nama_petani."',
        'Yogyakarta',
        'Bantul',
        'Pandak',
        'Daerah Istimewa Yogyakarta',
        'Gilangharjo',
        1,
        1)";
    $stmt = $conn->prepare($sql2);
    $stmt->execute();

    $result= array('status' => 'berhasil');
    echo json_encode($result);
} catch (PDOException $e) {
    $result= array('status' => 'gagal');
    echo json_encode($result);
}
?>