<?php
//error_reporting(0);
include "includes/config.php";
include "includes/fungsi.php";
session_start();
if(!isset($_SESSION['user'])){
	echo "<script>location.href='login.php'</script>";
}
?>
<!DOCTYPE HTML>
<html>
<head>
<title>Yakkum</title>
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
             <!--header start here-->
				<div class="header-main">
					<div class="logo-w3-agile">
						<h1><img src=images/header.jpg></h1>
							<!--	<h1><a href="./">Yakkum Emergency Unit</a></h1> -->
							</div>
					<div class="w3layouts-left">

							<div class="clearfix"> </div>
						 </div>
						 <div class="w3layouts-right">

							
							<div class="clearfix"> </div>				
						</div>
						<div class="profile_details w3l">		
								<ul>
									<li class="dropdown profile_details_drop">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
											<div class="profile_img">	
												<span class="prfil-img"><img src="images/in4.jpg" alt=""> </span> 
												<div class="user-name">
													<p><?=$_SESSION["user"]?></p>
													<span>Administrator</span>
												</div>
												<i class="fa fa-angle-down"></i>
												<i class="fa fa-angle-up"></i>
												<div class="clearfix"></div>	
											</div>	
										</a>
										<ul class="dropdown-menu drp-mnu">
											<li> <a href="profil.php"><i class="fa fa-user"></i> Profile</a> </li> 
											<li> <a href="logout.php"><i class="fa fa-sign-out"></i> Logout</a> </li>
										</ul>
									</li>
								</ul>
							</div>
							
				     <div class="clearfix"> </div>	
				</div>
<!--heder end here-->
	<ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="./">Home</a><i class="fa fa-angle-right"></i>Edit Warga</li>
            </ol>
		<!--grid-->
 	<div class="grid-form">
 		<div class="grid-form1">
 		<h2 id="forms-example" class="">Edit Warga</h2>
        <?php
        $id=$_GET['id'];
		if ($_POST){
        $id=$_POST['id'];
        $no_kk=$_POST['no_kk'];
        $nama=$_POST['nama'];
        $umur=$_POST['umur'];
        $jeniskelamin=$_POST['jeniskelamin'];
        $disabilitas=$_POST['disabilitas'];
        $alatbantu=$_POST['alatbantu'];
        $dusun=$_POST['dusun'];
        $alamat=$_POST['alamat'];
        $foto=$_FILES['foto']['name'];
        $latitude=$_POST['latitude'];
        $longtitude=$_POST['longtitude'];
        if(empty($foto)){
        $sql = "update tb_warga set no_kk='$no_kk',nama='$nama',umur='$umur',jeniskelamin='$jeniskelamin',disabilitas='$disabilitas',
        alatbantu='$alatbantu',dusun='$dusun',alamat='$alamat',latitude='$latitude',longtitude='$longtitude' where id_warga='$id'";
        }else{
            
        $gbr = kol_warga("foto",$id);
        unlink($gbr);
        
        $folder = 'foto/'.$foto;
        if (move_uploaded_file($_FILES['foto']['tmp_name'], $folder)){
                $file = 'foto/'.$foto;
            }
        $sql = "update tb_warga set no_kk='$no_kk',nama='$nama',umur='$umur',jeniskelamin='$jeniskelamin',disabilitas='$disabilitas',
        alatbantu='$alatbantu',dusun='$dusun',alamat='$alamat',foto='$file',latitude='$latitude',longtitude='$longtitude' where id_warga='$id'";        }
        $result = mysql_query($sql) or die(mysql_error());
        pesan_submit("cari.php");
		}
		 ?>
 		<form action="" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="exampleInputEmail1">No KK</label>
    <input name="id" type="hidden" class="form-control" value="<?=$id?>" required>
    <input name="no_kk" type="text" class="form-control" value="<?=kol_warga("no_kk",$id)?>" required>
  </div>
    <div class="form-group">
    <label for="exampleInputEmail1">Nama</label>
    <input name="nama" class="form-control" value="<?=kol_warga("nama",$id)?>" required> 
  </div>
    <div class="form-group">
    <label for="exampleInputEmail1">Umur</label>
    <input name="umur" type="text" class="form-control" value="<?=kol_warga("umur",$id)?>" required>
  </div>
    <div class="form-group">
    <label for="exampleInputEmail1">Jenis Kelamin</label><br>
    <?php
    $jk=kol_warga("jeniskelamin",$id);
    if($jk=='L'){
    
    ?>
    <input name="jeniskelamin" type="radio" value="L" checked>Laki-Laki</input>
    <input name="jeniskelamin" type="radio" value="P" >Perempuan</input>
    <?php }else{ ?>
    <input name="jeniskelamin" type="radio" value="L" >Laki-Laki</input>
    <input name="jeniskelamin" type="radio" value="P" checked>Perempuan</input>
    <?php } ?>
  </div>
    <div class="form-group">
    <label for="exampleInputEmail1">Disabilitas</label>
    <select name="disabilitas" class="form-control" required>
    <?=combo_dis(kol_warga("disabilitas",$id))?>
    </select>
  </div>
    <div class="form-group">
    <label for="exampleInputEmail1">Alat Bantu</label>
    <input name="alatbantu" type="text" class="form-control" value="<?=kol_warga("alatbantu",$id)?>" required>
  </div>
    <div class="form-group">
    <label for="exampleInputEmail1">Dusun</label>
    <select name="dusun" class="form-control" required>
    <?=combo_dus(kol_warga("dusun",$id))?>
    </select>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Alamat</label>
    <textarea name="alamat" class="form-control" required><?=kol_warga("alamat",$id)?></textarea>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Foto</label>
    <input name="foto" type="file" class="form-control">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Latitude</label>
    <input name="latitude" type="text" class="form-control" value="<?=kol_warga("latitude",$id)?>" required>
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Longtitude</label>
    <input name="longtitude" type="text" class="form-control" value="<?=kol_warga("longtitude",$id)?>" required>
  </div>
  <button type="submit" class="btn btn-primary">Ubah</button>
</form>
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
	 <p>� 2017 Pusat Rehabilitasi YAKKUM Yogyakarta</p>
</div>	
<!--COPY rights end here-->
</div>
</div>
  <!--//content-inner-->
		<!--/sidebar-menu-->
				<div class="sidebar-menu">
					<header class="logo1">
						<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span> </a> 
					</header>
						<div style="border-top:1px ridge rgba(255, 255, 255, 0.15)"></div>
                           <div class="menu">
									<ul id="menu" >
										<li><a href="./"><i class="fa fa-tachometer"></i> <span>Pemetaan</span><div class="clearfix"></div></a></li>
										
										
										 <li id="menu-academico" ><a href="cari.php"><i class="fa fa-search"></i><span>Pencarian</span><div class="clearfix"></div></a></li>
									<li><a href="logout.php"><i class="fa fa-sign-out" aria-hidden="true"></i><span>Logout</span><div class="clearfix"></div></a></li>
									</ul>
								</div>
							  </div>
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