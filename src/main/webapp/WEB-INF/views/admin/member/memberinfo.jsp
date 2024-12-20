<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/adm-header.jsp" %>
	<link rel="stylesheet" href="/resources/css/user/member.css">
	<script>
		function deleteMember(user_id) {
			var result = confirm('회원목록에서 ('+user_id+')님을 정말 삭제하겠습니까?');
					
			if (result) location.href='/admin/member/delete?user_id='+user_id; 
		}
	</script>
	<section>
		<div class="tab-content">
		    <div class="content-header flex-between">
		        <h3>회원 정보</h3>
		        <div class="sec-btn">
		        	<c:if test="${staffsess.staff_part >= 3 }">
					<a href="/admin/member/modify?user_id=${member.user_id }">정보수정</a>
					<a href="javascript:deleteMember('${member.user_id}');">회원삭제</a>
					</c:if>
					<a href="/admin/member/list">회원목록</a>
		        </div>
		    </div>
		    
		    <div class="content-wrap mb-info-wrapper">
				<c:if test="${member != null }">
					<ul class="mb-info">
						<li>
							<p>닉네임</p>
							<p>${member.user_nick}</p>
						</li>
						<li>
							<p>이 름</p>
							<p>${member.user_name}</p>
						</li>
						<li>
							<p>아이디</p>
							<p>${member.user_id}</p>
						</li>
						<li>
							<p>성 별</p>
							<p>${member.user_gender}</p>
						</li>
						<li>
							<p>메 일</p>
							<p>${member.user_mail}</p>
						</li>
						<li>
							<p>전 화</p>
							<p>${member.user_tel}</p>
						</li>
						<li>
							<p>주 소</p>
							<p>${member.user_zipcode} ${member.user_address}</p>
						</li>
						<c:if test="${member.user_type == 0}">
						<li>
							<p>회원여부</p>
							<p>비회원</p>
						</li>
						</c:if>
						
						<c:if test="${member.user_type == 1}">
						<li>
							<p>회원여부</p>
							<p>회원</p>
						</li>
						</c:if>
						
						<c:if test="${member.user_type == 1}">
							
						</c:if>
						
						<li>
							<p>등록일</p>
							<p><fmt:formatDate value="${member.user_reg_date}" pattern="yyyy년 MM월 dd일" /></p>
						</li>
						<li>
							<p>수정일</p>
							<p><fmt:formatDate value="${member.user_up_date}" pattern="yyyy년 MM월 dd일" /></p>
						</li>
					</ul>
				</c:if>
				
				<c:if test="${member == null }">
					<p class="cf-msg">※ 회원 정보가 없습니다.</p>
				</c:if>
			</div>
		</div>
	</section>
</body>
</html>	