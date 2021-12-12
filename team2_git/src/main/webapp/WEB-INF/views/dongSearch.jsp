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
<script type="text/javascript">
$(document).ready(function(){
	// 공백 확인
	$('#btn').click(function(){
		if($('#t_dong').val().trim()==""){
			alert('동을 입력하세요');
			$('#t_dong').focus();
			return false;
		} else {
			
		}
	});
}
</script>
<form action="${pageContext.request.contextPath}/map" method="get">
	<input type="text" name="t_dong" id="t_dong">
	<input type="submit" value="검색" id="btn">
</form>
</body>
</html>