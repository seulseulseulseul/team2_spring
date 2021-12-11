<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
// jQuery로 트레이너주소 받아오기(JSON);



$(document).ready(function(){
	$('#btn').click(function(){
		$.ajax({
			type: 'get',   //get방식으로 명시
			url : '${pageContext.request.contextPath}/addConverter',  //이동할 주소
			data : $('#t_dong').val(),   //검색어
			dataType:'text',   //문자형식으로 받기
			success: function(data){   //데이터 주고받기 성공했을 경우
				$.getJSON('${pageContext.request.contextPath}/dongSearch',function(rdata){
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					
					// 결과를 저장할 JSON 객체 생성
					
					$.each(rdata,function(index,item){
						var t_address = item.t_address;
						// 주소로 좌표를 검색합니다
						var coords = "";
						geocoder.addressSearch(t_address, function(result, status) {
						    // 정상적으로 검색이 완료됐으면 
						     if (status === kakao.maps.services.Status.OK) {
						        coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						        console.log(coords);
	
						    }
						});
						
					});
					
					// coords 결과 -JSON-> 다음페이지 전달
					
				});
			},
			error:function(){   //데이터 주고받기가 실패했을 경우
				alert('동을 정확하게 입력');
			
			}
		});
	});
});

// 주소 -> 좌표 변환


</script>
		<input type="text" name="t_dong" id="t_dong">
		<button type="button" id="btn">검색</button>
</body>
</html>