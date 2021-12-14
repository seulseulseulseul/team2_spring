<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>우리 동네 트레이너</title>
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
            <h1 class="mb-3 bread">관리자 페이지</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath }/member/user_list">회원리스트</a></span> 
            <span class="mr-2"><a href="${pageContext.request.contextPath}/member/trainer_list">트레이너리스트</a></span>
            <span class="mr-2"><a href="${pageContext.request.contextPath}/center/center_list">문의사항미답변</a></span></p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
          	<div class="row">

	          	<c:forEach var="centerDTO" items="${centerList }">
	          	<div class="col-md-12 d-flex ftco-animate">
		          	<div class="blog-entry blog-entry-2 justify-content-end d-md-flex w-100">
		              <div class="text pl-md-4 ml-md-2 pt-4">
		              	<div class="meta">
		                  <div><a href="#"><fmt:formatDate value="${centerDTO.b_date}" pattern="yyyy.MM.dd"/></a></div>
		                  <c:choose>
		                  <c:when test="${!empty centerDTO.u_id}">
		                  <div><a href="#">회원&nbsp;${centerDTO.u_id}</a></div>
		                  </c:when>
		                  <c:otherwise>
		                  <div><a href="#">트레이너&nbsp;${centerDTO.t_id}</a></div>
		                  </c:otherwise>
		                  </c:choose>
		               
		                	<div><a href="#" class="meta-chat"><span class="icon-chat"></span>답변대기</a></div>
		                  
		                </div>


		                <h3 class="heading mt-2"><a href="${pageContext.request.contextPath}/center/content?b_num=${centerDTO.b_num}">${centerDTO.b_title}</a></h3>
		                 <p><a href="${pageContext.request.contextPath}/center/content?b_num=${centerDTO.b_num}" class="btn btn-outline-primary">답변 작성하러 가기</a></p>
		                
		               
		              </div>
		            </div>
		          </div>
		            </c:forEach>
		</div> <!-- .col-md-8 -->
		
         </div>
		<div class="col-lg-4 sidebar ftco-animate">

            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <ul>

                <li><a href="${pageContext.request.contextPath}/center/list" class="btn py-3 px-4 btn-primary">글목록 </a></li>
                </ul>
              </div>
            </div>
         </div>
         </div>
         </div>
		</section>
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