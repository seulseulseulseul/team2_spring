
<%@page import="notice.NoticeDAO"%>
<%@page import="notice.NoticeDTO"%>
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
int b_num = 0;
if(request.getParameter("b_num")!=null) {
	b_num = Integer.parseInt(request.getParameter("b_num"));
}
//로그인된 아이디가 일반회원인지 트레이너인지에 따라 u_num, t_num 둘중 하나로 입력
String b_title = (String)request.getParameter("b_title");
String b_content = (String)request.getParameter("b_content");
//게시판내용을 담아서 디비작업파일에 전달할 파일
NoticeDTO noticeDTO = new NoticeDTO();
noticeDTO.setB_num(b_num);
noticeDTO.setB_title(b_title);
noticeDTO.setB_content(b_content);
//디비작업파일
NoticeDAO noticeDAO = new NoticeDAO();
noticeDAO.insertReply(noticeDTO);
//글목록 이동
response.sendRedirect("content.jsp?b_num="+b_num);
%>
</body>
</html>