<?php
include "includes/fungsi.php";
include "includes/config2.php";
$database = new Database();
$conn = $database->getConnection();
session_start();
if(!isset($_SESSION['user'])){
    echo "<script>location.href='login.php'</script>";
}
if($_SESSION['kategori'] == 'PET'){
    echo "<script>location.href='daftar_lahan_per_petani.php'</script>";
}
?>
<!DOCTYPE HTML>
<html>
<head>
    <title>Dutatani Mapping</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
    <!-- Custom CSS -->
    <link href="css/style.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="css/morris.css" type="text/css"/>
    <!-- Graph CSS -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- jQuery -->
    <script src="js/jquery-2.1.4.min.js"></script>
    <!-- tables -->
    <link rel="stylesheet" type="text/css" href="css/table-style.css" />
    <link rel="stylesheet" type="text/css" href="css/basictable.css" />
    <script type="text/javascript" src="js/jquery.basictable.min.js"></script>
    <script type="text/javascript">
        //open newwindows
        function MM_openBrWindow(theURL,winName,features) { //v2.0
            window.open(theURL,winName,features);
        }
    </script>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#table').basictable();

        });

    </script>
    <!-- //tables -->
    <!-- lined-icons -->
    <link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
    <!-- //lined-icons -->
</head>
<body>
<div class="page-container">
    <!--/content-inner-->
    <div class="left-content">
        <div class="mother-grid-inner">
            <div class="agile-grids">
                <div class="grid-form">
                    <div class="grid-form1">
                        <h2>Data Petani</h2>

                        <form action="daftar_petani.php" method="post">
                            <label>Kelompok Tani : </label>
                            <select id="klptani" name="klptani">
                                <?php
                                $strlistklp = "SELECT DISTINCT tp.ID_Kelompok_Tani as id, k.Nama_Kelompok_Tani as nama from master_kel_tani k, trans_ang_petani tp, master_petani p where k.ID_Kelompok_Tani = tp.ID_Kelompok_Tani AND tp.ID_User = p.ID_User";
                                if (isset($_POST['klptani']) and $_POST['klptani'] != ""){
                                    $strlistklp .= " and tp.ID_Kelompok_Tani != '".$_POST['klptani']."'";
                                    $klp = $_POST['klptani'];
                                    echo  '<option value="' . $_POST['klptani'] . '">' . tot_klp_tani($strlistklp) . '</option>';
                                }
                                $str = "<option value=\"\">- pilih -</option>";
                                $stmt = $conn->prepare($strlistklp);
                                $stmt->execute();
                                $stmt->setFetchMode(PDO::FETCH_ASSOC);
                                $result = $stmt->fetchAll();
                                foreach ($result as $val) {
                                    $str .= '<option value="' . $val['id'] . '">' . $val['nama'] . '</option>';
                                }
                                echo $str;
                                ?>
                            </select>
                            <label>Desa Petani : </label>
                            <select id="daerah" name="daerah">
                                <?php
                                $strlistdesa = "SELECT DISTINCT Desa_Kelurahan as desa from master_petani where Desa_Kelurahan !=''";
                                if (isset($_POST['daerah']) and $_POST['daerah'] != ""){
                                    $desa = $_POST['daerah'];
                                    $strlistdesa .= " WHERE Desa != '".$_POST['daerah']."'";
                                    echo '<option value="'.$_POST["daerah"].'">'.$_POST["daerah"].'</option>';
                                }
                                $str = "<option value=\"\">- pilih -</option>";
                                $stmt = $conn->prepare($strlistdesa);
                                $stmt->execute();
                                $stmt->setFetchMode(PDO::FETCH_ASSOC);
                                $result = $stmt->fetchAll();
                                foreach ($result as $val) {
                                    $str .= '<option value="' . $val['desa'] . '">' . $val['desa'] . '</option>';
                                }
                                echo $str;
                                ?>
                            </select>
                            <label>Cari nama : </label>
                            <?php
                            if (isset($_POST['nama']) and $_POST['nama'] != ""){
                                echo "<input type=\"text\" value=\"".$_POST['nama']."\" name=\"nama\" id=\"nama\">";
                            }else{
                                echo "<input type=\"text\" value=\"\" name=\"nama\" id=\"nama\">";
                            }
                            ?>
                            <input class="btn btn-primary btn-lg" id="cari" type="submit" value="cari">
                            <?php
                            if ((isset($_POST['nama'])) or (isset($_POST['daerah'])) or (isset($_POST['klptani'])))
                            {
                                echo "<button type='button' class='btn btn-info btn-lg'><a style='color: white' href='daftar_petani.php'>Reset</a></button>";
                            }
                            ?>
                        </form>

                        <table id="table">
                            <thead>
                            <tr>
                                <th>ID Petani</th>
                                <th>Nama Petani</th>
                                <th>Jumlah Lahan</th>
                                <th>Jumlah Lahan Tercatat</th>
                                <th>Jumlah lahan yang bisa ditambahkan</th>
                                <th>Aksi</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            $bisa = "";
                            $cnt = 0;
                            $call = $BASE_URL.'service/read_petani.php';
                            if (isset($_POST['klptani']) and $_POST['klptani'] != ""){
                                if ($cnt == 0){
                                    $call .= '?klptani='.$_POST['klptani'];
                                }else{
                                    $call .= '&klptani='.$_POST['klptani'];
                                }
                                $cnt++;
                            }
                            if (isset($_POST['daerah']) and $_POST['daerah'] != ""){
                                if ($cnt == 0){
                                    $call .= '?daerah='.$_POST['daerah'];
                                }else{
                                    $call .= '&daerah='.$_POST['daerah'];
                                }
                                $cnt++;
                            }
                            if (isset($_POST['nama']) and $_POST['nama'] != ""){
                                if ($cnt == 0){
                                    $call .= '?nama='.$_POST['nama'];
                                }else{
                                    $call .= '&nama='.$_POST['nama'];
                                }
                                $cnt++;
                            }

                            $str = file_get_contents($call);
                            $json = json_decode($str, true);
                            $cnt = count($json);
                            if ($cnt > 0) {
                                foreach ($json as $head) {
                                    $counter = 0;
                                    $idp = "";
                                    $tbl_cont = "<tr>";
                                    foreach ($head as $key => $val) {
                                        if ($counter == 0) {
                                            $idp = $val;
                                            $tbl_cont .= "<td>" . $val . "</td>";
                                        } elseif ($counter == 4) {
                                            $bisa = $val;
                                            $tbl_cont .= "<td>" . $val . "</td>";
                                        } else {
                                            $tbl_cont .= "<td>" . $val . "</td>";
                                        }
                                        $counter++;
                                    }
                                    if ($bisa == 0) {
                                        echo $tbl_cont."<td style='padding: 0; margin: 0;'><div style='padding: 0px; margin-top: 0px;'><button type='button' class='btn btn-info'><a style='color: white' href='daftar_lahan_per_petani.php?id=" . $idp . "'>Detail</a></button></div></td></tr>";
                                    } else {
                                        echo $tbl_cont."<td style='padding: 0; margin: 0;'><div style='padding: 0px; margin-top: 0px;'><button type='button' class='btn btn-success'><a href='lahan_add.php?id=" . $idp . "' style='color:white;'>Tambah Lahan</a></button><button type='button' class='btn btn-info'><a style='color: white' href='daftar_lahan_per_petani.php?id=" . $idp . "'>Detail</a></button></div></td></tr>";
                                    }
                                }
                            }
                            else {
                                ?>
                                <tr>
                                    <td colspan="8">Belum ada petani tercatat</td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                    </div>

                </div>
                <!-- //tables -->
            </div>

            <!-- script-for sticky-nav -->
            <script>
                $(document).ready(function() {
                    var navoffeset=$(".header-main").offset().top;
                    $(window).scroll(function(){
                        var scrollpos=$(window).scrollTop();
                        if(scrollpos >=navoffeset){
                            $(".header-main").addClass("fixed");
                        }else{
                            $(".header-main").removeClass("fixed");
                        }
                    });

                });
            </script>
            <!-- /script-for sticky-nav -->
            <!--inner block start here-->
            <div class="inner-block">

            </div>
            <!--inner block end here-->
            <!--copy rights start here-->
            <div class="copyrights">
                <p>© 2019 Mapping Dutani</p>
            </div>
            <!--COPY rights end here-->
        </div>
    </div>
    <!--//content-inner-->
    <!--/sidebar-menu-->
    <?php include "sidebar.php"?>
    <div class="clearfix"></div>
</div>
<script>
    var toggle = true;

    $(".sidebar-icon").click(function() {
        if (toggle)
        {
            $(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
            $("#menu span").css({"position":"absolute"});
        }
        else
        {
            $(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
            setTimeout(function() {
                $("#menu span").css({"position":"relative"});
            }, 400);
        }

        toggle = !toggle;
    });
</script>
<!--js -->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- /Bootstrap Core JavaScript -->

</body>
</html>