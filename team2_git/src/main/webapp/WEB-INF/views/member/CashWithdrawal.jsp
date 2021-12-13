<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Meditative - Free Bootstrap 4 Template by Colorlib</title>
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
                  <h3>CREDIT 현금 인출</h3>
                  <hr>
                  <section class="ftco-section">
                     <div class="container">
                        <div class="row justify-content-center mb-5 pb-3">
                           <div class="col-md-12 heading-section ftco-animate text-center">
                              <h2 class="mb-1">TRAINER 계좌 정보</h2>
                           </div>
                        </div>
                     </div>
                     <div class="row">
                        <div class="col-md-4"></div>
                        <div class="services-2 ftco-animate d-flex w-100">
                           <div
                              class="icon d-flex justify-content-center align-items-center\">
                              <span class="flaticon-meditation"></span>
                           </div>
                           <div class="text text-left pl-4">
                              <h3>※ 유의 사항</h3>
                              <p>관리자 확인 후 현금으로 전환됩니다. (약 5~7일 정도 소요 예정)</p>
                           </div>
                        </div>
                        <div class="services-2 ftco-animate d-flex w-100">
                           <div
                              class="icon d-flex justify-content-center align-items-center\">
                              <span class="flaticon-meditation"></span>
                           </div>

                           <div class="text text-left pl-4">
                              <h3>※ 이용 정보</h3>
                              <p>현금 전환은 4일 후 오전 10시 부터 오후5시까지 가능</p>
                              <p>트레이너의 책임있는 사유로 취소한 경우 환불 불가</p>
                              <p>○ 사용예정일 3일 전에 취소 또는 결제 당일 취소 크레딧 전액 고객 환불예정</p>
                              <p>○ 사용예정일 2일 전에 취소 예약금의 10% 공제 후 고객 환불예정</p>
                              <p>○ 사용예정일 1일 전에 취소 예약금의 20% 공제 후 고객 환불예정</p>
                              <p>○ 사용예정일 당일 취소 또는 미사용자 예약금의 30% 공제 후 고객 환불예정</p>
                              <section class="ftco-section">
                                 <div class="container">
                                    <div class="row justify-content-center mb-5 pb-3">
                                       <label><h3>계좌 정보</h3></label> <input type="text" name="u_name"
                                          id="u_name" class="form-control" placeholder="은행명을 반드시 입력해주세요.">
                                    </div>

                                    <div
                                       class="col-md-12 heading-section ftco-animate text-center">
                                       <a
                                          href="${pageContext.request.contextPath}/index"><img
                                          alt=""
                                          src="${pageContext.request.contextPath}/resources/images/confirm.png"
                                          id="confirm"></a>
                                    </div>
                                 </div>
                              </section>
                           </div>
                        </div>
                     </div>
                  </section>

               </div>
            </div>
         </div>
      </div>
   </section>

   <!-- .section -->

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