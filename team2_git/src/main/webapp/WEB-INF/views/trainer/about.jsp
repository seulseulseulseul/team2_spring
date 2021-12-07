<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
<!--     리뷰 css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review/review.css">
    
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
            <h2 class="mb-1">${NAME}
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
                        <p>${INTRO}</p>
<%--                         <p><%= memberDTO.getT_intro()%></p> --%>

                        
                     </div>
                  </div>
                  <div class="services-2 ftco-animate d-flex w-100">
                     <div class="icon d-flex justify-content-center align-items-center order-md-last">
                        <span class="flaticon-stone"></span>
                     </div>
                     <div class="text text-md-right pl-4 pl-md-0 pr-md-4">
                        <h3>이메일</h3>
                       <p>${EMAIL}</p>
                     </div>
                  </div>
                  <div class="services-2 ftco-animate d-flex w-100">
                     <div class="icon d-flex justify-content-center align-items-center order-md-last">
                        <span class="flaticon-stone"></span>
                     </div>
                     <div class="text text-md-right pl-4 pl-md-0 pr-md-4">
                        <h3>SNS</h3>
                        <p><a href="${SNS}"
                        
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
								<p>${PROGRAM}</p>
                     </div>
                  </div>
                  <div class="services-2 ftco-animate d-flex w-100">
                     <div class="icon d-flex justify-content-center align-items-center\">
                        <span class="flaticon-stone"></span>
                     </div>
                     <div class="text text-left pl-4">
                        <h3>경력</h3>
<%--                         <p><%= memberDTO.getT_exp()%></p> --%>
							<p>${EXP}</p>
							
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
    <h2 class="mb-1">트레이너  소개 동영상<br></h2> 
<%--     <%= memberDTO.getT_nic()%> --%>
      <p align = "middle">
		
		<iframe width="80%" height="500"  title="YouTube video player"
			src="${URL}?autoplay=1&amp;mute=1">
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
            <input type="button" value="리뷰 등록" class="btn py-3 px-4 btn-primary"  onclick="showExample('${u_id}','${t_id}')">
          </div>
        </div>
 
<!--  리뷰등록창 -->
	<div class="wrap">
        <h1>후기</h1>
       <form action="${pageContext.request.contextPath}/trainer/insertReview" class="bg-light p-4" method="post" >
            <input type="hidden" name="re_point" id="re_point" value="3"/>
            <input type="hidden" name="u_id" value="${u_id}" class="swal2-input">
			 <input type="hidden" name="t_id" value="${t_id}" class="swal2-input">
            <p class="title_star">별점과 이용경험을 남겨주세요.</p>
     
            <div class="review_rating rating_point">
                <div class="warning_msg">별점을 선택해 주세요.</div>
                <div class="rating">
                    <div class="ratefill"></div>
                    <!-- [D] 해당 별점이 선택될 때 그 점수 이하의 input엘리먼트에 checked 클래스 추가 -->
                    <input type="checkbox" name="rating" id="rating1" value="1" class="rate_radio" title="1점">
                    <label for="rating1"></label>
                    <input type="checkbox" name="rating" id="rating2" value="2" class="rate_radio" title="2점">
                    <label for="rating2"></label>
                    <input type="checkbox" name="rating" id="rating3" value="3" class="rate_radio" title="3점" >
                    <label for="rating3"></label>
                    <input type="checkbox" name="rating" id="rating4" value="4" class="rate_radio" title="4점">
                    <label for="rating4"></label>
                    <input type="checkbox" name="rating" id="rating5" value="5" class="rate_radio" title="5점">
                    <label for="rating5"></label>
                </div>
            </div>
            <div class="review_contents">
                <div class="warning_msg">5자 이상의 리뷰 내용을 작성해 주세요.</div>
               <textarea rows="10" name="re_coment" class="review_textarea"></textarea>
            </div>   
            <div class="cmd">
                <input type="submit" id="save" value="등록">
 		  		<input type="reset" value="취소">
            </div>
        </form>
    </div>
        
         
          
       
        <div class="row ftco-animate">
          <div class="col-md-12">
            <div class="carousel-testimony owl-carousel">
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                     <div class="line">
                       <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                       <span class="quote d-flex align-items-center justify-content-center">
                         <i class="icon-quote-left"></i>
                       </span>
                     </div>
                    <div class="d-flex align-items-center">
                       <div class="user-img" style="background-image: url(${pageContext.request.contextPath}/resources/images/person_1.jpg)">
                        </div>
                        <div class="ml-4">
                           <p class="name">Gabby Smith</p>
                          <span class="position">Customer</span>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                    <div class="line">
                       <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                       <span class="quote d-flex align-items-center justify-content-center">
                         <i class="icon-quote-left"></i>
                       </span>
                     </div>

                    <div class="d-flex align-items-center">
                       <div class="user-img" style="background-image: url(${pageContext.request.contextPath}/resources/images/person_2.jpg)">
                        </div>
                        <div class="ml-4">
                           <p class="name">Floyd Weather</p>
                          <span class="position">Customer</span>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                    <div class="line">
                       <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                       <span class="quote d-flex align-items-center justify-content-center">
                         <i class="icon-quote-left"></i>
                       </span>
                     </div>

                    <div class="d-flex align-items-center">
                       <div class="user-img" style="background-image: url(${pageContext.request.contextPath}/resources/images/person_3.jpg)">
                        </div>
                        <div class="ml-4">
                           <p class="name">James Dee</p>
                          <span class="position">Customer</span>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                    <div class="line">
                       <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                       <span class="quote d-flex align-items-center justify-content-center">
                         <i class="icon-quote-left"></i>
                       </span>
                     </div>

                    <div class="d-flex align-items-center">
                       <div class="user-img" style="background-image: url(${pageContext.request.contextPath}/resources/images/person_4.jpg)">
                        </div>
                        <div class="ml-4">
                           <p class="name">Lance Roger</p>
                          <span class="position">Customer</span>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="item">
                <div class="testimony-wrap p-4 pb-5">
                  <div class="text">
                    <div class="line">
                       <p class="mb-4 pb-1">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                       <span class="quote d-flex align-items-center justify-content-center">
                         <i class="icon-quote-left"></i>
                       </span>
                     </div>

                    <div class="d-flex align-items-center">
                       <div class="user-img" style="background-image: url(${pageContext.request.contextPath}/resources/images/person_2.jpg)">
                        </div>
                        <div class="ml-4">
                           <p class="name">Kenny Bufer</p>
                          <span class="position">Customer</span>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
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

<!-- 	리뷰창 SweetAlert -->
	<script  src="https://cdn.jsdelivr.net/npm/sweetalert2@10">
	</script>
	 <script src="${pageContext.request.contextPath}/resources/js/test.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/review.js"></script>
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