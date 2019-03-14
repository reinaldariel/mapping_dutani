<?php
//error_reporting(0);
include "includes/config2.php";
//include "includes/fungsi.php";
$database = new Database();
$conn = $database->getConnection();
session_start();
if(!isset($_SESSION['user'])){
    echo "<script>location.href='login.php'</script>";
}
?>
<!DOCTYPE HTML>
<html>
<head>
    <title>Dutatani</title>
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
                    <h2>Pemetaan Lokasi Lahan Pertanian</h2>

                    <!--<div class="toolbar"> -->
                    <?php
                    if ($_SESSION['kategori'] == "ADP"){
                    if($_POST){
                        $kdes=$_POST['des'];
                        $kklp=$_POST['klp'];
                    }else{
                        $kdes='';
                        $kklp='';
                    }
                    ?>
                    <form action="" method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Kelurahan</label>
                            <select name="des" class="form-control">
                                <option value="" selected>- Semua Desa Kelurahan -</option>
                                <?php $str = file_get_contents('http://localhost/mapping-dutatani/service/read_kelurahan.php');
                                $json = json_decode($str, true);
                                foreach ($json as $head){
                                    foreach ($head as $key => $val)
                                    echo "<option value='".$val."'>".$val."</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Kelompok Tani</label>
                            <select name="klp" class="form-control">
                                <option value="" selected>- Semua Kelompok Tani -</option>
                                <?php $str = file_get_contents('http://localhost/mapping-dutatani/service/read_klptani.php');
                                $json = json_decode($str, true);
                                foreach ($json as $head){
                                    foreach ($head as $key => $val)
                                        echo "<option value='".$val."'>".$val."</option>";
                                }
                                ?>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                    <?php }else{
                        $str = file_get_contents($BASE_URL.'service/read_lahan_one_petani.php?id_user='.$_SESSION['user']);
                        $json = json_decode($str, true);
                        $jml_lahan_tercatat = count($json);

                        $str = file_get_contents($BASE_URL.'service/read_one_petani.php?id_user='.$_SESSION['user']);
                        $json = json_decode($str, true);
                        foreach ($json as $head) {
                            $counter = 0;
                            foreach ($head as $key => $val) {
                                if ($counter == 1) {
                                    echo "<p>Lahan milik : </p>" . $val . "<br><br>";
                                }
                                elseif ($counter == 9){
                                    echo "<p>Jumlah lahan : </p>".$val."<br><br>";
                                    echo "<p>Jumlah lahan tercatat : </p>".$jml_lahan_tercatat;
                                }
                                $counter++;
                            }
                        }
                    } ?>
                </div>
                </header>

                <div class="agileits-box-body clearfix">

                    <div id="map" style="width: auto; height: 450px;"></div>
                    <?php
//                    $list = "select l.ID_Lahan as id_lahan,p.Nama_Petani as nama,l.longitude as longitude,l.latitude as latitude,l.foto as foto,l.Desa as desa,p.ID_User as id_user from master_petani p, master_peta_lahan l, master_kel_tani k where p.ID_User = l.id_user_petani AND p.ID_Kelompok_Tani = k.ID_Kelompok_Tani AND l.id_user_petani not in('') AND l.ID_Lahan not in('')";
                    if($_SESSION['kategori'] == "ADP") {
                        $list = "select l.ID_Lahan as id_lahan,p.Nama_Petani as nama,l.Koordinat_Y as longitude,l.Koordinat_X as latitude,l.foto as foto,l.Desa as desa,p.ID_User as id_user from master_petani p, master_peta_lahan l where p.ID_User = l.ID_User AND l.ID_User not in('') AND l.ID_Lahan not in('')";
//                        if (!empty($_POST['des'])) {
//                            $list = "" . $list . " and l.Desa='$_POST[des]'";
//                        }
//                    if(!empty($_POST['klp'])){
//                        $list="".$list." and k.Nama_Kelompok_Tani='$_POST[klp]'";
//                    }
                        $stmt = $conn->prepare($list);
                        $stmt->execute();
                    }else{
                        $list = "select l.ID_Lahan as id_lahan,p.Nama_Petani as nama,l.Koordinat_Y as longitude,l.Koordinat_X as latitude,l.foto as foto,l.Desa as desa,p.ID_User as id_user from master_petani p, master_peta_lahan l where p.ID_User = l.ID_User AND l.ID_User = '".$_SESSION['user']."' AND l.ID_Lahan not in('')";
                        $stmt = $conn->prepare($list);
                        $stmt->execute();
                    }


                    ?>
                    <script type="text/javascript">
                        var locations = [
                            <?php
                            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)){

                                $content="'<div id=\"content\">'+
                                '<div id=\"siteNotice\">'+
                                '</div>'+
                                '<h4 id=\"firstHeading\" class=\"firstHeading\">".$row['id_lahan']."</h4>'+
                                '<h6>".$row['nama']."</h6>'+
                                '<div id=\"bodyContent\"><p>'+
                                '<img width=200 src=\"".$row['foto']."\" ' +
                                '<ul>'+
                                '<li> ".$row['desa']."' +
                                '<li> <a href=\"view2.php?id=".$row['id_lahan']."\" target=\"_blank\">Detail</a>' +
                                '</ul></div></div>'";
                            echo "['".$row['id_lahan']."',".$row['latitude'].",".$row['longitude'].",".$content."],";
                            }
                            ?>


                        ];
                        var latLng=new google.maps.LatLng(locations[0][1], locations[0][2]);
                        var map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 20, //level zoom
                            scaleControl: true,
                            center:latLng,
                            mapTypeId: google.maps.MapTypeId.ROADMAP
                        });

                        var infowindow = new google.maps.InfoWindow();

                        var marker, i;
                        /* kode untuk menampilkan banyak marker */
                        for (i = 0; i < <?php echo $stmt->rowCount()?>; i++) {
                            marker = new google.maps.Marker({
                                position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                                map: map,
                                draggable : false,
                                animation: google.maps.Animation.DROP
                            });
                            /* menambahkan event click untuk menampilkan
                             info windows dengan isi sesuai dengan marker yg di klik */
                            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                                return function() {
                                    infowindow.setContent(locations[i][3]);
                                    infowindow.open(map, marker);
                                }
                            })(marker, i));
                        }
                    </script>

                </div>

            </div>
        </div>
        <!--//agileinfo-grap-->

<!--        <div class="four-grids">-->
<!---->
<!--            <!--	<div class="col-md-3 four-grid">-->
<!--                <div class="four-agileits">-->
<!--                    <div class="icon">-->
<!--                        <i class="glyphicon glyphicon-user" aria-hidden="true"></i>-->
<!--                    </div>-->
<!--                    <div class="four-text">-->
<!--                        <h3>Warga Disabilitas</h3>-->
<!--                        <h4> 0 </h4>-->
<!---->
<!--                    </div>-->
<!---->
<!--                </div>-->
<!--            </div>-->-->
<!--            <div class="col-md-3 four-grid">-->
<!--                <div class="four-agileits">-->
<!--                    <div class="icon">-->
<!--                        <i class="glyphicon glyphicon-user" aria-hidden="true"></i>-->
<!--                    </div>-->
<!--                    <div class="four-text">-->
<!--                        <h3>Lahan Pertanian</h3>-->
<!--                        <h4> --><?//=tot_dis($kdes,$kklp)?><!-- </h4>-->
<!---->
<!--                    </div>-->
<!---->
<!--                </div>-->
<!--            </div>-->
<!--            <div class="col-md-3 four-grid">-->
<!--                <div class="four-agileinfo">-->
<!--                    <div class="icon">-->
<!--                        <i class="glyphicon glyphicon-list-alt" aria-hidden="true"></i>-->
<!--                    </div>-->
<!--                    <div class="four-text">-->
<!--                        <h3>Dusun</h3>-->
<!--                        --><?php //if (!empty($kdus)){ ?>
<!--                            <h4>--><?//=$kdus?><!--</h4>-->
<!--                        --><?php //}else{ ?>
<!--                            <h4>--><?//=tot_dus()?><!--</h4>-->
<!--                        --><?php //} ?>
<!---->
<!--                    </div>-->
<!---->
<!--                </div>-->
<!--            </div>-->
<!--            <div class="col-md-3 four-grid">-->
<!--                <div class="four-w3ls">-->
<!--                    <div class="icon">-->
<!--                        <i class="glyphicon glyphicon-user" aria-hidden="true"></i>-->
<!--                    </div>-->
<!--                    <div class="four-text">-->
<!--                        <h3>Laki - Laki</h3>-->
<!--                        <h4>--><?//=tot_laki($kdes,$kklp)?><!--</h4>-->
<!---->
<!--                    </div>-->
<!---->
<!--                </div>-->
<!--            </div>-->
<!--            <div class="col-md-3 four-grid">-->
<!--                <div class="four-wthree">-->
<!--                    <div class="icon">-->
<!--                        <i class="glyphicon glyphicon-user" aria-hidden="true"></i>-->
<!--                    </div>-->
<!--                    <div class="four-text">-->
<!--                        <h3>Perempuan</h3>-->
<!--                        <h4>--><?//=tot_wanita($kdes,$kklp)?><!--</h4>-->
<!---->
<!--                    </div>-->
<!---->
<!--                </div>-->
<!--            </div>-->
<!--            <div class="clearfix"></div>-->
<!--        </div>-->

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