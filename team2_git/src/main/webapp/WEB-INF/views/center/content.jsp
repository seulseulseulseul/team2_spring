<%@page import="java.util.List"%>
<%@page import="center.CenterDTO"%>
<%@page import="center.CenterDAO"%>
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
            <h1 class="mb-3 bread">문의내역</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="blog.html">Blog</a></span> <span>Blog Single</span></p>
          </div>
        </div>
      </div>
    </section>
	<%
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
	CenterDAO centerDAO = new CenterDAO();
	int b_num = Integer.parseInt(request.getParameter("b_num")) ;
	CenterDTO centerDTO = centerDAO.getCenter(b_num);
	%>
    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate justify-content-center">
          <div><%= dateFormat.format(centerDTO.getDate())%></div>
		  <div><%= centerDTO.getU_num()%></div>
            <h2 class="mb-3"><%=centerDTO.getB_title() %></h2>
            <p><%=centerDTO.getB_content()%>
            </p>
          	<div class="form-group">
         	 	<input type="button" value="글수정" class="btn py-3 px-4 btn-primary" onclick="location.href='update.jsp'">
         	 	<input type="button" value="글목록" class="btn py-3 px-4 btn-primary" onclick="location.href='list.jsp'">
         	 	<input type="button" value="글삭제" class="btn py-3 px-4 btn-primary" onclick="location.href='delete.jsp?b_num=<%=b_num%>'">
         	 </div>
        
<!--     답변 목록 -->
	 <div class="pt-5 mt-5">
              <h3 class="mb-5">답변</h3>
              <ul class="comment-list">
              <%
				//메서드 호출
				List<CenterDTO> replyList = centerDAO.getReplyList(b_num);
				for(int i=0;i<replyList.size();i++){
					centerDTO = (CenterDTO)replyList.get(i);
              %>
                <li class="comment">
                  <div class="vcard bio">
                    <img src="${pageContext.request.contextPath}/resources/images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h5><%=centerDTO.getB_title() %></h5>
                    <div class="meta"><%=dateFormat.format(centerDTO.getDate())%></div>
                    <p><%=centerDTO.getB_content() %></p>
                    <p><a href="deleteReply.jsp?b_num=<%=b_num%>&b_reply=<%=centerDTO.getB_reply()%>" class="reply">삭제</a></p>
                  </div>
                </li>
			<%} %>
              </ul>
      </div>
<!-- 	 답변 등록 -->
	 <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">답변 등록</h3>
                <form action="insertReply.jsp" class="bg-light p-4">
                <input type="hidden" name="b_num" value=<%=b_num%>>
                  <div class="form-group">
                    <label for="subject">제목 *</label>
                    <input type="text" class="form-control bg-white" name="b_title">
                  </div>
                  <div class="form-group">
                    <label for="content">내용</label>
                    <textarea name="b_content" id="b_content" cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="작성" class="btn py-3 px-4 btn-primary"
                    onclick="alert('답변이 등록되었습니다.')">
                    <input type="reset" value="취소" class="btn py-3 px-4 btn-primary">
                  </div>

                </form>
        </div>
        </div>
        </div>
      </div>
    </section> <!-- .section -->
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