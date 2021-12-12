<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b649801a0c9d18b92d1ff5e831d22ebe&libraries=services"></script>
<script>
// jQuery로 트레이너주소 받아오기(JSON);
$(document).ready(function(){
	// 공백 확인
	$('#btn').click(function(){
		if($('#t_dong').val().trim()==""){
			alert('동을 입력하세요');
			$('#t_dong').focus();
			return false;
		};
		
		$(document).ready(function(){
			$('#btn').click(function(){
				$.ajax('${pageContext.request.contextPath}/getAddress',{
					data:[{t_extraAddress:$('#t_dong').val()}],
					success:function(rdata){
						if(rdata=='iddup'){
							rdata="아이디 중복";
						}else{
							rdata="아이디 사용가능";
						}
						$("#div").html(rdata);
					}
				});
			});
		});
		
		
		
		
		
// 		$.ajax('${pageContext.request.contextPath}/getAddress',{
// 			data: {t_extraAddress:$('#t_dong').val()},   //서버쪽으로 전달할 데이터
// 			dataType: 'json',   //JSON형식으로 받기
// 			success: function(rdata){   //데이터 송신했을 경우
// 				$.getJSON(rdata,function(rdata){
// 					$.each(rdata,function(index,item){
// 						console.log(index +" : "+ item.t_id);
// 						console.log(index +" : "+ item.t_name);
// 						console.log(index +" : "+ item.t_address);
// 						console.log(index +" : "+ item.t_phone);
// 						$('div').text('<p>'+item.t_id+'</p><p>'+item.t_name+'</p><p>'+item.t_address+'</p><p>'+item.t_phone+'</p>');
// 					}); // $.each
// 				});
// 				// 주소-좌표 변환 객체를 생성합니다
// 				var geocoder = new kakao.maps.services.Geocoder();
// 					// 주소로 좌표를 검색합니다
// 					geocoder.addressSearch('대구 남구 큰골길 2', function(result, status) {
// 						// 정상적으로 검색이 완료됐으면 
// 						if (status === kakao.maps.services.Status.OK) {

// 							var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
// 							console.log(coords);

// 					    } // if(status)
// 					}); // function(result, status)
				
					
// 			},
// 			error:function(){   //데이터 송신에 실패했을 경우
// 				alert('해당 동에 등록된 트레이너가 없습니다.');
			
// 			}
// 		});
	});
});

// 				$.getJSON('${pageContext.request.contextPath}/getAddress',function(rdata){ });
// 주소 -> 좌표 변환


</script>
		<input type="text" name="t_dong" id="t_dong">
		<button type="button" id="btn">검색</button>
		<div id="div"></div>
</body>
</html>