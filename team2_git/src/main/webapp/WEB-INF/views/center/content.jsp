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
                        <h1 class="mb-3 bread">고객센터</h1>
            <p class="breadcrumbs"> <span>문의사항을 남겨주세요. 관리자가 확인 후 답변드립니다.</span></p>
          </div>
        </div>
      </div>
    </section>
	<%
// 	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분");
	//dateFormat.format(centerDTO.getDate())
	%>
   <section class="login first grey">
			<div class="container">
				<div class="box-wrapper">				
					<div class="box box-border">
						<div class="box-body">
						<h3 class="mb-5">&nbsp;</h3>
          <div><fmt:formatDate value="${centerDTO.b_date}" pattern="yyyy년 MM월 dd일"/></div>
		  <div>${centerDTO.u_id}</div>
            <h2 class="mb-3">${centerDTO.b_title}</h2>
            <p>${centerDTO.b_content}
            </p>
          	<div class="form-group">
         	 	<input type="button" value="글목록" class="btn py-3 px-4 btn-primary" onclick="location.href='${pageContext.request.contextPath}/center/list'">
<!-- 				글쓴 사람 본인만 수정,삭제 가능하도록 -->

				<c:if test="${ (replyDTO.u_id eq sessionScope.u_id) or (replyDTO.u_id eq sessionScope.t_id)}">
         	 		<input type="button" value="글수정" class="btn py-3 px-4 btn-primary" onclick="location.href='${pageContext.request.contextPath}/center/update?b_num=${centerDTO.b_num}'">
         	 		<input type="button" value="글삭제" class="btn py-3 px-4 btn-primary" onclick="if(confirm('정말로 삭제하시겠습니까?'))location.href='${pageContext.request.contextPath}/center/delete?b_num=${centerDTO.b_num}'">
				</c:if>

         	 </div>

	 <div class="pt-5 mt-5">
              <h3 class="mb-3">답변</h3>
              <ul class="comment-list">
        	<c:forEach var="centerDTO2" items="${replyList}">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="${pageContext.request.contextPath}/resources/images/admin.png" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h5>${centerDTO2.b_title}</h5>
                    <div class="meta"><fmt:formatDate value="${centerDTO2.b_date}" pattern="yyyy년 MM월 dd일 hh시 mm분"/></div>
                    <p>${centerDTO2.b_content}</p>
<!--                     관리자만 답글 삭제 -->
                    <c:if test="${ sessionScope.u_id=='admin' }">
                    <p><a onclick="return confirm('정말로 삭제하시겠습니까?')" href="${pageContext.request.contextPath}/center/deleteReply?b_num=${centerDTO2.b_num}&b_reply=${centerDTO2.b_reply}" class="reply">삭제</a></p>
                  	</c:if>
                  </div>
                </li>
			 </c:forEach>
             </ul>
      </div>
      
<!--       관리자만 답글 달기 -->
	<c:if test="${ sessionScope.u_id=='admin' }">	
	 <div class="comment-form-wrap pt-5">
                <h3 class="mb-3">답변 등록</h3>
                <form action="${pageContext.request.contextPath}/center/insertReply" class="bg-light p-4" method="post">
                <input type="hidden" name="b_num" value="${centerDTO.b_num}">
                  <div class="form-group">
                    <label for="subject">제목 *</label>
                    <input type="text" class="form-control bg-white" name="b_title">
                    <input type="hidden" name="admin_id" value="admin">
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
      </c:if>
      <h3 class="mb-5">&nbsp;</h3>
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