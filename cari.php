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
                <li class="breadcrumb-item"><a href="./">Home</a><i class="fa fa-angle-right"></i>Pencarian</li>
            </ol>
		<!--grid-->
 	<div class="grid-form">
 		<div class="grid-form1">
 		<h2 id="forms-example" class="">Pencarian</h2>
 		<form action="" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Dusun</label>
    <select name="dus" class="form-control">
	<?=combo_dus($_POST['dus'])?>
	</select>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Disabilitas</label>
    <select name="dis" class="form-control">
	<?=combo_dis($_POST['dis'])?>
	</select>
  </div>
  
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
</div>


 	</div>
 	<!--//grid-->

<div class="agile-grids">	
				<!-- tables -->
				
			<!--	<div class="agile-tables">
					<div class="w3l-table-info"> -->
						<div class="grid-form">
 		<div class="grid-form1">
					  <h2>Data Penyandang Disabilitas</h2>
					    <table id="table">
						<thead>
						  <tr>
							<th>No</th>
							<th>No KK</th>
							<th>Nama</th>
							<th>Umur</th>
							<th>Jenis Kelamin</th>
							<th>Disabilitas</th>
							<th>Alat Bantu</th>
							<th>Dusun</th>
							<th>Aksi</th>
						  </tr>
						</thead>
						<tbody>
                        <?php
						$list = "select * from tb_warga where id_warga not in('')";
						if(!empty($_POST['dus'])){
						$list="".$list." and dusun='$_POST[dus]'";
						}
						if(!empty($_POST['dis'])){
						$list="".$list." and disabilitas='$_POST[dis]'";
						}
						$list="".$list." order by no_kk asc";
						$list=mysql_query($list);
						if (mysql_num_rows($list) > 0) {
						$no=1;
						while($row = mysql_fetch_array($list)){ ?>
						  <tr>
							<td><?=$no?></td>
							<?php
            echo "<td nowrap><a href=\"#\" onclick=\"MM_openBrWindow('view2.php?id=$row[id_warga]','','scrollbars=yes,resizable=yes,width=800,height=760')\">$row[no_kk]</a></td>";
							?>
							<td><?=$row['nama']?></td>
							<td><?=$row['umur']?></td>
							<td><?=$row['jeniskelamin']?></td>
							<td><?=$row['disabilitas']?></td>
							<td><?=$row['alatbantu']?></td>
							<td><?=$row['dusun']?></td>
							<td><a href="edit.php?id=<?=$row['id_warga']?>">Edit</a></td>
						  </tr>
						<?php 
						$no++;
						} 
						
									} else { 
								?>
                                <tr>
									<td colspan="8">Data tidak ditemukan</td>
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

</body>
</html>