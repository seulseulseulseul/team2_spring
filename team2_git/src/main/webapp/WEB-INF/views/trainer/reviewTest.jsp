<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="modal">
        <h1>Review</h1>
       <form action="${pageContext.request.contextPath}/trainer/insertReview" method="post" >
            <input type="hidden" name="re_point" id="re_point" value="">
            <input type="hidden" name="u_id" value="${u_id}" >
			 <input type="hidden" name="t_id" value="${t_id}" >
            <p class="title_star">별점과 이용경험을 남겨주세요.</p>
     
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
            <div class="review_contents">
               <textarea rows="10" name="re_coment" class="review_textarea"></textarea>
            </div>   
            <div class="cmd">
                <input type="submit" id="save" value="등록">
 		  		<input type="reset" value="취소">
            </div>
        </form>
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
// if (starValue.val() == "") {
// 	alert("이름을 입력하세요.");}
</script>
</html>