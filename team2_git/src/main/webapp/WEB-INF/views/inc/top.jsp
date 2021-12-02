<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  		<div class="container">
  			<div class="row m-auto">
  				<div class="col-12 w-100 text-center">
  					<a class="navbar-brand w-100" href="index.html">Meditative</a>
			      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			        <span class="oi oi-menu"></span> Menu
			      </button>
  				</div>
  				<div class="col-12 w-100 text-center">
  					<div class="collapse navbar-collapse" id="ftco-nav">
			        <ul class="navbar-nav m-auto">
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/index" class="nav-link">Home</a></li>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/about" class="nav-link">About</a></li>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/trainer" class="nav-link">Trainer</a></li>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/classes" class="nav-link">Classes</a></li>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/schedule" class="nav-link">Schedule</a></li>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/blog" class="nav-link">Blog</a></li>
<%-- 			          <li class="nav-item active"><a href="${pageContext.request.contextPath}/blog" class="nav-link">Blog</a></li> --%>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/contact" class="nav-link">Contact</a></li>
			        </ul>
			      </div>
  				</div>
  			</div>
  		</div>
	  </nav>