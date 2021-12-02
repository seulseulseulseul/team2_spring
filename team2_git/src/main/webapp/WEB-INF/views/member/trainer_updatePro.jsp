<%@page import="trainer.MemberDAO"%>
<%@page import="trainer.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/updatePro.jsp</title>
</head>
<body>
<%
// 한글처리
request.setCharacterEncoding("utf-8");
// 파라미터 가져오기 
String t_id = request.getParameter("t_id");
String t_pass = request.getParameter("t_pass");
String t_name = request.getParameter("t_name");
String t_nic = request.getParameter("t_nic");
String t_postcode = request.getParameter("t_postcode");
String t_address = request.getParameter("t_address");
String t_detailAddress = request.getParameter("t_detailAddress");
String t_phone = request.getParameter("t_phone");
String t_email = request.getParameter("t_email");


// MemberDTO  memberDTO 객체생성
MemberDTO memberDTO = new MemberDTO();
// 멤버변수에 폼에서 가져온 내용을 set호출해서 저장
memberDTO.setT_id(t_id);
memberDTO.setT_pass(t_pass);
memberDTO.setT_name(t_name);
memberDTO.setT_nic(t_nic);
memberDTO.setT_postcode(t_postcode);
memberDTO.setT_address(t_address);
memberDTO.setT_detailAddress(t_detailAddress);
memberDTO.setT_phone(t_phone);
memberDTO.setT_email(t_email);


//MemberDAO 객체생성
MemberDAO memberDAO  = new MemberDAO();
// MemberDTO memberDTO2 = memberDAO.userCheck("shin", "1111");
MemberDTO memberDTO2 = memberDAO.userCheck(t_id, t_pass);
if (memberDTO2!=null) {
	//일치 updateMember(memberDTO) 메서드 정의
	memberDAO.updateMember(memberDTO);
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



