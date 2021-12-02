<%@page import="java.sql.Timestamp"%>
<%@page import="center.CenterDAO"%>
<%@page import="center.CenterDTO"%>
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
request.setCharacterEncoding("utf-8");
int u_num = 0;
if(request.getParameter("u_num")!=null) {
	u_num = Integer.parseInt(request.getParameter("u_num"));
}
//로그인된 아이디가 일반회원인지 트레이너인지에 따라 u_num, t_num 둘중 하나로 입력
String b_title = (String)request.getParameter("b_title");
String b_content = (String)request.getParameter("b_content");
int secret = 0;
if(request.getParameter("secret")!=null){
secret = Integer.parseInt(request.getParameter("secret"));}
//게시판내용을 담아서 디비작업파일에 전달할 파일
CenterDTO centerDTO = new CenterDTO();
centerDTO.setU_num(u_num);
centerDTO.setB_title(b_title);
centerDTO.setB_content(b_content);
centerDTO.setSecret(secret);
//디비작업파일
CenterDAO centerDAO = new CenterDAO();
centerDAO.insertCenter(centerDTO);
//글목록 이동
response.sendRedirect("list.jsp");
%>
</body>
</html>