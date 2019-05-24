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
    <script src="js/jquery-ui.min.js"></script>
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
                    <h2>Pemetaan Lokasi Lahan Pertanian</h2>
                    <h4>Detil Titik Lahan Pertanian</h4>

                    <!--<div class="toolbar"> -->
                    <?php
                    $penambahan_lahan =0;

                        $str_titik_all = file_get_contents($BASE_URL.'service/read_one_detail_lahan.php?id_lahan='.$_GET['id_lahan']);
                        $json = json_decode($str_titik_all, true);
                        $jml_titik_tercatat = count($json);

                        $str = file_get_contents($BASE_URL.'service/read_one_petani_berdasar_lahan.php?id_lahan='.$_GET['id_lahan']);
                        $json = json_decode($str, true);
                        foreach ($json as $head) {
                            $counter = 0;
                            foreach ($head as $key => $val) {
                                if ($counter == 1) {
                                    echo "<p>Lahan milik : </p>" . $val . "<br><br>";
                                }
                                $counter++;
                            }
                        }
                     ?>
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
                            $json = json_decode($str, true);
                            //print_r(count($json));exit;
                            ?>
                        var locations = [
                            <?php
                            $json = json_decode($str_titik_all, true);
                            if (count($json) > 0) {
                                foreach ($json as $key => $val) {
                                    echo "['".$val['id_detail']."',".$val['lat'].",".$val['longt']."],";
                                }
                            }else{
                                $json = json_decode($str, true);
                                foreach ($json as $key => $val) {
                                    echo "['0',".$val['Koordinat_X'].",".$val['Koordinat_Y']."],";
                                }
                            }
                            ?>
                        ];
                        console.log(locations);
                        var latLng=new google.maps.LatLng(locations[0][1], locations[0][2]);
                        var map = new google.maps.Map(document.getElementById('map'), {
                            zoom: 20, //level zoom
                            scaleControl: true,
                            center:latLng,
                            mapTypeId: 'satellite'
                        });

                        var infowindow = new google.maps.InfoWindow();

                        //set polygon area
                        var line_locations = [
                            <?php
                            $json = json_decode($str_titik_all, true);
                            if (count($json) > 0) {
                                foreach ($json as $key => $val) {
                                    if($key == count($json)-1){
                                        echo "{lat:".$val['lat'].", lng:".$val['longt']."}";
                                    }else{
                                        echo "{lat:".$val['lat'].", lng:".$val['longt']."},";
                                    }
                                }
                            }
                            ?>
                        ];

                        var lahanPath = new google.maps.Polygon({
                          path: line_locations,
                          geodesic: true,
                          strokeColor: '#FF0000',
                          strokeOpacity: 1.0,
                          strokeWeight: 2
                        });

                        lahanPath.setMap(map);

                        var marker, i;
                        /* kode untuk menampilkan banyak marker */
                        <?php $json_titik_all = json_decode($str_titik_all, true); ?>
                        for (i = 0; i < <?php echo count($json_titik_all) ?>; i++) {
                            marker = new google.maps.Marker({
                                position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                                map: map,
                                draggable : false,
                                animation: google.maps.Animation.DROP,
                                icon: 'http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld='+locations[i][0]+'|FE6256|000000'
                            });
                        }

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

            <div class="agile-grids">
                <!-- tables -->

                <div class="grid-form">
                    <div class="grid-form1">
                        <h4>Data Titik Lahan Petani</h4>
                        <button type="button" class="btn btn-success" name="titik_lahan_add" id="titik_lahan_add" onclick="goAdd(<?php echo $_GET['id_lahan']; ?>)"> + Tambah Titik</button>
                        <table id="table" class="table table-striped table-hover">
                            <thead>
                            <tr>
                                <th>ID Titik Lahan</th>
                                <th>Lat</th>
                                <th>Long</th>
                                <th>Aksi</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                            $json = json_decode($str_titik_all, true);
                            if (count($json) > 0) {
                                foreach ($json as $key => $val) {?>
                                    <tr>
                                        <td><?php echo $val['id_detail']?></td>
                                        <td><?php echo $val['lat']?></td>
                                        <td><?php echo $val['longt']?></td>
                                        <td>
                                        <center>
                                            <a href="titik_lahan_add.php?id_lahan=<?php echo $val['id_lahan'];?>&id_detail=<?php echo $val['id_detail'];?>" class="btn btn-warning">Ubah</a>
                                            <a href="service/hapus_titik_lahan.php?id_lahan=<?php echo $val['id_lahan'];?>&id_detail=<?php echo $val['id_detail']; ?>" class="btn btn-danger">Hapus</a>
                                        </center>
                                        </td>
                                    </tr>
                                <?php 
                                }
                            }
                            else { ?>
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

    function goUpdatePosisi(){
        alert('nice');
    }
</script>
<!--js -->
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>
<!-- /Bootstrap Core JavaScript -->

<script type="text/javascript">
    //$('tbody').sortable();
    $('tbody').sortable({
        disabled: false,
        axis: 'y',
        items: "> tr:not(:first)",
        forceHelperSize: true,
        start: function(event, ui) {
            ui.item.data('originIndex', ui.item.index());
            //alert("Posisi Awal " + ui.item.index());
        },
        update: function (event, ui) {
            var originIndex = ui.item.data('originIndex');
            var Newpos = ui.item.index();
            var MovedItem
            var RefID = $('tr').find('td:first').html();
            //alert("New Position " + Newpos + "..... RefID: " + RefID + "Old Pos " + originIndex);
            $.ajax({
                url:"service/update_posisi_titik.php",
                type:'post',
                data:{
                    id_indeks_start:originIndex,
                    id_indeks_end:Newpos,
                    id_lahan:<?php echo $_GET['id_lahan']?>
                },
                success:function(){
                    alert('Lahan sudah berhasil diubah!');
                    document.location.reload();
                }
            })
        }
    }).disableSelection();
</script>
</body>
</html>