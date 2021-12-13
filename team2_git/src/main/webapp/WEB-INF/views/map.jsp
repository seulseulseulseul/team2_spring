<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<div id="mapwrap" style="overflow:hidden;"><div id="map" style="position:relative; width: 100%; height: 350px;"><p class="btn-init" onclick="setBounds()" style="position: absolute;right: 7px;bottom: 7px;
color: #666666;z-index: 10;font-size: 12px;font-weight: bold;background: white;box-shadow: 1px 1px 1px 1px #AAAAAA;padding: 0px 7px;border-radius: 4px;cursor: pointer;">초기화면으로</p></div><div style="width: 100%;background-color: #CCCCCC;"><p style="text-align: right;margin-top: 0px;"><a href="https://juahnpop.tistory.com/255" target="_blank" style="color: #751278;font-size: 14px;font-weight: bold;padding-right: 8px;">👉 Get Custom KakaoMap Code -&gt; Click</a></p></div></div>


	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b649801a0c9d18b92d1ff5e831d22ebe&libraries=services"></script>
	<script>
function get(name){
	   if(name=(new RegExp('[?&]'+encodeURIComponent(name)+'=([^&]*)')).exec(location.search))
	      return decodeURIComponent(name[1]);
}
var t_dong = get('t_dong');
console.log(t_dong);
// map.jsp 페이지에서
// AJAX로 주소 받아올 때 t_id 함께 받아옴
// ajax 구현해야 가능한 기능

$(document).ready(function(){
// 	$('#btn').click(function(){
		$.ajax('${pageContext.request.contextPath}/getAddress',{
			data:{"t_extraAddress":t_dong},
			success:function(rdata){
				$.each(rdata,function(index,item){
					console.log(index +" : "+ item.t_id);
					console.log(index +" : "+ item.t_name);
					console.log(index +" : "+ item.t_address);
					console.log(index +" : "+ item.t_phone);
				});
			}
		});
// 	});
});


var inputData = ['${t_dong}']

var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
mapOption = { 
    center: new kakao.maps.LatLng(35.1584285771639, 129.0625107105665), // 지도의 중심좌표
    level: 4 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
var count = 0;

var ps = new kakao.maps.services.Places();
var bounds = new kakao.maps.LatLngBounds();
var mapTypeControl = new kakao.maps.MapTypeControl();
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
var imageSrc =
"https://tistory2.daumcdn.net/tistory/3056305/skin/images/map-marker-red.png",
imageSize = new kakao.maps.Size(35, 35),
imageOption = {
offset: new kakao.maps.Point(17, 40)
};
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
if (inputData != null) {
kewwordSearch(inputData[count]);
}
function kewwordSearch(keword) {
ps.keywordSearch(keword, placesSearchCB);
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

//마커를 표시할 위치와 title 객체 배열입니다 (db에서 데이터 받아오기)
var positions = [

	{	
		t_id:'trainer_1',
	    title: '케이시', 
	    addr: '부산광역시 부산진구 동천로 108',
	    sns: '',
	    latlng: new kakao.maps.LatLng(35.1584285771639, 129.0625107105665)
	},
	{
		t_id:'trainer_2',
	    title: '제이슨', 
	    addr: '부산광역시 부산진구 전포동 서전로58번길 22',
	    sns: '',
	    latlng: new kakao.maps.LatLng(35.156901740197576, 129.06610355894085)
	},
	{
		t_id:'trainer_3',
	    title: '벤토리', 
	    addr: '부산광역시 부산진구 서면로74',
	    sns: '',
	    latlng: new kakao.maps.LatLng(35.15712748335726, 129.05815592509134)
	},
	{
		t_id:'trainer_4',
	    title: '아지스', 
	    addr: '부산광역시 부산진구 전포대로 250',
	    sns: '',
	    latlng: new kakao.maps.LatLng(35.1593325667776, 129.06581691426743)
	},
	{
		t_id:'trainer_5',
	    title: '크리스탈', 
	    addr: '부산광역시 해운대구 APEC로 58',
	    sns: '',
	    latlng: new kakao.maps.LatLng(35.16744146784642, 129.13708241811898)
	},
	{
		t_id:'trainer_6',
	    title: '햄말론', 
	    addr: '부산광역시 해운대구 해운대로469번길 96',
	    sns: '',
	    latlng: new kakao.maps.LatLng(35.16768704221481, 129.14519341772683)
	},
	{
		t_id:'trainer_7',
	    title: '몬스터', 
	    addr: '부산광역시 해운대구 센텀4로 15',
	    sns: '',
	    latlng: new kakao.maps.LatLng(35.170704038216186, 129.12828477304168)
	},
	{
		t_id:'trainer_8',
	    title: '요도리', 
	    addr: '부산광역시 해운대구 우동 해운대해변로 140',
	    sns: '',
	    latlng: new kakao.maps.LatLng(35.158916069357325, 129.14605172456365)
	}
];


	
	for (var i = 0; i < positions.length; i ++) {
		var data = positions[i];
	    displayMarker(data);
	    
	}
	
	  function makeClickListener(map, marker, overlay) {

          return function() {

          overlay.setMap(null);

        };

  }
	
//지도에 마커를 생성하는 함수
function displayMarker(data) {
    var marker = new kakao.maps.Marker({
        map: map, // 마커를 표시할 지도
        position: data.latlng, // 마커를 표시할 위치
        image : markerImage // 마커 이미지
    });
    
  	//커스텀 오버레이에 표시할 컨텐츠
//     var content = '<div class="wrap">' + 
//     '    <div class="info">' + 
//     '        <div class="title">' + 
//                 data.title + 
//     '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
//     '        </div>' + 
//     '        <div class="body">' + 
//     '            <div class="img">' +
//     '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
//     '           </div>' + 
//     '            <div class="desc">' + 
//     '                <div class="ellipsis">'+ data.addr +'</div>' + 
//     '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
//     '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">SNS</a></div>' + 
//     '            </div>' + 
//     '        </div>' + 
//     '    </div>' +    
//     '</div>';
    
    //마커 위에 커스텀오버레이를 표시
    
      var content = document.createElement('div');
      content.innerHTML =  '<div class="wrap">' + 
      '    <div class="info">' + 
      '        <div class="title">' + 
                  data.title + 
//       '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
      '        </div>' + 
      '        <div class="body">' + 
      '            <div class="img">' +
      '                <img src="https://pbs.twimg.com/media/E8pZ-aoVgAAKtAN?format=jpg&name=large" width="73" height="70">' +
      '           </div>' + 
      '            <div class="desc">' + 
      '                <div class="ellipsis">'+ data.addr +'</div>' + 
      '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
      '                <div> <a href="${pageContext.request.contextPath}/trainer/about?t_id='+ data.t_id + '" target="_blank" class="link">프로필</a></div>' + 
      '            </div>' + 
      '        </div>' + 
      '    </div>' +    
      '</div>';;
      
//     var overlay = new kakao.maps.CustomOverlay({
//     	content: content,
// 	  	map: map,
// 	  	position: marker.getPosition()
//     });
    
//     var closeBtn = document.createElement('button');
//     closeBtn.innerHTML = '닫기';
//     closeBtn.onclick = function () {
//         overlay.setMap(null);
//     };
// 	    content.appendChild(closeBtn);
// 	    overlay.setContent(content);
	  	
// 	//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
// 	kakao.maps.event.addListener(marker, 'click', function() {
// 		overlay.setMap(map);
// 	});
	
// 	function closeOverlay() {
// 	    overlay.setMap(null);     
// 	}

	var customOverlay = new kakao.maps.CustomOverlay({
	map: map,
	position: new kakao.maps.LatLng(place.y, place.x),
	content: content,
	yAnchor: 0.11
	});
	}


}

	function setBounds() {
	map.setBounds(bounds, 90, 30, 10, 30);
	}

// //커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
// kakao.maps.event.addListener(marker, 'mouseout', function() {
//    // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
// 	overlay.setMap(null);
// });
// 	}





</script>
</body>
</html>