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
<%
request.setCharacterEncoding("utf-8");
int num = Integer.parseInt(request.getParameter("num"));
CommuDAO commuDAO = new CommuDAO();
commuDAO.deleteBoard(num);
%>
	location.href="list.jsp";
}else{
	history.back();
}
</script>
</body>
</html>