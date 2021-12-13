<%@page import="com.itwill.dao.TrainerDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.itwill.domain.TrainerDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String uploadPath = request.getRealPath("/upload");
System.out.println(uploadPath);
//첨부할 파일 최대크기 : 10MB
int maxSize = 10*1024*1024; 
MultipartRequest multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
String t_id = multi.getParameter("t_id");
String t_intro = multi.getParameter("t_intro");
String t_postcode = multi.getParameter("t_postcode");
String t_address = multi.getParameter("t_address");
String t_detailAddress = multi.getParameter("t_detailAddress");
//트레이너 프로필 사진
String profile_photo = multi.getFilesystemName("profile_photo");
String t_exp = multi.getParameter("t_exp");
String t_sns = multi.getParameter("t_sns");
String t_program = multi.getParameter("t_program");
String video = multi.getParameter("video");

//게시판내용을 담아서 디비작업파일에 전달할 파일
TrainerDTO trainerDTO = new TrainerDTO();
trainerDTO.setT_id(t_id);
trainerDTO.setT_intro(t_intro);
trainerDTO.setT_postcode(t_postcode);
trainerDTO.setT_address(t_address);
trainerDTO.setT_detailAddress(t_detailAddress);
trainerDTO.setProfile_photo(profile_photo);
trainerDTO.setT_exp(t_exp);
trainerDTO.setT_sns(t_sns);
trainerDTO.setT_program(t_program);
trainerDTO.setVideo(video);
MemberDAO memberDAO = new MemberDAO();
memberDAO.updatePlusMember(trainerDTO);

//트레이너 소개페이지로 이동
response.sendRedirect("insert.jsp");
%>
</body>
</html>