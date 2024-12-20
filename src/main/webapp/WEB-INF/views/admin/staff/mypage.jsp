<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/adm-header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin/staff.css">

	<section>
		<div class="tab-content">
	    	<div class="content-header flex-between">
		        <h3>마이페이지</h3>
		        <div class="sec-btn">
					<a href="/admin/staff/modify?staff_id=${staff.staff_id }">정보수정</a>
		        </div>
		    </div>
		    
			<c:if test="${staff != null}">
			<div class="content-wrap staff-info">
				<div>
					<h3>직원 정보</h3>
					<ul class="sa-info">
						<li>
							<p>이 름</p>
							<p>${staff.staff_name}</p>
						</li>
						<li>
							<p>사 번</p>
							<p>${staff.staff_id}</p>
						</li>
						<li>
							<p>연락처</p>
							<p>${staff.staff_phone}</p>
						</li>
						<c:if test="${staff.staff_type == 1 }">
						<li>
							<p>고용상태</p>
							<p>근 무</p>
						</li>
						<c:if test="${staff.staff_part == 1}">
						<li>
							<p>부 서</p>
							<p>C/S팀</p>
						</li>
						</c:if>
						<c:if test="${staff.staff_part == 2}">
						<li>
							<p>부 서</p>
							<p>영업팀</p>
						</li>
						</c:if>
						<c:if test="${staff.staff_part == 3}">
						<li>
							<p>부 서</p>
							<p>임 원</p>
						</li>
						</c:if>
						<li>
							<p>등록일</p>
							<p><fmt:formatDate value="${staff.staff_reg_date}" pattern="yyyy년 MM월 dd일" /></p>
						</li>
						<li>
							<p>수정일</p>
							<p><fmt:formatDate value="${staff.staff_up_date}" pattern="yyyy년 MM월 dd일" /></p>
						</li>
						</c:if>
						<c:if test="${staff.staff_type == 0 }">
						<li>
							<p>고용상태</p>
							<p>퇴 사</p>
						</li>
						<li>
							<p>퇴사일</p>
							<p><fmt:formatDate value="${staff.staff_out_date}" pattern="yyyy년 MM월 dd일" /></p>
						</li>
						</c:if>
					</ul>
				</div>
				
				<div>
					<h3>직원 이미지</h3>
					<div class="staff-img">
						<c:if test="${staff.staff_img != null }">
						<img alt="직원이미지" src="${staff.staff_img }">
			    		</c:if>
			    		
						<c:if test="${staff.staff_img == null }">
			    		<img src="/resources/images/noimage.jpg" class="img" alt="직원이미지"></img>
				    	</c:if>
			    	</div>
		    	</div>
			</div>
			</c:if>
			<c:if test="${staff == null }">
			<p class="cf-msg">직원 정보가 없습니다</p>
			</c:if>
		</div>
	</section>
</body>
</html>