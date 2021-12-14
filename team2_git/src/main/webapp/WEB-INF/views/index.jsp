<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <title>우리 동네 트레이너</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<style>
.customoverlay {position:relative;bottom:50px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;color:black;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #FFC200;background: #FFC200 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 15px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 13px;font-size:14px;font-weight:bold;color:#495057;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
</head>
  </head>
  <body>
  <script type="text/javascript"
		src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac8d5007893ea860bfc9b47b6f852222&libraries=services"></script>
  <script type="text/javascript">
  var positions = new Array();

  $(document).ready(function(){
  	$('#btn').click(function(){
  		var placeSearch = $('#placeSearch').val();
  		$('#trainer').html(placeSearch);

  		$.getJSON('${pageContext.request.contextPath}/getAddress2',function(rdata){
//   			data:{"t_extraAddress":${t_dong}},
//   			success:function(rdata,){
  				$.each(rdata,function(index,item){
//   					
//   		$('table').append('<tr><td>'+item.t_id+'</td><td>'+item.t_name+'</td><td>'+item.t_address+'</td></tr>');
  										
  					positions.push({
  							"t_id": item.t_id,
  							"t_name": item.t_name, 
  							"t_address": item.t_address,
//   							"t_rate": item.t_rate,
//   							"t_rateConunt": item.t_rateConunt
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
  					     
  					     	
  					     
  					        var iwContent = '<div class="customoverlay">' +
  					        '  <a href="${pageContext.request.contextPath}/trainer/about?t_id='+ data.t_id + '" >' +
  					        '    <span class="title">'+data.t_name+'</span>' +
  					        '  </a>' +
  					        '</div>';
//   					        '<div style="padding:5px;"><b>'+data.t_name+'&nbsp;&nbsp;&nbsp;</b>'
//   					        +'<a href="${pageContext.request.contextPath}/trainer/about?t_id='+ data.t_id + '" target="_blank" class="link">더보기</a><br>'
//   					        +data.t_address+'</div>', 
  					       	// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
//   					        ,iwRemoveable = true;
  					        var customOverlay = new kakao.maps.CustomOverlay({
  							    map: map,
  							    position: marker.getPosition(),
  							    content: iwContent,
  							    yAnchor: 1 
  							});
  				//	         // 인포윈도우로 장소에 대한 설명을 표시합니다
//   					        var infowindow = new kakao.maps.InfoWindow({
//   							    content : iwContent
  // // 							    ,removable : iwRemoveable
//   							});
  					    	
  						    //마커를 클릭했을 때 커스텀 오버레이를 표시합니다
//   						    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
//      							kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
     							kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow));

//      							/marker click event/
     							
  					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다	
     							
  					    }
//   					     function makeOverListener(map, marker, infowindow) {
//   					    	    return function() {
//   					    	        infowindow.open(map, marker);
//   					    	    };
//   					    	}

  // // 					    	인포윈도우를 닫는 클로저를 만드는 함수입니다 
//   					    	function makeOutListener(infowindow) {
//   					    	    return function() {
//   					    	        infowindow.close();
//   					    	    };
//   					    	}
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
  		<jsp:include page="inc/top.jsp"></jsp:include>
    <!-- END nav -->
    
 <section class="login first grey" data-stellar-background-ratio="0.5">
    <div class="container">				
						<div class="box-body"> 
						 <h3 class="mb-1">우리 동네 트레이너를 검색 해 보세요!</h3> 
							<input type="text" id="placeSearch" class="form-control" placeholder="&nbsp;주소를 입력해주세요 예) 부산 진구 동천로 93, 해운대구 해운대해변로 33" width="200px" > 
							<br><input type="button" value="우리 동네 트레이너 검색" id="btn" class="btn btn-primary">
    			<div><div id="map" style="width:90%;	height:500px;margin: 0px auto; margin-top:20px; margin-bottom:50px;"></div></div>
					   	 </div>
	 
			<hr>
			<div class="container">
			<h3 class="mb-1">&nbsp;</h3> 
				<h3 class="mb-1">득근 보장 트레이너 추천!</h3> <br><br>
				<div class="row">
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/images/trainer_9.jpg;"></div>
							<div class="text mt-4">
								<h3 class="mb-4">허니제이 트레이너</h3>
								<p class="mb-5">생활 습관을 바꾸는 일상 다이어트</p>
								<p><a href="${pageContext.request.contextPath}/trainer/about?t_id=trainer_9" class="btn btn-white px-4 py-3"> Learn more <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/images/trainer_10.jpg;"></div>
							<div class="text mt-4">
								<h3 class="mb-4">로빈 트레이너</h3>
								<p class="mb-5">운동처방재활학과 졸업. 7년차 트레이너</p>
								<p><a href="${pageContext.request.contextPath}/trainer/about?t_id=trainer_10" class="btn btn-white px-4 py-3"> Learn more <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/images/trainer_11.jpg;"></div>
							<div class="text mt-4">
								<h3 class="mb-4">노제 트레이너</h3>
								<p class="mb-5">소수 정예 회원 관리, 바디프로필 경력 다수</p>
								<p><a href="${pageContext.request.contextPath}/trainer/about?t_id=trainer_11" class="btn btn-white px-4 py-3"> Learn more <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/images/trainer_12.jpg;"></div>
							<div class="text mt-4">
								<h3 class="mb-4">케빈 트레이너</h3>
								<p class="mb-5">국제자격증 기반 체계적이고 전문적인 컨설팅</p>
								<p><a href="${pageContext.request.contextPath}/trainer/about?t_id=trainer_12" class="btn btn-white px-4 py-3"> Learn more <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- 		</section> -->



         
<!--           <section class="ftco-section bg-light"> -->
<!--           <section class="login first grey"> -->
			
    	</div>
    	</section>
<h3 class="mb-1">&nbsp;</h3> 
     <jsp:include page="inc/bottom.jsp"></jsp:include>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

<!-- 맵js -->
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(35.1567, 129.0569), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
</script>
<script src="${pageContext.request.contextPath}/resources/js/submitCheck.js"></script>

  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    
  </body>
</html>