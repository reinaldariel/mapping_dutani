<?php
//error_reporting(0);
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
$str_titik_all = $BASE_URL.'service/read_lahan_berdetail.php';
$str_dtl_titik_all = $BASE_URL.'service/read_lahan_detail.php';
$counter=0;
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

    <!--    <script type="text/javascript">-->
    <!--        //open newwindows-->
    <!--        function MM_openBrWindow(theURL,winName,features) { //v2.0-->
    <!--            window.open(theURL,winName,features);-->
    <!--        }-->
    <!--    </script>-->
</head>
<body>
<div class="page-container">
    <!--/content-inner-->
    <div class="left-content">
        <div class="mother-grid-inner">
            <div class="grid-form">
                <div class="grid-form1">
                    <h2>Peta Persebaran Lahan Pertanian</h2>
                    <form action="showall_lahan.php" method="post">
                        <label>pilih kelompok </label>
                        <select id="klptani" name="klptani">
                            <?php
                            $strlistklp = $BASE_URL.'service/read_klptani.php';
                            if (isset($_POST['klptani']) and $_POST['klptani'] != ""){
                                if ($counter == 0) {
                                    $str_titik_all .= '?klptani='.$_POST['klptani'];
                                    $str_dtl_titik_all .= '?klptani='.$_POST['klptani'];
                                }
                                else{
                                    $str_titik_all .= '&klptani='.$_POST['klptani'];
                                    $str_dtl_titik_all .= '&klptani='.$_POST['klptani'];
                                }

                                $klp = $_POST['klptani'];
                                $strlistklp .= "?klptani=".$klp;
                                echo  '<option value="' . $_POST['klptani'] . '">' . tot_klp_tani($strlistklp) . '</option>';
                                $counter++;
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
                        <label>pilih daerah </label>
                        <select id="daerah" name="daerah">
                            <?php
                            $strlistdesa = $BASE_URL.'service/read_kelurahan.php';
                            if (isset($_POST['daerah']) and $_POST['daerah'] != ""){
                                if ($counter == 0) {
                                    $str_titik_all .= '?daerah=' . $_POST['daerah'];
                                    $str_dtl_titik_all .= '?daerah=' . $_POST['daerah'];
                                }
                                else{
                                    $str_titik_all .= '&daerah=' . $_POST['daerah'];
                                    $str_dtl_titik_all .= '&daerah=' . $_POST['daerah'];
                                }
                                $desa = $_POST['daerah'];
                                $strlistdesa .= "?desa=".$_POST["daerah"];
                                echo '<option value="'.$_POST["daerah"].'">'.$_POST["daerah"].'</option>';
                                $counter++;
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
                        if ((isset($_POST['daerah'])) or (isset($_POST['klptani'])))
                        {
                            echo "<a href=\"showall_lahan.php\"><i class=\"fa fa-times fa-lg\"></i></a>";
                        }
                        ?>
                    </form>
                </div>
                </header>

                <div class="agileits-box-body clearfix">

                    <div id="map" style="width: auto; height: 450px;"></div>
                    <script type="text/javascript">
                        <?php
                        $str_titik_all = file_get_contents($str_titik_all);
                        $str_dtl_titik_all = file_get_contents($str_dtl_titik_all);
                        $json = json_decode($str_titik_all, true);
                        $json2 = json_decode($str_dtl_titik_all, true);
                        if (count($json) > 0) {
                            echo "
                        var locations = [
                        ";
                            foreach ($json as $row) {

                                $content = "'<div id=\"content\">'+
                                '<div id=\"siteNotice\">'+
                                '</div>'+
                                '<h4 id=\"firstHeading\" class=\"firstHeading\">" . $row['ID_Lahan'] . "</h4>'+
                                '<h6>" . $row['nama'] . "</h6>'+
                                '<div id=\"bodyContent\"><p>'+
                                '<ul>'+
                                '<li> " . $row['desa'] . "' +
                                '<li> " . $row['Nama_Kelompok_Tani'] . "' +
                                '<li> <a href=\"detail_lahan.php?id_lahan=" . $row['ID_Lahan'] . "&id_petani=".$row['id_user']."\" target=\"_blank\">Detail</a>' +
                                '</ul></div></div>'";

                                $lineloc = "[";
                                foreach ($json2 as $value2) {
                                    if ($row['ID_Lahan'] == $value2['ID_Lahan'])
                                        $lineloc .= "{lat:" . $value2['lat'] . ", lng:" . $value2['longt'] . "},";
                                }
                                $lineloc = substr($lineloc, 0, -1);
                                $lineloc .= "]";

                                echo "['" . $row['ID_Lahan'] . "'," . $row['lat'] . "," . $row['longt'] . ",'#" . $row['col_hex'] . "'," . $content . "," . $lineloc . "],";
                            }
                            echo "   
                        ];
                        var latLng = new google.maps.LatLng(locations[0][1], locations[0][2]);";
                        }else{
                            echo "var latLng = new google.maps.LatLng(".$def_lat.", ".$def_long.");";
                        }
                        ?>
                        var map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 16, //level zoom
                            scaleControl: true,
                            center:latLng,
                            mapTypeId: google.maps.MapTypeId.HYBRID
                        });
                            var infowindow = new google.maps.InfoWindow();
                            var line_locations, lahanPath, i;
                            /* kode untuk menampilkan banyak marker */
                            for (i = 0; i < <?php echo count($json)?>; i++) {
                                line_locations = locations[i][5];
                                lahanPath = new google.maps.Polygon({
                                    path: line_locations,
                                    geodesic: true,
                                    map: map,
                                    strokeColor: locations[i][3],
                                    strokeOpacity: 0.5,
                                    strokeWeight: 0.5,
                                    fillColor: locations[i][3],
                                    fillOpacity: 0.35
                                });
                                google.maps.event.addListener(lahanPath, 'click', (function (lahanPath, i) {
                                    return function () {
                                        latLng = new google.maps.LatLng(locations[i][1], locations[i][2]);
                                        infowindow.setContent(locations[i][4]);
                                        infowindow.setPosition(latLng);
                                        infowindow.open(map);
                                    }
                                })(lahanPath, i));
                            }
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
                        <h4> <?php echo tot_klp_tani($json); ?> </h4>

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
<!-- morris JavaScript -->
<script src="js/raphael-min.js"></script>
<script src="js/morris.js"></script>
<script>
    $(document).ready(function() {
        //BOX BUTTON SHOW AND CLOSE
        jQuery('.small-graph-box').hover(function() {
            jQuery(this).find('.box-button').fadeIn('fast');
        }, function() {
            jQuery(this).find('.box-button').fadeOut('fast');
        });
        jQuery('.small-graph-box .box-close').click(function() {
            jQuery(this).closest('.small-graph-box').fadeOut(200);
            return false;
        });

        //CHARTS
        function gd(year, day, month) {
            return new Date(year, month - 1, day).getTime();
        }

        graphArea2 = Morris.Area({
            element: 'hero-area',
            padding: 10,
            behaveLikeLine: true,
            gridEnabled: false,
            gridLineColor: '#dddddd',
            axes: true,
            resize: true,
            smooth:true,
            pointSize: 0,
            lineWidth: 0,
            fillOpacity:0.85,
            data: [
                {period: '2014 Q1', iphone: 2668, ipad: null, itouch: 2649},
                {period: '2014 Q2', iphone: 15780, ipad: 13799, itouch: 12051},
                {period: '2014 Q3', iphone: 12920, ipad: 10975, itouch: 9910},
                {period: '2014 Q4', iphone: 8770, ipad: 6600, itouch: 6695},
                {period: '2015 Q1', iphone: 10820, ipad: 10924, itouch: 12300},
                {period: '2015 Q2', iphone: 9680, ipad: 9010, itouch: 7891},
                {period: '2015 Q3', iphone: 4830, ipad: 3805, itouch: 1598},
                {period: '2015 Q4', iphone: 15083, ipad: 8977, itouch: 5185},
                {period: '2016 Q1', iphone: 10697, ipad: 4470, itouch: 2038},
                {period: '2016 Q2', iphone: 8442, ipad: 5723, itouch: 1801}
            ],
            lineColors:['#ff4a43','#a2d200','#22beef'],
            xkey: 'period',
            redraw: true,
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['All Visitors', 'Returning Visitors', 'Unique Visitors'],
            pointSize: 2,
            hideHover: 'auto',
            resize: true
        });


    });
</script>
</body>
</html>