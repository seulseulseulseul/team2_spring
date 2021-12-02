<%@page import="java.text.SimpleDateFormat"%>
<%@page import="center.CenterDAO"%>
<%@page import="center.CenterDTO"%>
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

    <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-3 bread">문의사항</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>문의사항</span></p>
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
	          	<%
	          	CenterDAO centerDAO = new CenterDAO();
	          	//한화면에 보여줄 글개수 5개 설정
				int pageSize=3;
				//페이지 번호 가져오기
				String pageNum = request.getParameter("pageNum");
				//페이지 번호가 없으면 -> 1
				if(pageNum==null){
					pageNum="1";
				}
				
				//시작하는 행번호 구하기
				int currentPage=Integer.parseInt(pageNum);
				int startRow=(currentPage-1)*pageSize+1;
				//끝나는 행번호 구하기
				int endRow=startRow+pageSize-1;
				
				//메서드 호출
				//getBoardList(startRow,pageSize)
				//select * from board order by num desc limit 시작행-1, 가져올개수
				List<CenterDTO> centerList = centerDAO.getCenterList(startRow, pageSize);
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy.MM.dd");
				for(int i=0;i<centerList.size();i++){
					//boardList 한칸접근 게시판 한개 들고 오기
					// BoardDTO boardDTO = (BoardDTO)boardList.get(i);
					CenterDTO centerDTO = (CenterDTO)centerList.get(i);
	          	%>
	          	
	          	<div class="col-md-12 d-flex ftco-animate">
		          	<div class="blog-entry blog-entry-2 justify-content-end d-md-flex w-100">
		              <div class="text pl-md-4 ml-md-2 pt-4">
		              	<div class="meta">
		                  <div><a href="#"><%=dateFormat.format(centerDTO.getDate())%></a></div>
		                  <div><a href="#"><%=centerDTO.getU_num() %></a></div>
		                  <% 
		                  if(centerDAO.isReply(centerDTO.getB_num())==0){
		                	%>
		                	<div><a href="#" class="meta-chat"><span class="icon-chat"></span>답변대기</a></div>
		                <%
		                  }else{
		                  %>
		                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span>답변완료</a></div>
		                  <% }%>
		                </div>
		                <%if(centerDTO.getSecret()==0) {%>
		                <h3 class="heading mt-2"><a href="content.jsp?b_num=<%=centerDTO.getB_num()%>"><%=centerDTO.getB_title() %></a></h3>
		                <%}else{ %>
		                <h3 class="heading mt-2"><a href="content.jsp?b_num=<%=centerDTO.getB_num()%>">비밀글 입니다.</a></h3>
		                <%} %>
		                <p><a href="content.jsp?b_num=<%=centerDTO.getB_num()%>" class="btn btn-outline-primary">글 보기</a></p>
		              </div>
		            </div>
		          </div>
		            
		          <%} %>

						<div class="row mt-5">
			        <div class="col">
			          <div class="block-27">
			            <ul>
		          <%
					//한페이지에 보여줄 페이지 개수 설정
					int pageBlock=3;
		          	//총 글 개수
					int count = centerDAO.getCenterCount();
					//시작하는 페이지 번호
					int startPage=(currentPage-1)/pageBlock*pageBlock+1;
					//끝나는 페이지 번호
					int endPage=startPage+pageBlock-1;
					//전체 글 페이지 수 구하기
					int pageCount=count/pageSize+(count%pageSize==0?0:1);
					if(endPage>pageCount){
						//끝나는 페이지번호 = 전체 글 페이지 수
						endPage=pageCount;
					}
					//이전 1 안보임 11 21 .. 보임
					if(startPage > pageBlock){
					%>
			              <li><a href="list.jsp?pageNum=<%=startPage-pageBlock%>">&lt;</a></li>
					<%
					}
					//1~10
					for(int i=startPage;i<=endPage;i++){
					%>
			              <li class="active"><a href="list.jsp?pageNum=<%=i%>"><%=i%></a></li>
					<% } 
					
					//다음 끝페이지번호 10 전체페이지개수 50 => 다음에 글이 있음
					if(endPage < pageCount){
					%>
			              <li><a href="list.jsp?pageNum=<%=startPage+pageBlock%>">&gt;</a></li>
					<% }%>
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
                <li><a href="insert.jsp" class="btn py-3 px-4 btn-primary">글쓰기 </a></li>
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