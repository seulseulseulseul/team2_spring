<%@page import="trainer.MemberDTO"%>
<%@page import="trainer.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>���̵� �ߺ�üũ</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function ok() {
	var t_id=$("input[id='t_id']");
	if(t_id.val().length<3||t_id.val().length>20){
		//"���̵�� 3�� �̻� 8�� �̳��� �Է��ؾ� �մϴ�" <-- ��� �޼��� ���
		alert("���̵�� 3�� �̻� 20�� �̳��� �Է��ؾ� �մϴ�.");
		//���̵� �Է� <input>��ҿ� ������� �־� �Է��ߴ� ������ ��� �����Ǵ� ȿ���� ����. 
		t_id.val("");
		//CheckId()�Լ� ����������.
		t_id.focus();
		return false; //�Լ� �ȿ����� return. break���� �ݺ���.
	}else{
		if(window.confirm("���̵� ������ ����Ͻðھ��?")){
		// join.jsp(opener) ���̵� ���ڿ� �ֱ�  <=  idCheck.jsp���� ã�����̵�
		opener.document.getElementById("t_id").value=t_id.val();
		//â�ݱ�
		window.close();
		}
	}
}
 </script>

</head>
<body>
<%
String t_id=request.getParameter("t_id");
// ����۾�
//MemberDAO ��ü����
MemberDAO memberDAO=new MemberDAO();
//MemberDTO memberDTO = getMember(String id)�޼��� ȣ�� 
MemberDTO memberDTO=memberDAO.getMember(t_id);
// ���̵� ������ null   => ���̵� �ߺ��ƴ�  ���̵� ��밡��
// ���̵� ������ null�ƴ� => ���̵� �ߺ�  ���̵� ������
if(memberDTO==null){
	%>���̵� ��밡�� <input type="button" value="���̵���" onclick="ok()"><%
}else{
	%>���̵� �ߺ�<%
}
%>
<form action="trainer_CheckId.jsp" method="get">
���̵� : <input type="text" name="t_id" class="t_id" id="t_id" value="<%=t_id%>">
<input type="submit" value="���̵� ã��">
</form>
</body>
</html>