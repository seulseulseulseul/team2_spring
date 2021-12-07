function user_CheckForm(){
	//ID를 입력할 수 있는 <input>태그 선택해서 가져와서 u_id변수에 저장
	var u_id = $("input[id='u_id']");
	//비밀번호를 입력할 수 있는 <input>태그를 선택해 가져와서 u_pass변수에 저장
	var u_pass = $("input[id='u_pass']");
	//이름을 입력할 수 있는 <input>태그 선택해서 가져와 u_name 변수에 저장
	var u_name = $("input[id='u_name']");
	//닉네임울 입력할 수 있는 <input>태그 선택해서 가져와서 u_nic변수에 저장
	var u_nic = $("input[id='u_nic']");
	//이메일을 입력할 수 있는 <input>태그 선택해서 가져와서 u_email변수에 저장
	var u_email = $("input[id='u_email']");
	//전화번호를 입력할 수 있는 <input>태그 선택해서 가져와서 u_phone변수에 저장
	var u_phone = $("input[id='u_phone']");
	
	//밑에서 바로 $로 가져왔음
	
	  
	//아이디를 입력하지 않았을 경우
		if(u_id.val() == ""){
			alert("아이디를 입력하세요.");
			return false;
		}
		
		if($("#user_IdCheck").val() == "N"){
			alert("중복체크하세요.");
			return false;
		}
		
		
	//비밀번호를 입력하지 않았다면
		if(u_pass.val() == ""){
			alert("비밀번호를 입력하세요.");
			return false;
		}
	//입력한 비밀번호가 8자 미만 또는 12자 초과로 작성했을 경우
		if(u_pass.val().length<8 || u_pass.val().length>12){
			alert("비밀번호는 8~12자 이내로 작성하시오.");
			//비밀번호 입력 공간에 입력했던 내용을 지우기 위해 빈공백으로 설정
			u_pass.value = u_pass.val("");
			//<form> 요소로 false를 리턴하여 action 속성의 서버페이지로 전송하는 것을 차단.
			return false;
		}
		
		 //이름을 입력하지 않았을 경우
		if (u_name.val() == "") {
			alert("이름을 입력하세요.");
			u_name.focus();
			return false;
		}
	
		//이름을 2자 미만 또는 5자보다 초과로 작성했을 경우
		if (u_name.val().length < 2 || u_name.val().length > 5) {
			alert("이름은 2~5자 이내로 작성하시오.");
	
			//이름 입력란 <input> 요소에 입력된 텍스트에 선택되도록 하기
			u_name.select();
	
			return false;
		}
		
		//닉네임을 입력하지 않았다면
		if(u_nic.val() == ""){
			alert("닉네임을 입력하세요.");
			return false;
		}
		
		//이메일을 입력하지 않았다면
		if(u_email.val() == ""){
			alert("이메일을 입력하세요.");
			return false;
		}
		
		//전화번호를 입력하지 않았다면
		if(u_phone.val() == ""){
			alert("전화번호를 입력하세요.");
			return false;
		}
		
		return true;

	/*
	 	document.getElementsByTagName(태그명) -> 해당 태그명의 요소를 모두 선택해서 가져옴
	 	document.getElementById(id속성의값) -> id 속성값에 해당하는 요소 하나를 선택해서 가져옴.
	 	document.getElementsByClassName(class 속성의 값) -> 클래스 속성값에 해당하는 요소들을 모두 선택해서 가져옴
	 	document.getElementByName(name속성의 값) -> name속성값을 가지는 요소를 모두 선택해옴.
	 	
	 */

}

