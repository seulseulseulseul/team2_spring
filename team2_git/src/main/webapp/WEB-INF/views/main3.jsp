<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>   
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    margin-bottom: 15px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    margin-bottom: 15px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}

.starRev{
	width: 250px;
	padding-left: 110px;
	margin-bottom: 15px;
}

.review_textarea{
	clear: left;
	margin-left: 5px;
 	width:90%;
 	border: 1px solid #ced4da;
 	border-radius: 0.25rem;
 	font-size: 1rem;
    font-weight: 400;
    color: #495057;
 	background-color: #cccccc;
}
.body-input{
	width:100%;
	margin: 15px auto;
}

.foot{     
  padding-left: 35px;                 
  width:90%;
  height:50px;
  margin-top: 20px, auto;
}
.pop-btn{ 
  display:inline-flex;            
  width:40%;                      
  height:100%;                    
  justify-content:center;         
  align-items:center;             
  float:left;                     
  color:#ffffff;                  
  cursor:pointer;
  margin-right: 20px;     
  background-color: #264db5;
  font-size:15px;     
  border-radius:10px;     
}
/* .pop-btn.confirm{        */
/*   border-right:1px solid #264db5;  */
/* } */

/* ------------------- */

.popup-body{                
  width:100%;
  background-color:#ffffff; 
}
.body-content{              
  width:95%;
  padding:20px;  
  align-items:center;
}
.body-titlebox{             
  text-align:center;         
  font-size:18px; 
  font-weight: bolder;
  hight: 30px;   
}
.body-contentbox{           
  word-break:break-word;    
  overflow-y:auto;          
  min-height:150px;         
  max-height:300px;  
  align-items:center;      
}

/* ------------------ */
.popup-head{
  width:100%;
  height:50px;  
  display:flex; 
  align-items:center;
  justify-content:center;
  color:#ffffff; 
  font-size:20px;
}
/* -------------------- */
.popup{
  width:100%;               
  max-width:400px;          
  border-radius:10px;       
  overflow:hidden;          
  background-color:#264db5; 
  box-shadow: 5px 10px 10px 1px rgba(0,0,0,.3); 
}
/* --------------------------- */
.popup-wrap{
  background-color:rgba(0,0,0,.3); 
  justify-content:center; 
  align-items:center;     
  position:fixed;         
  top:0;
  left:0;
  right:0;
  bottom:0;               
  display:none; 
  padding:15px; 
}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
    /*팔로우 버튼 클릭*/
    $(document).ready(function(){

    
    		  $("#confirm").click(function(){
    		      modalClose(); //모달 닫기 함수 호출
    		      //컨펌 이벤트 처리
    		  });
    		  $("#modal-open").click(function(){        
    		      $("#popup").css('display','flex').hide().fadeIn();
    		      //팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
    		  });
    		  $("#close").click(function(){
    		      modalClose(); //모달 닫기 함수 호출
    		  });
    		  function modalClose(){
    		      $("#popup").fadeOut(); //페이드아웃 효과
    		  }     
        });


</script>
</head>
<body>
<h1 id="modal-open">리뷰 작성</h1>
<div class="container"> 
  <div class="popup-wrap" id="popup"> 
    <div class="popup">	
      <div class="popup-head">	
          <span class="head-title">Review</span>
      </div>
      <div class="popup-body">	
        <div class="body-content">
          <div class="body-titlebox">
          	별점과 이용경험을 남겨주세요.
          </div>
          <div class="body-contentbox">
            <form action="${pageContext.request.contextPath}/trainer/insertReview" method="post">
            	<input type="hidden" name="re_point" id="re_point" value="">
            <input type="hidden" name="u_id" value="hong" >
			 <input type="hidden" name="t_id" value="kim" >
			<div class="body-input">
            <div class="review_rating rating_point">
                <div class="starRev">
				  <span class="starR1 on" value="0.5"></span>
				  <span class="starR2" value="1"></span>
				  <span class="starR1" value="1.5"></span>
				  <span class="starR2" value="2"></span>
				  <span class="starR1" value="2.5"></span>
				  <span class="starR2" value="3"></span>
				  <span class="starR1" value="3.5"></span>
				  <span class="starR2" value="4"></span>
				  <span class="starR1" value="4.5"></span>
				  <span class="starR2" value="5"></span>
				</div>
            </div>
               <textarea rows="5" name="re_coment" class="review_textarea"></textarea>
            </div>  
   	 		 <div class="foot">
                <input type="submit" class="pop-btn confirm" id="confirm" value="등록" onclick="return CheckForm();">
 		  		<input type="reset" class="pop-btn close" id="close" value="취소">
     		 </div>
       </form>
          </div>
   	  </div>
        </div>
    </div>
</div>
</div>
</body>
 <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script type="text/javascript">
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
	var u_id = $("input[name='u_id']");
	var t_id = $("input[name='t_id']");
	var re_coment = $("textarea[name='re_coment']");
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
}
// if (starValue.val() == "") {
// 	alert("이름을 입력하세요.");}
</script>
</html>