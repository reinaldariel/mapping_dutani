<?php
//error_reporting(0);
session_start();
include "includes/config.php";
$id=$_GET['id'];
?>
<!DOCTYPE HTML>
<html>
<head>
<title>Detail Lahan</title>
<link href="style.css" rel="stylesheet" type="text/css" />
 <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAL_3NhGIUmaXLbudR1lQLHUSLPi6_lzGI&sensor=false" type="text/javascript"></script>
</head>
<body>



<?php

	  
		echo "<div id=\"$id\" class=\"full\">";
		echo "<fieldset>\n";
		echo "	<table width=\"10%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\" id=\"Over1\">\n";
		echo "	  <tr align='left'><td>"; ?>
 <div id="map" style="width: 470px; height: 250px;"></div>

  <script type="text/javascript">
    var locations = [
   <?php

            	$sql_lokasi="select nama,longtitude,latitude,foto,alamat from tb_warga where id_warga='$id'";
            	$result=query($sql_lokasi);
            	while($data=mysql_fetch_object($result)){
            	$content="'<div id=\"content\">'+
				'<div id=\"siteNotice\">'+
				'</div>'+
				'<h4 id=\"firstHeading\" class=\"firstHeading\">$data->nama</h4>'+
				'<div id=\"bodyContent\"><p>'+
				'<img width=200 src=\"$data->foto\" ' +
				'<ul>'+


				'<li> $data->alamat' +
				'</ul></div></div>'"; ?>
        ['<?php echo $data->nama;?>', <?php echo $data->latitude;?>, <?php echo $data->longtitude;?>],
       <?php
				}
		?>
		
    
    ];
	var latLng=new google.maps.LatLng(locations[0][1], locations[0][2]);
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 15,
        scaleControl: true,
      center:latLng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;
	var content=<?php echo $content?>;
    
    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position:new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map,
		animation: google.maps.Animation.DROP
      });
	
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(content);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
  </script>
		<?php
		echo "</td>";
		echo "	  <td>";
		echo "<img src=".kol_warga("foto",$id)." width='250' height='250'>"; echo"</td></tr>\n";
		echo "	</table>\n";		
		echo "</fieldset>\n";
		echo "<br />\n";
		echo "<fieldset><legend>In+formasi Warga</legend>\n";
		echo "    <table width=\"100%\" border=\"0\" cellpadding=\"3\" cellspacing=\"0\" id=\"Over2\">\n";
		echo "      <tbody>\n";
		echo "	  <tr>\n";
		echo "        <td width=\"25\">1</td><td width=\"250\">No KK</td>\n";
		echo "        <td width=\"5\">:</td><td><span>".kol_warga("no_kk",$id)."</span> </td>\n";
		echo "      </tr>\n";
		echo "      <tr>\n";
		echo "        <td>2</td><td>Nama</td><td>:</td>\n";
		echo "        <td><span>".kol_warga("nama",$id)."</span></td>\n";
		echo "      </tr>\n";
		echo "      <tr>\n";
		echo "        <td>3</td><td>Umur</td><td>:</td>\n";
		echo "        <td><span>".kol_warga("umur",$id)."</span></td>\n";
		echo "      </tr>\n";
		echo "      <tr>\n";
		echo "        <td>4</td><td>Jenis Kelamin </td><td>:</td>\n";
		echo "        <td><span>".kol_warga("jeniskelamin",$id)."</span></td>\n";
		echo "      </tr>\n";
		echo "      <tr>\n";
		echo "        <td>5</td><td>Disabilitas </td><td>:</td>\n";
		echo "        <td><span>".kol_warga("disabilitas",$id)."</span></td>\n";
		echo "      </tr>\n";
		echo "      <tr>\n";
		echo "        <td>6</td><td>Alat Bantu </td><td>:</td>\n";
		echo "        <td><span>".kol_warga("alatbantu",$id)."</span></td>\n";
		echo "      </tr>\n";
		echo "      <tr>\n";
		echo "        <td>7</td><td>Dusun</td><td>:</td>\n";
		echo "        <td><span>".kol_warga("dusun",$id)."</span></td>\n";
		echo "      </tr>\n";
		echo "      <tr>\n";
		echo "        <td>8</td><td>Alamat</td><td>:</td>\n";
		echo "        <td><span>".kol_warga("alamat",$id)."</span></td>\n";
		echo "      </tr>\n";
		echo "	  </tbody>\n";
		echo "    </table>\n";
		echo "</fieldset>\n";
		echo "<br />\n";

		echo "<fieldset><legend>Kebutuhan</legend>\n";
		echo "    <table width=\"100%\" border=\"0\" cellpadding=\"4\" cellspacing=\"0\" id=\"Over2\">\n";
		echo "      <tbody>\n";
		echo "      <tr align='left'><th>No</th><th>Jenis</th><th>Status</th><th>Penanggungjawab</th><th>Waktu</th></tr>\n";
		$nc=1;
		
		$sql=mysql_query("select * from tb_keb where id_warga='$id'");
		while($rc=mysql_fetch_array($sql)){
		echo "	  <tr>\n";
		echo "        <td>$nc</td><td>$rc[jenis]</td><td>$rc[status]</td><td>$rc[penanggung]</td><td>$rc[waktu]</td>\n";
		echo "      </tr>\n";
		$nc++;
		}
		echo "	  </tbody>\n";
		echo "    </table>\n";
		echo "</fieldset>\n";
		echo "<br />\n";
		///////////////////////


	echo '<p align="center">';
	echo "<a href=\"#\" onclick=\"javascript:self.close();\">Close</a>&nbsp;&nbsp;&nbsp;\n";
	echo "<a href=\"#\" onclick=\"javascript:print(document);\">Print</a>\n";
	echo '</p>';
	echo "</div>";
?>
</body>
</html>
