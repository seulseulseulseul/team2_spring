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

    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">

    <link rel="stylesheet" href="../css/aos.css">

    <link rel="stylesheet" href="../css/ionicons.min.css">

    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/style.css">
  </head>
  <body>
  <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- END nav -->

    <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-3 bread">회원 로그인</h1>
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
                <h4>유저 로그인</h4>
							<form action="user_loginPro.jsp" id="join" method="post">
								<div class="form-group">
									<label>ID</label>
									<input type="text" name="u_id" id="u_id" class="form-control">
								</div>
								<div class="form-group">
									<label class="fw">Password
									</label>
									<input type="password" name="u_pass" id="u_pass" class="form-control">
								</div>
								<div class="form-group text-right">
									<button class="btn btn-primary btn-block">Login</button>
								</div>
								<div class="form-group text-center">
									<span class="text-muted">아이디가 없으신가요?</span><br> 
									<a href="user_register.jsp">유저 회원가입</a><br>
									<a href="trainer_register.jsp">트레이너 회원가입</a>
								</div>
								<div class="title-line">
									or
								</div>
              	<a href="#" class="btn btn-social btn-block facebook"><i class="ion-social-facebook"></i> Login with Facebook</a>
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


  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/bootstrap-datepicker.js"></script>
  <script src="../js/jquery.timepicker.min.js"></script>
  <script src="../js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
    
  </body>
</html>