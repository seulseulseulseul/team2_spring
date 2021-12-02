<%@page import="user.user_MemberDTO"%>
<%@page import="user.user_MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/idCheck.jsp</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function ok() {
	var u_id=$("input[id='u_id']");
	if(u_id.val().length<3||u_id.val().length>20){
		//"아이디는 3자 이상 8자 이내로 입력해야 합니다" <-- 경고 메세지 출력
		alert("아이디는 3자 이상 20자 이내로 입력해야 합니다.");
		//아이디 입력 <input>요소에 빈공백을 주어 입력했던 내용이 모두 삭제되는 효과를 주자. 
		u_id.val("");
		//CheckId()함수 빠져나가기.
		u_id.focus();
		return false; //함수 안에서는 return. break문은 반복문.
	}else{
		if(window.confirm("아이디를 정말로 사용하시겠어요?")){
		// join.jsp(opener) 아이디 상자에 넣기  <=  idCheck.jsp에서 찾은아이디
		opener.document.getElementById("u_id").value=u_id.val();
		//창닫기
		window.close();
		}
	}
}
 </script>
</head>
<body>
<%
String u_id= request.getParameter("u_id");
// 디비작업
// MemberDAO 객체생성
user_MemberDAO memberDAO = new user_MemberDAO();
// MemberDTO memberDTO = getMember(String id) 메소드  호출
user_MemberDTO memberDTO = memberDAO.getMember(u_id);
// 아이디 없으면 null => 아이디 중복아님 아이디 사용가능
// 아이디 있으면 null아님 => 아이디 중복 아이디 사용못함
if(memberDTO==null){
	%>아이디 사용가능 <input type="button" value="아이디사용" onclick="ok()"><%
}else{
	%>아이디 중복<%
}
%>
<form action="user_CheckId.jsp" method="get">
아이디 : <input type="text" name="u_id" class="id" id="u_id" value="<%=u_id%>">
<input type="submit" value="아이디 찾기">
</form>
</body>
</html>