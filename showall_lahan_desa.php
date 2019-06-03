<?php
include "includes/config2.php";
include "includes/fungsi.php";
$database = new Database();
$conn = $database->getConnection();
session_start();
$klp='';
$desa='';
if(!isset($_SESSION['user'])){
    echo "<script>location.href='login.php'</script>";
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
            <div class="grid-form">
                <div class="grid-form1">
                    <h2>Peta Persebaran Lahan Pertanian</h2>
                    <h4>Berdasar Daerah</h4>
                    <form action="showall_lahan_desa.php" method="post">
                        <label>pilih daerah </label>
                        <select id="daerah" name="daerah">
                            <?php
                            $strlistdesa = "SELECT DISTINCT Desa from master_peta_lahan";
                            if (isset($_POST['daerah']) and $_POST['daerah'] != ""){
                                $str_titik_all = file_get_contents($BASE_URL.'service/read_lahan_per_daerah.php?desa='.$_POST['daerah']);
                                $str_dtl_titik_all = file_get_contents($BASE_URL.'service/read_lahan_detail.php?desa='.$_POST['daerah']);
                                $desa = $_POST['daerah'];
                                $strlistdesa .= " WHERE Desa != '".$_POST['daerah']."'";
                                echo '<option value="'.$_POST["daerah"].'">'.$_POST["daerah"].'</option>';
                            }else{
                                $str_titik_all = file_get_contents($BASE_URL.'service/read_lahan_berdetail.php');
                                $str_dtl_titik_all = file_get_contents($BASE_URL.'service/read_lahan_detail.php');
                            }
                            $str = "<option value=\"\">- pilih -</option>";
                            $stmt = $conn->prepare($strlistdesa);
                            $stmt->execute();
                            $stmt->setFetchMode(PDO::FETCH_ASSOC);
                            $result = $stmt->fetchAll();
                            foreach ($result as $val) {
                                $str .= '<option value="' . $val['Desa'] . '">' . $val['Desa'] . '</option>';
                            }
                            echo $str;
                            ?>
                        </select>
                        <input class="btn btn-primary btn-lg" id="pilih_daerah" value="Pilih" type="submit">
                    </form>
                </div>
                </header>

                <div class="agileits-box-body clearfix">

                    <div id="map" style="width: auto; height: 450px;"></div>
                    <script type="text/javascript">
                        var latLng=new google.maps.LatLng(<?php echo $def_lat; ?>, <?php echo $def_long; ?>);
                        var map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 16, //level zoom
                            scaleControl: true,
                            center:latLng,
                            mapTypeId: google.maps.MapTypeId.HYBRID
                        });

                        //var infowindow = new google.maps.InfoWindow();

                        <?php
                        $json = json_decode($str_titik_all, true);
                        $json2 = json_decode($str_dtl_titik_all, true);
                        foreach ($json as $value) {
                            $lineloc ="";
                            foreach ($json2 as $value2){
                                if ($value['ID_Lahan'] == $value2['ID_Lahan'])
                                    $lineloc .= "{lat:".$value2['lat'].", lng:".$value2['longt']."},";
                            }

                            $lineloc = substr($lineloc, 0 , -1);
                            $lineloc .= "];";
                            echo "var line_locations=[".$lineloc."
                            var lahanPath = new google.maps.Polygon({
                            path: line_locations,
                            geodesic: true,
                            strokeColor: '#".$value['col_hex']."',
                            strokeOpacity: 0.5,
                            strokeWeight: 0.5,
                            fillColor: '#".$value['col_hex']."',
                            fillOpacity: 0.35
                        });

                        lahanPath.setMap(map);
                            ";
                        }
                        ?>

                    </script>
                </div>

            </div>
        </div>

        <div class="four-grids">

            <div class="col-md-3 four-grid">
                <div class="four-agileits">
                    <div class="icon">
                        <i class="glyphicon glyphicon-grain" aria-hidden="true"></i>
                    </div>
                    <div class="four-text">
                        <h3>Lahan Pertanian</h3>
                        <h4> <?php echo count($json); ?> </h4>

                    </div>

                </div>
            </div>
            <div class="col-md-3 four-grid">
                <div class="four-agileinfo">
                    <div class="icon">
                        <i class="glyphicon glyphicon-user" aria-hidden="true"></i>
                    </div>
                    <div class="four-text">
                        <h3>Petani</h3>
                        <h4> <?php
                            echo tot_petani($klp,$desa);
                            ?> </h4>
                    </div>

                </div>
            </div>
            <div class="col-md-3 four-grid">
                <div class="four-w3ls">
                    <div class="icon">
                        <i class="glyphicon glyphicon-home" aria-hidden="true"></i>
                    </div>
                    <div class="four-text">
                        <h3>Desa</h3>
                        <h4> <?php
                                echo tot_desa($json);
                            ?> </h4>

                    </div>

                </div>
            </div>
            <div class="col-md-3 four-grid">
                <div class="four-wthree">
                    <div class="icon">
                        <i class="glyphicon glyphicon-list" aria-hidden="true"></i>
                    </div>
                    <div class="four-text">
                        <h3>Kelompok Tani</h3>
                        <h4> <?php
                                echo tot_klp_tani($json);
                            ?> </h4>

                    </div>

                </div>
            </div>
            <div class="clearfix"></div>
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