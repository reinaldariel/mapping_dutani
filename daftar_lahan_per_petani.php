<?php
//error_reporting(0);
include "includes/config.php";
session_start();
if(!isset($_SESSION['user'])){
    echo "<script>location.href='login.php'</script>";
}
?>
<!DOCTYPE HTML>
<html>
<head>
    <title>Yakkum</title>
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
               <!--grid-->
            <div class="grid-form">
                <div class="grid-form1">
                    <h2>Pemetaan Lokasi Lahan Pertanian</h2>

                    <!--<div class="toolbar"> -->
                    <?php
                    $penambahan_lahan =0;
                    if ($_SESSION['kategori'] == "PET"){
                        $str = file_get_contents('http://localhost/mapping-dutatani/service/read_lahan_one_petani.php?id_user='.$_SESSION['user']);
                        $json = json_decode($str, true);
                        $jml_lahan_tercatat = count($json);

                        $str = file_get_contents('http://localhost/mapping-dutatani/service/read_one_petani.php?id_user='.$_SESSION['user']);
                        $json = json_decode($str, true);
                        foreach ($json as $head) {
                            $counter = 0;
                            foreach ($head as $key => $val) {
                                if ($counter == 1) {
                                    echo "<p>Lahan milik : </p>" . $val . "<br><br>";
                                }
                                elseif ($counter == 9){
                                    echo "<p>Jumlah lahan : </p>".$val."<br><br>";
                                    echo "<p>Jumlah lahan tercatat : </p>".$jml_lahan_tercatat."<br><br>";
                                    $penambahan_lahan = $val-$jml_lahan_tercatat;
                                    echo "<p>Anda dapat menambah ".$penambahan_lahan." lahan</p>";
                                }
                                $counter++;
                            }
                        }
                    } ?>
                </div>


            </div>
            <!--//grid-->

            <div class="agile-grids">
                <!-- tables -->

                <!--	<div class="agile-tables">
                        <div class="w3l-table-info"> -->
                <div class="grid-form">
                    <div class="grid-form1">
                        <h2>Data Lahan Petani</h2>
                        <?php if($penambahan_lahan > 0 ) {
                            echo '<button type="button" class="btn btn-success"> + Tambah Lahan</button>';
                        }?>
                        <table id="table">
                            <thead>
                            <tr>
                                <th>ID Lahan</th>
                                <th>Luas Lahan</th>
                                <th>Jenis Lahan</th>
                                <th>Alamat</th>
                                <th>Aksi</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            $str = file_get_contents('http://localhost/mapping-dutatani/service/read_lahan_one_petani.php?id_user='.$_SESSION['user']);
                            $json = json_decode($str, true);
                            if (count($json) > 0) {
                                foreach ($json as $head) {
                                    $counter = 0;
                                    $tbl_cont = "<tr>";
                                    foreach ($head as $key => $val) {
                                        if ($counter == 0 or $counter == 4 or $counter == 5) {
                                            $tbl_cont = $tbl_cont . "<td>" . $val . "</td>";
                                        } elseif ($counter == 6) {
                                            $tbl_cont = $tbl_cont . "<td>" . $val . ", ";
                                        } elseif ($counter == 7 or $counter == 8) {
                                            $tbl_cont = $tbl_cont . $val . ", ";
                                        } elseif ($counter == 9) {
                                            $tbl_cont = $tbl_cont . $val . "</td>";
                                        }
                                        $counter++;
                                    }
                                    echo "$tbl_cont.<td><button type='button' class='btn btn-info'>Detail</button><button type='button' class='btn btn-warning'>Ubah</button><button type='button' class='btn btn-danger'>Hapus</button> </td></tr>";
                                }
                            }
                            else {
                                ?>
                                <tr>
                                    <td colspan="8">Belum ada lahan tercatat</td>
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