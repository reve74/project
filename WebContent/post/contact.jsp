<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<!-- Website template by freewebsitetemplates.com -->
<html>
<head>
	<meta charset="UTF-8">
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyCKxjWqs0sZuIvyP6XW918r7l2iLIb2t04" ></script>
<style>
#map_ma {width:100%; height:400px; clear:both; border:solid 1px blue;}
</style>	
	
	
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="../css/login.css" rel="stylesheet" type="text/css">
	<link href="../css/bootstrap.css" rel="stylesheet" type="text/css">
</head>
<body>
		<!-- 헤더 -->
		<jsp:include page="../inc/top.jsp"></jsp:include>
		<!-- 헤더 -->
		<div id="body" class="contact">
			<div class="header">
				<div>
					<h1>LOCATION</h1>
				</div>
			</div>
			<div class="body">
				<div>
					<div>
						<img src="../images/check-in.png" alt="">
						<h1>찾아오시는 길</h1>
						<p>	</p>
					</div>
				</div>
			</div>
			<div class="footer">
		
			<div id="map_ma"></div>
			<script type="text/javascript">
					$(document).ready(function() {
						var myLatlng = new google.maps.LatLng(33.464464,126.320539); // 위치값 위도 경도
				var Y_point			= 33.464464;		// Y 좌표
				var X_point			= 126.320539;		// X 좌표
				var zoomLevel		= 18;				// 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼
				var markerTitle		= "제주특별자치도 제주시 애월읍 애월리 애월로";		// 현재 위치 마커에 마우스를 오버을때 나타나는 정보
				var markerMaxWidth	= 100;				// 마커를 클릭했을때 나타나는 말풍선의 최대 크기
			
			// 말풍선 내용
				var contentString	= '<div>' +
				'<h2>제주특별자치도 제주시 애월읍 애월리 애월로 124</h2>'+
				'<p>안녕하세요. 구글지도입니다.</p>' +
				
				'</div>';
				var myLatlng = new google.maps.LatLng(Y_point, X_point);
				var mapOptions = {
									zoom: zoomLevel,
									center: myLatlng,
									mapTypeId: google.maps.MapTypeId.ROADMAP
								}
				var map = new google.maps.Map(document.getElementById('map_ma'), mapOptions);
				var marker = new google.maps.Marker({
														position: myLatlng,
														map: map,
														title: markerTitle
				});
				var infowindow = new google.maps.InfoWindow(
															{
																content: contentString,
																maxWizzzdth: markerMaxWidth
															}
						);
				google.maps.event.addListener(marker, 'click', function() {
					infowindow.open(map, marker);
				});
			});
					</script>


			</div>
		</div>
		<!--푸터 -->
		<jsp:include page="../inc/bottom.jsp"></jsp:include>
		<!--푸터 -->
	
</body>
</html>
