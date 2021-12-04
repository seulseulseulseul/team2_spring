<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
if(window.confirm("정말로 삭제하시겠습니까?")){
	location.href="${pageContext.request.contextPath}/commu/deletePro?c_num=${c_num}";
}else{
	history.back();
}
</script>
</body>
</html>