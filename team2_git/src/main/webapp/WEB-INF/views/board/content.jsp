
<%@page import="board.BoardDTO"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/content.jsp</title>
</head>
<body>
<%
//  http://localhost:8181/JspStudy/board/content.jsp?num=2
//  request내장객체에서 num 가져오기
int num=Integer.parseInt(request.getParameter("num"));
//BoardDAO 객체생성
BoardDAO boardDAO=new BoardDAO();
//조회수 증가 update board set readcount=readcount+1 where num=?
boardDAO.updateReadcount(num);
// BoardDTO boardDTO  =  getBoard(int num) 메서드 정의
// getBoard(num) 메서드 호출
BoardDTO boardDTO=boardDAO.getBoard(num);
%>
<h1>글내용보기</h1>
<table border="1">
<tr><td>글번호</td><td><%=boardDTO.getNum()%></td>
    <td>작성일</td><td><%=boardDTO.getDate()%></td></tr>
<tr><td>글쓴이</td><td><%=boardDTO.getName() %></td>
    <td>조회수</td><td><%=boardDTO.getReadcount() %></td></tr>
<tr><td>글제목</td><td colspan="3"><%=boardDTO.getSubject() %></td></tr>
<tr><td>첨부파일</td>
<td colspan="3"><a href="../upload/<%=boardDTO.getFile() %>" download><%=boardDTO.getFile() %></a></td></tr>
<tr><td>글내용</td><td colspan="3"><%=boardDTO.getContent() %></td></tr>
<tr><td colspan="4">
<input type="button" value="글수정" 
onclick="location.href='updateForm.jsp?num=<%=boardDTO.getNum()%>'">
<input type="button" value="글삭제" 
onclick="location.href='deleteForm.jsp?num=<%=boardDTO.getNum()%>'">
<input type="button" value="글목록" 
onclick="location.href='list.jsp'"></td></tr>
</table>	
</body>
</html>


