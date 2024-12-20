<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/user/board.css">
<script src="/resources/ckeditor/ckeditor.js"></script>
	<section>
		<form action="/static/reply/modify" method="post">
			<input type="hidden" name="bno" value="${rvo.bno }">
			<input type="hidden" name="rno" value="${rvo.rno }">
			<input type="hidden" name="writer" value="${rvo.writer }">
			<ul class="bd-reg-frm">
				<li>
					<p>작성자 : ${rvo.writer }</p>
					<div class="bd-side-btn">
						<c:if test="${bvo.writer == session.user_nick or bvo.writer == staffsess.staff_name or staffsess.staff_id == 'admin' or session.user_id == 'admin'}">
						<button type="submit" class="side-btn">수 정</button>
						</c:if>
						<a href="/static/board/view?bno=${rvo.bno }" class="side-btn">이 전</a>
					</div>
				</li>
				<li>
					<textarea name="content" id="contents">${rvo.content }</textarea>
					<script>
						var ckeditor_config = {
							width: '100%',
							height: '300px',
							resize_enable: false,
							enterMode: CKEDITOR.ENTER_BR,
							shiftEnterMode: CKEDITOR.ENTER_P,
							filebrowserUploadUrl: "/static/board/ckUpload"
							// BoardController에서 '/board/ckUpload' 요청을 처리해야함
						};
						
						CKEDITOR.replace("contents", ckeditor_config);
					</script>
				</li>
			</ul>
		</form>
	</section>

<%@include file = "../include/footer.jsp" %>