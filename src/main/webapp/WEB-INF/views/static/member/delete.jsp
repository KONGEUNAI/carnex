<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/user/member.css">
<script>
	$(function(){
		$('#delete').click(function(){
			$('#deleteFrm').attr('action', '/static/member/delete');
			$('#deleteFrm').submit();
		});
	});
</script>

	<section>
		<div class="mb-del-wrap">
			<form id="deleteFrm" method="post">
				<input type="hidden" name="user_id" value="${delete.user_id }">
				<div class="del-icon"><i class="bi bi-trash3"></i></div>
				<p class="del-msg">${delete.user_nick }님 정말 탈퇴하시겠습니까?<br>탈퇴 후 회원 정보를 복원할 수 없습니다.</p>
				<textarea name="user_drop" class="del-text">탈퇴 사유를 적어주시면 더 좋은 모습으로 단장하겠습니다.</textarea>
				<div class="mb-group-btn">
					<c:if test="${session != null }">
					<button type="button" id="delete" class="btn btn-carnex">회원삭제</button>
					</c:if>
					<a href="/static/member/mypage?user_id=${delete.user_id }" class="btn btn-kakao">뒤로가기</a>
				</div>
			</form>			
		</div>
	</section>

<%@include file = "../include/footer.jsp" %>