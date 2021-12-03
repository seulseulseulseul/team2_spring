<%@page import="board.BoardDAO"%>
<%@page import="board.BoardDTO"%>
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
<title>board/updatePro.jsp</title>
</head>
<body>
<%
// request 한글처리
request.setCharacterEncoding("utf-8");
// request num name pass subject content 파라미터 가져오기
int num=Integer.parseInt(request.getParameter("num"));
String name=request.getParameter("name");
String pass=request.getParameter("pass");
String subject=request.getParameter("subject");
String content=request.getParameter("content");

// 수정할 정보를 바구니(BoardDTO) 저장
BoardDTO boardDTO=new BoardDTO();
boardDTO.setNum(num);
boardDTO.setName(name);
boardDTO.setPass(pass);
boardDTO.setSubject(subject);
boardDTO.setContent(content);

// 디비 객체생성
BoardDAO boardDAO=new BoardDAO();
//메서드 정의 BoardDTO numCheck(int num,String pass)
// 메서드 호출 BoardDTO boardDTO2= numCheck(num,pass)
BoardDTO boardDTO2=boardDAO.numCheck(num, pass);
// 일치하면 boardDTO2 주소값 , 틀리면 boardDTO2 null 값 
if(boardDTO2!=null){
//null 아닌경우 => num,pass일치 => updateBoard(boardDTO)=>list.jsp이동
	boardDAO.updateBoard(boardDTO);
	//list.jsp 이동
		response.sendRedirect("list.jsp");
}else{
	//null  =>  num,pass  불일치 => 입력정보 틀림 뒤로이동
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