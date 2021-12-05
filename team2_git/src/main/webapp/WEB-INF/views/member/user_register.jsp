<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    
     <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
 	<script type="text/javascript">
 	
 	function u_CheckId() {
		$.ajax({
			url:"${pageContext.request.contextPath}/member/user_IdCheck",
			type:"post",
			dataType:"json",
			data:{"u_id":$("#u_id").val()},
			success:function(data){
				if(data==1){
					alert("중복된 아이디입니다.");
				}else if(data ==0){
					$("#user_IdCheck").attr("value","Y");
					alert("사용가능한 아이디입니다.");
				}
			}
		})}
 	
 </script>

  </head>
  <body>
  <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- END nav -->

    <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-3 bread">유저 회원가입</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="blog.html">공지사항</a></span> <span>Blog Single</span></p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">유저 회원가입</h3>
                <form action="${pageContext.request.contextPath}/member/user_registerPro" id="join" method="post">
								<div class="form-group">
									<label>ID</label>
									<button type="button" value="N" id="user_IdCheck" onclick="u_CheckId();" class="btn btn-primary">아이디 중복확인</button><br>
									<input type="text" name="u_id" id="u_id" class="form-control" placeholder="아이디확인 필수" >
								</div>					
								</div>
								<div class="form-group">
									<label class="fw">비밀번호</label>
									<input type="password" name="u_pass" id="u_pass" class="form-control">
								</div>
								<div class="form-group">
									<label>이름</label>
									<input type="text" name="u_name" id="u_name" class="form-control">
								</div>
								<div class="form-group">
									<label>닉네임</label>
									<input type="text" name="u_nic" id="u_nic" class="form-control">
								</div>
								<div class="form-group">
									<label>E-mail</label>
									<input type="email" name="u_email" id="u_email" class="form-control">
								</div>
								<div class="form-group">
									<label>전화번호</label>
									<input type="text" name="u_phone" id="u_phone" class="form-control">
								</div>
								<div class="form-group text-right">
									<button type="submit" class="btn btn-primary btn-block"  onclick="return user_CheckForm();">회원가입</button>
								</div>
								<div class="form-group text-center">
									<span class="text-muted">Already have an account?</span> <a href="${pageContext.request.contextPath}/member/user_login.jsp">로그인</a>
								</div>
							</form>
              </div>
            </div>
			<!-- .col-md-8 -->
<!--           <div class="col-lg-4 sidebar ftco-animate"> -->
<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <div class="categories"> -->
<!--                 <ul> -->
<!--                 <li><a href="update.jsp" class="btn py-3 px-4 btn-primary">글수정 </a></li> -->
<!--                 <li><a href="delete.jsp" class="btn py-3 px-4 btn-primary">글삭제 </a></li> -->
<!--                 <li><a href="list.jsp" class="btn py-3 px-4 btn-primary">글목록 </a></li> -->
<!--                 </ul> -->
<!--               </div> -->
<!--             </div> -->


<!--         </div> -->
      </div>
      </div>
    </section> <!-- .section -->

      <jsp:include page="../inc/bottom.jsp"></jsp:include>
    
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/jquery.timepicker.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/user_CheckForm.js"></script>
   
  </body>
</html>