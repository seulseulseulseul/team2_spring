<%@page import="java.util.List"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
           <h1 class="mb-3 bread">커뮤니티</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="${pageContext.request.contextPath}/commu/list">커뮤니티</a></span> <span>${commuDTO.c_num}번 글 </span></p>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-8 ftco-animate justify-content-center">
          <div>${commuDTO.nic} | ${commuDTO.date}</div>
          <c:if test="${!empty commuDTO.file}">
          	<div><a href="${pageContext.request.contextPath}/resources/commuUpload/${commuDTO.file}" download>${commuDTO.file}</a></div>
          </c:if>
		  <div>조회 ${commuDTO.readcount}</div>
            <h2 class="mb-3">${commuDTO.subject}</h2>
            <p class="mb-3">${commuDTO.content}</p>
          	<div class="form-group">
          		<c:if test="${(commuDTO.u_id eq sessionScope.u_id) or (commuDTO.u_id eq sessionScope.t_id) }">
         	 		<input type="button" value="글수정" class="btn py-3 px-4 btn-primary" onclick="location.href='${pageContext.request.contextPath}/commu/update?c_num=${commuDTO.c_num}'">
         	 		<input type="button" value="글삭제" class="btn py-3 px-4 btn-primary" onclick="if(confirm('정말로 삭제하시겠습니까?'))location.href='${pageContext.request.contextPath}/commu/deletePro?c_num=${commuDTO.c_num}'">
         	 	</c:if>
         	 </div>

	 <div class="pt-5 mt-5">
              <h3 class="mb-3">댓글</h3>
              <ul class="comment-list">
        	<c:forEach var="replyDTO" items="${replyList}">
                <li class="comment" style="margin-left:${replyDTO.depth*60}px">
                  <div class="vcard bio">
                     <img src="${pageContext.request.contextPath}/resources/images/person_${(replyDTO.r_num mod 5)+1}.png" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <div class="meta">${replyDTO.nic} | ${replyDTO.date}</div>
                    <p>${replyDTO.content}</p>
                    <c:if test="${(replyDTO.u_id eq sessionScope.u_id) or (replyDTO.u_id eq sessionScope.t_id) }">
                    
                    
                    <div class="dropdown1">
						<button class="reply" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">댓글 수정</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						  <h3 class="mb-3">댓글 등록</h3>
			              <form action="${pageContext.request.contextPath}/commu/updateReply" class="bg-light p-4" method="post">
				        	<input type="hidden" name="c_num" value="${commuDTO.c_num}">
				            <input type="hidden" name="r_num" value="${replyDTO.r_num}">
			       			<div class="form-group">
							  <label for="content">내용</label>
			                  <textarea name="content" cols="30" rows="3" class="form-control"></textarea>
							</div>
			                <div class="form-group">
			                  <input type="submit" value="작성" class="btn py-3 px-4 btn-primary">
			                  <input type="reset" value="취소" class="btn py-3 px-4 btn-primary">
			                </div>
			              </form>	
						</div>
					  </div>
					  
					 <div class="dropdown">
						<a><button class="reply" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" 
						onclick="if (confirm('정말로 삭제하시겠습니까?')){location.href='${pageContext.request.contextPath}/commu/deleteReply?r_num=${replyDTO.r_num}&c_num=${commuDTO.c_num}';}">댓글 삭제</button></a>
				
					  </div>                    	
	                    	
                  	</c:if>
                    <c:if test="${sessionScope.id ne null }">
<!--                      드롭다운 		-->

                      <div class="dropdown">
						<button class="reply" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">댓글 작성</button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						  <h3 class="mb-3">댓글 등록</h3>
			              <form action="${pageContext.request.contextPath}/commu/insertReply2" class="bg-light p-4" method="post">
				        	<input type="hidden" name="c_num" value="${commuDTO.c_num}">
				            <input type="hidden" name="r_num" value="${replyDTO.r_num}">
			       			<div class="form-group">
							  <label for="content">내용</label>
			                  <textarea name="content" cols="30" rows="3" class="form-control"></textarea>
							</div>
			                <div class="form-group">
			                  <input type="submit" value="작성" class="btn py-3 px-4 btn-primary">
			                  <input type="reset" value="취소" class="btn py-3 px-4 btn-primary">
			                </div>
			              </form>	
						</div>
					  </div>
					  <!--                      드롭다운 		-->
					  
					  
					</c:if>
                  </div>
                </li>
			 </c:forEach>
             </ul>
      </div>
    	<div class="row mt-5">
	        <div class="col">
	          <div class="block-27">
	            <ul>
	            <c:if test="${pageDTO.startPage > pageDTO.pageBlock}">
	              <li><a href="${pageContext.request.contextPath}/commu/content?c_num=${commuDTO.c_num }&pageNum=${pageDTO.startPage-pageDTO.pageBlock}">&lt;</a></li>
				</c:if>
	            <!-- var: 변수명. begin: 시작. end: 끝. step:증가  -->
				<c:forEach var="i" begin="${pageDTO.startPage}" end="${pageDTO.endPage}" step="1">
				  <li class="active"><a href="${pageContext.request.contextPath}/commu/content?c_num=${commuDTO.c_num }&pageNum=${i }">${i }</a></li>
				</c:forEach>
				<c:if test="${pageDTO.endPage < pageDTO.pageCount}">
				  <li><a href="${pageContext.request.contextPath}/commu/content?c_num=${commuDTO.c_num }&pageNum=${pageDTO.startPage+pageDTO.pageBlock}">&gt;</a></li>
				</c:if>
	            </ul>
	          </div>
	        </div>
	 	 </div>

	 <div class="comment-form-wrap pt-5">
                <h3 class="mb-3">댓글 등록</h3>
                <form action="${pageContext.request.contextPath}/commu/insertReply" class="bg-light p-4" method="post">
                <input type="hidden" name="c_num" value="${commuDTO.c_num}">
                  <div class="form-group">
                    <label for="content">내용</label>
                    <textarea name="content" cols="30" rows="3" class="form-control"></textarea>
                  </div>
                  <div class="form-group">
                    <input type="submit" value="작성" class="btn py-3 px-4 btn-primary">
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
		        <li><a href="${pageContext.request.contextPath}/commu/list" class="btn py-3 px-4 btn-primary">글목록 </a></li>
		      </ul>
		    </div>
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