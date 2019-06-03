<?php
//error_reporting(0);
include "includes/config2.php";
include "includes/fungsi.php";
session_start();
$klp='';
$desa='';
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
                    <h4>Berdasar Kelompok Tani</h4>
                    <form action="filter_klp_tani.php" method="post">
                        <label>pilih kelompok </label>
                        <select id="klptani" name="klptani">
                            <?php
                            $strlistklp = "SELECT DISTINCT tp.ID_Kelompok_Tani as id, k.Nama_Kelompok_Tani as nama from master_kel_tani k, trans_ang_petani tp, master_petani p, trans_lahan tl, master_peta_lahan l where k.ID_Kelompok_Tani = tp.ID_Kelompok_Tani AND tp.ID_User = p.ID_User AND p.ID_User = tl.ID_User AND tl.ID_Lahan = l.ID_Lahan";
                            if (isset($_POST['klptani']) and $_POST['klptani'] != ""){
                                $lahancounter = file_get_contents($BASE_URL.'service/read_lahan_per_klp_tani.php?klp_tani='.$_POST['klptani']);
                                $str_titik_all = file_get_contents($BASE_URL.'service/read_lahan_detail.php?klp_tani='.$_POST['klptani']);
                                $strlistklp .= " and tp.ID_Kelompok_Tani != '".$_POST['klptani']."'";
                                $klp = $_POST['klptani'];
                                echo  '<option value="' . $_POST['klptani'] . '">' . tot_klp_tani($strlistklp) . '</option>';
                            }else{
                                $lahancounter = file_get_contents($BASE_URL.'service/read_lahan_berdetail.php');
                                $str_titik_all = file_get_contents($BASE_URL.'service/read_lahan_detail.php');
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
                                    echo "
                                var locations = convexHull.getHull();

                                var latLng=new google.maps.LatLng(locations[0].x, locations[0].y);";
                                }else{
                                    echo "var latLng=new google.maps.LatLng(".$def_lat.", ".$def_long.");";
                                }
                                $json = json_decode($lahancounter, true);
                                ?>

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
                                }

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
                            <h4> <?php echo tot_petani($klp,$desa); ?> </h4>

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
                            <h4> <?php echo tot_desa($json); ?> </h4>

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