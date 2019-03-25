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
$nama='';
$idp = $_GET['id'];
if ($idp == $_SESSION['user']){
    $nama = $_SESSION['nama'];
}else{
    $stmt = $conn->prepare("SELECT Nama_Petani from master_petani WHERE ID_User = ?");
    $stmt->bindParam(1,$idp);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $nama = $row['Nama_Petani'];
    }
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
<!--    <script src="js/jquery-2.1.4.min.js"></script>-->
    <script
            src="https://code.jquery.com/jquery-3.3.1.js"
            integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
            crossorigin="anonymous"></script>
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
                    <h2>Pemetaan Lokasi Lahan Pertanian</h2>

                    <form action="service/insert_lahan.php" method="post" enctype="multipart/form-data">

                                <div class="form-group">
                                    <label>Nama Petani</label>
                                    <input type="text" value="<?php echo $nama; ?>" name="nama_petani" id="nama_petani" class="form-control">
                                    <input type="hidden" value="<?php echo $idp; ?>" name="ID_User" id="ID_User">
                                </div>

                                <div class="form-group">
                                    <label>Nama Lahan</label>
                                    <input type="text" value="" name="nama_lahan" id="nama_lahan" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Luas Lahan</label>
                                    <input type="number" value="" name="luas_lahan" id="luas_lahan" class="form-control">
                                </div>
                                <div class="form-group">
                                    <label>Jenis Lahan</label>
                                    <select class="form-control" id="jenis_lahan" name="jenis_lahan" required>
                                        <option value="" disabled selected> Jenis Lahan </option>
                                        <option value="sawah"> Sawah </option>
                                        <option value="tegalan"> Tegalan </option>
                                </div>
                        <div class="form-group">
                            <label class="control-label">a</label>
                            <select class="form-control"id="a" name="a" required>
                            </select>
                        </div>
                        <div class="form-group">
                            <label class="control-label">Provinsi</label>
                            <select class="form-control" id="provinsi" name="provinsi" required>
                                <option value="" selected> Provinsi </option>
                                <?php
                                $str = "";
                                $stmt = $conn->prepare("SELECT Nama_Provinsi from provinsi");
                                $stmt->execute();
                                $stmt->setFetchMode(PDO::FETCH_ASSOC);
                                $result = $stmt->fetchAll();
                                foreach ($result as $val) {
                                    $str .= '<option value="' . $val['Nama_Provinsi'] . '">' . $val['Nama_Provinsi'] . '</option>';
                                }
                                echo $str;
                                ?>
                            </select>

                        </div>

                        <div class="form-group">
                            <label class="control-label">Kabupaten</label>
                            <select class="form-control"id="Kab" name="Kabupaten" required>
                                <option value="" disabled selected> Kabupaten </option>
                            </select>
                        </div>


                        <div class="form-group">
                                            <label class="control-label">Kecamatan</label>
                                            <select class="form-control"id="Kec" name="Kecamatan" required>
                                                <option value="" disabled selected> Kecamatan </option>
                                            </select>
                                        </div>
                                <div class="form-group">
                                            <label class="control-label">Desa / Kelurahan</label>
                                            <select class="form-control"id="Desa" name="Desa_Kelurahan" required>
                                                <option value="" disabled selected> Desa / Kelurahan </option>

                                            </select>
                                        </div>

                                    <div class="form-group">
                                        <label>Status Organik</label>
                                        <select class="form-control" id="status_organik" name="status_organik" required>
                                            <option value="" disabled selected> Status Organik </option>
                                            <option value="organik"> Organik </option>
                                            <option value="non_organik"> Non-organik </option>
                                    </div>
                                    <div class="form-group">
                                        <label>Status Lahan</label>
                                        <select class="form-control" id="b" name="b" required>
                                    </div>
                        <div class="form-group">
                            <label>Status Lahan</label>
                            <select class="form-control" id="status_lahan" name="status_lahan" required>
                                <option value="" disabled selected> Status Lahan </option>
                                <option value="milik"> milik </option>
                                <option value="sewa"> sewa </option>
                                <option value="garap"> garap </option>
                        </div>
                        <div class="form-group">
                            <label>Status Lahan</label>
                            <select class="form-control" id="v" name="v" required>
                        </div>
                                    <div class="form-group">
                                        <label class="control-label">Tanaman</label>
                                        <select class="form-control" id="ID_Spesies" name="ID_Spesies" required>
                                            <option value="" disabled selected> Spesies </option>
                                            <?php
                                            $str = "";
                                            $stmt = $conn->prepare("SELECT ID_Spesies, Nama_Tanaman from master_spesies_tanaman");
                                            $stmt->execute();
                                            $stmt->setFetchMode(PDO::FETCH_ASSOC);
                                            $result = $stmt->fetchAll();
                                            foreach ($result as $val) {
                                                    $str .= '<option value="' . $val['ID_Spesies'] . '">' . $val['Nama_Tanaman'] . '</option>';
                                            }
                                            echo $str;
                                            ?>
                                        </select>

                                    </div>
                        <div class="form-group">
                            <label>Kebutuhan Benih</label>
                            <input type="number" value="" name="kebutuhan_benih" id="kebutuhan_benih" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Kebutuhan Saprotan</label>
                            <input type="number" value="" name="kebutuhan_saprotan" id="kebutuhan_saprotan" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Bulan Tanam</label>
                            <select class="form-control" id="bulan_tanam" name="bulan_tanam" required>
                                <option value="" disabled selected> Bulan </option>
                                <option value="01"> Januari </option>
                                <option value="02"> Februari </option>
                                <option value="03"> Maret </option>
                                <option value="04"> April </option>
                                <option value="05"> Mei </option>
                                <option value="06"> Juni </option>
                                <option value="07"> Juli </option>
                                <option value="08"> Agustus </option>
                                <option value="09"> September </option>
                                <option value="10"> Oktober </option>
                                <option value="11"> November </option>
                                <option value="12"> Desember </option>

                        </div>

                        <div class="form-group">
                            <label>Bulan Panen</label>
                            <select class="form-control" id="c" name="c" >
                        </div>

                        <div class="form-group">
                            <label>Bulan Panen</label>
                            <select class="form-control" id="bulan_panen" name="bulan_panen" required>
                                <option value="" disabled selected> Bulan </option>
                                <option value="01"> Januari </option>
                                <option value="02"> Februari </option>
                                <option value="03"> Maret </option>
                                <option value="04"> April </option>
                                <option value="05"> Mei </option>
                                <option value="06"> Juni </option>
                                <option value="07"> Juli </option>
                                <option value="08"> Agustus </option>
                                <option value="09"> September </option>
                                <option value="10"> Oktober </option>
                                <option value="11"> November </option>
                                <option value="12"> Desember </option>

                        </div>
                        <div class="form-group">
                            <label>Bulan Panen</label>
                            <select class="form-control" id="c" name="c" >
                        </div>
                        <div class="form-group">
                            <label>Rata-rata hasil per panen</label>
                            <input type="number" value="" name="rata_hasil_panen" id="rata_hasil_panen" class="form-control">
                        </div>

                        <div class="form-group">
                            <label class="control-label">Foto </label>
                            <input type="file" name="filenya">
                        </div>

                        <div class="form-group">
                            <label>Latitude</label>
                            <input type="text" value="" name="lat" id="lat" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Longitude</label>
                            <input type="text" value="" name="longt" id="longt" class="form-control">
                        </div>
                        <div id="map" style="width: auto; height: 450px;"></div>

                        <input class="btn btn-primary btn-lg" id="simpan_tanah" type="submit" value="Simpan">
<!--                        <input type="submit" class="btn btn-primary" id="simpan_tanah" value"Simpan">Simpan</input>-->
                    </form>
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
<!--//content-inner-->
<!--/sidebar-menu-->
<?php include "sidebar.php"?>
<div class="clearfix"></div>
</div>
<script>
    var latLng=new google.maps.LatLng(-7.9293733, 110.3009733);
    var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 17, //level zoom
        scaleControl: true,
        center:latLng,
        mapTypeId: google.maps.MapTypeId.HYBRID
    });

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
<script>
    $(document).ready(function(){
        $("#provinsi").change(function(){
            showHint($("#provinsi").val());
        });
    });

    function showHint(str) {
        if (str.length == 0) {
            document.getElementById("Kab").innerHTML = "";
            return;
        } else {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    //document.getElementById("txtHint").innerHTML = this.responseText;
                    var hasil = this.responseText.split(",");
                    $("#Kab").empty();
                    $("#Kab").append("<option>Kabupaten</option>");
                    for (var i = 0; i < hasil.length - 1; ++i) {
                        $("#Kab").append(hasil[i]);
                    };
                }
            };
            xmlhttp.open("GET", "./service/read_kabupaten_hint.php?prov=" + str, true);
            xmlhttp.send();
        }

    }
</script>
<script>

    $(document).ready(function(){
        $("#Kab").change(function(){
            showHintkec($("#Kab").val());
        });
    });

    function showHintkec(strkec) {
        if (strkec.length == 0) {
            document.getElementById("Kec").innerHTML = "";
            return;
        } else {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    //document.getElementById("txtHint").innerHTML = this.responseText;
                    var hasilkec = this.responseText.split(",");
                    $("#Kec").empty();
                    $("#Kec").append("<option>Kecamatan</option>");
                    for (var i = 0; i < hasilkec.length - 1; ++i) {
                        $("#Kec").append(hasilkec[i]);
                    };
                }
            };
            xmlhttp.open("GET", "./service/read_kecamatan_hint.php?kab=" + strkec, true);
            xmlhttp.send();
        }
    }
</script>

<script>

    $(document).ready(function(){
        $("#Kec").change(function(){
            showHintkel($("#Kec").val());
        });
    });

    function showHintkel(strkel) {
        if (strkel.length == 0) {
            document.getElementById("Desa").innerHTML = "";
            return;
        } else {
            var xmlhttp = new XMLHttpRequest();
            xmlhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    //document.getElementById("txtHint").innerHTML = this.responseText;
                    var hasilkel = this.responseText.split(",");
                    $("#Desa").empty();
                    $("#Desa").append("<option>Desa / Kelurahan</option>");
                    for (var i = 0; i < hasilkel.length - 1; ++i) {
                        $("#Desa").append(hasilkel[i]);
                    }
                }
            };
            xmlhttp.open("GET", "./service/read_kelurahan_hint.php?kec=" + strkel, true);
            xmlhttp.send();
        }
    }

</script>
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