<%@page import="user.user_MemberDAO"%>
<%@page import="user.user_MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/user_updatePro.jsp</title>
</head>
<body>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// 파라미터 가져오기 
String u_id = request.getParameter("u_id");
String u_pass = request.getParameter("u_pass");
String u_nic = request.getParameter("u_nic");
String u_name = request.getParameter("u_name");
String u_email = request.getParameter("u_email");
String u_phone = request.getParameter("u_phone");


// MemberDTO  memberDTO 객체생성
user_MemberDTO user_memberDTO = new user_MemberDTO();
// 멤버변수에 폼에서 가져온 내용을 set호출해서 저장
user_memberDTO.setU_id(u_id);
user_memberDTO.setU_pass(u_pass);
user_memberDTO.setU_nic(u_nic);
user_memberDTO.setU_name(u_name);
user_memberDTO.setU_email(u_email);
user_memberDTO.setU_phone(u_phone);






//MemberDAO 객체생성
user_MemberDAO user_memberDAO  = new user_MemberDAO();
user_MemberDTO user_memberDTO2 = user_memberDAO.userCheck(u_id, u_pass);
if (user_memberDTO2!=null) {
	//일치 updateMember(memberDTO) 메서드 정의
	user_memberDAO.updateMember(user_memberDTO);
	%>
	<script type="text/javascript">
		alert("수정이 완료되었습니다.");
		response.sendRedirect("main.jsp");
	</script>
	<%
} else {
	%>
	<script type="text/javascript">
		alert("해당 사용자가 존재하지 않습니다.");
		history.back();
	</script>
	<%
}

%>
</body>
</html>



