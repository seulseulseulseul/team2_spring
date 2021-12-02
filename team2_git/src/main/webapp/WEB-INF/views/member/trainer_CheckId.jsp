<%@page import="trainer.MemberDTO"%>
<%@page import="trainer.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복체크</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function ok() {
	var t_id=$("input[id='t_id']");
	if(t_id.val().length<3||t_id.val().length>20){
		//"아이디는 3자 이상 8자 이내로 입력해야 합니다" <-- 경고 메세지 출력
		alert("아이디는 3자 이상 20자 이내로 입력해야 합니다.");
		//아이디 입력 <input>요소에 빈공백을 주어 입력했던 내용이 모두 삭제되는 효과를 주자. 
		t_id.val("");
		//CheckId()함수 빠져나가기.
		t_id.focus();
		return false; //함수 안에서는 return. break문은 반복문.
	}else{
		if(window.confirm("아이디를 정말로 사용하시겠어요?")){
		// join.jsp(opener) 아이디 상자에 넣기  <=  idCheck.jsp에서 찾은아이디
		opener.document.getElementById("t_id").value=t_id.val();
		//창닫기
		window.close();
		}
	}
}
 </script>

</head>
<body>
<%
String t_id=request.getParameter("t_id");
// 디비작업
//MemberDAO 객체생성
MemberDAO memberDAO=new MemberDAO();
//MemberDTO memberDTO = getMember(String id)메서드 호출 
MemberDTO memberDTO=memberDAO.getMember(t_id);
// 아이디 없으면 null   => 아이디 중복아님  아이디 사용가능
// 아이디 있으면 null아님 => 아이디 중복  아이디 사용못함
if(memberDTO==null){
	%>아이디 사용가능 <input type="button" value="아이디사용" onclick="ok()"><%
}else{
	%>아이디 중복<%
}
%>
<form action="trainer_CheckId.jsp" method="get">
아이디 : <input type="text" name="t_id" class="t_id" id="t_id" value="<%=t_id%>">
<input type="submit" value="아이디 찾기">
</form>
</body>
</html>