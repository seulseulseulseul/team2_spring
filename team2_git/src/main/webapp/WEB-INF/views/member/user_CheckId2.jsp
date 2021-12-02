<%@page import="user.user_MemberDTO"%>
<%@page import="user.user_MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/user_CheckId2.jsp</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function ok(){

	//아이디 입력 <input> 요소를 선택해 가져와서 u_id 변수를 선언해 저장
	var u_id = $("input[id='u_id']");
	//입력한 아이디 값이 3자 미만이거나 8자를 초과할 경우 
	if(u_id.val().length<3||u_id.val().length>8){
		//"아이디는 3자 이상 8자 이내로 입력해야 합니다" <-- 경고 메세지 출력
		alert("아이디는 3자 이상 8자 이내로 입력해야 합니다.");
		//아이디 입력 <input>요소에 빈공백을 주어 입력했던 내용이 모두 삭제되는 효과를 주자. 
		u_id.val() = "";
		//CheckId()함수 빠져나가기.
		return false; //함수 안에서는 return. break문은 반복문.
	}
	else{ //입력한 아이디 값이 3자 미만이거나 8자를 초과하지 않을 경우 (제대로 입력했다면)
		//"아이디를 정말로 사용하시겠어요?" 메세지와 함께 Confirm()창을 띄우고 [확인] 버튼을 눌렀을 때
		if(window.confirm("아이디를 정말로 사용하시겠어요?")){
			//Register.html(부모창) 페이지의 id 속성값이 u_id인 <input> 태그의 value 속성값을 
			//현재 CheckId.html(자식창)의 아이디 입력 <input>태그에 입력한 값으로 설정.
			opener.document.getElementById("u_id").value=u_id.val();
			//설정후 자식창인 CheckID.html 창 닫기
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
user_MemberDAO user_memberDAO = new user_MemberDAO();
// MemberDTO memberDTO = getMember(String id) 메소드  호출
user_MemberDTO user_memberDTO = user_memberDAO.getMember(u_id);
// 아이디 없으면 null => 아이디 중복아님 아이디 사용가능
// 아이디 있으면 null아님 => 아이디 중복 아이디 사용못함
if(user_memberDTO==null){
	%>아이디 사용가능 <input type="button" value="아이디 사용" onclick="ok()"><%
}else{
	%>아이디 중복<%
}
%>
<form action="user_CheckId2.jsp" method="get">
아이디 : <input type="text" name="u_id" class="u_id" id="u_id" value="<%=u_id%>">
<input type="submit" value="아이디 중복 확인">
</form>
</body>
</html>