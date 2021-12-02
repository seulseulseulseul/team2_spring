<%@page import="trainer.MemberDTO"%>
<%@page import="trainer.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/trainer_loginPro.jsp</title>
</head>
<body>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// id pass 파라미터 가져오기 
String t_id=request.getParameter("t_id");
String t_pass=request.getParameter("t_pass");

// MemberDAO 객체생성
MemberDAO memberDAO=new MemberDAO();
// 리턴할형 MemberDTO userCheck(id,pass)메서드 정의
// MemberDTO memberDTO  =  userCheck(id,pass)메서드 호출
MemberDTO memberDTO=memberDAO.userCheck(t_id, t_pass);

if(memberDTO!=null){
	// 일치 세션값 생성 "id", id
	session.setAttribute("t_id", t_id);
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