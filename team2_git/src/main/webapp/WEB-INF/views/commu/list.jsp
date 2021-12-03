<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>게시판 - 글 목록</title>
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
            <h1 class="mb-3 bread">커뮤니티</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>커뮤니티</span></p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
          	<div class="row">
<!-- 		              <a href="blog-single.html" class="block-20" style="background-image: url('../images/image_1.jpg');"> -->
<!-- 		              </a> -->
	          	<c:forEach var="commuDTO" items="${commuList }">
<%-- 				   <tr><td>${commuDTO.num }</td> --%>
<%-- 				      <td>${commuDTO.name }</td> --%>
<%-- 				      <td><a href="${pageContext.request.contextPath}/board/content?num=${boardDTO.num }"> --%>
<%-- 				      ${commuDTO.subject }</a></td> --%>
<%-- 				      <td>${commuDTO.date }</td> --%>
<%-- 				      <td>${commuDTO.readcount }</td> --%>
<!-- 				   </tr> -->
				
	          	
	          	<div class="col-md-12 d-flex ftco-animate">
		          	<div class="blog-entry blog-entry-2 justify-content-end d-md-flex w-100">
		              <div class="text pl-md-4 ml-md-2 pt-4">
		              	<div class="meta">
		                  <div>${commuDTO.getDate() }</div>
<%-- 		                  <div>${ }</div> --%>
							<div>${commuDTO.getNic() }</div>
		                </div>	                
		              </div>
		            </div>
		          </div>
				</c:forEach>

						<div class="row mt-5">
			        <div class="col">
			          <div class="block-27">
			            <ul>
			            <c:if test="${pageDTO.startPage > pageDTO.pageBlock }">
						<li><a href="${pageContext.request.contextPath}/commu/list?pageNum=${pageDTO.startPage-pageDTO.pageBlock}">&lt;</a></li>
						</c:if>
						<c:forEach var="i" begin="${pageDTO.startPage }" end="${pageDTO.endPage }" step="1">
						<li class="active"><a href="${pageContext.request.contextPath}/commu/list?pageNum=${i}">${i} </a></li>
						</c:forEach>
			            <c:if test="${pageDTO.endPage < pageDTO.pageCount }">
			            <li><a href="${pageContext.request.contextPath}/commu/list?pageNum=${pageDTO.startPage+pageDTO.pageBlock}">&gt;</a></li>
			            </a>
			            </c:if>
			            </ul>
			          </div>
			        </div>
			 	 </div>
		</div> <!-- .col-md-8 -->
		
         </div>
		<div class="col-lg-4 sidebar ftco-animate">
		   <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                	<div class="icon">
	                  <span class="icon-search"></span>
	                </div>
                  <input type="text" class="form-control" placeholder="검색기능 구현">
                </div>
              </form>
            </div>
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <ul>
                <li><a href="${pageContext.request.contextPath}/commu/insert" class="btn py-3 px-4 btn-primary">글쓰기 </a></li>
                <li><a href="${pageContext.request.contextPath}/commu/list" class="btn py-3 px-4 btn-primary">글목록 </a></li>
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