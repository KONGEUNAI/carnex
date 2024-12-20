<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/adm-header.jsp" %>
	<link rel="stylesheet" href="/resources/css/admin/staff.css">
	<script>
		$(function(){
			$('#sa-search').keyup(function(){
				var value = $(this).val().toLowerCase();
				
				$('.sa-info-item > li').filter(function(){
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
				});
			});
		});
		function deleteStaff(staff_id) {
	        var result = confirm('직원목록에서 ('+staff_id+')님을 정말 삭제하겠습니까?');
	        
	        if (result) location.href='/admin/staff/delete?staff_id='+staff_id; 
	    }
		var urlParams = new URLSearchParams(window.location.search);
    var value = urlParams.get('staff_part');
	</script>
	
	<section>
		<div class="tab-content">
	    <div class="content-header flex-between">
        <h3>직원 목록</h3>
	    </div>
	    
	    <div class="content-wrap staff-list">
	    		<h3>직원 검색</h3>
				<div class="sa-search-wrap">
					<input type="search" id="sa-search" placeholder="직원 이름 입력" class="input-frm input-sa">
				</div>
				
				<h3>직원 목록</h3>
				<div class="sa-info-wrap">
					<div class="sa-info-title">
						<p>사번</p>
						<p>이름</p>
						<p>연락처</p>
						<p>부서</p>
						<p>등록일</p>
					</div>
					
				<c:if test="${not empty staffList}">
					<c:forEach items="${staffList}" var="svo">
					<ul class="sa-info-item">
						<li>
							<p><a href="/admin/staff/mypage?staff_id=${svo.staff_id}">${svo.staff_id}</a></p>
							<p>${svo.staff_name} 님</p>
							<p>${svo.staff_phone}</p>
						<c:if test="${svo.staff_type == 1 }">
						<c:if test="${svo.staff_part == 1 }">
							<p>C/S부</p>
						</c:if>
						<c:if test="${svo.staff_part == 2 }">
							<p>영업부</p>
						</c:if>
						<c:if test="${svo.staff_part == 3 }">
							<p>임 원</p>
						</c:if>
						</c:if>
						<c:if test="${svo.staff_type == 0 }">
							<p>퇴 사</p>
						</c:if>
							<p><fmt:formatDate value="${svo.staff_reg_date}" pattern="yyyy년 MM월 dd일" /></p>
						</li>
					</ul>
					</c:forEach>
				</c:if>
				<c:if test="${empty staffList}">
				<p> ※ 등록된 직원이 없습니다.</p>
				</c:if>
				</div>
			</div>
		</div>
	</section>
</body>
</html>