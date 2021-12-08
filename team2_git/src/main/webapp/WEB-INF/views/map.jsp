<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1250efa15a77b9db6cfd3fe6ffebabae"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1250efa15a77b9db6cfd3fe6ffebabae&libraries=LIBRARY"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1250efa15a77b9db6cfd3fe6ffebabae&libraries=services,clusterer,drawing"></script>
</head>
<body>
<div id="map3" style="width:100%;height:350px;"></div>
				<script>
				// 마커추가지도
				var mapContainer3 = document.getElementById('map3'), // 지도를 표시할 div
				mapOption3 = {
				center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level: 3 // 지도의 확대 레벨
				};
				var map3 = new kakao.maps.Map(mapContainer3, mapOption3); // 지도를 생성합니다
				// 마커가 표시될 위치입니다
				var position = [
				new kakao.maps.LatLng(33.450705, 126.570677),
				new kakao.maps.LatLng(33.450936, 126.569477),
				new kakao.maps.LatLng(33.450879, 126.569940),
				new kakao.maps.LatLng(33.451393, 126.570738)
				];
				for (var i = 0; i < position.length; i++) {
				var marker = new kakao.maps.Marker({
				map: map3,
				position: position[i]
				});
				marker.setMap(map3);
				
				}
				</script>

</body>
</html>