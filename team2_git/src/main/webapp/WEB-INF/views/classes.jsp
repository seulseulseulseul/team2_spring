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
  </head>
  <body>
  		<jsp:include page="inc/top.jsp"></jsp:include>
    <!-- END nav -->

    <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-3 bread">Class Program</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Classes</span></p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
    	<div class="container">
        <div class="row">
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-1.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Private &amp; Group Lessons</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-2.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga for Pregnant</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-3.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga for Beginners</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-4.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga Barre</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-5.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga Core</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-6.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga Restore</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        </div>
    	</div>
    </section>
    
   <jsp:include page="inc/bottom.jsp"></jsp:include>
    
  

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