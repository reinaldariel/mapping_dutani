<?php
//error_reporting(0);
include "includes/config2.php";

$database = new Database();
$conn = $database->getConnection();

session_start();
if(!isset($_SESSION['user'])){
    echo "<script>location.href='login.php'</script>";
}

/*if (isset($_POST['lat']))
{
  $hasil='';
  if(!isset($_GET['id_detail'])){
    $hasil= $tanah->simpan_tanah($_POST['Des_singkat'], $_POST['Des_lengkap'], 
      $_FILES['Foto_tanah'], $_POST['Alamat_tanah'], $_POST['Kota'], $_POST['Harga']);
    
  }
  else{
    $hasil= $tanah->update_tanah($_GET['Id_tanah'], $_POST['Des_singkat'], $_POST['Des_lengkap'], 
      $_FILES['Foto_tanah'], $_POST['Alamat_tanah'], $_POST['Kota'], $_POST['Harga']);    
  }
  if ($hasil=="sukses"){
    echo "<div class='box box-primary row callout callout-info' style='text-align: right'><h4>Sukses!</h4></div>";
    echo "<meta http-equiv='refresh' content='1;url=kelola_tanah.php'>";
  }
  else{
    echo "<div class='box box-danger row callout callout-info' style='text-align: right'><h4>Gagal!</h4></div>";
  }
}*/

//init
$str_titik_center = '';

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
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAL_3NhGIUmaXLbudR1lQLHUSLPi6_lzGI&sensor=false" type="text/javascript"></script>
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
                    <h2>Tambah Titik Lahan Pertanian</h2>
                </div>


            </div>
            <!--//grid-->

            <div class="agile-grids">
                <div class="grid-form">
                    <div class="grid-form1">
<div class="agileits-box-body clearfix">

                    <div id="map" style="width: auto; height: 450px;"></div>
                    <?php
                    if($_SESSION['kategori'] == "ADP") {
                        $list = "select l.ID_Lahan as id_lahan,p.Nama_Petani as nama,l.Koordinat_Y as longitude,l.Koordinat_X as latitude,l.foto as foto,l.Desa as desa,p.ID_User as id_user from master_petani p, master_peta_lahan l where p.ID_User = l.ID_User AND l.ID_User not in('') AND l.ID_Lahan not in('') AND l.ID_Lahan= ".$_GET['id_lahan'];
                        $stmt = $conn->prepare($list);
                        $stmt->execute();
                    }else{
                        $list = "select l.ID_Lahan as id_lahan,p.Nama_Petani as nama,l.Koordinat_Y as longitude,l.Koordinat_X as latitude,l.foto as foto,l.Desa as desa,p.ID_User as id_user from master_petani p, master_peta_lahan l where p.ID_User = l.ID_User AND l.ID_User = '".$_SESSION['user']."' AND l.ID_Lahan not in('')";
                        $stmt = $conn->prepare($list);
                        $stmt->execute();
                    }

                    $str_titik_all = file_get_contents($BASE_URL.'service/read_one_detail_lahan.php?id_lahan='.$_GET['id_lahan']);
                    $json_titik_all = json_decode($str_titik_all, true);
                    $jml_titik_tercatat = count($json_titik_all);

                    $str_titik_center = file_get_contents($BASE_URL.'service/read_one_detail_lahan.php?id_lahan='.$_GET['id_lahan']);
                    $json_titik_center = json_decode($str_titik_center, true);

                    ?>
                    <script type="text/javascript">
                        var locations = [
                            <?php
                            if ($jml_titik_tercatat > 0) {
                                foreach ($json_titik_center as $key => $val) {
                                    $content="'<div id=\"content\">'+
                                        '<div id=\"siteNotice\">'+
                                        '</div>'+
                                        '<h4 id=\"firstHeading\" class=\"firstHeading\">".$val['id_lahan']."</h4>'+
                                        '<h6>".$val['id_detail']."</h6>'+
                                        '<div id=\"bodyContent\"><p>'+
                                        '<ul>'+
                                        '<li> <a href=\"view2.php?id=".$val['id_detail']."\" target=\"_blank\">Detail</a>' +
                                        '</ul></div></div>'";
                                    echo "['".$val['id_detail']."',".$val['lat'].",".$val['longt'].",".$content."],";
                                }
                            }else{
                                $stmt->setFetchMode(PDO::FETCH_ASSOC);
                                $val = $stmt->fetch();
                                echo "['".$val['id_lahan']."',".$val['latitude'].",".$val['longitude']."]";
                            }
                            ?>
                        ];


                        var latLng=new google.maps.LatLng(locations[0][1], locations[0][2]);
                        var map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 20, //level zoom
                            scaleControl: true,
                            center:latLng,
                            mapTypeId: google.maps.MapTypeId.HYBRID
                        });



                        if (locations.length = 1){

                        }
                        else if (locations.length > 0) {
                            var infowindow = new google.maps.InfoWindow();
                            var marker, i;
                            /* kode untuk menampilkan banyak marker */
                            for (i = 0; i < <?php echo count($json_titik_all) ?>; i++) {
                                marker = new google.maps.Marker({
                                    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                                    map: map,
                                    draggable: false,
                                    animation: google.maps.Animation.DROP
                                });
                                /* menambahkan event click untuk menampilkan
                                 info windows dengan isi sesuai dengan marker yg di klik */
                                google.maps.event.addListener(marker, 'click', (function (marker, i) {
                                    return function () {
                                        infowindow.setContent(locations[i][3]);
                                        infowindow.open(map, marker);
                                    }
                                })(marker, i));
                            }
                        }

                        //Add listener
                        google.maps.event.addListener(map, "click", function (event) {
                            var latitude = event.latLng.lat();
                            var longitude = event.latLng.lng();
                            //console.log( latitude + ', ' + longitude );
                            document.getElementById('lat').value = latitude;
                            document.getElementById('longt').value = longitude;

                            radius = new google.maps.Circle({map: map,
                                radius: 4,
                                center: event.latLng,
                                fillColor: '#777',
                                fillOpacity: 0.1,
                                strokeColor: '#AA0000',
                                strokeOpacity: 0.8,
                                strokeWeight: 2,
                                draggable: true,    // Dragable
                                editable: true      // Resizable
                            });

                            // Center of map
                            map.panTo(new google.maps.LatLng(latitude,longitude));

                        }); //end addListener


                    </script>

                </div>
                    </div>
                </div>
            </div>

            <div class="agile-grids">
                <form action="service/insert_one_titik_lahan.php" method="post">
                    <div class="grid-form">
                        <div class="grid-form1">
                            <div class="form-group">
                              <label>Latitude</label>
                              <input type="text" value="" name="lat" id="lat" class="form-control">
                            </div>
                            <div class="form-group">
                              <label>Longitude</label>
                              <input type="text" value="" name="longt" id="longt" class="form-control">
                            </div>
                            <button type="submit" class="btn btn-primary" id="simpan_tanah" onclick="goAdd()">Simpan</button>
                            <input type="hidden" value="<?php echo isset($_GET['id_lahan'])? $_GET['id_lahan']: 0 ?>" name="id_lahan" id="id_lahan" class="form-control">
                            <input type="hidden" value="<?php echo isset($_GET['id_detail'])? $_GET['id_detail']: 0 ?>" name="id_detail" id="id_detail" class="form-control">
                        </div>
                    </div>
                </form>
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

    function goAdd(){
        document.location = "titik_lahan_add.php";
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