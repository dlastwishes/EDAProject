<!DOCTYPE html>
<html>
	<head>
	  <title></title>
	  <meta charset="utf-8">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>


	</head>
	<style>
		.bg-green{
			background: #48773e;
		}
		a{
			color: white;
		}

		html, body {
			height: 100%;
			margin: 0;
			padding: 0;
		}
		#map {
			height: 100%;
			width: 100%;
			position: absolute;
			z-index: 9;
			margin: 0 auto;
		}

		.alert-button{
			position: absolute;
			z-index: 10;
			bottom: 2%;

		}

	</style>

	<script type="text/javascript">
		var map,infowindow,marker;
function initMap() { 
	var myOptions = {
	  zoom: 9,
	  center: new google.maps.LatLng(13.652383,100.493872),
	  panControl: false,
  	  zoomControl: false,
  	  mapTypeControl: false,
 	  scaleControl: false,
 	  streetViewControl: false,
 	  overviewMapControl: false,
	};

	 map = new google.maps.Map(document.getElementById('map_canvas'),
		myOptions);

	 marker = new  google.maps.Marker({
		map:map,
		position: new google.maps.LatLng(13.652383,100.493872),
		draggalbe:true
	});

	 infowindow = new google.maps.InfoWindow({
		map:map,

	});

	 if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function(position) {
        var pos = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };


     var myOptions = {
	  zoom: 9,
	  center: new google.maps.LatLng(position.coords.latitude,position.coords.longitude),
	  panControl: false,
  	  zoomControl: false,
  	  mapTypeControl: false,
 	  scaleControl: false,
 	  streetViewControl: false,
 	  overviewMapControl: false,
	};

	 map = new google.maps.Map(document.getElementById('map_canvas'),
		myOptions);

	 marker = new  google.maps.Marker({
		map:map,
		position: new google.maps.LatLng(position.coords.latitude,position.coords.longitude),
		draggalbe:true
	});

	 infowindow = new google.maps.InfoWindow({
		map:map,

	});

	 google.maps.event.addListener(map,'click',function(event){	
		infowindow.setContent("LatLng = " + event.latLng);
		infowindow.setPosition(event.latLng);
		infowindow.open(map,marker);
		marker.setPosition(event.latLng);
		$("#lat").val(event.latLng.lat());//valuable
	// window.alert("lat_lis : "+event.latLng.lat());
		$("#lng").val(event.latLng.lng());//valuable
	// window.alert("lng_lis : "+event.latLng.lng());
		geocodeLatLng(event.latLng.lat(), event.latLng.lng());

	});

        }, function() {
        handleLocationError(true, infoWindow, map.getCenter());
    window.alert("handle func true");
        });

      } else {
        // Browser doesn't support Geolocation
        handleLocationError(false, infoWindow, map.getCenter());
    window.alert("handle func true");
      }
		
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
        infoWindow.open(map);
      }


function geocodeLatLng(lat_lis, lng_lis) {
	// window.alert("geocode func");
		// var lat = $("#lat").val();//non-value
		// var lat = lata;
		var lat = lat_lis;
	// window.alert("#lat : "+ lat_lis);
		// var lng = $("#lng").val();//non-value
		// var lng = lnga;
		var lng = lng_lis;
	// window.alert("#lng : "+ lng_lis);
        var latlng = {lat: parseFloat(lat), lng: parseFloat(lng)};
    // window.alert("latlng : "+ latlng);
		var geocoder = new google.maps.Geocoder;
        geocoder.geocode({'location': latlng}, function(results, status) {//blank results

	// window.alert("geocoder : "+geocoder);
          if (status === 'OK') { //status = ZERO_RESULTS
            if (results[1]) {             
			  marker.setPosition(latlng);
			  var rs = results[1].formatted_address;
			  var tmp = rs.split(" ");
			  var tumbon_name = tmp[1];
			  var ampur_name = tmp[3];
			  var province_name = tmp[4];
			  var zip_code = tmp[5];

			// $("#FullName").val(rs);
			$("#tumbon_name").val(tumbon_name);
			$("#ampur_name").val(ampur_name);
			$("#province_name").val(province_name);
			$("#zip_code").val(zip_code);

              infowindow.setContent(results[1].formatted_address);
              infowindow.open(map, marker);
            } else {
              window.alert('No results found');
            }
          } else {
            window.alert('Geocoder failed due to: ' + status);
          }
        });
      }


	</script>

	<body>
	<!-- Nav tabs -->
	<div style="position: fixed; z-index: 12; margin: 0 auto; width: 100%" >
		<nav class="navbar navbar-expand-sm bg-green navbar-dark" style="z-index: 11;"> 
		  	<ul class="nav nav-tabs  " role="tablist">
			    <li class="nav-item">
			      <a class="nav-link active " data-toggle="tab" href="#home">Home</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link " data-toggle="tab" href="#alert">Alert</a>
			    </li>
			    <li class="nav-item">
			      <a class="nav-link " data-toggle="tab" href="#instruction">Instruction</a>
			    </li>
			<!-- Hamberger -->
			    <li>
		    		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
		    			<span class="navbar-toggler-icon"></span>
		  			</button>
		    	</li>
	    	</ul>

	<!-- Navbar links (Hamberger) -->
			 <div class="collapse navbar-collapse" id="collapsibleNavbar">
			    <ul class="navbar-nav">
			      	<li class="nav-item">
			        	<a class="nav-link" href="#">Link</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="#">Link</a>
			      	</li>
			      	<li class="nav-item">
			        	<a class="nav-link" href="#">Link</a>
			      	</li> 
			    </ul>
			</div> 
		</nav>
	</div>

	<!-- Tab panels -->
	  	<div class="tab-content container-fluid">
	<!-- Tab Home -->
	    	<div id="home" class="tab-pane active">

		<!-- Google map-->
	    		<div id="map" style="z-index: 10;">
	    			
	    		</div>
	    		<script>
	    			var map;
	    			function initMap() {
	    				map = new google.maps.Map(document.getElementById('map'), {
	    					center: {lat: 13.652383, lng: 100.493872}, 
	    					zoom: 9
	    				});
	    			}
	    		</script>
	    		<script type="text/javascript" src="jquery-3.2.1.min.js" ></script>
	    		<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBfgpIhXtMr0LUMBjKoJsd6eeUYxvEUiAg&callback=initMap&language=th"
type="text/javascript"></script>

		<!-- Alert -->
	       		<a href="detail.html">
	      			<div class="alert alert-secondary row container text-center alert-button" style="padding: 1px;">
	      				<div class="col-2" style="padding: 5px">
	      					<img src="alert-icon/flood.svg" class="rounded-circle" style="width:50px;">
	      				</div>
	      					
	      					<div class="col" style="padding: 5px">
	      						<p>
	      						น้ำทะเลเจ้าพระยาหนุนสูง</p>
	      						<p class="text-secondary" style="font-size: 12px; text-align: right; margin-bottom: 0px">
	      						20 ก.พ. 2561
	      						</p>
	      					
	      				</div>
	      				<div class="col-2" style="padding: 10px">
	      					<img src="icon/red-danger.svg" style="width:30px; ">
	      				</div>
	  				</div>
				</a>
	    	</div>

	<!-- Tab Alert -->
	    	<div id="alert" class="container tab-pane fade"><br>
	      		<h3>Alert</h3>
	      		<p>...</p>
	    	</div>

	<!-- Tab Instruction -->
	    	<div id="instruction" class="container tab-pane fade"><br>
	      		<h3>Instruction</h3>
	      		<p>...</p>
	    	</div>
		</div>
	</body>
</html>
