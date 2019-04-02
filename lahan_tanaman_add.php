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
$namalahan='';
$idl = $_GET['id'];
    $stmt = $conn->prepare("SELECT p.Nama_Petani from master_peta_lahan l, master_petani p WHERE l.ID_User = p.ID_User AND ID_Lahan = ?");
    $stmt->bindParam(1,$idl);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
        $nama = $row['Nama_Petani'];
    };

$stmt = $conn->prepare("SELECT nama_lahan from master_peta_lahan WHERE ID_Lahan = ?");
$stmt->bindParam(1,$idl);
$stmt->execute();
$stmt->setFetchMode(PDO::FETCH_ASSOC);
while($row = $stmt->fetch(PDO::FETCH_ASSOC)){
    $namalahan = $row['nama_lahan'];
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

                    <form action="service/insert_lahan_tanaman.php" method="post" enctype="multipart/form-data">
                        <h4>Data penanaman</h4>
                        <h5>lahan <?php echo $namalahan; ?></h5>
                        <h5>lahan milik <?php echo $nama; ?> </h5>
                        <input type="hidden" value="<?php echo $idl; ?>" name="id_lahan" id="id_lahan">
<table>
    <tbody>
    <tr>
        <td><label>Tanaman</label></td>
        <td><label> :&nbsp</label></td>
        <td>
        <select id="ID_Spesies" name="ID_Spesies" required>
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
        </td>
    </tr>
    <tr>
        <td>
        <label>Kebutuhan Benih (dalam kg)</label>
        </td>
        <td><label> : </label></td>
        <td>
            <input type="number" value="" name="kebutuhan_benih" id="kebutuhan_benih">
        </td>
    </tr>
    <tr>
        <td>
        <label>Kebutuhan Saprotan</label>
        </td>
        <td><label> : </label></td>
        <td>
            <input type="number" value="" name="kebutuhan_saprotan" id="kebutuhan_saprotan">
        </td>
    </tr>
    <tr>
        <td>
        <label>Bulan Tanam</label>
        </td>
        <td><label> : </label></td>
        <td>
            <select id="bulan_tanam" name="bulan_tanam" required>
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
        </select>
        </td>
    </tr>
    <tr>
        <td>
        <label>Bulan Panen</label>
        </td>
        <td><label> : </label></td>
        <td>
            <select id="bulan_panen" name="bulan_panen" required>
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
        </select>
        </td>
    </tr>
    <tr>
        <td>
        <label>Rata-rata hasil per panen (dalam kg) &nbsp</label>
        </td>
        <td><label> : </label></td>
        <td>
            <input type="number" value="" name="rata_hasil_panen" id="rata_hasil_panen">
        </td>
    </tr>
    </tbody>
</table>

                        <input class="btn btn-primary btn-lg" id="simpan_tanah" type="submit" value="Simpan">

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