<?php
//error_reporting(0);
include "includes/config2.php";
session_start();
if(!isset($_SESSION['user'])){
    echo "<script>location.href='login.php'</script>";
}
$id = $_GET['id_lahan'];
?>
<!DOCTYPE HTML>
<html>
<head>
    <title>Dutatani Mapping</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAL_3NhGIUmaXLbudR1lQLHUSLPi6_lzGI&sensor=false" type="text/javascript"></script>
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

                            <?php
                            $lat="";
                            $long="";
                            $nama_lahan ="";
                            $foto="";
                            $str = file_get_contents($BASE_URL.'service/read_one_lahan.php?id_lahan='.$id);
                            $json = json_decode($str, true);
                            if (count($json) > 0) {
                                foreach ($json as $value) {
                                    $lat=$value['lat'];
                                    $long=$value['longt'];
                                    $nama_lahan=$value['nama_lahan'];
                                    $foto =$value['foto'];
                                    echo "<h2>".$value['nama_lahan']."</h2>
                                    <table style=\"border: none\">
                                    <tbody>
                                        <tr>
                                            <td>ID Lahan </td> <td> : ".$value['ID_Lahan']."</td>
                                        </tr>
                                        <tr>
                                            <td>Nama Petani </td> <td> : ".$value['Nama_Petani'].", <a href='../dutatani/si_petani/Detail_Petani.php?id=".$value['ID_User']."'>Detail</a></td>
                                        </tr>
                                        <tr>
                                            <td>Luas lahan </td> <td> : ".$value['luas_lahan']."</td>
                                        </tr>
                                        <tr>
                                            <td>Jenis Lahan </td> <td> : ".$value['jenis_lahan']."</td>
                                        </tr>
                                        <tr>
                                            <td>Desa / Kelurahan </td> <td> : ".$value['Desa']."</td>
                                        </tr>
                                        <tr>
                                            <td>Kecamatan </td> <td> : ".$value['Kecamatan']."</td>
                                        </tr>
                                        <tr>
                                            <td>Kabupaten </td> <td> : ".$value['Kabupaten']."</td>
                                        </tr>
                                        <tr>
                                            <td>Provinsi </td> <td> : ".$value['Provinsi']."</td>
                                        </tr>
                                        <tr>
                                            <td>Status Keorganikan </td> <td> : ".$value['status_organik']."</td>
                                        </tr>
                                        <tr>
                                            <td>Status Lahan </td> <td> : ".$value['status_lahan']."</td>
                                        </tr>
                                        <tr>
                                            <td>Nama Tanaman </td> <td> : ".$value['Nama_Tanaman']."</td>
                                        </tr>
                                        <tr>
                                            <td>Kebutuhan Benih </td> <td> : ".$value['kebutuhan_benih']."</td>
                                        </tr>
                                        <tr>
                                            <td>Kebutuhan Saprotan </td> <td> : ".$value['kebutuhan_saprotan']."</td>
                                        </tr>
                                        <tr>
                                            <td>Bulan Menanam </td> <td> : ".$value['bulan_tanam']."</td>
                                        </tr>
                                        <tr>
                                            <td>Bulan Panen </td> <td> : ".$value['bulan_akhir']."</td>
                                        </tr>
                                        <tr>
                                            <td>Rata - rata hasil panen </td> <td> : ".$value['rata_hasil_panen']."</td>
                                        </tr>
                                        ";
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
                        <br>
                        <p>Foto</p>
                        <img src="images/foto_lahan/<?php echo $foto ?>" alt="">
                        <br>
                        <p>Lokasi</p>
                        <div id="map" style="width: auto; height: 450px;"></div>
                    </div>
                </div>
                <!-- //tables -->
            </div>

            <!-- script for map -->
            <script type="text/javascript">
                var locations = [
                    <?php
                        $content="'<div id=\"content\">'+
                                '<div id=\"siteNotice\">'+
                                '</div>'+
                                '<h4 id=\"firstHeading\" class=\"firstHeading\">Disini</h4>'+
                                '<h6>".$nama_lahan."</h6>'+
                                '</div>'";
                        echo "'".$nama_lahan."',".$lat.",".$long.",".$content;
                    ?>
                ];
                var latLng=new google.maps.LatLng(locations[1], locations[2]);
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 20, //level zoom
                    scaleControl: true,
                    center:latLng,
                    mapTypeId: google.maps.MapTypeId.HYBRID
                });

                var infowindow = new google.maps.InfoWindow();

                var marker, i;
                i=0;
                /* kode untuk menampilkan banyak marker */
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(locations[1], locations[2]),
                        map: map,
                        draggable : false,
                        animation: google.maps.Animation.DROP
                    });
                    /* menambahkan event click untuk menampilkan
                     info windows dengan isi sesuai dengan marker yg di klik */
                    google.maps.event.addListener(marker, 'click', (function(marker) {
                        return function() {
                            infowindow.setContent(locations[3]);
                            infowindow.open(map, marker);
                        }
                    })(marker));
            </script>

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