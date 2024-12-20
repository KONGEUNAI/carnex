<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/adm-header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin/staff.css">
	
	<section>
		<form name="mbRegFrm" action="/admin/staff/modify" method="post" autocomplete="off" enctype="multipart/form-data">
			<div class="tab-content">
				<div class="content-header flex-between">
	        <h3>직원 수정</h3>
	        <div class="sec-btn">
						<button id="register-btn" type="submit">정보수정</button>
						<c:if test="${modify.staff_part >= 5 }">
						<a href="/admin/staff/list">직원 목록</a>
						</c:if>
						<c:if test="${modify.staff_part == 1}">
						<a href="/admin/staff/partlist?staff_part=${modify.staff_part}">C/S부 직원 목록</a>
						</c:if>
						<c:if test="${modify.staff_part == 2}">
						<a href="/admin/staff/partlist?staff_part=${modify.staff_part}">영업부 직원 목록</a>
						</c:if>
						<c:if test="${modify.staff_part == 3}">
						<a href="/admin/staff/partlist?staff_part=${modify.staff_part}">임원실 직원 목록</a>
						</c:if>
	        </div>
		    </div>
		    <div class="content-wrap">
					<ul class="sa-mod-frm">
						<li>
							<p>사원번호</p>
							<input type="text" name="staff_id" value="${modify.staff_id }" readonly class="input-frm input-sa">
						</li>
						<li>
							<p>비밀번호</p>
							<input type="password" name="staff_pwd" value="" required autofocus class="input-frm input-sa">
						</li>
						<li>
							<p>이름</p>
							<input type="text" name="staff_name" value="${modify.staff_name }" required class="input-frm input-sa">
						</li>
						<li>
							<p>전화번호</p>
							<input type="tel" name="staff_phone" value="${modify.staff_phone }" class="input-frm input-sa">
						</li>
						<li>
							<p>부서</p>
							<div class="mb-frm-check">
								<input type="number" name="staff_part" value="${modify.staff_part }" class="input-frm input-sa">
								<p class="sa-msg">※ C/S부 : 1, 영업부 : 2, 임원 : 3</p>
							</div>
						</li>
						<li>
							<p>고용상태</p>
							<div class="mb-frm-check">
								<input type="number" name="staff_type" value="${modify.staff_type }" class="input-frm input-sa">
								<p class="sa-msg">※ 일반 : 0, 직원 : 1</p>
							</div>
						</li>
						<li>
							<p>인사말</p>
							<input type="text" name="staff_intro" value="${modify.staff_intro }" class="input-frm input-sa">
						</li>
						<li>
							<p>직원사진</p>
							<input type="file" id="staffImg" name="staffImg" accept="image/*">
						</li>
					</ul>
				</div>
			</div>
		</form>
	</section>
</body>
</html>