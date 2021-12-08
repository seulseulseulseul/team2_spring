<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>INDEX</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/aos.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1250efa15a77b9db6cfd3fe6ffebabae"></script>

<script type="text/javascript">

//function searchPlaces() {
//	  $.ajax({
//        url:'https://dapi.kakao.com/v2/local/search/address.json?query='+encodeURIComponent('전북 삼성동 100'),
//        type:'GET',
//        headers: {'Authorization' : '1250efa15a77b9db6cfd3fe6ffebabae'},
//success:function(data){
//    console.log(data);
//},
//error : function(e){
//    console.log(e);
//}
//});
//}
</script>
</head>
<body>
	<jsp:include page="inc/top.jsp"></jsp:include>
	<!-- END nav -->


		<section class="ftco-section">
			<div class="container">

<!-- <div id="map" style="width:100%;height:350px;"></div> -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1250efa15a77b9db6cfd3fe6ffebabae&libraries=services,clusterer"></script>

<div id="mapwrap" style="overflow:hidden;"><div id="map" style="position:relative; width: 100%; height: 350px;"></div>
	
	<script>
	var inputData = ['부산역'] // *********여기 우리 데이터 불러오는 방법...
	var mapContainer = document.getElementById('map'),
	mapOption = {
	center: new kakao.maps.LatLng(35.114566906806054, 129.03923989719564),
	level: 3
	};
	var map = new kakao.maps.Map(mapContainer, mapOption);
	var count = 0;
	var ps = new kakao.maps.services.Places();
	var bounds = new kakao.maps.LatLngBounds();
	var mapTypeControl = new kakao.maps.MapTypeControl();
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	
	 var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
     imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
     imgOptions =  {
         spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
         spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
         offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
     },
     markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
         marker = new kakao.maps.Marker({
         position: position, // 마커의 위치
         image: markerImage 
     });
	function kewwordSearch(keword) {
	ps.kewwordSearch(keword, placesSearchCB);
	count = count + 1;
	}
	function placesSearchCB(data, status, pagination) {
	if (status === kakao.maps.services.Status.OK) {
	displayMarker(data[0]);
	bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
	if (count < inputData.length) {
	kewwordSearch(inputData[count])
	} else if (count == inputData.length) {
	setBounds();
	applyStyle();
	}
	}
	}
	function displayMarker(place) {
	var marker = new kakao.maps.Marker({
	map: map,
	position: new kakao.maps.LatLng(place.y, place.x),
	image: markerImage
	});
	kakao.maps.event.addListener(marker, 'click', function () {
	var position = this.getPosition();
	var url = 'https://map.kakao.com/link/map/' + place.id;
	window.open(url, '_blank');
	});
	var content =
	'<div class="customoverlay" style="position: relative;bottom: 76px;border-radius: 6px;border: 1px solid #ccc;border-bottom: 2px solid #ddd;float: left;">' +
	' <a href="https://map.kakao.com/link/map/' + place.id + '"' +
	' target="_blank" style="display: block;text-decoration: none;color: #666666;text-align: center;border-radius: 6px;font-size: 14px;font-weight: bold;overflow: hidden;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;">' +
	' <span class="title" style="display: block;text-align: center;background: #fff;margin-right: 35px;padding: 8px 10px;font-size: 13px;font-weight: bold;">' +
	count + '. ' + place.place_name + '</span>' +
	' </a>' +
	'</div>';
	var customOverlay = new kakao.maps.CustomOverlay({
	map: map,
	position: new kakao.maps.LatLng(place.y, place.x),
	content: content,
	yAnchor: 0.11
	});
	}
	function setBounds() {
	map.setBounds(bounds, 90, 30, 10, 30);
	}
	</script>


<script>
// var MARKER_WIDTH = 33, // 기본, 클릭 마커의 너비
//     MARKER_HEIGHT = 36, // 기본, 클릭 마커의 높이
//     OFFSET_X = 12, // 기본, 클릭 마커의 기준 X좌표
//     OFFSET_Y = MARKER_HEIGHT, // 기본, 클릭 마커의 기준 Y좌표
//     OVER_MARKER_WIDTH = 40, // 오버 마커의 너비
//     OVER_MARKER_HEIGHT = 42, // 오버 마커의 높이
//     OVER_OFFSET_X = 13, // 오버 마커의 기준 X좌표
//     OVER_OFFSET_Y = OVER_MARKER_HEIGHT, // 오버 마커의 기준 Y좌표
//     SPRITE_MARKER_URL = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markers_sprites2.png', // 스프라이트 마커 이미지 URL
//     SPRITE_WIDTH = 126, // 스프라이트 이미지 너비
//     SPRITE_HEIGHT = 146, // 스프라이트 이미지 높이
//     SPRITE_GAP = 10; // 스프라이트 이미지에서 마커간 간격

// var markerSize = new kakao.maps.Size(MARKER_WIDTH, MARKER_HEIGHT), // 기본, 클릭 마커의 크기
//     markerOffset = new kakao.maps.Point(OFFSET_X, OFFSET_Y), // 기본, 클릭 마커의 기준좌표
//     overMarkerSize = new kakao.maps.Size(OVER_MARKER_WIDTH, OVER_MARKER_HEIGHT), // 오버 마커의 크기
//     overMarkerOffset = new kakao.maps.Point(OVER_OFFSET_X, OVER_OFFSET_Y), // 오버 마커의 기준 좌표
//     spriteImageSize = new kakao.maps.Size(SPRITE_WIDTH, SPRITE_HEIGHT); // 스프라이트 이미지의 크기

// var positions = [  // 마커의 위치
//         new kakao.maps.LatLng(33.44975, 126.56967),
//         new kakao.maps.LatLng(33.450579, 126.56956),
//         new kakao.maps.LatLng(33.4506468, 126.5707)
//     ],
//     selectedMarker = null; // 클릭한 마커를 담을 변수

// var mapContainer = document.getElementById('map'), // 지도를 표시할 div
//     mapOption = { 
//         center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
//         level: 3 // 지도의 확대 레벨
//     };

// var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// // 지도 위에 마커를 표시합니다
// for (var i = 0, len = positions.length; i < len; i++) {
//     var gapX = (MARKER_WIDTH + SPRITE_GAP), // 스프라이트 이미지에서 마커로 사용할 이미지 X좌표 간격 값
//         originY = (MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 기본, 클릭 마커로 사용할 Y좌표 값
//         overOriginY = (OVER_MARKER_HEIGHT + SPRITE_GAP) * i, // 스프라이트 이미지에서 오버 마커로 사용할 Y좌표 값
//         normalOrigin = new kakao.maps.Point(0, originY), // 스프라이트 이미지에서 기본 마커로 사용할 영역의 좌상단 좌표
//         clickOrigin = new kakao.maps.Point(gapX, originY), // 스프라이트 이미지에서 마우스오버 마커로 사용할 영역의 좌상단 좌표
//         overOrigin = new kakao.maps.Point(gapX * 2, overOriginY); // 스프라이트 이미지에서 클릭 마커로 사용할 영역의 좌상단 좌표
        
//     // 마커를 생성하고 지도위에 표시합니다
//     addMarker(positions[i], normalOrigin, overOrigin, clickOrigin);
// }

// // 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
// function addMarker(position, normalOrigin, overOrigin, clickOrigin) {

//     // 기본 마커이미지, 오버 마커이미지, 클릭 마커이미지를 생성합니다
//     var normalImage = createMarkerImage(markerSize, markerOffset, normalOrigin),
//         overImage = createMarkerImage(overMarkerSize, overMarkerOffset, overOrigin),
//         clickImage = createMarkerImage(markerSize, markerOffset, clickOrigin);
    
//     // 마커를 생성하고 이미지는 기본 마커 이미지를 사용합니다
//     var marker = new kakao.maps.Marker({
//         map: map,
//         position: position,
//         image: normalImage
//     });

//     // 마커 객체에 마커아이디와 마커의 기본 이미지를 추가합니다
//     marker.normalImage = normalImage;

//     // 마커에 mouseover 이벤트를 등록합니다
//     kakao.maps.event.addListener(marker, 'mouseover', function() {

//         // 클릭된 마커가 없고, mouseover된 마커가 클릭된 마커가 아니면
//         // 마커의 이미지를 오버 이미지로 변경합니다
//         if (!selectedMarker || selectedMarker !== marker) {
//             marker.setImage(overImage);
//         }
//     });

//     // 마커에 mouseout 이벤트를 등록합니다
//     kakao.maps.event.addListener(marker, 'mouseout', function() {

//         // 클릭된 마커가 없고, mouseout된 마커가 클릭된 마커가 아니면
//         // 마커의 이미지를 기본 이미지로 변경합니다
//         if (!selectedMarker || selectedMarker !== marker) {
//             marker.setImage(normalImage);
//         }
//     });

//     // 마커에 click 이벤트를 등록합니다
//     kakao.maps.event.addListener(marker, 'click', function() {

//         // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
//         // 마커의 이미지를 클릭 이미지로 변경합니다
//         if (!selectedMarker || selectedMarker !== marker) {

//             // 클릭된 마커 객체가 null이 아니면
//             // 클릭된 마커의 이미지를 기본 이미지로 변경하고
//             !!selectedMarker && selectedMarker.setImage(selectedMarker.normalImage);

//             // 현재 클릭된 마커의 이미지는 클릭 이미지로 변경합니다
//             marker.setImage(clickImage);
//         }

//         // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
//         selectedMarker = marker;
//     });
// }

// // MakrerImage 객체를 생성하여 반환하는 함수입니다
// function createMarkerImage(markerSize, offset, spriteOrigin) {
//     var markerImage = new kakao.maps.MarkerImage(
//         SPRITE_MARKER_URL, // 스프라이트 마커 이미지 URL
//         markerSize, // 마커의 크기
//         {
//             offset: offset, // 마커 이미지에서의 기준 좌표
//             spriteOrigin: spriteOrigin, // 스트라이프 이미지 중 사용할 영역의 좌상단 좌표
//             spriteSize: spriteImageSize // 스프라이트 이미지의 크기
//         }
//     );
    
//     return markerImage;
// }
</script>
			
			
			</div>
		</section>

		<!-- loader -->
		<div id="ftco-loader" class="show fullscreen">
			<svg class="circular" width="48px" height="48px">
				<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke="#eeeeee" />
				<circle class="path" cx="24" cy="24" r="22" fill="none"
					stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
		</div>


		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/jquery.timepicker.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
		<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
		<%--   <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script> --%>
		<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>