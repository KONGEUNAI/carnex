<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/adm-header.jsp" %>
  <link rel="stylesheet" href="/resources/css/user/member.css">
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
							$('#nick-check-msg').text('※ 닉네임이 중복되어 사용할 수 없읍니다.');
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
			window.open("/static/member/reg-address", "AddressSearch", "width=350,height=450,scrollbars=yes");
		}
  </script>
</head>

<body>

  <section>
	  <form name="mbRegFrm" action="/admin/member/register" method="post" class="center-wrap">
	  	<div class="tab-content">
		    <div class="content-header flex-between">
		        <h3>회원 등록</h3>
		        <div class="sec-btn">
  					<button id="register-btn" type="submit" disabled="disabled">회원 등록</button>
					<a href="/admin/member/list">회원 목록</a>
		        </div>
		    </div>
		    <div class="content-wrap member-reg">
		    	<h3>회원 정보 입력</h3>
			    <ul class="mb-reg-frm">
			      <li>
			      	<p>회원 아이디</p>
			      	<div class="mb-frm-check">
			        	<input id="user_id" type="text" name="user_id" placeholder="아이디" required autofocus class="input-frm input-mb">
			        	<p id="id-check-msg">※ 아이디 중복체크를 해주세요.</p>
			        </div>
			        <button id="idCheck" type="button" class="btn btn-info">중복 확인</button>
			      </li>
			      <li>
			      	<p>회원 비밀번호</p>
			        <input type="password" name="user_pwd" placeholder="비밀번호" required class="input-frm input-mb">
			      </li>
			      <li>
			      	<p>회원 이름</p>
			        <input type="text" name="user_name" placeholder="이름" required class="input-frm input-mb">
			      </li>
			      <li>
			      	<p>회원 닉네임</p>
			      	<div class="mb-frm-check">
			        	<input id="user_nick" type="text" name="user_nick" placeholder="닉네임" required class="input-frm input-mb">
			        	<p id="nick-check-msg">※ 닉네임 중복체크를 해주세요.</p>
			        </div>
		        	<button id="nickCheck" type="button" class="btn btn-info">중복 확인</button>
			      </li>
			      <li>
			      	<p>회원 생년월일</p>
			        <input type="date" name="user_birth" required class="input-frm input-mb">
			      </li>  
			      <li>
			      	<p>성별</p>
			        <input type="radio" name="user_gender" value="남자" class="gender" id="male" checked>
			        <label class="btn btn-info btn-man" for="male">남자</label>
			        <input type="radio" name="user_gender" value="여자" class="gender" id="female">
			        <label class="btn btn-info btn-woman" for="female">여자</label>
			      </li>
			      <li>
			      	<p>회원 전화번호</p>
			        <input type="tel" name="user_tel" placeholder="전화번호" required class="input-frm input-mb">
			      </li>
			      <li>
			      	<p>회원 우편번호</p>
			        <input type="text" name="user_zipcode" placeholder="우편번호" readonly required class="input-frm input-mb">
			        <button type="button" onclick="getAddress()" class="btn btn-info">우편번호 찾기</button>
			      </li>
			      <li>
			      	<p>회원 주소</p>
			        <input type="text" name="user_address" placeholder="주소" required class="input-frm input-mb">
			      </li>
			    </ul>
		    </div>
	    </div>
	  </form>
  </section>
</body>
</html>