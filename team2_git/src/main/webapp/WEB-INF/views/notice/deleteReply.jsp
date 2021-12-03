<%@page import="notice.NoticeDAO"%>
<%@page import="center.CenterDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
int b_num = 0;
if(request.getParameter("b_num")!=null)
{b_num = Integer.parseInt(request.getParameter("b_num")) ;}
int b_reply = 0;
if(request.getParameter("b_reply")!=null)
{b_reply = Integer.parseInt(request.getParameter("b_reply")) ;}
NoticeDAO noticeDAO = new NoticeDAO();
noticeDAO.deleteReply(b_num, b_reply);
%>
	location.href="content.jsp?b_num=<%=b_num %>";
}else{
	history.back();
}
</script>
</body>
</html>