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
    <!-- Modal IMG CSS-->
    <link href="css/modal_image.css" rel="stylesheet">
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
                            $str = file_get_contents($BASE_URL.'service/read_one_lahan.php?id_lahan='.$id);
                            $json = json_decode($str, true);
                            if (count($json) > 0) {
                                foreach ($json as $value) {
                                    $lat=$value['lat'];
                                    $long=$value['longt'];
                                    $nama_lahan=$value['nama_lahan'];
                                    echo "<h2>".$value['nama_lahan']."</h2>
                                    <h4>Keterangan Lahan</h4>
                                    <button type='button' class='btn btn-warning'><a href='lahan_edit.php?id_lahan=".$id."' style='color: white'>Ubah</a></button>
                                    <table style=\"border: none\">
                                    <tbody>
                                        <tr>
                                            <td>ID Lahan </td> <td> : ".$value['ID_Lahan']."</td>
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
                                        ";
                                    }
                            }
                            else {
                                ?>
                        <table style="border: none">
                            <tbody>
                                <tr>
                                    <td colspan="8">Belum ada lahan tercatat</td>
                                </tr>
                            <?php } ?>
                            </tbody>
                        </table>
                        <br>
                        <?php
                        echo "<h4>Kepemilikan Lahan</h4>
                            <table style=\"border: none\">
                                    <tbody>
                            ";
                        $str = file_get_contents($BASE_URL.'service/read_trans_one_lahan.php?id_lahan='.$id);
                        $json = json_decode($str, true);
                        foreach ($json as $value){
                            if($value['status_lahan'] == 'milik'){
                                echo "
                                    <tr>
                                    <td>Pemilik Lahan</td> <td> : ".$value['nama_petani'].", <a href='../dutatani/si_petani/Detail_Petani.php?id=".$value['ID_User']."'>Detail</a></td>
                                    </tr>
                                    ";
                            }
                            elseif($value['status_lahan'] == 'sewa'){
                                echo "
                                    <tr>
                                    <td>Penyewa Lahan</td> <td> : ".$value['nama_petani'].", <a href='../dutatani/si_petani/Detail_Petani.php?id=".$value['ID_User']."'>Detail</a></td>
                                    </tr>
                                    ";
                            }
                            elseif($value['status_lahan'] == 'garap'){
                                echo "
                                    <tr>
                                    <td>Penggarap Lahan</td> <td> : ".$value['nama_petani'].", <a href='../dutatani/si_petani/Detail_Petani.php?id=".$value['ID_User']."'>Detail</a></td>
                                    </tr>
                                    ";
                            }
                        }
                        echo "</tbody></table>";
                        ?>
                        <br>
                        <h4>Tanaman</h4>
                        <a href="./lahan_tanaman_add.php?id=<?php echo $id;?>" class="btn btn-success">Tambah penanaman</a>
                            <?php
                            $cntr=1;
                            $str = file_get_contents($BASE_URL.'service/read_tanaman_per_lahan.php?id_lahan='.$id);
                            $json = json_decode($str, true);
                            if (count($json) > 0) {
                                foreach ($json as $value) {
                                    $btanam='';
                                    $bpanen='';
                                    switch ($value['bulan_tanam']) {
                                        case "01":
                                            $btanam  = 'Januari';
                                            break;
                                        case "02":
                                            $btanam  = 'Februari';
                                            break;
                                        case "03":
                                            $btanam  = 'Maret';
                                            break;
                                        case "04":
                                            $btanam  = 'April';
                                            break;
                                        case "05":
                                            $btanam  = 'Mei';
                                            break;
                                        case "06":
                                            $btanam  = 'Juni';
                                            break;
                                        case "07":
                                            $btanam  = 'Juli';
                                            break;
                                        case "08":
                                            $btanam  = 'Agustus';
                                            break;
                                        case "09":
                                            $btanam  = 'September';
                                            break;
                                        case "10":
                                            $btanam  = 'Oktober';
                                            break;
                                        case "11":
                                            $btanam  = 'November';
                                            break;
                                        case "12":
                                            $btanam  = 'Desember';
                                            break;
                                        default:
                                            echo "-";
                                    }
                                    switch ($value['bulan_akhir']) {
                                        case "01":
                                            $bpanen  = 'Januari';
                                            break;
                                        case "02":
                                            $bpanen  = 'Februari';
                                            break;
                                        case "03":
                                            $bpanen  = 'Maret';
                                            break;
                                        case "04":
                                            $bpanen  = 'April';
                                            break;
                                        case "05":
                                            $bpanen  = 'Mei';
                                            break;
                                        case "06":
                                            $bpanen  = 'Juni';
                                            break;
                                        case "07":
                                            $bpanen  = 'Juli';
                                            break;
                                        case "08":
                                            $bpanen  = 'Agustus';
                                            break;
                                        case "09":
                                            $bpanen  = 'September';
                                            break;
                                        case "10":
                                            $bpanen  = 'Oktober';
                                            break;
                                        case "11":
                                            $bpanen  = 'November';
                                            break;
                                        case "12":
                                            $bpanen  = 'Desember';
                                            break;
                                        default:
                                            echo "-";
                                    }
                                   echo "
                         <h5>Penanaman ".$cntr."</h5>  
                          <a href='./lahan_tanaman_edit.php?id=".$value['id_detail_tanaman']."' class='btn btn-warning'>Ubah</a>
                        <table>
                            <tbody>
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
                                <td>Bulan Menanam </td> <td> : ".$btanam."</td>
                            </tr>
                            <tr>
                                <td>Bulan Panen </td> <td> : ".$bpanen."</td>
                            </tr>
                            <tr>
                                <td>Rata - rata hasil panen </td> <td> : ".$value['rata_hasil_panen']."</td>
                            </tr>
                            </tbody>
                        </table>
                        <br>
                            ";
                                   $cntr++;
                                }
                            }
                            else {
                                ?>

                                    <p>Belum ada penanaman tercatat</p>

                            <?php } ?>

                        <br>
                        <h4>Foto</h4>
                        <a href="./lahan_foto_add.php?id=<?php echo $id;?>" class="btn btn-success">Tambah Foto</a>
                        <table style="border: none">
                            <tbody>
                            <tr>
                        <?php
                        $fotocounter=0;
                        $str = file_get_contents($BASE_URL.'service/read_foto_lahan.php?id_lahan='.$id);
                        $json = json_decode($str, true);
                        if (count($json) > 0) {
                            foreach ($json as $value) {
                                echo "
<td><img id='myImg".$fotocounter."' src='images/foto_lahan/".$value['foto']."' alt='".$value['foto']."' style='width:100%;max-width:200px'>
</td>
";
                                $fotocounter++;
                            }
                        }
                        else {
                        ?>

                                <td colspan="8">Belum ada foto tercatat</td>

                            <?php } ?>
                            </tr>
                            </tbody>
                        </table>
                        <br>
                        <h4>Lokasi</h4>
                        <a href="./detail_titik_lahan.php?id_lahan=<?php echo $id;?>" class="btn btn-success">Detail Titik Lahan</a>
                        <div id="map" style="width: auto; height: 450px;"></div>
                    </div>
                </div>
                <!-- //tables -->
            </div>
            <!-- The Modal -->
            <div id="myModal" class="modal">

                <!-- The Close Button -->
                <span class="close">&times;</span>

                <!-- Modal Content (The Image) -->
                <img class="modal-content" id="img01">

                <!-- Modal Caption (Image Text) -->
                <div id="caption"></div>
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

                var marker;

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

                var line_locations = [
                    <?php
                    $str_titik_all = file_get_contents($BASE_URL.'service/read_one_detail_lahan.php?id_lahan='.$id);
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
<script>
    // Get the modal
    var modal = document.getElementById('myModal');

    // Get the image and insert it inside the modal - use its "alt" text as a caption
    <?php
    for($i=0;$i< $fotocounter ;$i++) {
        echo "var img".$i." = document.getElementById('myImg".$i."');";
    }
    ?>
    var modalImg = document.getElementById("img01");
    var captionText = document.getElementById("caption");

    <?php
    for($i=0;$i< $fotocounter ;$i++) {
       echo '
       img'.$i.'.onclick = function(){
        modal.style.display = "block";
        modalImg.src = this.src;
        captionText.innerHTML = this.alt;
    }
       ';
    }
    ?>

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
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