<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<script>

function aboutTest(tid){
	
	location.href = "/trainer/about";
}

</script>
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
  		<jsp:include page="inc/top.jsp"></jsp:include>
    <!-- END nav -->

    <section class="home-slider js-fullheight owl-carousel">
      <div class="slider-item js-fullheight" style="background-image:url(${pageContext.request.contextPath}/resources/images/bg_1.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-10 text ftco-animate text-center">
            <h1 class="mb-4">Discover Your Inner Sanctuary</h1>
            <h3 class="subheading">Everyday We Bring Hope and Smile to the Patient We Serve</h3>
            <p><a href="#" class="btn btn-white btn-outline-white px-4 py-3 mt-3">View our works</a></p>
          </div>
        </div>
        </div>
      </div>

      <div class="slider-item js-fullheight" style="background-image:url(${pageContext.request.contextPath}/resources/images/bg_2.jpg);">
      	<div class="overlay"></div>
        <div class="container">
          <div class="row no-gutters slider-text js-fullheight align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-10 text ftco-animate text-center">
            <h1 class="mb-4">Lighting Your Heart &amp; Mind</h1>
            <h3 class="subheading">Your Health is Our Top Priority with Comprehensive, Affordable medical.</h3>
            <p><a href="#" class="btn btn-white btn-outline-white px-4 py-3 mt-3">View our works</a></p>
          </div>
        </div>
        </div>
      </div>
    </section>

    <section class="ftco-section bg-light">
			<div class="container">
				<div class="row">
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div onclick="aboutTest(1)" class="img" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-6.jpg);">
							</div>
							<div class="text mt-4">
								<h3 class="mb-4">Power Yoga</h3>
								<p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								<p><a href="#" class="btn btn-white px-4 py-3"> Learn more <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-1.jpg);"></div>
							<div class="text mt-4">
								<h3 class="mb-4">Community Class</h3>
								<p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								<p><a href="#" class="btn btn-white px-4 py-3"> Learn more <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-7.jpg);"></div>
							<div class="text mt-4">
								<h3 class="mb-4">Foundation Yoga</h3>
								<p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								<p><a href="#" class="btn btn-white px-4 py-3"> Learn more <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
					<div class="col-md-3 d-flex align-items-stretch">
						<div class="offer-deal text-center">
							<div class="img" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-2.jpg);"></div>
							<div class="text mt-4">
								<h3 class="mb-4">Prenatal Yoga</h3>
								<p class="mb-5">Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
								<p><a href="#" class="btn btn-white px-4 py-3"> Learn more <span class="ion-ios-arrow-round-forward"></span></a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-12 heading-section ftco-animate text-center">
            <h2 class="mb-1">Experience of Yoga</h2>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-4">
    				<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center order-md-last">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-md-right pl-4 pl-md-0 pr-md-4">
								<h3>Balance Body &amp; Mind</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
						<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center order-md-last">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-md-right pl-4 pl-md-0 pr-md-4">
								<h3>Healthy Daily Life</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
						<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center order-md-last">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-md-right pl-4 pl-md-0 pr-md-4">
								<h3>Improves your flexibility</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
						<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center order-md-last">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-md-right pl-4 pl-md-0 pr-md-4">
								<h3>Protects your spine</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
    			</div>

    			<div class="col-md-4 d-flex">
    				<div class="img img-services w-100" style="background-image: url(${pageContext.request.contextPath}/resources/images/services.jpg);"></div>
    			</div>

    			<div class="col-md-4">
    				<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center\">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-left pl-4">
								<h3>Betters your bone health</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
						<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center\">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-left pl-4">
								<h3>Increases your blood flow</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
						<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center\">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-left pl-4">
								<h3>Keep a practice journal</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
						<div class="services-2 ftco-animate d-flex w-100">
							<div class="icon d-flex justify-content-center align-items-center\">
								<span class="flaticon-meditation"></span>
							</div>
							<div class="text text-left pl-4">
								<h3>Builds muscle strength</h3>
								<p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
							</div>
						</div>
    			</div>
    		</div>
    	</div>
    </section>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-12 heading-section ftco-animate text-center">
            <h2 class="mb-1">Our Classes</h2>
          </div>
        </div>
        <div class="row">
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-1.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Private &amp; Group Lessons</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-2.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga for Pregnant</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-3.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga for Beginners</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-4.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga Barre</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-5.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga Core</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        	<div class="col-md-4">
        		<div class="classes w-100 ftco-animate">
        			<a href="#" class="img w-100 mb-3" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-6.jpg);"></a>
        			<div class="text w-100 text-center">
        				<h3><a href="#">Yoga Restore</a></h3>
        				<p>Sept. 30, 2019 - 01:00pm - 03:00pm</p>
        			</div>
        		</div>
        	</div>
        </div>
    	</div>
    </section>

    <section class="ftco-section">
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-12 heading-section ftco-animate text-center">
            <h2 class="mb-1">Class Time Table</h2>
          </div>
        </div>
    		<div class="row">
          <div class="col-md-12">
            <div class="table-responsive">
              <table class="table table-bordered text-center">
                <thead>
                  <tr class="bg-primary text-white">
                    <th>Monday</th>
                    <th>Tuesday</th>
                    <th>Wednesday</th>
                    <th>Thursday</th>
                    <th>Friday</th>
                    <th>Saturday</th>
                    <th>Sunday</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-1.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-2.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-3.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                  </tr>
                  <tr>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-4.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-5.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-6.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-7.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                  </tr>
                  <tr>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-1.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-2.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-3.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                  </tr>
                  <tr>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-4.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-5.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-6.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-7.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                  </tr>
                  <tr>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-1.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-2.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-3.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td><i class="ion-ios-close"></i></td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-4.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                    <td class="text-center"><div class="img rounded-circle ftco-animate mb-2" style="background-image: url(${pageContext.request.contextPath}/resources/images/classes-5.jpg);"></div>
                      <a href="#"><strong>Yoga training</strong> <br>
                      7 am-6 am</a>
                    </td>
                  </tr>
                </tbody>
                <tfoot>
                  <tr>
                    <th><a href="#"><i class="ion-ios-arrow-round-back"></i> September</a></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th><a href="#">November <i class="ion-ios-arrow-round-forward"></i></a></th>
                  </tr>
                </tfoot>
              </table>
            </div>
          </div>
        </div>
    	</div>
    </section>
		

    <section class="ftco-section testimony-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-10 heading-section ftco-animate text-center">
            <h3 class="subheading">Testimony</h3>
            <h2 class="mb-1">Successful Stories</h2>
          </div>
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

    <section class="ftco-section bg-light">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-3">
          <div class="col-md-7 heading-section ftco-animate text-center">
            <h2 class="mb-1">Recent Posts</h2>
          </div>
        </div>
        <div class="row d-flex">
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href="blog-single.html" class="block-20" style="background-image: url('${pageContext.request.contextPath}/resources/images/image_1.jpg');">
              </a>
              <div class="text w-100 mt-3">
              	<div class="meta">
                  <div><a href="#">July. 14, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">Is wellness the new luxury</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry justify-content-end">
              <a href="blog-single.html" class="block-20" style="background-image: url('${pageContext.request.contextPath}/resources/images/image_2.jpg');">
              </a>
              <div class="text w-100 mt-3">
              	<div class="meta">
                  <div><a href="#">July. 14, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">Is wellness the new luxury</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
              </div>
            </div>
          </div>
          <div class="col-md-4 d-flex ftco-animate">
          	<div class="blog-entry">
              <a href="blog-single.html" class="block-20" style="background-image: url('${pageContext.request.contextPath}/resources/images/image_3.jpg');">
              </a>
              <div class="text w-100 mt-3">
              	<div class="meta">
                  <div><a href="#">July. 14, 2019</a></div>
                  <div><a href="#">Admin</a></div>
                  <div><a href="#" class="meta-chat"><span class="icon-chat"></span> 3</a></div>
                </div>
                <h3 class="heading mt-2"><a href="#">Is wellness the new luxury</a></h3>
                <p>A small river named Duden flows by their place and supplies it with the necessary regelialia.</p>
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
            <h2 class="mb-1">See the latest photos</h2>
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

		

     <jsp:include page="inc/bottom.jsp"></jsp:include>
    
    
  

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