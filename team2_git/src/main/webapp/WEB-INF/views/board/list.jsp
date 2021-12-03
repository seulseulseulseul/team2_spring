<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/list.jsp</title>
</head>
<body>
<%
//BoardDAO 객체생성
// BoardDAO boardDAO =new BoardDAO();

// 한화면에 보여줄 글개수  10개 설정
// int pageSize=10;
// int pageSize=3;

// 첫번째 페이지 => 1
//  http://localhost:8181/JspStudy/board/list.jsp

// 페이지번호 하이퍼링크 클릭하면 => 1,2, 3,...
//  http://localhost:8181/JspStudy/board/list.jsp?pageNum=3

// //페이지 번호 가져오기 
// String pageNum=request.getParameter("pageNum");
// //페이지번호가 없으면 -> 1
// if(pageNum==null){
// 	pageNum="1";
// }

// out.println("pageSize="+pageSize);
// out.println("pageNum="+pageNum);

//시작하는 행번호 구하기
// pageNum       pageSize        =>   startRow
//    1             10           =>    (1-1)*10+1=>0*10+1=>  0+1 => 1  
//    2             10           =>    (2-1)*10+1=>1*10+1=> 10+1 => 11  
//    3             10           =>    (3-1)*10+1=>2*10+1=> 20+1 => 21 

// pageNum => 정수형 변경
// int currentPage=Integer.parseInt(pageNum);
// int startRow=(currentPage-1)*pageSize+1;
// out.println("startRow="+startRow);

// 끝나는 행번호 구하기
// startRow  pageSize  => endRow
//    1         10     => 1+10-1=>10
//    11        10     => 11+10-1=>20
//    21        10     => 21+10-1=>30
// int endRow=startRow+pageSize-1;
// out.println("endRow="+endRow);

// List boardList  =  getBoardList(startRow, pageSize ) 메서드 정의
// 메서드 호출
// List boardList=boardDAO.getBoardList(startRow, pageSize);
// select * from board order by num desc limit 시작행-1, 가져올개수
// List<BoardDTO> boardList=boardDAO.getBoardList(startRow, pageSize);
// 배열  for 첫번째 칸 => BoardDTO => 멤버변수 num pass name...

//게시판 전체 글 개수
// select count(*) from board
// int count=boardDAO.getBoardCount();
%>
<h1>글목록[전체글 개수 : <%//=count %>]</h1>
<h2><a href="writeForm.jsp">글쓰기</a></h2>
<table border="1">
<tr><td>글번호 </td><td>글쓴이</td><td>제목</td>
<td>등록일</td><td>조회수</td></tr>
<%
// for(int i=0;i<boardList.size();i++){
	// boardList 한칸접근 게시판 한개 들고 오기
// 	BoardDTO boardDTO=(BoardDTO)boardList.get(i);
	// 배열에서 형변환 없이 한칸에 데이터 가져오기
// 	BoardDTO boardDTO=boardList.get(i);
%><tr><td><%//=boardDTO.getNum() %></td>
      <td><%//=boardDTO.getName() %></td>
      <td><a href="content.jsp?num=<%//=boardDTO.getNum()%>">
      <%//=boardDTO.getSubject() %></a></td>
      <td><%//=boardDTO.getDate() %></td>
      <td><%//=boardDTO.getReadcount() %></td></tr><%	
// }
%>
<c:forEach var="boardDTO" items="${boardList }">
   <tr><td>${boardDTO.num }</td>
      <td>${boardDTO.name }</td>
      <td><a href="${pageContext.request.contextPath}/board/content?num=${boardDTO.num }">
      ${boardDTO.subject }</a></td>
      <td>${boardDTO.date }</td>
      <td>${boardDTO.readcount }</td>
   </tr>
</c:forEach>
</table>
<%
//한페이지에 보여줄 페이지 개수 설정
// int pageBlock=10;
// int pageBlock=3;

//시작하는 페이지 번호
//  currentPage         pageBlock    =>     startPage
//    1~10(00~09)           10       =>       (0~9)/10*10+1=>0*10+1=> 0*10+1=>0+1=>1  
//    11~20(10~19)          10       =>       (10~19)/10*10+1=>1*10+1=> 1*10+1=>10+1=>11
//    21~30(20~29)          10       =>       (20~29)/10*10+1 =>2*10+1=> 2*10+1=>20+1=>21
// int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// out.println("startPage="+startPage);

// 끝나는 페이지 번호
// startPage   pageBlock  => endPage
//    1            10     =>  1+10-1 =>10
//    11           10     =>  11+10-1 =>20
//    21           10     =>  21+10-1 =>30
// int endPage=startPage+pageBlock-1;
// 구한 끝나는 페이지 번호 10 , 전체 글 페이지 수 2
// 전체 글 페이지 수 구하기
// 전체 글 50 / 한화면에 보여줄 글개수 10 => 전체페이지수 5 + 나머지글 없음 0
// 전체 글 57 / 한화면에 보여줄 글개수 10 => 전체페이지수 5 + 나머지글 있음 1
//                                                 나머지 없으면 0 더하기, 있으면 1 더하기
// int pageCount=count/pageSize+(count%pageSize==0?0:1);
// out.println("pageCount="+pageCount);

// if(endPage >  pageCount){
// // 	끝나는페이지번호 =  전체글페이지수
// 	endPage=pageCount;
// }
// out.println("endPage="+endPage);
// out.println("<br>");

//이전   1 안보임   11 21.. 보임
// if(startPage > pageBlock){

// }
//1~10 
// for(int i=startPage;i<=endPage;i++){

// }

//다음 끝페이지번호 10  < 전체페이지개수  50 => 다음에 글있음
// if(endPage < pageCount){

// }

%>
<c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
<a href="${pageContext.request.contextPath}/board/list?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">[이전]</a>
</c:if>
<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
	<a href="${pageContext.request.contextPath}/board/list?pageNum=${i}">${i} </a>
</c:forEach>
<c:if test="${pageDTO.endPage < pageDTO.pageCount }">
<a href="${pageContext.request.contextPath}/board/list?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">[다음]</a>
</c:if>
</body>
</html>
