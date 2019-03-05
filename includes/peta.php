  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAL_3NhGIUmaXLbudR1lQLHUSLPi6_lzGI&sensor=false" type="text/javascript"></script>

 <div id="map" style="width: auto; height: 600px;"></div>

  <script type="text/javascript">
    var locations = [
   <?php

            	$sql_lokasi="select nama,longtitude,latitude,foto,alamat from tb_warga ";
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
        ['<?php echo $data->nama;?>', <?php echo $data->latitude;?>, <?php echo $data->longtitude;?>, <?php echo $content;?>],
       <?php
				}
		?>
		
    
    ];
	var latLng=new google.maps.LatLng(-7.815532,110.162667);
    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 11,
        scaleControl: true,
      center:latLng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;
    
    for (i = 0; i < locations.length; i++) {
	  marker = new google.maps.Marker({
        //position:latLng,
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
		map: map,
		draggable : true,
		animation: google.maps.Animation.DROP
      });
	
      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][3]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
	  </script>


