<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>login</title>
  <link rel="stylesheet" href="/resources/css/reset.css">
  <link rel="stylesheet" href="/resources/css/static/common.css">
  <link rel="stylesheet" href="/resources/css/admin/login.css">
	<script src="/resources/js/jquery-1.12.4.min.js"></script>
<!--   <script src="js/common.js"></script> -->
  <script>
    $(function() {
      $('.chack-btn input').click(function() {
        var activeTab = $(this).attr('data-tab');
        $('ul.tab li').removeClass('on');
        $('.tab-content').removeClass('on');
        $(this).addClass('on');
        $('#' + activeTab).addClass('on');
      });
      
      $('#idCheck').click(function(){
    	  
			var query = { user_id : $('#user_id').val() };
			
			$.ajax({
				url:'/confirm/member/idcheck',
				type: 'post',
				data: query,
				success: function(data){
					  if (data === 'success') {
					  	$('#id-check-msg').text('※ 아이디가 중복되어 사용할 수 없습니다.');
					  	$('#user_id').focus();
				  		$('#register-btn').attr('disabled', 'disabled');
				  	} else {
				  		$('#id-check-msg').text('※ 사용가능한 아이디 입니다.')
				  		$('#idCheck').addClass('click');
			  			if ($('#idCheck').hasClass('click') && $('#nickCheck').hasClass('click')) {
			  				$('#register-btn').removeAttr('disabled');
		  				}
		  			}
		  		}
	  		});
	  	});
		
		
			$('#nickCheck').click(function(){
				
				var query = { user_nick : $('#user_nick').val() };
				
				$.ajax({
					url:'/confirm/member/nickcheck',
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
							
							if ($('#idCheck').hasClass('click') && $('#nickCheck').hasClass('click')) {
								$('#register-btn').removeAttr('disabled');
							}
						}
					}
				});
			});
    });
    function getAddress(){
			window.open("/static/member/reg-address", "AddressSearch", "width=700,height=450,scrollbars=yes");
		}
  </script>
</head>

<body>
  <section>
    <div class="login">
      <a href="/" class="login-logo"><h3><span class="txt-y">C</span>ar<span class="txt-b">N</span>ex</h3></a>
      <input class="checkbox" type="checkbox" id="reg-log" name="reg-log">
      <label for="reg-log" class="reg-log"><span class="login-check">LOGIN</span> / <span class="singup-check">SING UP</span></label>
      <div class="card-3d-wrap">
        <div class="card-3d-wrapper">
          <div class="card-front">
            <div class="center-wrap">
              <div class="chack-btn flex-evenly">
                <input id="tabs-1" type="radio" name="tabs-radio" data-tab="tab1" checked>
                <label for="tabs-1" class="tabs-btn"><h4>회원 로그인</h4></label>
                <input id="tabs-2" type="radio" name="tabs-radio" data-tab="tab2">
                <label for="tabs-2" class="tabs-btn"><h4>직원 로그인</h4></label>
              </div>

              <!-- 회원로그인 -->
              <form action="/confirm/member/login" id="tab1" class="tab-content on" method="post">
                <c:if test="${not empty errorMessage}">
				        <li class="error-message" style="color: red;">
				            <p>${errorMessage}</p>
				        </li>
				    		</c:if>  
                <ul class="input-form user-login">
                  <li>
                    <input type="text" name="user_id" placeholder="회원 아이디" class="form-style">
                    <i class="input-icon bi bi-person-fill"></i>
                  </li>  
                  <li>
                    <input type="password" name="user_pwd" placeholder="회원 비밀번호" class="form-style">
                    <i class="input-icon bi bi-shield-lock-fill"></i>
                  </li>
                  <li class="flex-between">
                    <button type="submit" class="btn btn-carnex">login</button>
                    <button href="#" class="btn btn-kakao">kakao</button>
                    <button href="#" class="btn btn-naver">naver</button>
                  </li>
                </ul>
              </form>

              <!-- 직원로그인 -->
              <form action="/confirm/staff/login" id="tab2" class="tab-content" method="post">
              	<c:if test="${not empty errorMessageStaff}">
				        <li class="error-message" style="color: red;">
				            <p>${errorMessageStaff}</p>
				        </li>
				   			</c:if>
                <ul class="input-form admin-login">
                  <li>
                    <input type="text" name="staff_id" placeholder="직원 아이디" class="form-style">
                    <i class="input-icon bi bi-person-fill"></i>
                  </li>  
                  <li>
                    <input type="password" name="staff_pwd" placeholder="직원 비밀번호" class="form-style">
                    <i class="input-icon bi bi-shield-lock-fill"></i>
                  </li>
                  <li class="flex-between">
                    <button type="submit" class="btn btn-carnex">login</button>
                    <button href="#" class="btn btn-kakao">kakao</button>
                    <button href="#" class="btn btn-naver">naver</button>
                  </li>
                </ul>
              </form>

              <a href="#" class="link"><p>비밀번호를 잊었습니까?</p></a>
              <a href="/static/campaign"><div class="event-bn"></div></a>
              <ul class="login-txt flex-evenly">
                <li><a href="#" class="link"><p>이용약관</p></a></li>
                <li><a href="#" class="link"><p>개인정보처리방침</p></a></li>
                <li><a href="#" class="link"><p>책임의 한계와 법적고지</p></a></li>
                <li><a href="#" class="link"><p>회원정보 고객센터</p></a></li>
              </ul>
            </div>
          </div>

          <!-- 회원가입 -->
          <div class="card-back">
            <form name="mbRegFrm" action="/static/member/register" method="post" class="center-wrap">
              <h4>SIGN UP</h4>
              <ul class="input-form">
                <li>
                  <input id="user_id" type="text" name="user_id" placeholder="아이디" required autofocus class="form-style">
                  <button id="idCheck" type="button" class="btn btn-chack">중복 확인</button>
                  <i class="input-icon bi bi-person-fill-add"></i>
                </li>
                <li><p id="id-check-msg">※ 아이디 중복체크를 해주세요.</p></li>
                <li>
                  <input type="password" name="user_pwd" placeholder="비밀번호" required class="form-style">
                  <i class="input-icon bi bi-shield-lock-fill"></i>
                </li>
                <li>
                  <input type="text" name="user_name" placeholder="이름" required class="form-style">
                  <i class="input-icon bi bi-person-vcard"></i>
                </li>
                <li>
                  <input id="user_nick" type="text" name="user_nick" placeholder="닉네임" required class="form-style">
                  <button id="nickCheck" type="button" class="btn btn-chack">중복 확인</button>
                  <i class="input-icon bi bi-person-video2"></i>
                </li>
                <li><p id="nick-check-msg">※ 닉네임 중복체크를 해주세요.</p></li>
                <li>
                  <input type="date" name="user_birth" required class="form-style">
                  <i class="input-icon bi bi-cake2-fill"></i>
                </li>  
                <li>
                  <input type="radio" name="user_gender" value="남자" class="gender" id="male">
                  <label class="btn btn-chack" for="male">남자</label>
                  <input type="radio" name="user_gender" value="여자" class="gender" id="female">
                  <label class="btn btn-chack" for="female">여자</label>
                </li>
                <li>
                  <input type="tel" name="user_tel" placeholder="전화번호" required class="form-style">
                  <i class="input-icon bi bi-telephone-fill"></i>
                </li>
                <li>
                  <input type="text" name="user_zipcode" placeholder="우편번호" readonly required class="form-style">
                  <button type="button" onclick="getAddress()" class="btn btn-chack">우편번호 찾기</button>
                  <i class="input-icon bi bi-building-fill-add"></i>
                </li>
                <li>
                  <input type="text" name="user_address" placeholder="주소" required class="form-style">
                  <i class="input-icon bi bi-house-add-fill"></i>
                </li>
                <li><button id="register-btn" type="submit" class="btn btn-sub btn-carnex">Next step</button></li>
              </ul>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>

</body>
</html>