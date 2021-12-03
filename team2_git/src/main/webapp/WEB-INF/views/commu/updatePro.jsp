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
//세션값이 없으면 login.jsp 이동
if(u_id==null && t_id==null){
	response.sendRedirect("../member/login.jsp");
}
// request내장객체에서 게시글 번호 받아오기
int num=Integer.parseInt(request.getParameter("num"));
// CommuDAO 객체 생성
CommuDAO commuDAO=new CommuDAO();
// 본인이 작성한 글이 아니면 게시글로 리디렉트
if(commuDAO.numCheck(num, u_id, t_id) == null) {
	response.sendRedirect("content.jsp?num=" + num);
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
//lib 폴더에 cos.jar 프로그램 설치
//webapp  upload 폴더 만들고 => 물리적경로
String uploadPath=request.getRealPath("/upload/commu");
//C:\Program Files\Apache Software Foundation\Tomcat 8.5\wtpwebapps\FunWeb
System.out.println(uploadPath);
//파일 크기 10M
int maxSize=10*1024*1024;

MultipartRequest multi=new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());

//multi 태그파라미터 가져오기 name pass subject content
String subject = (String)multi.getParameter("subject");
String content = (String)multi.getParameter("content");
String file = (String)multi.getParameter("file");
//첨부파일이 없으면
if(file==null){
	//기존파일이름 가져오기
	file=multi.getParameter("oldfile");
}

//게시판내용을 디비작업파일에 저장
CommuDTO commuDTO = new CommuDTO();
commuDTO.setSubject(subject);
commuDTO.setContent(content);
commuDTO.setFile(file);

//db 업데이트
commuDAO.updateBoard(commuDTO);
//글목록 이동
response.sendRedirect("list.jsp");
%>
</body>
</html>