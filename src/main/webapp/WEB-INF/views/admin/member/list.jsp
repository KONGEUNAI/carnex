<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/adm-header.jsp" %>
<link rel="stylesheet" href="/resources/css/user/member.css">
<script>
	$(function(){
		$('#mb-search').keyup(function(){
		    var value = $(this).val().toLowerCase();

		    $('.mb-info-wrap li').filter(function(index) {
		        // 첫 번째 li는 제외하고, 두 번째 li부터 선택
		        if (index > 0) { 
		            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
		        }
		    });
		});
	});
</script>
	<section>
		<div class="tab-content">
		    <div class="content-header flex-between">
		        <h3>회원 목록</h3>
		    </div>
	    
		    <div class="content-wrap member-list">
		    	<h3>회원 검색</h3>
		    	<div class="mb-search-wrap">
					<input type="search" id="mb-search" placeholder="회원 닉네임 입력" class="input-frm input-sa">
				</div>
				<h3>회원 목록</h3>
				<ul class="mb-info-wrap">
					<li>
						<p>아이디</p>
						<p>닉네임</p>
						<p>이름</p>
						<p>회원</p>
						<p>최종수정일</p>
					</li>
				<c:if test="${not empty mbList}">
					<c:forEach items="${mbList}" var="mvo">
					<li>
						<p><a href="/admin/member/memberinfo?user_id=${mvo.user_id}">${mvo.user_id}</a></p>
						<p>${mvo.user_nick}</p>
						<p>${mvo.user_name}</p>
					<c:if test="${mvo.user_type == 0 }">
						<p>비회원</p>
					</c:if>
					<c:if test="${mvo.user_type == 1 }">
						<p>회원</p>
					</c:if>
						<p><fmt:formatDate value="${mvo.user_up_date}" pattern="yyyy년 MM월 dd일" /></p>
					</li>
					</c:forEach>
				</c:if>
				<c:if test="${empty mbList}">
				<p> ※ 등록된 회원이 없습니다.</p>
				</c:if>
				</ul>
			</div>
		</div>
	</section>
</body>
</html>
