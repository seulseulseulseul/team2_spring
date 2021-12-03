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
<title>board/deletePro.jsp</title>
</head>
<body>
<%
//request num  pass  파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String pass=request.getParameter("pass");

//디비 객체생성
BoardDAO boardDAO=new BoardDAO();
//메서드 호출 BoardDTO boardDTO2= numCheck(num,pass)
BoardDTO boardDTO2=boardDAO.numCheck(num, pass);

if(boardDTO2!=null){
	//null 아닌경우 => num,pass일치 => deleteBoard(num)=>list.jsp이동
	boardDAO.deleteBoard(num);
	//list.jsp 이동
	response.sendRedirect("list.jsp");
}else{
	%>
	<script type="text/javascript">
		alert("입력하시정보는 틀립니다.");
		history.back();
	</script>
	<%
}
%>
</body>
</html>


