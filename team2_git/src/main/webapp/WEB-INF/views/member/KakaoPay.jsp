<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>우리 동네 트레이너</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">

$( document ).ready(function() {


	
	$("#apibtn2").click(function() {
		
		var flexCheckDefault = $('input[name=flexCheckDefault]:checked').val();

		var CashDepositLocation = "";
		CashDepositLocation+="${pageContext.request.contextPath}/member/CashDeposit";
		CashDepositLocation+=flexCheckDefault;
	
		location.href=CashDepositLocation;
		
	});
	
});

</script>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700&display=swap"
	rel="stylesheet">

<link
	href="https://fonts.googleapis.com/css?family=EB+Garamond:400,400i,500,500i,600,600i,700,700i&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/magnific-popup.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/aos.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/ionicons.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/jquery.timepicker.css">


<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/flaticon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/icomoon.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">

<!--     카카오페이 API -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#apibtn').click(function() {
			$.ajax({
				//                  url:kakaoUrl,
				url : '${pageContext.request.contextPath}/kakaopay',
				dataType : 'json',
				success : function(data) {
					var box = data.next_redirect_pc_url;
					location.href = box;
				},
				error : function(error) {
					alert(error);
				}
			});
		});

	});
</script>
<!--    카카오페이 API 끝 -->

</head>
<body>
	<jsp:include page="../inc/top.jsp"></jsp:include>
	<!-- END nav -->



	<!--     </section> -->

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					<div class="comment-form-wrap pt-5">
						<div class="">
							<h4>Personal Trainer 회당 이용 금액 (15% Off Each + Every Coupon)</h4>
							<hr>
							<h4>
								※ 상품 선택 후 <img alt=""
									src="${pageContext.request.contextPath}/resources/images/kakaopay_1.png" width="60px" height="27px"> 또는 <img alt=""
									src="${pageContext.request.contextPath}/resources/images/pay.png" width="60px" height="27px"> 으로 결제하여 주시기 바랍니다.
							</h4>

<%-- 								<a href="${pageContext.request.contextPath}/kakaopay"> --%>
									<p style="font-size: 40px;"><img alt=""
								src="${pageContext.request.contextPath}/resources/images/credit_1.png"
								width="180px" height="180px" id="credit_1">
											&nbsp;&nbsp;1회 50,000원 </p>
											<div class="form-check">
											  <input class="form-check-input" type="radio" value="1" id="flexCheckDefault" name="flexCheckDefault" style="width: 20px; height: 20px;">
											  <label class="form-check-label" for="flexCheckDefault" style="font-size: 20px;">
											    &nbsp;구매하기
											  </label>
											</div>
								<br> 
								
<%-- 								<a href="${pageContext.request.contextPath}/kakaopay"> --%>
									<p style="font-size: 40px;"><img alt=""
								src="${pageContext.request.contextPath}/resources/images/credit_3.png"
								width="180px" height="180px" id="credit_3">
											&nbsp;&nbsp;3회  120,000원 discounted</p>
										<div class="form-check">
											  <input class="form-check-input" type="radio" value="2" id="flexCheckDefault2" name="flexCheckDefault" style="width: 20px; height: 20px;">
											  <label class="form-check-label" for="flexCheckDefault2" style="font-size: 20px;">
											    &nbsp;구매하기
											  </label>
											</div>
								
								<br> 
								
<%-- 								<a href="${pageContext.request.contextPath}/kakaopay"> --%>
								<p style="font-size: 40px;"><img alt=""
								src="${pageContext.request.contextPath}/resources/images/credit_10.png"
								width="180px" height="180px" id="credit_10">
											&nbsp;&nbsp;10회 400,000원 discounted</p>
											<div class="form-check" >
											  <input class="form-check-input" type="radio" value="3" id="flexCheckDefault3" name="flexCheckDefault" style="width: 20px; height: 20px;">
											  <label class="form-check-label" for="flexCheckDefault3" style="font-size: 20px;">
											    &nbsp;구매하기
											  </label>
											</div>
								
								<br> <br>


							<!-- <!--                 		카카오페이로 결제 -->
							<a href="${pageContext.request.contextPath}/kakaopay"><img
								alt=""
								src="${pageContext.request.contextPath}/resources/images/kakaopay_2.png"
								id="apibtn"
								width="120px" height="50px"></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


							<!-- 						무통장으로 결제 ${pageContext.request.contextPath}/member/CashDeposit -->
								<a><img
									alt=""
									src="${pageContext.request.contextPath}/resources/images/pay.png"
									id="apibtn2"
									width="120px" height="50px"></a>
							
							<form
								action="${pageContext.request.contextPath}/member/user_loginPro"
								method="post">
								<!-- 								<div class="form-group text-right"> -->
								<!-- 									<input type="button" value="카카오페이로 결제" class="btn btn-primary btn-block" id="apibtn" name="apibtn"> -->
								<!-- 								</div> -->
								<!-- 								환불정책 -->

								<div>
									<div class="text text-left pl-4">
										<div>
											<br> <br>
											<h3>※ 환불 정책</h3>
											<hr>
											<p>이용 당일 오전 10시 이전까지 가능(10시 이후 취소, 수정 불가능)</p>
											<p>예약자의 책임있는 사유로 취소한 경우</p>
											<p>○ 사용예정일 3일 전에 취소 또는 결제 당일 취소 예약금 전액 환불</p>
											<p>○ 사용예정일 2일 전에 취소 예약금의 10% 공제 후 환불</p>
											<p>○ 사용예정일 1일 전에 취소 예약금의 20% 공제 후 환불</p>
											<p>○ 사용예정일 당일 취소 또는 미사용자 예약금의 30% 공제 후 환불</p>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="../inc/bottom.jsp"></jsp:include>




	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.easing.1.3.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.waypoints.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.stellar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.animateNumber.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.timepicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/google-map.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>

</body>
</html>
