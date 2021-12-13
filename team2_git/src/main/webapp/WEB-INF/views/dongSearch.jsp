<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/map" method="get" onsubmit="return submitCheck(this);">
	<input type="text" name="t_dong" id="t_dong">
	<input type="submit" value="검색" id="btn">
</form>
<script type="text/javascript">

	function submitCheck(myForm) {
		//이름을 2-5자 사이로 한글로 입력했는지 판단하는 정규표현식(규칙)
		var reg1 = /^[가-힣]{2,5}$/;
		var value = myForm.t_dong.value;
		var result = reg1.test(value);
		console.log(result);
		if( !result ) {
			alert("잘못된 동이름입니다.");
			myForm.t_dong.focus();
			return false;
		}
	}


</script>
</body>
</html>