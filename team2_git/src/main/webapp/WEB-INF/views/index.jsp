<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
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
    
    <script type="text/javascript">

	function submitCheck(myForm) {
		//이름을 2-5자 사이로 한글로 입력했는지 판단하는 정규표현식(규칙)
		var reg1 = /^[가-힣]{2,5}$/;
		var value = myForm.t_dong.value;
		var result = reg1.test(value);
		console.log(result);
		if( !result ) {
			alert("잘못된 동이름입니다.");
			myForm.t_dong.focus();
			return false;
		}
	}

	</script>


    <section class="ftco-section bg-light">
			<div class="container">
				<h1 class="mb-1">득근 보장 트레이너 추천!</h1> <br><br>
				<div class="row">
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/images/gallery-4.jpg;"></div>
							<div class="text mt-4">
								<h3 class="mb-4">모니카 트레이너</h3>
<!-- 								<p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p> -->
								<p><a href="#" class="btn btn-white px-4 py-3"> Learn more <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/images/gallery-3.jpg);"></div>
							<div class="text mt-4">
								<h3 class="mb-4">허니제이 트레이너</h3>
<!-- 								<p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p> -->
								<p><a href="#" class="btn btn-white px-4 py-3"> Learn more <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/images/gallery-5.jpg);"></div>
							<div class="text mt-4">
								<h3 class="mb-4">노제 트레이너</h3>
<!-- 								<p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p> -->
								<p><a href="#" class="btn btn-white px-4 py-3"> Learn more <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/images/gallery-7.jpg);"></div>
							<div class="text mt-4">
								<h3 class="mb-4">가비 트레이너</h3>
<!-- 								<p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p> -->
								<p><a href="#" class="btn btn-white px-4 py-3"> Learn more <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
<!-- 		</section> -->


			<hr>
         
<!--           <section class="ftco-section bg-light"> -->
<!--           <section class="login first grey"> -->
			<div class="container">
				<div class="box-wrapper">				
					<div class="box box-border">
						<div class="box-body"> <br>
						 <h1 class="mb-1">우리 동네 트레이너를 검색 해 보세요!</h1> <br><br>
				          <form action="${pageContext.request.contextPath}/map" method="get" onsubmit="return submitCheck(this);">
							<input type="text" name="t_dong" id="t_dong" class="form-control" placeholder="&nbsp;동을 입력해주세요. 예) 부전동, 연산동" width="200px" > <br>
							<input type="submit" value="우리 동네 트레이너 검색" id="btn" class="btn btn-primary">
					   	 </form>
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