<%@page import="trainer.MemberDAO"%>
<%@page import="trainer.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/trainer_registerPro.jsp</title>
</head>
<body>
<%
// http가 폰에서 입력한 정보를 서버에 들고오면
// 서버에서 request내장객체 생성하고 request에 들고온 정보를 저장
// request 한글처리
request.setCharacterEncoding("utf-8");
// request 파라미터 가져오기
String t_id=request.getParameter("t_id");
String t_pass=request.getParameter("t_pass");
String t_name=request.getParameter("t_name");
String t_nic=request.getParameter("t_nic");
String t_postcode=request.getParameter("t_postcode");
String t_address=request.getParameter("t_address");
String t_detailAddress=request.getParameter("t_detailAddress");
String t_phone=request.getParameter("t_phone");
String t_email=request.getParameter("t_email");

//패키지 trainer 파일 MemberDTO 만들기
//멤버변수 정의 set get 정의 
//MemberDTO 객체생성
MemberDTO memberDTO =new MemberDTO();
//멤버변수에 폼에서 가져온 내용을 set호출해서 저장
memberDTO.setT_id(t_id);
memberDTO.setT_pass(t_pass);
memberDTO.setT_name(t_name);
memberDTO.setT_nic(t_nic);
memberDTO.setT_postcode(t_postcode);
memberDTO.setT_address(t_address);
memberDTO.setT_detailAddress(t_detailAddress);
memberDTO.setT_phone(t_phone);
memberDTO.setT_email(t_email);

//패키지 member 파일 MemberDAO 만들기
//insertMember(바구니주소) 메서드 정의
//MemberDAO 객체생성  
MemberDAO memberDAO=new MemberDAO();
//insertMember(주소) 메서드 호출
memberDAO.insertMember(memberDTO);
%>
<script type="text/javascript">
	alert("회원가입성공");
	location.href="start_login.jsp";
</script>
</body>
</html>