<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/adm-header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin/staff.css">
<script>
	$(function(){
		$('#idCheck').click(function(){
			
			var query = { staff_id : $('#staff_id').val() };
			
			$.ajax({
				url:'/confirm/staff/idcheck',
				type: 'post',
				data: query,
				success: function(data){
					if (data === 'success') {
						$('#id-check-msg').text('※ 아이디가 중복되어 사용할 수 없습니다.');
						$('#staff_id').focus();
						$('#register-btn').attr('disabled', 'disabled');
					} else {
						$('#id-check-msg').text('※ 사용가능한 아이디 입니다.')
						$('#idCheck').addClass('click');
						
						if ($('#idCheck').hasClass('click')) {
							$('#register-btn').removeAttr('disabled');
						}
					}
				}
			});
		});
	});
</script>
	<section>
		<div class="tab-content">
			<form action="/admin/staff/register" method="post" enctype="multipart/form-data">
		    <div class="content-header flex-between">
		        <h3>직원 등록</h3>
		        <div class="sec-btn">
		          	<button id="register-btn" type="submit" disabled="disabled">직원등록</button>
					<a href="/admin/staff/list">직원목록</a>
		        </div>
		    </div>
		    
	    	<div class="content-wrap staff-reg">
	    		<h3>직원 정보 입력</h3>
					<ul class="sa-reg-frm">
						<li>
							<p>사원번호</p>
							<div class="mb-frm-check">
								<input id="staff_id" type="text" name="staff_id" placeholder="사원 번호 입력" required autofocus class="input-frm input-sa">
								<p id="id-check-msg" class="sa-msg">※ 아이디중복확인 버튼을 클릭하여 아이디 중복확인을 하세요.</p>
							</div>
							<button id="idCheck" type="button" class="btn btn-info">중복확인</button>
						</li>
						<li>
							<p>비밀번호</p>
							<input type="password" name="staff_pwd" placeholder="비번 입력" required class="input-frm input-sa">
						</li>
						<li>
							<p>이름</p>
							<input type="text" name="staff_name" placeholder="이름 입력" required class="input-frm input-sa">
						</li>
						<li>
							<p>전화번호</p>
							<input type="tel" name="staff_phone" placeholder="전화번호 입력" class="input-frm input-sa">
						</li>
						<li>
							<p>부서</p>
							<div class="mb-frm-check">
								<input type="number" name="staff_part" placeholder="부서 입력" class="input-frm input-sa">
								<p class="sa-msg">※ C/S팀 : 1, 영업팀 : 2, 임원 : 3</p>
							</div>
						</li>
						<li>
							<p>고용 상태</p>
							<input type="number" name="staff_type" placeholder="일반(0) / 직원(1)" class="input-frm input-sa">
						</li>
						<li>
							<p>인사말</p>
							<input type="text" name="staff_intro" placeholder="인사말 입력" class="input-frm input-sa">
						</li>
						<li>
							<p>직원사진</p>
							<input type="file" id="staffImg" name="staffImg" accept="image/*">
						</li>
					</ul>
				</div>
			</form>
		</div>
	</section>
</body>
</html>