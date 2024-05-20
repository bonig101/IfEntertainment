<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.story-postbox .row {
    margin: 40px 0;
}

.entertainment_title, .entertainment_address, .entertainment_phone {
	font-size: 20px;
	font-weight: bold;
}

</style>

</head>
<body>
	<h3 style="margin-bottom:20px;">🏙️ 찾아오시는 길</h3>
	<hr>
	<div class="story-postbox">
		<div class="row entertainment_visit_detail">
			<div class="entertainment_title">
				<span>🏢 IF ENTERTAINMENT</span>
			</div>
			<div class="entertainment_address">
				<span>🗺️ 대전광역시 중구 계룡로 846</span>
			</div>
			<div class="entertainment_phone">
				<span>📞 042-222-8201</span>
			</div>
		</div>
		<div id="map" style="width: 100%; height: 500px; margin-top: 30px;"></div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=87fd4e91b572fad8ecce4bd918ae0e52"></script>
	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(36.325015, 127.408895), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption);

		// 마커가 표시될 위치입니다 
		var markerPosition = new kakao.maps.LatLng(36.325015, 127.408895);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var iwContent = '<div class="gm-style-iw gm-style-iw-c" style="margin-left:6px; margin-top:2px; padding:6px; text-align:center; font-weight:bold; font-size:11px;">IF ENTERTAINMENT <br><a href="https://map.kakao.com/link/map/Hello World!,36.325015, 127.408895" style="color: #9551fc; text-decoration: none;" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,36.325015, 127.408895" style="color: #9551fc; text-decoration: none;" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
		iwPosition = new kakao.maps.LatLng(36.325015, 127.408895); //인포윈도우 표시 위치입니다

		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			position : iwPosition,
			content : iwContent
		});

		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		infowindow.open(map, marker);
	</script>
</body>
</html>