$(document).ready(function(){
$('.starRev span').click(function(){
	  $(this).parent().children('span').removeClass('on');
	  $(this).addClass('on').prevAll('span').addClass('on');
	  var starValue = $(this).attr("value");
	  $("#re_point").val(starValue) ;
	  return false;
	});
});
function CheckForm(){
	var re_point = $("#re_point");
	var u_id = $("#u_id");
	var t_id = $("#t_id");
	var re_coment = $("#re_coment");
	if (re_point.val() == "") {
			alert("별점을 입력하세요.");
			return false;
	}
	if (u_id.val() == "") {
			alert("로그인 하세요.");
			return false;
	}
	 //이름을 입력하지 않았을 경우
	if ( t_id.val() == "") {
			alert("트레이너를 선택해주세요.");
			return false;
	}
	if (re_coment.val() == "") {
			alert("이용경험을 남겨주세요.");
			return false;
	}
	alert("리뷰 작성이 완료되었습니다.");
};
function CheckForm2(){
	var u_id = $("#u_id");
	var u_cash = $("#u_cash");
	var t_id = $("#t_id");
	var coment = $("#coment");
	var book_date = $("#book_date");
	if (u_id.val() == "") {
		alert("로그인 하세요.");
		return false;
	}else if(u_cash.val()>0){
			if(confirm('1크레딧이 차감됩니다. 예약하시겠습니까?')){

				 //이름을 입력하지 않았을 경우
				if ( t_id.val() == "") {
						alert("트레이너를 선택해주세요.");
						return false;
				}
				if (coment.val() == "") {
						alert("요청사항을 남겨주세요.");
						return false;
				}
				if (book_date.val() == "") {
						alert("예약일자를 확인해주세요.");
						return false;
				}
			}
	}else{
		alert("크레딧 충전이 필요합니다.");
		return false;
	}
	alert("예약이 완료되었습니다.");
};
