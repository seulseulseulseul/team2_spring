<%@page import="com.itwillbs.domain.CommuDTO"%>
<%@page import="com.itwillbs.dao.CommuDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// request 객체에서 id값 가져오기
String u_id=(String)session.getAttribute("u_id");
String t_id=(String)session.getAttribute("t_id");
//세션값이 없으면 login.jsp 이동
if(u_id==null && t_id==null){
	response.sendRedirect("../member/login.jsp");
}
// request내장객체에서 게시글 번호 받아오기
int num=Integer.parseInt(request.getParameter("num"));
// CommuDAO 객체 생성
CommuDAO commuDAO=new CommuDAO();
// 본인이 작성한 글이 아니면 게시글로 리디렉트
if(commuDAO.numCheck(num, u_id, t_id) == null) {
	%>
	<script>
	alert("작성자만 수정할 수 있습니다."); 
	</script>
	<%
	response.sendRedirect("content.jsp?num=" + num);
}
//getBoard(num) 메서드 호출
CommuDTO commuDTO=commuDAO.getBoard(num);
%>
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
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span class="mr-2"><a href="blog.html">커뮤니티</a></span> <span>Blog Single</span></p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate">
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">글수정</h3>
                <form action="updatePro.jsp" class="bg-light p-4"enctype="multipart/form-data">
                  <input type="hidden" name="num" value="<%=commuDTO.getNum() %>">
                  <input type="hidden" name="u_id" value="<%=commuDTO.getU_id() %>">
                  <input type="hidden" name="t_id" value="<%=commuDTO.getT_id() %>">
                  <div class="form-group">
                    <label for="name">작성자 *</label>
                    <input type="text" value="<%=commuDTO.getNic() %>" class="form-control" id="email" readonly>
                  </div>
                  <div class="form-group">
                    <label for="subject">제목 *</label>
                    <input type="text" name="subject" class="form-control bg-white" id="subject"
                    value="<%=commuDTO.getSubject() %>">
                  </div>
                  <div class="form-group">
                    <label for="content">글내용</label>
                    <textarea name="content" id="content" cols="30" rows="10" class="form-control">
                    <%=commuDTO.getContent() %>
                    </textarea>
                  </div>
                  <div class="form-group">
                    <label for="file">파일</label>
                    <input type="file" class="form-control" id="website">
                    <input type="hidden" name="oldfile" value="<%=commuDTO.getFile() %>">
                  </div>
                  <div class="form-group">
                    <input type="submit" value="수정" class="btn py-3 px-4 btn-primary">
                    <input type="reset" value="취소" class="btn py-3 px-4 btn-primary">
                  </div>

                </form>
              </div>
            </div>
			<!-- .col-md-8 -->
          <div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <ul>
                <li><a href="/center/update" class="btn py-3 px-4 btn-primary">글수정 </a></li>
                <li><a href="#" class="btn py-3 px-4 btn-primary">글삭제 </a></li>
                <li><a href="/center/list" class="btn py-3 px-4 btn-primary">글목록 </a></li>
                </ul>
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