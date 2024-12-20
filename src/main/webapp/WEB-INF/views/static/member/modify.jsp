<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin/login.css">
<link rel="stylesheet" href="/resources/css/user/member-modify.css">
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
						$('#nick-check-modi').text('※ 닉네임이 중복되어 사용할 수 없습니다.');
						$('#user_nick').focus();
						$('#register-btn').attr('disabled', 'disabled');
					} else {
						$('#nick-check-modi').text('※ 사용가능한 닉네임 입니다.')
						$('#nickCheck').addClass('click');
						
						if ($('#nickCheck').hasClass('click')) {
							$('#register-btn').removeAttr('disabled');
						}
					}
				}
			});
		});
		
		$("#userImg").on('change',function(){
      var fileName = $("#userImg").val();
      $(".pimg-op").val(fileName);
    });
		
	});
	
	function getAddress(){
		window.open("/static/member/reg-address", "AddressSearch", "width=700,height=450,scrollbars=yes");
	}
</script>
	
	<section>
		<div class="mb-modi-wrap">
		<h4>회원정보 수정</h4>
		<div class="mb-modi-content">
		<form name="mbRegFrm" action="/static/member/modify" method="post" autocomplete="off" class="mb-modi-frm" enctype="multipart/form-data">
			<ul class="modi-form">
				<li>
					<input id="user_id" type="text" name="user_id" value="${modify.user_id }"  readonly class="form-style">
					<i class="input-icon bi bi-person-fill-add"></i>
				</li>
				<li>
					<input type="password" name="user_pwd" value="" required autofocus placeholder="비밀번호 입력" class="form-style">
					<i class="input-icon bi bi-shield-lock-fill"></i>
				</li>
				<li>
					<input type="text" name="user_name" value="${modify.user_name }" required class="form-style">
					<i class="input-icon bi bi-person-vcard"></i>
				</li>
				<li>
					<input id="user_nick" type="text" name="user_nick" value="${modify.user_nick }" required class="form-style form-check">
					<button id="nickCheck" type="button" class="btn btn-chack modiBtn">닉네임중복확인</button>
					<i class="input-icon bi bi-person-video2"></i>
				</li>
				<li><p id="nick-check-modi">※ 반드시 닉네임 중복확인을 하세요.</p></li>
				<li>
          <input type="date" name="user_birth" required class="form-style">
          <i class="input-icon bi bi-cake2-fill"></i>
        </li>
				<li class="gender-btn">
					<input id="man" type="radio" name="user_gender" value="남자">
					<label for="man" class="btn btn-chack">남자</label>
					<input id="woman" type="radio" name="user_gender" value="여자">
					<label for="woman" class="btn btn-chack">여자</label>
				</li>
				<li>
					<input type="tel" name="user_tel" value="${modify.user_tel }" class="form-style">
					<i class="input-icon bi bi-telephone-fill"></i>
				</li>
				<li>
					<input id="user_zipcode" type="text" name="user_zipcode" value="${modify.user_zipcode }" readonly class="form-style form-check">
					<button id="zipcodeBtn" onclick="getAddress()" type="button" class="btn btn-chack modiBtn">우편번호 찾기</button>
					<i class="input-icon bi bi-building-fill-add"></i>
				</li>
				<li>
					<input id="user_address" type="text" name="user_address" value="${modify.user_address }" class="form-style">
					<i class="input-icon bi bi-house-add-fill"></i>
				</li>
				<li>
					<input type="email" name="user_mail" value="${modify.user_mail }" class="form-style">
					<i class="input-icon bi bi-at"></i>
				</li>
				<li>
					<select name="user_wishcar" class="form-style sel-op">
					  <option value="">선호하는 차량을 선택하세요.</option>
					  <option value="세단" ${modify.user_wishcar == '세단' ? 'selected' : ''}>Sedan</option>
					  <option value="쿠페" ${modify.user_wishcar == '쿠페' ? 'selected' : ''}>Coupe</option>
					  <option value="웨건" ${modify.user_wishcar == '웨건' ? 'selected' : ''}>Station Wagon</option>
					  <option value="SUV" ${modify.user_wishcar == 'SUV' ? 'selected' : ''}>SUV</option>
					  <option value="컨버터블" ${modify.user_wishcar == '컨버터블' ? 'selected' : ''}>Convertible</option>
					  <option value="해치백" ${modify.user_wishcar == '해치백' ? 'selected' : ''}>Hatch Back</option>
					  <option value="리무진" ${modify.user_wishcar == '리무진' ? 'selected' : ''}>Limousine</option>
					  <option value="밴" ${modify.user_wishcar == '밴' ? 'selected' : ''}>VAN</option>
					  <option value="픽업트럭" ${modify.user_wishcar == '픽업트럭' ? 'selected' : ''}>Pick-up Truck</option>
					</select>
		          	<i class="input-icon bi bi-car-front-fill"></i>
		        </li>
		        <li>
				<select name="user_wishprice" class="form-style sel-op">
				  <option value="미정" ${modify.user_wishprice == '미정' ? 'selected' : ''}>선호하는 가격대를 선택하세요.</option>
				  <option value="500만원 이하" ${modify.user_wishprice == '500만원 이하' ? 'selected' : ''}>500만원 이하</option>
				  <option value="2,000만원 이하" ${modify.user_wishprice == '2,000만원 이하' ? 'selected' : ''}>2,000만원 이하</option>
				  <option value="5,000만원 이하" ${modify.user_wishprice == '5,000만원 이하' ? 'selected' : ''}>5,000만원 이하</option>
				  <option value="1억 이하" ${modify.user_wishprice == '1억 이하' ? 'selected' : ''}>1억 이하</option>
				  <option value="2억 이하" ${modify.user_wishprice == '2억 이하' ? 'selected' : ''}>2억 이하</option>
				</select>
		          <i class="input-icon bi bi-coin"></i>
		        </li>
		        <li>
					<select name="user_path" class="form-style sel-op">
					  <option value="없음" ${modify.user_path == '없음' ? 'selected' : ''}>가입경로가 무엇입니까?</option>
					  <option value="검색엔진" ${modify.user_path == '검색엔진' ? 'selected' : ''}>검색엔진</option>
					  <option value="SNS" ${modify.user_path == 'SNS' ? 'selected' : ''}>SNS</option>
					  <option value="자사앱" ${modify.user_path == '자사앱' ? 'selected' : ''}>자사앱</option>
					  <option value="지인소개" ${modify.user_path == '지인소개' ? 'selected' : ''}>지인소개</option>
					  <option value="기타" ${modify.user_path == '기타' ? 'selected' : ''}>기타</option>
					</select>
			        <i class="input-icon bi bi-sign-turn-slight-right-fill"></i>
		        </li>
				<li>
			        <input placeholder="프로필 이미지등록" class="form-style form-check pimg-op">
			        <label for="userImg" class="btn btn-chack modiBtn">파일찾기</label>
			        <input type="file" id="userImg" name="userImg" accept="image/*">
			        <i class="input-icon bi bi-image"></i>
			      </li>
					<li class= "gender-btn">
						<button id="register-btn" type="submit" class="btn btn-chack" disabled="disabled">제출</button>
						<a href="/static/member/mypage?user_id=${modify.user_id }" class="btn btn-chack">뒤로가기</a>
					</li>
			</ul>
		</form>
		</div>
		</div>
	</section>
	
<%@include file = "../include/footer.jsp" %>