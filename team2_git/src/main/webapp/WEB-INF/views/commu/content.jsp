<%@page import="commu.CommuDTO"%>
<%@page import="commu.CommuDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
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
            <h1 class="mb-3 bread">커뮤니티</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="blog.html">Blog</a></span> <span>커뮤니티</span></p>
          </div>
        </div>
      </div>
    </section>
	<%
	// 날짜 형식 설정
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
	// request내장객체에서 게시글 번호 받아오기
	int num = Integer.parseInt(request.getParameter("num"));
	//CommuDAO 객체생성
	CommuDAO commuDAO = new CommuDAO();
	// 게시글 정보 가져오기
	CommuDTO commuDTO = commuDAO.getBoard(num);
	//조회수 증가 update board set readcount=readcount+1 where num=?
	commuDAO.updateReadcount(num);
	%>
    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate justify-content-center">
          <div><%= dateFormat.format(commuDTO.getDate()) %></div>
		  <div><%= commuDTO.getU_id()%></div>
            <h2 class="mb-3"><%=commuDTO.getSubject() %></h2>
            <p><%=commuDTO.getContent()%>
            </p>
          	<div class="form-group">
          	<%
          	// 세션 id값 가져오기
			String id=(String)session.getAttribute("id");
			//세션값이 있으면 글쓴이와 로그인(세션값) 사람이 일치하면 글수정, 글삭제 버튼 보이기
			if(id!=null){
				// 로그인  글쓴이 비교 일치
				if(id.equals(commuDTO.getU_id())){
					%>
			<input type="button" value="글수정" class="btn" 
			   onclick="location.href='updateForm.jsp?num=<%=commuDTO.getNum()%>'">
			<input type="button" value="글삭제" class="btn" 
			   onclick="location.href='deleteForm.jsp?num=<%=commuDTO.getNum()%>'">		
					<%
				}
			}
			%>
         	 	<input type="button" value="글목록" class="btn py-3 px-4 btn-primary" onclick="location.href='list.jsp'">
            </div>
       	  </div>
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