<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/user/revMo-pwdChe.css">

	<section>
		<div class="mb-rb-wrap">
			<form action="/static/member/pwd-check" id="revModiFrm" method="post">
			    <input type="hidden" name="user_id" value="${mvo.user_id}">
				<ul class="input-form">
				    <li class="del-icon"><i class="bi bi-shield-lock-fill"></i></li>
				    <li><p class="rb-msg">계속하려면 먼저 본인임을 인증하세요.</p></li>
				    <li>
						<input type="password" name="user_pwd" placeholder="비밀번호 입력" required class="form-style input-pwd">
						<i class="input-icon bi bi-shield-lock-fill"></i>
					</li>
				    <li class="mb-rb-btn">
				        <c:if test="${mvo != null }">
			            <button type="submit" id="changeBtn" class="btn btn-carnex">정보수정</button>
				        </c:if>
				        <a href="/static/member/mypage?user_id=${mvo.user_id}" class="btn btn-kakao">뒤로가기</a>
				    </li>
			    </ul>
			</form>
			
		    <c:if test="${not empty errorMessage}">
	        <div class="error-message">
	            <p>${errorMessage}</p>
	        </div>
		    </c:if>  
		</div>
	</section>
</body>
</html>