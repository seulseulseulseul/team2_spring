<%@page import="user.user_MemberDTO"%>
<%@page import="user.user_MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/user_loginPro.jsp</title>
</head>
<body>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// id pass 파라미터 가져오기 
String u_id=request.getParameter("u_id");
String u_pass=request.getParameter("u_pass");

// MemberDAO 객체생성
user_MemberDAO memberDAO=new user_MemberDAO();
// 리턴할형 MemberDTO userCheck(id,pass)메서드 정의
// MemberDTO memberDTO  =  userCheck(id,pass)메서드 호출
user_MemberDTO memberDTO=memberDAO.userCheck(u_id, u_pass);

if(memberDTO!=null){
	// 일치 세션값 생성 "id", id
	session.setAttribute("u_id", u_id);
// main폴더	main.jsp 이동
	response.sendRedirect("main.jsp");
}else{
	//틀림 "입력하신 정보 틀림" 뒤로이동
	%>
	<script type="text/javascript">
		alert("입력하신 정보 틀림");
		history.back();
	</script>
	<%
}
%>
</body>
</html>