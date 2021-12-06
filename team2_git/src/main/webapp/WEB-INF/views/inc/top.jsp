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
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/about" class="nav-link">트레이너소개</a></li>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/center/list" class="nav-link">고객센터</a></li>
<%-- 			          <li class="nav-item"><a href="${pageContext.request.contextPath}/classes" class="nav-link">공지사항</a></li> --%>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/schedule" class="nav-link">일반회원가입</a></li>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/blog" class="nav-link">로그인</a></li>
<%-- 			          <li class="nav-item active"><a href="${pageContext.request.contextPath}/blog" class="nav-link">트레이너회원가입</a></li> --%>
			           
<%-- 			          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/logout" class="nav-link">로그아웃</a></li> --%>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/member/user_update" class="nav-link">유저 회원정보수정</a></li>
			        </ul>
			      	<%-- 						${sessionScope.id }님 로그인 하셨습니다. --%>
						<input type="button" value="로그아웃"  class="btn btn-primary"
						           onclick="location.href='${pageContext.request.contextPath}/member/logout'"><br>
			      
			      </div>
  				</div>
  			</div>
  		</div>
	  </nav>