<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!-- =>form태그 사용을 위해 추가해야 함. -->
<form action="${pageContext.request.contextPath}/trainer/insertReview" method="post" >
<div class="modal fade bd-example-modal-lg" tabindex="-1" id="review_modal">
<div class="modal-dialog modal-lg" role="document">
<div class="modal-content">
<div class="modal-header">
<h5 class="modal-title">리뷰 등록</h5>
</div>

<div class="modal-body">
<div class="form-inline">
 <input type="hidden" name="re_point" id="re_point"  value="3"/>
 <input type="hidden" name="u_id" value="${u_id}" class="swal2-input">
 <input type="hidden" name="t_id" value="${t_id}" class="swal2-input">
<label style="width:100px">별점</label>
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
<div class="form-inline">
	<div class="review_contents">
 <div class="warning_msg">5자 이상의 리뷰 내용을 작성해 주세요.</div>
  <textarea rows="10" name="re_coment" class="review_textarea"></textarea>
   </div>   
</div>

</div>
               <div class="modal-footer">
                <input type="submit" class="btn btn-primary" value="수정" />
                <button type="button" class="btn btn-secondary"  data-dismiss="modal">닫기</button>
               </div>
    
</div>
</div>
</div>
</form>