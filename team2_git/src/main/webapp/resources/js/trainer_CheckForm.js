function trainer_CheckForm(){
	//ID를 입력할 수 있는 <input>태그 선택해서 가져와서 t_id변수에 저장
	var t_id = $("input[id='t_id']");
	//비밀번호를 입력할 수 있는 <input>태그를 선택해 가져와서 t_pass변수에 저장
	var t_pass = $("input[id='t_pass']");
	//이름을 입력할 수 있는 <input>태그 선택해서 가져와 t_name 변수에 저장
	var t_name = $("input[id='t_name']");
	//닉네임울 입력할 수 있는 <input>태그 선택해서 가져와서 t_nic변수에 저장
	var t_nic = $("input[id='t_nic']");
	//우편번호를 입력 할 수 있는 input>태그 선택해서 가져와서 t_post변수에 저장
	var t_address = $("input[id='t_address']"); 
	//전화번호를 입력할 수 있는 <input>태그 선택해서 가져와서 t_phone변수에 저장
	var t_phone = $("input[id='t_phone']");
	//이메일울 입력할 수 있는 <input>태그 선택해서 가져와서 t_email변수에 저장
	var t_email = $("input[id='t_email']");
	
	//밑에서 바로 $로 가져왔음
	
	  
	//아이디를 입력하지 않았을 경우
		if(t_id.val() == ""){
			alert("아이디를 입력하세요.");
			return false;
		}
	//비밀번호를 입력하지 않았다면
		if(t_pass.val() == ""){
			alert("비밀번호를 입력하세요.");
			return false;
		}
	//입력한 비밀번호가 8자 미만 또는 12자 초과로 작성했을 경우
		if(t_pass.val().length<8 || t_pass.val().length>12){
			alert("비밀번호는 8~12자 이내로 작성하시오.");
			//비밀번호 입력 공간에 입력했던 내용을 지우기 위해 빈공백으로 설정
			t_pass.value = t_pass.val("");
			//<form> 요소로 false를 리턴하여 action 속성의 서버페이지로 전송하는 것을 차단.
			return false;
		}
				
	 //이름을 입력하지 않았을 경우
		if (t_name.val() == "") {
			alert("이름을 입력하세요.");
			t_name.focus();
			return false;
		}
	
	//이름을 2자 미만 또는 5자보다 초과로 작성했을 경우
		if (t_name.val().length < 2 || t_name.val().length > 5) {
			alert("이름은 2~5자 이내로 작성하시오.");
	
			//이름 입력란 <input> 요소에 입력된 텍스트에 선택되도록 하기
			t_name.select();
	
			return false;
		}
		
		//닉네임을 입력하지 않았다면
		if(t_nic.val() == ""){
			alert("닉네임을 입력하세요.");
			return false;
		}
		
		//우편번호를 입력하지 않았다면
		if(t_address.val() == ""){
			alert("주소를 입력해주세요.");
			return false;
		}
		//전화번호를 입력하지 않았다면
		if(t_phone.val() == ""){
			alert("전화번호를 입력하세요.");
			return false;
		}
		//이메일을 입력하지 않았다면
		if(t_email.val() == ""){
			alert("이메일을 입력하세요.");
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

	