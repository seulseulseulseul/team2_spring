<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="commu.CommuDAO"%>
<%@page import="commu.CommuDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// request 객체에서 id값 가져오기
String u_id=(String)session.getAttribute("u_id");
String t_id=(String)session.getAttribute("t_id");
String nic=(String)request.getAttribute("nic");
//세션값이 없으면 login.jsp 이동
if(u_id==null && t_id==null){
	response.sendRedirect("../member/login.jsp");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//request 한글처리
//request.setCharacterEncoding("utf-8");
request.setCharacterEncoding("utf-8");

//파일업로드
//webapp  upload 폴더 만들고 => 물리적경로
String uploadPath=request.getRealPath("/upload/commu");
//파일 크기 10M
int maxSize=10*1024*1024;
MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

//multi 태그파라미터 가져오기 id nick subject content
String subject = (String)multi.getParameter("subject");
String content = (String)multi.getParameter("content");
String file = (String)multi.getParameter("file");

//CommuDTO 객체 생성
CommuDTO commuDTO = new CommuDTO();
//게시판내용을 디비작업파일에 저장
commuDTO.setU_id(u_id); // id는 session에서 가져옴
commuDTO.setSubject(subject);
commuDTO.setContent(content);
commuDTO.setFile(file);

//CommuDAO 객체 생성
CommuDAO commuDAO = new CommuDAO();
commuDAO.insertBoard(commuDTO);
//글목록 이동
response.sendRedirect("list.jsp");
%>
</body>
</html>