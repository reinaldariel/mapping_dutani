<?php
//error_reporting(0);
include "includes/config2.php";
session_start();
if(!isset($_SESSION['user'])){
    echo "<script>location.href='login.php'</script>";
}
$id = $_GET['id'];
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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAL_3NhGIUmaXLbudR1lQLHUSLPi6_lzGI&sensor=false" type="text/javascript"></script>

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
<!--                    <table>-->
                    <?php
                    $penambahan_lahan =0;

                        $str = file_get_contents($BASE_URL.'service/read_lahan_one_petani.php?id_user='.$id);
                        $json = json_decode($str, true);
                        $jml_lahan_tercatat = count($json);

                        $str = file_get_contents($BASE_URL.'service/read_one_petani.php?id_user='.$id);
                        $json2 = json_decode($str, true);
                        foreach ($json2 as $val) {
                            echo "<div class='col-md-3'> Lahan milik </div><div class='col-md-3'> : " . $val['Nama_Petani'] . "</div><br>";
                            echo "<div class='col-md-3'> Jumlah lahan </div><div class='col-md-3'> : ".$val['jml_lahan']."</div><br>";
                            echo "<div class='col-md-3'> Jumlah lahan tercatat </div><div class='col-md-3'> : ".$jml_lahan_tercatat."</div><br>";
                            $penambahan_lahan = $val['jml_lahan']-$jml_lahan_tercatat;
                            echo "<div class='col-md-3'> Anda dapat menambah </div><div class='col-md-3'> : ".$penambahan_lahan." lahan </div><br>";
                        }
                     ?>
<!--                    </table>-->
                </div>
            </div>
            <!--//grid-->
            <div class="agile-grids">
                <div class="grid-form">
                    <div class="grid-form1">
                        <div class="agileits-box-body clearfix">

                            <div id="map" style="width: auto; height: 450px;"></div>
                            <script type="text/javascript">
                                <?php
                                if ($jml_lahan_tercatat > 0){
                                echo "
                                var latLng=new google.maps.LatLng(".$json[0]['Koordinat_X'].",".$json[0]['Koordinat_Y'].");
                                ";
                                }else{
                                    echo "
                                var latLng=new google.maps.LatLng(".$def_lat.",".$def_long.");
                                ";
                                }
                                echo "var map = new google.maps.Map(document.getElementById('map'), {
                                    zoom: 16, //level zoom
                                    center: latLng,
                                    scaleControl: true,
                                    mapTypeId: google.maps.MapTypeId.HYBRID
                                });";
                                foreach ($json as $value) {
                                    $lineloc ="";
                                    $str2 = file_get_contents($BASE_URL.'service/read_one_detail_lahan.php?id_lahan='.$value['ID_Lahan']);
                                    $json2 = json_decode($str2, true);
                                    foreach ($json2 as $value2){
                                        $lineloc .= "{lat:".$value2['lat'].", lng:".$value2['longt']."},";
                                    }

                                    $lineloc = substr($lineloc, 0 , -1);
                                    $lineloc .= "];";
                                    echo "var line_locations=[".$lineloc."
                            var lahanPath = new google.maps.Polygon({
                            path: line_locations,
                            geodesic: true,
                            strokeColor: '#FF0000',
                            strokeOpacity: 1.0,
                            strokeWeight: 2
                        });

                        lahanPath.setMap(map);
                            ";
                                }
                                ?>

                            </script>

                        </div>
                    </div>
                </div>
            </div>

            <div class="agile-grids">
                <!-- tables -->

                <!--	<div class="agile-tables">
                        <div class="w3l-table-info"> -->
                <div class="grid-form">
                    <div class="grid-form1">
                        <h2>Data Lahan Petani</h2>
                        <?php if($penambahan_lahan > 0 ) {
                            echo '<button type="button" class="btn btn-success"><a href="lahan_add.php?id='.$id.'" style="color: white">+ Tambah Lahan</a></button>';
                        }?>
                        <table id="table">
                            <thead>
                            <tr>
                                <th>ID Lahan</th>
                                <th>Nama Lahan</th>
                                <th>Luas Lahan</th>
                                <th>Jenis Lahan</th>
                                <th>Alamat</th>
                                <th>Aksi</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            $id_lhn="";
                            $str = file_get_contents($BASE_URL.'service/read_lahan_one_petani.php?id_user='.$id);
                            $json = json_decode($str, true);
                            if (count($json) > 0) {
                                foreach ($json as $val) {
                                    $tbl_cont = "<tr>";

                                    $id_lhn = $val['ID_Lahan'];
                                    $tbl_cont .= "<td>" . $val['ID_Lahan'] . "</td>";
                                    $tbl_cont .= "<td>" . $val['nama_lahan'] . "</td>";
                                    $tbl_cont .= "<td>" . $val['luas_lahan'] . "</td>";
                                    $tbl_cont .= "<td>" . $val['jenis_lahan'] . "</td>";
                                    $tbl_cont .= "<td>" . $val['Desa'] . ", " . $val['Kecamatan'] . ", " . $val['Kabupaten'] . ", " . $val['Provinsi'] . "</td>";
                                    
                                    echo $tbl_cont."<td><div style='padding: 0px; margin-top: 0px;'><button type='button' class='btn btn-info'><a href='detail_lahan.php?id_lahan=".$id_lhn."' style='color: white'>Detail</a></button><button type='button' class='btn btn-warning'><a href='lahan_edit.php?id_lahan=".$id_lhn."' style='color: white'>Ubah</a></button><button type='button' class='btn btn-danger'><a href='service/hapus_lahan.php?id_lahan=".$id_lhn."' style='color: white'>Hapus</a></button></div> </td></tr>";
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