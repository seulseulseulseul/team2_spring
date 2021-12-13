<%@page import="com.itwill.domain.Trainer_MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.wrap {
	position: absolute;
	left: 0;
	bottom: 40px;
	width: 288px;
	height: 132px;
	margin-left: -144px;
	text-align: left;
	overflow: hidden;
	font-size: 12px;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	line-height: 1.5;
}

.wrap * {
	padding: 0;
	margin: 0;
}

.wrap .info {
	width: 286px;
	height: 120px;
	border-radius: 5px;
	border-bottom: 2px solid #ccc;
	border-right: 1px solid #ccc;
	overflow: hidden;
	background: #fff;
}

.wrap .info:nth-child(1) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.info .title {
	padding: 5px 0 0 10px;
	height: 30px;
	background: #eee;
	border-bottom: 1px solid #ddd;
	font-size: 18px;
	font-weight: bold;
}

.info .close {
	position: absolute;
	top: 10px;
	right: 10px;
	color: #888;
	width: 17px;
	height: 17px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
	cursor: pointer;
}

.info .body {
	position: relative;
	overflow: hidden;
}

.info .desc {
	position: relative;
	margin: 13px 0 0 90px;
	height: 75px;
}

.desc .ellipsis {
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.desc .jibun {
	font-size: 11px;
	color: #888;
	margin-top: -2px;
}

.info .img {
	position: absolute;
	top: 6px;
	left: 5px;
	width: 73px;
	height: 71px;
	border: 1px solid #ddd;
	color: #888;
	overflow: hidden;
}

.info:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: 0;
	width: 22px;
	height: 12px;
	background:
		url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
	color: #5085BB;
}
</style>
</head>
<body>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b649801a0c9d18b92d1ff5e831d22ebe&libraries=services"></script>
	<script type="text/javascript">

var positions = new Array();

$(document).ready(function(){
	$('#btn').click(function(){
		var placeSearch = $('#placeSearch').val();
		$('#trainer').html(placeSearch);

		$.getJSON('${pageContext.request.contextPath}/getAddress2',function(rdata){
// 			data:{"t_extraAddress":${t_dong}},
// 			success:function(rdata,){
				$.each(rdata,function(index,item){
// 					
// 		$('table').append('<tr><td>'+item.t_id+'</td><td>'+item.t_name+'</td><td>'+item.t_address+'</td></tr>');
										
					positions.push({
							"t_id": item.t_id,
							"t_name": item.t_name, 
							"t_address": item.t_address	
					});					
				});
			
			for(var i = 0; i < positions.length; i ++) {
				var data = positions[i];
			    displayMarker(data);
				}
				function displayMarker(data) {
					geocoder.addressSearch(data.t_address, function(result, status) {
						var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
						 // 마커 이미지의 이미지 크기 입니다
					    var imageSize = new kakao.maps.Size(24, 35); 
					    
					    // 마커 이미지를 생성합니다    
					    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
					    
				//	     // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
				
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				
				// //	         결과값으로 받은 위치를 마커로 표시합니다
				// 	        var marker = new kakao.maps.Marker({
				// 	            map: map,
				// 	            position: coords
				// 	        });
					
					     // 마커를 생성합니다
					        var marker = new kakao.maps.Marker({
					            map: map, // 마커를 표시할 지도
					            position: coords, // 마커를 표시할 위치
					            title : data.t_id, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
					            image : markerImage // 마커 이미지 
					        });
					     
					        var iwContent = '<div style="padding:5px;">'+data.t_name+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					        iwRemoveable = true;
					        
				//	         // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
							    content : iwContent,
							    removable : iwRemoveable
							});
					    	
						    //마커를 클릭했을 때 커스텀 오버레이를 표시합니다
// 						    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
//    						kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
   							kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));

//    							/marker click event/
   							
					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다	
   							
					    }
// 					     function makeOverListener(map, marker, infowindow) {
// 					    	    return function() {
// 					    	        infowindow.open(map, marker);
// 					    	    };
// 					    	}

					    	// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
// 					    	function makeOutListener(infowindow) {
// 					    	    return function() {
// 					    	        infowindow.close();
// 					    	    };
// 					    	}
					    	function makeClickListener(map, marker, infowindow) {
	   							return function() {
	   								infowindow.open(map, marker);
	   							};
	   						}
 						
					});//displayMarker
				geocoder.addressSearch(placeSearch, function(result, status) {
					     if (status === kakao.maps.services.Status.OK) {
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        map.setCenter(coords);
				    	} 
						});
				}
		});

	});
});
</script>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b649801a0c9d18b92d1ff5e831d22ebe&libraries=services"></script>


	<p id=trainer></p>
	<input type="button" value="검색" id="btn">
	<input type="text" id="placeSearch">
	<div id="map" style="width: 100%; height: 350px;"></div>

	<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();






</script>


</body>
</html>