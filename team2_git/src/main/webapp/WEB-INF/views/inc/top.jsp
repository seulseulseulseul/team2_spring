<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<section>

</section>   
    
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
  		<div class="container">
  			<div class="row m-auto">
  				<div class="col-12 w-100 text-center">
  					<a class="navbar-brand w-100" href="index.html">Meditative</a>
			      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
			        <span class="oi oi-menu"></span> Menu
			      </button>
  				</div>
  				
	
  				
<c:if test="${empty sessionScope.u_id}">
		<div id="login"><a href="${pageContext.request.contextPath}/member/user_login">로그인</a> | 
						<a href="${pageContext.request.contextPath}/member/trainer_login">트레이너 로그인</a> | 
             		    <a href="${pageContext.request.contextPath}/member/user_register">회원가입</a> |
             		    <a href="${pageContext.request.contextPath}/member/trainer_register">트레이너 회원가입</a> </div>	
</c:if>

<%-- <c:if test="${empty sessionScope.t_id}"> --%>
<%-- 		<div id="login"><a href="${pageContext.request.contextPath}/member/user_login">${empty sessionScope.u_id} t_login</a> |  --%>
<%--              		   <a href="${pageContext.request.contextPath}/member/user_rigister">t_join</a></div>	 --%>
<%-- </c:if> --%>

<!-- 유저 로그인 시 세션값 가져오기 -->
<c:if test="${sessionScope.id=='1' }">
		<c:if test="${empty sessionScope.u_id}">
		<div id="login"><a href="${pageContext.request.contextPath}/member/user_login">로그인</a> | 
             		   <a href="${pageContext.request.contextPath}/member/user_register">회원가입</a></div>	
</c:if>

</c:if>

<!-- 트레이너 로그인 시 세션값 가져오기 -->
<c:if test="${sessionScope.id=='2' }">
		<c:if test="${empty sessionScope.u_id}">
		<div id="login"><a href="${pageContext.request.contextPath}/member/trainer_login">트레이너 로그인</a> | 
             		   <a href="${pageContext.request.contextPath}/member/trainer_register">트레이너 회원가입</a></div>	
</c:if>

</c:if>

<c:if test="${! empty sessionScope.u_id}">
	<div id="login">${sessionScope.u_id }님 | 
	               <a href="${pageContext.request.contextPath}/member/logout">로그아웃</a> | 
                   <a href="${pageContext.request.contextPath}/member/user_update">회원정보수정</a></div>
</c:if>

<c:if test="${! empty sessionScope.t_id}">
	<div id="login">${sessionScope.t_id }님 | 
	               <a href="${pageContext.request.contextPath}/member/logout">로그인</a> | 
                   <a href="${pageContext.request.contextPath}/member/trainer_update">트레이너정보수정</a></div>
</c:if>
  				
  				
  				<div class="col-12 w-100 text-center">
  					<div class="collapse navbar-collapse" id="ftco-nav">
  				       
			        <ul class="navbar-nav m-auto">
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/index" class="nav-link">Home</a></li>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/center/list" class="nav-link">고객센터</a></li>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/classes" class="nav-link">공지사항</a></li>
			          <li class="nav-item"><a href="${pageContext.request.contextPath}/schedule" class="nav-link">커뮤니티</a></li>
			        </ul>
			      	<br>
			      				      
			      </div>
  				</div>
  			</div>
  		</div>
	  </nav>