<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>우리 동네 트레이너</title>
<!--     testtest -->
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
  <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
                        <h1 class="mb-3 bread">마이 페이지</h1>
          </div>
        </div>
      </div>
    </section>

	<section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">트레이너 정보 수정</h3>
<%-- 							<form action="${pageContext.request.contextPath}/member/updatePro" method="post"> --%>
							<form action="${pageContext.request.contextPath}/member/trainer_updatePro" id="join" method="post">
								<div class="form-group">
									<label>사용자ID</label>
<%-- 									아이디 : <input type="text" name="id" value="${sessionScope.id }" readonly><br> --%>
									<input class="form-control" type="text" name="t_id" id="t_id" value="${sessionScope.t_id }" readonly>
								</div>
								<div class="form-group">
									<label>이름</label>
<!-- 									<input type="text" name="name" id="t_name" class="form-control"> -->
									<input class="form-control" type="text" name="t_name" id="t_name" value="${trainer_memberDTO.t_name }">
								</div>
								<div class="form-group">
									<label class="fw">비밀번호</label>
<!-- 									<input type="password" name="password" id="t_pass" class="form-control"> -->
									<input class="form-control" type="password" name="t_pass" id="t_pass" placeholder="비밀번호를 입력하세요.">
								</div>
								<div class="form-group">
									<label>트레이너 닉네임</label>
<!-- 									<input type="text" name="nic" id="t_nic" class="form-control"> -->
									<input class="form-control" type="text" name="t_nic" id="t_nic" value="${trainer_memberDTO.t_nic }">
								</div>
								<div class="form-group">
								<label>우편번호</label>
								<button type="button" onclick="searchPostCode();" class="btn btn-primary">우편번호 검색</button><br>
<!-- 								<input type="text" name="postcode" id="t_postcode" class="form-control"> -->
								<input class="form-control" type="text" name="t_postcode" id="t_postcode" value="${trainer_memberDTO.t_postcode }">
							
								</div>
								<div class="form-group">
								<label>헬스장위치(주소)</label>
									<input type="text" name="t_address" id="t_address" class="form-control" value="${trainer_memberDTO.t_address }" readonly>
								</div>
								<div class="form-group">
								<label>헬스장 상세주소</label>
<!-- 									<input type="text" name="detailAddress" id="t_detailAddress" class="form-control"><br> -->
								<input class="form-control" type="text" name="t_detailAddress" id="t_detailAddress" value="${trainer_memberDTO.t_detailAddress }">
								<input type="hidden" name="t_extraAddress" id="t_extraAddress" value="${trainer_memberDTO.t_extraAddress }">
								<input type="hidden" name="t_jibunAddress" id="t_jibunAddress" value="">
								</div>
								<div class="form-group">
									<label>전화번호</label>
<!-- 									<input type="text" name="phone" id="t_phone" class="form-control"> -->
									<input type="text" name="t_phone" id="t_phone" class="form-control" value="${trainer_memberDTO.t_phone }">
								
								</div>
								<div class="form-group">
									<label>Email</label>
<!-- 									<input type="email" name="email" id="t_email" class="form-control"> -->
									<input class="form-control" type="email" name="t_email" id="t_email" value="${trainer_memberDTO.t_email }">
								</div>
									
								<div class="form-group text-right">
									<button class="btn btn-primary btn-block" type="submit" onclick="return trainer_CheckForm();">정보 수정</button>
<!-- 									<input type="submit" value="수정" class="submit"> -->
								</div>
							</form>
						</div>
					</div>
					
<!-- 			트레이너 왼쪽메뉴 -->
        <jsp:include page="../inc/trainer_side.jsp"></jsp:include>
        
			</div>
		</section>


     <jsp:include page="../inc/bottom.jsp"></jsp:include>
    
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/addressapi.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/trainer_CheckForm.js"></script>
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