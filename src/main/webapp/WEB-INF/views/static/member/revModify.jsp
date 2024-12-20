<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/user/revMo-pwdChe.css">

<script>
	$(function(){
	    document.getElementById('changeBtn').addEventListener('click', function() {
	        // 예약변경 완료 확인 창 띄우기
	        var isConfirmed = confirm("예약변경이 완료되었습니다. 계속하시겠습니까?");
	        
	        if (isConfirmed) {
	            // 사용자가 확인을 누르면 폼을 제출합니다.
	            document.getElementById('revModiFrm').submit();
	        }
	        // 사용자가 취소를 누르면 아무 일도 하지 않습니다.
	    });
	});
</script>

	<section>
		<div class="mb-rb-wrap">
			<form action="/static/member/revModify" id="revModiFrm" method="post">
			    <input type="hidden" name="user_id" value="${rvo.user_id}">
			    <input type="hidden" name="rev_no" value="${rvo.rev_no}">
			    <ul class="input-form">
				    <li class="del-icon"><i class="bi bi-calendar-check"></i></li>
				    <li><p class="rb-msg">변경하실 날짜와 시간을 선택해주세요</p></li>
					<li>
						<input type="date" name="rev_date" value="${rvo.rev_date}" class="form-style">
						<i class="input-icon bi bi-calendar-check"></i>
					</li>
					<li>
						<input type="time" name="rev_time" value="${rvo.rev_time}" class="form-style">
						<i class="input-icon bi bi-alarm"></i>
					</li>
				    <li class="mb-rb-btn">
				        <c:if test="${session != null }">
			            <button type="submit" id="changeBtn" class="btn btn-carnex">예약변경</button>
				        </c:if>
				        <a href="/static/member/mypage?user_id=${rvo.user_id}" class="btn btn-kakao">뒤로가기</a>
				    </li>
			    </ul>
			</form>
		</div>
	</section>

<%@include file = "../include/footer.jsp" %>