<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>트레이너 소개</title>
 
    
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
    
    <!--        리뷰 목록 불러오기 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review/review-css.css">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
    /*팔로우 버튼 클릭*/
    $(document).ready(function(){

    
    		  $("#confirm").click(function(){
    		      modalClose(); //모달 닫기 함수 호출
    		      //컨펌 이벤트 처리
    		  });
    		  $("#modal-open").click(function(){        
    		      $("#popup").css('display','flex').hide().fadeIn();
    		      //팝업을 flex속성으로 바꿔준 후 hide()로 숨기고 다시 fadeIn()으로 효과
    		  });
    		  $("#close").click(function(){
    		      modalClose(); //모달 닫기 함수 호출
    		  });
    		  function modalClose(){
    		      $("#popup").fadeOut(); //페이드아웃 효과
    		  }     
        });
	</script>
  </head>
  <body>
   <jsp:include page="../inc/top.jsp"></jsp:include>
    <!-- END nav -->
<%-- <%
// 세션값 가져오기
// String nick = request.getParameter("t_nic")==null?"":request.getParameter("t_nic");  
String t_id=(String)session.getAttribute("t_id");
MemberDAO memberDAO=new MemberDAO();
MemberDTO memberDTO=memberDAO.getMember(t_id);

%> --%>

    <section class="hero-wrap hero-wrap-2" style="background-image: url('${pageContext.request.contextPath}/resources/images/bg_3.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center">
          <div class="col-md-9 ftco-animate text-center">
            <h1 class="mb-3 bread">트레이너 소개</h1>
            <p class="breadcrumbs"><span class="mr-2"><a href="views/index.jsp">메인</a></span> <span>트레이너 소개</span></p>
          </div>
        </div>
      </div>
    </section>



   <!--  트레이너 상세정보  -->
   
    <section class="ftco-section">
       <div class="container">
          <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-12 heading-section ftco-animate text-center">
                
         <!--  왼쪽 메뉴 -->
            <h2 class="mb-1">${trainer_memberDTO.t_name}
<%--              <%= memberDTO.getT_nic()%> --%>
            </h2>
          </div>
        </div>
          <div class="row">
             <div class="col-md-4">
                <div class="services-2 ftco-animate d-flex w-100">
                     <div class="icon d-flex justify-content-center align-items-center order-md-last">
                        <span class="flaticon-stone"></span>
                     </div>
                     <div class="text text-md-right pl-4 pl-md-0 pr-md-4">
                        <h3>소개</h3>
                        <p>${trainer_memberDTO.t_intro}</p>
<%--                         <p><%= memberDTO.getT_intro()%></p> --%>

                        
                     </div>
                  </div>
                  <div class="services-2 ftco-animate d-flex w-100">
                     <div class="icon d-flex justify-content-center align-items-center order-md-last">
                        <span class="flaticon-stone"></span>
                     </div>
                     <div class="text text-md-right pl-4 pl-md-0 pr-md-4">
                        <h3>이메일</h3>
                       <p>${trainer_memberDTO.t_email}</p>
                     </div>
                  </div>
                  <div class="services-2 ftco-animate d-flex w-100">
                     <div class="icon d-flex justify-content-center align-items-center order-md-last">
                        <span class="flaticon-stone"></span>
                     </div>
                     <div class="text text-md-right pl-4 pl-md-0 pr-md-4">
                        <h3>SNS</h3>
                        <p><a href="${trainer_memberDTO.t_sns}"
                        
                         class="btn btn-white px-4 py-3"> 인스타그램 <span class="icon-instagram"></span></a></p>
                     </div>
                  </div>
<!--                   <div class="services-2 ftco-animate d-flex w-100"> -->
<!--                      <div class="icon d-flex justify-content-center align-items-center order-md-last"> -->
<!--                         <span class="flaticon-stone"></span> -->
<!--                      </div> -->
<!--                      <div class="text text-md-right pl-4 pl-md-0 pr-md-4"> -->
<!--                         <h3>SNS</h3> -->
<%--                         <p><a href=<%= memberDTO.getT_sns()%> class="btn btn-white px-4 py-3"> 인스타그램 <span class="icon-instagram"></span></a></p> --%>
<!--                      </div> -->
<!--                   </div> -->
             </div>

            <!-- 트레이너 상세정보 이미지 -->
             <div class="col-md-4 d-flex">
             <img src="trainerimage\">
<%--              <%= memberDTO.getPhoto_name()%> --%>
<%--                 <div class="img img-services w-100" style="background-image: <%= memberDTO.getProfile_photo()%>"></div> --%>
             </div>
   
            
            <!--  오른쪽 메뉴 -->
             <div class="col-md-4">
                <div class="services-2 ftco-animate d-flex w-100">
                     <div class="icon d-flex justify-content-center align-items-center\">
                        <span class="flaticon-stone"></span>
                     </div>
                     <div class="text text-left pl-4">
                        <h3>프로그램 소개</h3>
<%--                         <p><%= memberDTO.getT_program()%></p>d --%>
								<p>${trainer_memberDTO.t_program}</p>
                     </div>
                  </div>
                  <div class="services-2 ftco-animate d-flex w-100">
                     <div class="icon d-flex justify-content-center align-items-center\">
                        <span class="flaticon-stone"></span>
                     </div>
                     <div class="text text-left pl-4">
                        <h3>경력</h3>
<%--                         <p><%= memberDTO.getT_exp()%></p> --%>
							<p>${trainer_memberDTO.t_exp}</p>
							
                     </div>
                  </div>
                  <div class="services-2 ftco-animate d-flex w-100">
                     <div class="icon d-flex justify-content-center align-items-center\">
                        <span class="flaticon-stone"></span>
                     </div>
                     <div class="text text-left pl-4">
                        <h3>예약하기</h3>
                        <p><a href="https://naver.com" class="btn btn-white px-4 py-3"> 예약하기<span class="ion-ios-arrow-round-forward"></span></a></p>
                     </div>
                  </div>
<!--                   <div class="services-2 ftco-animate d-flex w-100"> -->
<!--                      <div class="icon d-flex justify-content-center align-items-center\"> -->
<!--                         <span class="flaticon-stone"></span> -->
<!--                      </div> -->
<!--                      <div class="text text-left pl-4"> -->
<!--                         <h3>Builds muscle strength</h3> -->
<!--                         <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p> -->
<!--                      </div> -->
<!--                   </div> -->
             </div>
          </div>
       </div>
    </section>
    <section class="ftco-section">
       <div class="container">
          <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-12 heading-section ftco-animate text-center">
    <h2 class="mb-1">트레이너 소개 동영상<br></h2> 
<%--     <%= memberDTO.getT_nic()%> --%>
  <p align = "middle">
      
      <iframe width="80%" height="500"  title="YouTube video player"
         src="${trainer_memberDTO.video}?autoplay=1&amp;mute=1">
       clipboard-write; encrypted-media; gyroscope; 
       picture-in-picture" allowfullscreen></iframe>
       
       </p>  
       </div>
       </div>
       </div>
       </section>
    
	<section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-10 heading-section ftco-animate text-center">
            <h3 class="subheading">Review</h3>
            <h2 class="mb-1">리뷰</h2>
            <input type="button" value="리뷰 등록" class="btn py-3 px-4 btn-primary"  id="modal-open">
            <div class="container"> 
          </div>
        </div>
        
  <div class="popup-wrap" id="popup"> 
    <div class="popup">	
      <div class="popup-head">	
          <span class="head-title">Review</span>
      </div>
      <div class="popup-body">	
        <div class="body-content">
          <div class="body-titlebox">
          	별점과 이용경험을 남겨주세요.
          </div>
          <div class="body-contentbox">
            <form action="${pageContext.request.contextPath}/trainer/insertReview" method="post">
            	<input type="hidden" name="re_point" id="re_point" value="">
            <input type="hidden" name="u_id" id="u_id" value="${u_id }" >
			 <input type="hidden" name="t_id" id="t_id" value="${t_id }" >
			<div class="body-input">
            <div class="review_rating rating_point">
                <div class="starRev">
				  <span class="starR1 on" value="0.5"></span>
				  <span class="starR2" value="1"></span>
				  <span class="starR1" value="1.5"></span>
				  <span class="starR2" value="2"></span>
				  <span class="starR1" value="2.5"></span>
				  <span class="starR2" value="3"></span>
				  <span class="starR1" value="3.5"></span>
				  <span class="starR2" value="4"></span>
				  <span class="starR1" value="4.5"></span>
				  <span class="starR2" value="5"></span>
				</div>
            </div>
               <textarea rows="5" name="re_coment" id="re_coment" class="review_textarea"></textarea>
            </div>  
   	 		 <div class="foot">
                <input type="submit" class="pop-btn confirm" id="confirm" value="등록" onclick="return CheckForm();">
 		  		<input type="reset" class="pop-btn close" id="close" value="취소">
     		 </div>
      		 </form>
          </div>
   	  		</div>
        </div>
  	  </div>
</div>
</div>
   
    

        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel" >
            
          <c:forEach var="reviewDTO" items="${reviewList }">
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                     <div class="line">
                       <p class="mb-4 pb-1">${reviewDTO.re_coment}</p>
                       <span class="quote d-flex align-items-center justify-content-center">
                         <i class="icon-quote-left"></i>
                       </span>
                     </div>
                    <div class="d-flex align-items-center">
                       <div class="user-img" style="background-image: url(${pageContext.request.contextPath}/resources/images/person_1.jpg)">
                        </div>
                        <div class="ml-4">
                           <p class="name">${reviewDTO.u_id}</p>
                           <span class="starR1" value="1"></span><span class="starR2" value="1"></span><p class="name">${reviewDTO.re_point}</p><br>
                          <span class="position"><fmt:formatDate value="${reviewDTO.re_date}" pattern="yy년 MM월 dd일"/></span>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </c:forEach>
            
            </div>
          </div>
        </div>
<!--         container -->
      </div>
    </section>

    <section class="ftco-counter img" id="section-counter" style="background-image: url(${pageContext.request.contextPath}/resources/images/bg_3.jpg);" data-stellar-background-ratio="0.5">
         <div class="overlay"></div>
      <div class="container">
        <div class="row justify-content-center">
           <div class="col-md-10">
              <div class="row">
                <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">

                  <div class="block-18 text-center">
                    <div class="text">
                       <strong class="number" data-number="2560">0</strong>
                       <span>Happy Customers</span>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
                  <div class="block-18 text-center">
                    <div class="text">
                       <strong class="number" data-number="60">0</strong>
                       <span>Yoga Classes</span>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
                  <div class="block-18 text-center">
                    <div class="text">
                       <strong class="number" data-number="50">0</strong>
                       <span>Years of Experience</span>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
                  <div class="block-18 text-center">
                    <div class="text">
                       <strong class="number" data-number="100">0</strong>
                       <span>Yoga Conducted</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
       	 </div>
    	 </div>
  	  </div>
    </section>
	

      <section class="ftco-gallery ftco-section">
       <div class="container-fluid px-md-5">
          <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h2 class="mb-1">Our Gallery</h2>
          </div>
        </div>
          <div class="row">
               <div class="col-md-3 ftco-animate">
                  <a href="${pageContext.request.contextPath}/resources/images/gallery-1.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/images/gallery-1.jpg);">
                     <div class="icon mb-4 d-flex align-items-center justify-content-center">
                      <span class="icon-instagram"></span>
                  	 </div>
                  </a>
               </div>
               <div class="col-md-3 ftco-animate">
                  <a href="${pageContext.request.contextPath}/resources/images/gallery-2.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/images/gallery-2.jpg);">
                     <div class="icon mb-4 d-flex align-items-center justify-content-center">
                      <span class="icon-instagram"></span>
                   	</div>
                  </a>
               </div>
               <div class="col-md-3 ftco-animate">
                  <a href="${pageContext.request.contextPath}/resources/images/gallery-3.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/images/gallery-3.jpg);">
                     <div class="icon mb-4 d-flex align-items-center justify-content-center">
                      <span class="icon-instagram"></span>
                  	 </div>
                  </a>
               </div>
               <div class="col-md-3 ftco-animate">
                  <a href="${pageContext.request.contextPath}/resources/images/gallery-4.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/images/gallery-4.jpg);">
                     <div class="icon mb-4 d-flex align-items-center justify-content-center">
                      <span class="icon-instagram"></span>
                  	 </div>
                  </a>
               </div>

               <div class="col-md-3 ftco-animate">
                  <a href="${pageContext.request.contextPath}/resources/images/gallery-5.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/images/gallery-5.jpg);">
                     <div class="icon mb-4 d-flex align-items-center justify-content-center">
                      <span class="icon-instagram"></span>
                  	 </div>
                  </a>
               </div>
               <div class="col-md-3 ftco-animate">
                  <a href="${pageContext.request.contextPath}/resources/images/gallery-6.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/images/gallery-6.jpg);">
                     <div class="icon mb-4 d-flex align-items-center justify-content-center">
                      <span class="icon-instagram"></span>
                 	  </div>
                  </a>
               </div>
               <div class="col-md-3 ftco-animate">
                  <a href="${pageContext.request.contextPath}/resources/images/gallery-7.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/images/gallery-7.jpg);">
                     <div class="icon mb-4 d-flex align-items-center justify-content-center">
                      <span class="icon-instagram"></span>
                  	 </div>
                  </a>
               </div>
               <div class="col-md-3 ftco-animate">
                  <a href="${pageContext.request.contextPath}/resources/images/gallery-8.jpg" class="gallery image-popup img d-flex align-items-center" style="background-image: url(${pageContext.request.contextPath}/resources/images/gallery-8.jpg);">
                     <div class="icon mb-4 d-flex align-items-center justify-content-center">
                      <span class="icon-instagram"></span>
                	   </div>
                  </a>
               </div>
        </div>
       </div> 
    </section>

      

   <jsp:include page="../inc/bottom.jsp"></jsp:include>
    
    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

 <script src="${pageContext.request.contextPath}/resources/css/review/review-js.js"></script>
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