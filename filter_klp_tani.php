<?php
//error_reporting(0);
include "includes/config2.php";
session_start();
if(!isset($_SESSION['user'])){
    echo "<script>location.href='login.php'</script>";
}

$database = new Database();
$conn = $database->getConnection();

//init
$str_titik_all = '';

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
    <!-- convex hull -->
    <script src="js/graham_scan.min.js"></script>
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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAL_3NhGIUmaXLbudR1lQLHUSLPi6_lzGI&sensor=false&libraries=geometry" type="text/javascript"></script>
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
                    <h2>Peta Gabungan Lahan Pertanian</h2>
                    <h4>Berdasar Daerah</h4>
                    <form action="filter_klp_tani.php" method="post">
                        <label>pilih daerah </label>
                        <select id="klptani" name="klptani">
                            <?php
                            if (isset($_POST['klptani'])){
                                $str_titik_all = file_get_contents($BASE_URL.'service/read_detail_titik_lahan_per_klp_tani.php?klp_tani='.$_POST['klptani']);
                            }else{
                                $str_titik_all = file_get_contents($BASE_URL.'service/read_detail_titik_lahan_per_klp_tani.php');
                            }
                            $str = "";
                            $stmt = $conn->prepare("SELECT ID_Kelompok_Tani as id, Nama_Kelompok_Tani as nama from master_kel_tani");
                            $stmt->execute();
                            $stmt->setFetchMode(PDO::FETCH_ASSOC);
                            $result = $stmt->fetchAll();
                            foreach ($result as $val) {
                                $str .= '<option value="' . $val['id'] . '">' . $val['nama'] . '</option>';
                            }
                            echo $str;
                            ?>
                        </select>
                        <input class="btn btn-primary btn-lg" id="pilih_poktan" value="Pilih" type="submit">
                    </form>
                </div>


            </div>
            <!--//grid-->

            <div class="agile-grids">
                <div class="grid-form">
                    <div class="grid-form1">
                        <div class="agileits-box-body clearfix">

                            <div id="map" style="width: auto; height: 450px;"></div>
                            <script type="text/javascript">
                                //Create new instance
                                var convexHull = new ConvexHullGrahamScan();

                                //add points
                                <?php
                                $json = json_decode($str_titik_all, true);
                                if (count($json) > 0) {
                                    foreach ($json as $key => $val) {
                                        echo "convexHull.addPoint(".$val['lat'].",".$val['longt'].");";
                                    }
                                }
                                ?>

                                var locations = convexHull.getHull();

                                var latLng=new google.maps.LatLng(locations[0].x, locations[0].y);
                                var map = new google.maps.Map(document.getElementById('map'), {
                                    zoom: 18, //level zoom
                                    scaleControl: true,
                                    center:latLng,
                                    mapTypeId: google.maps.MapTypeId.HYBRID
                                });

                                var infowindow = new google.maps.InfoWindow();

                                //set polygon area
                                var i;
                                var line_locations=[];
                                for (i=0;i<locations.length;i++){
                                    line_locations.push({lat:locations[i].x, lng:locations[i].y});
                                };

                                console.log(line_locations);

                                var lahanPath = new google.maps.Polygon({
                                    path: line_locations,
                                    geodesic: true,
                                    strokeColor: '#FF0000',
                                    strokeOpacity: 1.0,
                                    strokeWeight: 2
                                });

                                lahanPath.setMap(map);

                                //calculate distance
                                //var lengthInMeters = google.maps.geometry.spherical.computeLength(lahanPath.getPath());

                                //calculate area
                                function roundUp(num, precision) {
                                    precision = Math.pow(10, precision)
                                    return Math.ceil(num * precision) / precision
                                }

                                var lengthInMeters = google.maps.geometry.spherical.computeArea(lahanPath.getPath());

                                //add listener info
                                google.maps.event.addListener(lahanPath,'click', function (event) {
                                    infowindow.setContent("Luas Area : " + roundUp(lengthInMeters,2) + "m2");
                                    infowindow.setPosition(event.latLng);
                                    infowindow.open(map,lahanPath);
                                });
                            </script>

                        </div>
                    </div>
                </div>
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
    </input>
    <!--//content-inner-->
    <!--/sidebar-menu-->
    <?php include "sidebar.php" ?>
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

    function goAdd(id_lahan){
        document.location = "titik_lahan_add.php?id_lahan="+id_lahan;
    }
</script>
<!--js -->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- /Bootstrap Core JavaScript -->

</body>
</html>