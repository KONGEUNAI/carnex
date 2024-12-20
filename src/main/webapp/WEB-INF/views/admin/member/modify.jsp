<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/adm-header.jsp" %>
<link rel="stylesheet" href="/resources/css/user/member.css">
<script>
	$(function(){
		$('#nickCheck').click(function(){
			
			var query = {
				user_id : $('#user_id').val()
				, user_nick : $('#user_nick').val()
			};
			
			$.ajax({
				url:'/confirm/member/upnickcheck',
				type: 'post',
				data: query,
				success: function(data){
					if (data === 'success') {
						$('#nick-check-msg').text('※ 닉네임이 중복되어 사용할 수 없습니다.');
						$('#user_nick').focus();
						$('#register-btn').attr('disabled', 'disabled');
					} else {
						$('#nick-check-msg').text('※ 사용가능한 닉네임 입니다.')
						$('#nickCheck').addClass('click');
						
						if ($('#nickCheck').hasClass('click')) {
							$('#register-btn').removeAttr('disabled');
						}
					}
				}
			});
		});
	});
	
	function getAddress(){
		window.open("/static/member/reg-address", "AddressSearch", "width=350,height=450,scrollbars=yes");
	}
</script>
	<section>
		<form name="mbRegFrm" action="/admin/member/modify" method="post" autocomplete="off">
			<div class="tab-content">
		    <div class="content-header flex-between">
		        <h3>회원 수정</h3>
		        <div class="sec-btn">
				<button id="register-btn" type="submit" disabled="disabled">정보수정</button>
				<a href="/admin/member/list">회원목록</a>
		        </div>
		    </div>
		    <div class="content-wrap">
					<ul class="mb-mod-frm">
						<li>
							<p>회원 아이디</p>
							<input id="user_id" type="text" name="user_id" value="${modify.user_id }" readonly class="input-frm input-mb">
						</li>
						<li>
							<p>회원 비밀번호</p>
							<input type="password" name="user_pwd" value="" required autofocus class="input-frm input-mb">
						</li>
						<li>
							<p>회원 이름</p>
							<input type="text" name="user_name" value="${modify.user_name }" required class="input-frm input-mb">
						</li>
						<li>
							<p>회원 닉네임</p>
							<div class="mb-frm-check">
								<input id="user_nick" type="text" name="user_nick" value="${modify.user_nick }" required class="input-frm input-mb">
								<p id="nick-check-msg">※ 닉네임중복확인 버튼을 클릭하여 닉네임 중복확인을 하세요.</p>
							</div>
							<button id="nickCheck" type="button" class="btn btn-info">닉네임중복확인</button>
						</li>
						<li>
							<p>회원 생년월일</p>
				          	<input type="date" name="user_birth" required class="input-frm input-mb">
				        </li> 
						<li>
							<p>성 별</p>
							<input id="man" type="radio" name="user_gender" value="남자" checked>
							<label for="man" class="btn btn-info btn-man">남자</label>
							<input id="woman" type="radio" name="user_gender" value="여자">
							<label for="woman" class="btn btn-info btn-woman">여자</label>
						</li>
						<li>
							<p>회원 전화번호</p>
							<input type="tel" name="user_tel" value="${modify.user_tel }" class="input-frm input-mb">
						</li>
						<li>
							<p>회원 우편번호</p>
							<input id="user_zipcode" type="text" name="user_zipcode" value="${modify.user_zipcode }" readonly class="input-frm input-mb">
							<button id="zipcodeBtn" onclick="getAddress()" type="button" class="btn btn-info">우편번호 찾기</button>
						</li>
						<li>
							<p>회원 주소</p>
							<input id="user_address" type="text" name="user_address" value="${modify.user_address }" class="input-frm input-mb">
						</li>
						<li>
							<p>회원 메일</p>
							<input type="email" name="user_mail" value="${modify.user_mail }" class="input-frm input-mb">
						</li>
						<li>
							<p>회원 유형</p>
							<div class="mb-frm-check">
								<input type="number" name="user_type" placeholder="회원 유형" class="input-frm input-mb">
								<p class="cf-msg">※ 비회원 0, 회원은 1을 입력하세요</p>
							</div>
						</li>
					</ul>
				</div>
			</div>
		</form>
	</section>
</body>
</html>