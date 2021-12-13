<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>로그인 선택창</title>
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
  </head>
  <body>
   <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- END nav -->

<!--     <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5"> -->
<!--       <div class="overlay"></div> -->
<!--       <div class="container"> -->
<!--         <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"> -->
<!--           <div class="col-md-9 ftco-animate text-center"> -->
<!--             <h1 class="mb-3 bread">로그인 선택창</h1> -->
<%--             <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/member/user_register">일반 회원가입</a></span> <span><a href="${pageContext.request.contextPath}/member/trainer_register">트레이너 회원가입</a></span></p> --%>
<!--           </div> -->
<!--         </div> -->
<!--       </div> -->
<!--     </section> -->


		<!--  style="background-image: url('../images/bg_3.jpg');"  -->
   <section class="hero-wrap hero-wrap-2" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
          	<div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          	<div class="sidebar-box ftco-animate">
              <div class="categories">
                <ul>
                <li><a href="${pageContext.request.contextPath}/member/user_login" class="btn py-3 px-4 btn-primary">회원 로그인 </a></li>
                <li><a href="${pageContext.request.contextPath}/member/trainer_login" class="btn py-3 px-4 btn-primary">트레이너 로그인 </a></li>
                </ul>
                
                <br> 
                <!-- 네이버 로그인 창으로 이동 --> 
                <div id="naver_id_login" style="text-align:center">
                <a href="${url}"> 
                <img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a>
                </div>
				<br>
              </div>
            </div>
            </div>
           </div>
          </div>
         </div>
		</section>
	


<!-- 		              <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_1.jpg');"> -->
<!-- 		              </a> -->
	         
	           

<!-- 						<div class="row mt-5"> -->
<!-- 			        <div class="col"> -->
<!-- 			          <div class="block-27"> -->
<!-- 			            <ul> -->
		        
<!-- 			          </div> -->
<!-- 			        </div> -->
<!-- 			 	 </div> -->
<!-- 		</div> .col-md-8 -->
		
<!--          </div> -->
<!-- 		<div class="col-lg-4 sidebar ftco-animate"> -->
<!-- 		   <div class="sidebar-box"> -->
<!--               <form action="#" class="search-form"> -->
<!--                 <div class="form-group"> -->
<!--                 	<div class="icon"> -->
<!-- 	                  <span class="icon-search"></span> -->
<!-- 	                </div> -->
<!--                   <input type="text" class="form-control" placeholder="검색기능 구현"> -->
<!--                 </div> -->
<!--               </form> -->
<!--             </div> -->
<!--             <div class="sidebar-box ftco-animate"> -->
<!--               <div class="categories"> -->
<!--                 <ul> -->
<%--                 <li><a href="${pageContext.request.contextPath}/member/user_register" class="btn py-3 px-4 btn-primary">유저 회원가입 </a></li> --%>
<%--                 <li><a href="${pageContext.request.contextPath}/member/trainer_register" class="btn py-3 px-4 btn-primary">트레이너 회원가입 </a></li> --%>
<!--                 </ul> -->
<!--               </div> -->
<!--             </div> -->
<!--          </div> -->

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
    
  </body>
</html>