<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div class="col-lg-4 sidebar ftco-animate">
            <div class="sidebar-box ftco-animate">
              <div class="categories">
                <ul>
                <li><a href="${pageContext.request.contextPath }/member/trainer_update" class="btn py-3 px-4 btn-primary">트레이너정보수정</a></li>
                <li><a href="${pageContext.request.contextPath}/member/trainer_insert?t_id=${sessionScope.t_id}" class="btn py-3 px-4 btn-primary">추가정보수정</a></li>
                <li><a href="${pageContext.request.contextPath}/trainer/about?t_id=${sessionScope.t_id}" class="btn py-3 px-4 btn-primary">프로필</a></li>
                <li><a href="${pageContext.request.contextPath }/member/trainer_credit" class="btn py-3 px-4 btn-primary">마이 크레딧</a></li>
                </ul>
              </div>
            </div>
            </div>
          