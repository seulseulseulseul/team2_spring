<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/fwritePro.jsp</title>
</head>
<body>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// request 파라미터(태그) 값 가져오기 name pass subject content
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

// 조회수 0
int readcount=0;
// 날짜내장객체 <= 시스템 날짜 가져오기
Timestamp date=new Timestamp(System.currentTimeMillis());

//게시판내용을 담아서 디비작업파일에 전달 할 파일
// 패키지 board 파일이름 BoardDTO
// BoardDTO 객체생성
BoardDTO boardDTO=new BoardDTO();
// set메서드 호출 <= 폼에서 가져온 파라미터 값 저장
boardDTO.setName(name);
boardDTO.setPass(pass);
boardDTO.setSubject(subject);
boardDTO.setContent(content);
boardDTO.setReadcount(readcount);
boardDTO.setDate(date);

//디비작업파일 
// 패키지 board 파일이름 BoardDAO
// BoardDAO 객체생성 insertBoard(게시판내용을 저장한 주소) 정의
BoardDAO boardDAO=new BoardDAO();
// insertBoard() 호출
boardDAO.insertBoard(boardDTO);

// 글목록 이동
response.sendRedirect("list.jsp");
%>
</body>
</html>


