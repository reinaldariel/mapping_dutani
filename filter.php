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
$lahancounter = $BASE_URL.'service/read_lahan_berdetail.php';
$str_titik_all = $BASE_URL.'service/read_lahan_detail.php';
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
                    <label>Gabungan berdasar :</label>
                    <select id="pilihan" onchange="pilihanGabungan()">
                    <?php
                    if (isset($_POST['klptani']) and $_POST['klptani'] != ""){
                    echo '<option value="formKtani">Kelompok Tani</option>
                        <option value="">-Pilih-</option>
                        <option value="formDaerah">Daerah</option>';
                    } elseif (isset($_POST['daerah']) and $_POST['daerah'] != ""){
                        echo '<option value="formDaerah">Daerah</option>
                        <option value="">-Pilih-</option>
                        <option value="formKtani">Kelompok Tani</option>';
                    } else {
                        echo '<option value="">-Pilih-</option>
                        <option value="formDaerah">Daerah</option>
                        <option value="formKtani">Kelompok Tani</option>';
                    }
                    ?>
                    </select>
                    <?php
                    if (isset($_POST['klptani']) and $_POST['klptani'] != ""){
                        echo '<form action="filter.php" method="post" id="formKtani">';
                    }else {
                        echo '<form action="filter.php" method="post" id="formKtani" style="display: none">';
                    }
                    ?>
                        <h4>Berdasar Kelompok Tani</h4>
                        <label>pilih kelompok </label>
                        <select id="klptani" name="klptani">
                            <?php
                            $strlistklp = $BASE_URL.'service/read_klptani.php';
                            if (isset($_POST['klptani']) and $_POST['klptani'] != ""){
                                $lahancounter .= '?klptani='.$_POST['klptani'];
                                $str_titik_all .= '?klptani='.$_POST['klptani'];

                                $strlistklp .= "?klptani=".$klp;
                                $klp = $_POST['klptani'];
                                echo  '<option value="' . $_POST['klptani'] . '">' . tot_klp_tani($strlistklp) . '</option>';
                            }
                            $str = "<option value=\"\">- pilih -</option>";
                            $strlistklp = file_get_contents($strlistklp);
                            $json = json_decode($strlistklp, true);
                            foreach ($json as $val) {
                                $str .= '<option value="' . $val['id'] . '">' . $val['nama_kelompok_tani'] . '</option>';
                            }
                            echo $str;
                            ?>
                        </select>
                        <input class="btn btn-primary btn-lg" id="pilih_poktan" value="Pilih" type="submit">
                    <?php
                    if (isset($_POST['klptani']) and $_POST['klptani'] != "") {
                        echo '<a href="filter.php"><i class="fa fa-times fa-lg"></i></a>';
                    }
                    ?>
                    </form>
                    <?php
                    if (isset($_POST['daerah']) and $_POST['daerah'] != ""){
                        echo '<form action="filter.php" method="post" id="formDaerah">';
                    }else {
                        echo '<form action="filter.php" method="post" id="formDaerah" style="display: none">';
                    }
                    ?>
                    <h4>Berdasar Daerah</h4>
                        <label>pilih daerah </label>
                        <select id="daerah" name="daerah">
                            <?php
                            $strlistdesa = $BASE_URL.'service/read_kelurahan.php';
                            if (isset($_POST['daerah']) and $_POST['daerah'] != ""){
                                $lahancounter .= '?daerah=' . $_POST['daerah'];
                                $str_titik_all .= '?daerah=' . $_POST['daerah'];
                                $strlistdesa .= "?desa=".$_POST["daerah"];
                                $desa = $_POST['daerah'];
                                echo  '<option value="' . $_POST['klptani'] . '">' . tot_desa($strlistdesa) . '</option>';
                            }
                            $str = "<option value=\"\">- pilih -</option>";
                            $strlistdesa = file_get_contents($strlistdesa);
                            $json = json_decode($strlistdesa, true);
                            foreach ($json as $val) {
                                $str .= '<option value="' . $val['Desa'] . '">' . $val['Desa'] . '</option>';
                            }
                            echo $str;
                            ?>
                        </select>
                        <input class="btn btn-primary btn-lg" id="pilih_daerah" value="Pilih" type="submit">
                    <?php
                    if (isset($_POST['daerah']) and $_POST['daerah'] != ""){
                        echo '<a href="filter.php"><i class="fa fa-times fa-lg"></i></a>';
                    }
                    ?>
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
                                $lahancounter = file_get_contents($lahancounter);
                                $str_titik_all = file_get_contents($str_titik_all);
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
                                    infowindow.setContent(<?php if (isset($_POST['daerah']) and $_POST['daerah'] != ""){ echo "'".$_POST['daerah']."<br>' + "; } elseif (isset($_POST['klptani']) and $_POST['klptani'] != ""){ echo "'".$_POST['klptani']."<br>' + "; }  ?>"Luas Area : " + roundUp(lengthInMeters,2) + "m2");
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

            <script>
                <!-- script-for sticky-nav -->
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

                function pilihanGabungan() {
                    var x = document.getElementById("pilihan").value;
                    if(x == "formKtani") {
                        document.getElementById("formKtani").style.display = "";
                        document.getElementById("formDaerah").style.display = "none";
                    }else if(x == "formDaerah"){
                        document.getElementById("formKtani").style.display = "none";
                        document.getElementById("formDaerah").style.display = "";
                    } else {
                        document.getElementById("formKtani").style.display = "none";
                        document.getElementById("formDaerah").style.display = "none";
                    }
                }
            </script>
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
</script>
<!--js -->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- /Bootstrap Core JavaScript -->

</body>
</html>