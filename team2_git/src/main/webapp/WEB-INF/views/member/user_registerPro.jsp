<%@page import="user.user_MemberDAO"%>
<%@page import="user.user_MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/user_registerPro.jsp</title>
</head>
<body>
<%
// http가 폰에서 입력한 정보를 서버에 들고오면
// 서버에서 request내장객체 생성하고 request에 들고온 정보를 저장
// request 한글처리
request.setCharacterEncoding("utf-8");
// request 파라미터 가져오기
String u_id=request.getParameter("u_id");
String u_pass=request.getParameter("u_pass");
String u_nic=request.getParameter("u_nic");
String u_name=request.getParameter("u_name");
String u_email=request.getParameter("u_email");
String u_phone=request.getParameter("u_phone");

//패키지 trainer 파일 MemberDTO 만들기
//멤버변수 정의 set get 정의 
//MemberDTO 객체생성
user_MemberDTO user_memberDTO =new user_MemberDTO();
//멤버변수에 폼에서 가져온 내용을 set호출해서 저장
user_memberDTO.setU_id(u_id);
user_memberDTO.setU_pass(u_pass);
user_memberDTO.setU_nic(u_nic);
user_memberDTO.setU_name(u_name);
user_memberDTO.setU_email(u_email);
user_memberDTO.setU_phone(u_phone);
// user_memberDTO.setU_num(u_num);

//패키지 member 파일 MemberDAO 만들기
//insertMember(바구니주소) 메서드 정의
//MemberDAO 객체생성  
user_MemberDAO user_memberDAO=new user_MemberDAO();
//insertMember(주소) 메서드 호출
user_memberDAO.insertMember(user_memberDTO);
%>
<script type="text/javascript">
	alert("회원가입성공");
	location.href="start_login.jsp";
</script>
</body>
</html>