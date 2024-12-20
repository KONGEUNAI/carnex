<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>contract</title>
	<link rel="stylesheet" href="/resources/css/admin/contract.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript">
		if (window.addEventListener) {
			window.addEventListener('load', InitEvent, false);
		}
		var canvas, context, tool;
		function InitEvent() {
			canvas = document.getElementById('drawCanvas');
			if (!canvas) {
				alert("캔버스 객체를 찾을 수 없음");
				return;
			}
			if (!canvas.getContext) {
				alert("Drawing Contextf를 찾을 수 없음");
				return;
			}
			context = canvas.getContext('2d');
			if (!context) {
				alert("getContext() 함수를 호출 할 수 없음");
				return;
			}
			
			tool = new tool_pencil();
			canvas.addEventListener('mousedown', ev_canvas, false);
			canvas.addEventListener('mousemove', ev_canvas, false);
			canvas.addEventListener('mouseup', ev_canvas, false);
			canvas.addEventListener('touchstart', ev_canvas, false);
			canvas.addEventListener('touchmove', ev_canvas, false);
			canvas.addEventListener('touchend', ev_canvas, false);
		}
		function tool_pencil() {
			var tool = this;
			this.started = false;
	
			this.mousedown = function (ev) {
					context.beginPath();
					context.moveTo(ev._x, ev._y);
					tool.started = true;
			};
			
			this.mousemove = function (ev) {
				if (tool.started) {
					context.lineTo(ev._x, ev._y);
					context.stroke();
				}
			};
			
			this.mouseup = function (ev) {
				if (tool.started) {
					tool.mousemove(ev);
					tool.started = false;
				}
			};
		
			this.touchstart = function (ev) {
				context.beginPath();
				context.moveTo(ev._x, ev._y);
				tool.started = true;
			};

			this.touchmove = function (ev) {
				if (tool.started) {
						context.lineTo(ev._x, ev._y);
						context.stroke();
				}
			};

			this.touchend = function (ev) {
				if (tool.started) {
					tool.touchmove(ev);
					tool.started = false;
				}
			};
		}

		function ev_canvas(ev) {
			if (ev.layerX || ev.layerX == 0) { // Firefox 브라우저
				ev._x = ev.layerX;
				ev._y = ev.layerY;
			}
			else if (ev.offsetX || ev.offsetX == 0) { // Opera 브라우저
				ev._x = ev.offsetX;
				ev._y = ev.offsetY;
			}
			else if (ev.targetTouches[0] || ev.targetTouches[0].pageX == 0) {	//핸드폰
				var left = 0;
				var top = 0;
				var elem = document.getElementById('drawCanvas');
		
				while (elem) {
					left = left + parseInt(elem.offsetLeft);
					top = top + parseInt(elem.offsetTop);
					elem = elem.offsetParent;
				}
		
				ev._x = ev.targetTouches[0].pageX - left;
				ev._y = ev.targetTouches[0].pageY - top;
			}

			var func = tool[ev.type];
			if (func) {
			func(ev);
			}
		}	
		
		function onClear() {
			canvas = document.getElementById('drawCanvas');
			context.save();
			context.setTransform(1, 0, 0, 1, 0, 0);
			context.clearRect(0, 0, canvas.width, canvas.height);
			context.restore();
		}

		function saveSign() {
			canvas = document.getElementById('drawCanvas');
			document.getElementById('con_sign').value = canvas.toDataURL();
		}

		$(function(){
			$("#chk").click(function(){
				if ($("#chk").prop("checked")) {
					$(".chkAll").prop("checked", true);
				} else {
					$(".chkAll").prop("checked", false);
				}
			});
		});
			
		var urlParams = new URLSearchParams(window.location.search);
    var car_num = urlParams.get('car_num');
    document.getElementById('validity').value = car_num;
		
		function getCard(){
			carNum = document.getElementById('carNum').value;
			window.open("/static/member/card-storage?car_num="+carNum+"&user_id=", "CardSearch", "width=1200,height=650,scrollbars=yes");
		}
		function getUser(){
			window.open("/admin/member/user-search?num=1", "UserSearch", "width=850,height=350,scrollbars=yes");
		}
	</script>
</head>
<body>
	<form name="contractFrm" action="/admin/contract/contract" method="post" onsubmit="saveSign()">
		<c:if test="${param.car_num == 0 }">
		<div class="contract-title">
			<h2>CARNEX 중고차 계약서</h2>
			<p>※ 종이 출력물로만 사용하세요</p>
		</div>
		</c:if>
		<div class="contract-wrap">
			<input type="hidden" id="validity">
			<h3>구매자 정보</h3>
			<button type="button" onclick="getUser()" class="btn btn-info">유저 찾기</button>
			<ul class="contract-info">
				<li>
					<p>아이디</p>
					<input type="text" name="user_id" value="${mvo.user_id }" placeholder="카넥스 아이디" required class="input-frm input-ct">
				</li>
				<li>
					<p>이름</p>
					<input type="text" name="user_name" value="${mvo.user_name }" placeholder="이름" required class="input-frm input-ct">
				</li>
				<li>
					<p>전화번호</p>
					<input type="tel" name="user_tel" value="${mvo.user_tel }" placeholder="전화번호" required class="input-frm input-ct">
				</li>
				<li>
					<p>우편번호</p>
					<input type="text" name="user_zipcode" value="${mvo.user_zipcode }" placeholder="우편번호" required class="input-frm input-ct">
				</li>
				<li>
					<p>주소</p>
					<input type="text" name="user_address" value="${mvo.user_address }" placeholder="주소" required class="input-frm input-ct">
				</li>
			</ul>
		</div>
	
		<div class="contract-wrap">
			<h3>카드 정보</h3>
			<button type="button" onclick="getCard()" class="btn btn-info">카드 찾기</button>
			<ul class="contract-info card-info">
				<li>
					<p>은행</p>
					<input type="hidden" name="card_num" value="${cardvo.card_num != 0 ? cardvo.card_num : 0}">
					<input type="text" name="card_bank" placeholder="은행" class="input-frm input-ct">
				</li>
				<li>
					<p>성</p>
					<input type="text" name="card_lastname" placeholder="성" class="input-frm input-ct">
				</li>
				<li>
					<p>이름</p>
					<input type="text" name="card_firstname" placeholder="이름" class="input-frm input-ct">
				</li>
				<li>
					<p>CVC 번호</p>
					<input type="text" pattern="[0-9]+" maxlength='3' name="card_cvc" placeholder="CVC 번호" class="input-frm input-ct">
				</li>
				<li>
					<p>카드번호</p>
					<input type="text" pattern="[0-9]+" maxlength='4' name="card_digit1" placeholder="1234" class="input-frm input-ct">
					<input type="password" pattern="[0-9]+" maxlength='4' name="card_digit2" placeholder="****" class="input-frm input-ct">
					<input type="password" pattern="[0-9]+" maxlength='4' name="card_digit3" placeholder="****" class="input-frm input-ct">
					<input type="text" pattern="[0-9]+" maxlength='4' name="card_digit4" placeholder="5678" class="input-frm input-ct">
				</li>
			</ul>
		</div>
	
		<div class="contract-wrap wrap-1">
			<div class="contract-container">
				<h3>상품 정보</h3>
				<ul class="contract-info">
					<li>
						<p>계약 날짜</p>
						<p>${date }</p>
					</li>
					<li>
						<p>상품 제목</p>
						<p>${gvo.car_title }</p>
						<input type="hidden" id="carNum" name="car_num" value="${gvo.car_num }">
						<input type="hidden" name="staff_id" value="${gvo.staff_id }">
						<input type="hidden" name="car_title" value="${gvo.car_title }">
					</li>
					<li>
						<p>상품 부제</p>
						<p>${gvo.car_subtitle }</p>
						<input type="hidden" name="car_subtitle" value="${gvo.car_subtitle }">
					</li>
					<li>
						<p>상품 가격</p>
						<p>${gvo.car_price }</p>
						<input type="hidden" name="car_price" value="${gvo.car_price }">
					</li>
				</ul>
			</div>
	
			<div class="sing-wrap">
				<h3>서명</h3>
				<canvas id="drawCanvas"></canvas>
				<input type="hidden" id="con_sign" name="con_sign" value="">
				<div class="sing-wrap-btn flex-between">
					<a href="#" onclick="onClear();" class="btn btn-info">지우기</a>
					<button type="button" onclick="saveSign()" class="btn btn-info">저장</button>
				</div>
			</div>
		</div>
	
		<div class="contract-wrap">
			<h3>이용약관</h3>
			<div class="joinForm">
				<ul class="join_box">
					<li class="checkBox check01">
						<ul class="clearfix">
							<li>이용약관, 개인정보 수집 및 이용, 위치정보 이용약관(선택), 프로모션 안내 메일 수신(선택)에 모두 동의합니다.</li>
							<li class="checkAllBtn">
								<input type="checkbox" name="chkAll" id="chk" class="chkAll">
							</li>
						</ul>
					</li>
					<li class="checkBox check02">
						<ul class="clearfix">
							<li>이용약관 동의(필수)</li>
							<li class="checkBtn">
								<input type="checkbox" name="chk" class="chkAll">
							</li>
						</ul>
						<textarea>여러분을 환영합니다. 카넥스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 카넥스 서비스의 이용과 관련하여 카넥스 서비스를 제공하는 카넥스 주식회사(이하 ‘네이버’)와 이를 이용하는 카넥스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 카넥스 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
	
	 카넥스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 카넥스 서비스의 이용과 관련하여 카넥스 서비스를 제공하는 카넥스 주식회사(이하 ‘네이버’)와 이를 이용하는 카넥스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 카넥스 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
	
	 카넥스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 카넥스 서비스의 이용과 관련하여 카넥스 서비스를 제공하는 카넥스 주식회사(이하 ‘네이버’)와 이를 이용하는 카넥스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 카넥스 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
						</textarea>
					</li>
					<li class="checkBox check03">
						<ul class="clearfix flex-between">
							<li>개인정보 수집 및 이용에 대한 안내(필수)</li>
							<li class="checkBtn">
								<input type="checkbox" name="chk" class="chkAll">
							</li>
						</ul>
						<textarea>여러분을 환영합니다. 카넥스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 카넥스 서비스의 이용과 관련하여 카넥스 서비스를 제공하는 카넥스 주식회사(이하 ‘네이버’)와 이를 이용하는 카넥스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 카넥스 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
	
	 카넥스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 카넥스 서비스의 이용과 관련하여 카넥스 서비스를 제공하는 카넥스 주식회사(이하 ‘네이버’)와 이를 이용하는 카넥스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 카넥스 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
	
	 카넥스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 카넥스 서비스의 이용과 관련하여 카넥스 서비스를 제공하는 카넥스 주식회사(이하 ‘네이버’)와 이를 이용하는 카넥스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 카넥스 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
						</textarea>
					</li>
					<li class="checkBox check03">
						<ul class="clearfix flex-between">
							<li>위치정보 이용약관 동의(선택)</li>
							<li class="checkBtn">
								<input type="checkbox" name="chk" class="chkAll">
							</li>
						</ul>
						<textarea>여러분을 환영합니다. 카넥스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 카넥스 서비스의 이용과 관련하여 카넥스 서비스를 제공하는 카넥스 주식회사(이하 ‘네이버’)와 이를 이용하는 카넥스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 카넥스 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
	
	 카넥스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 카넥스 서비스의 이용과 관련하여 카넥스 서비스를 제공하는 카넥스 주식회사(이하 ‘네이버’)와 이를 이용하는 카넥스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 카넥스 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
	
	 카넥스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 카넥스 서비스의 이용과 관련하여 카넥스 서비스를 제공하는 카넥스 주식회사(이하 ‘네이버’)와 이를 이용하는 카넥스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 카넥스 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
						</textarea>
					</li>
					<li class="checkBox check04">
						<ul class="clearfix flex-between">
							<li>이벤트 등 프로모션 알림 메일 수신(선택)</li>
							<li class="checkBtn">
								<input type="checkbox" name="chk" class="chkAll">
							</li>
						</ul>
					</li>
				</ul>
				<ul class="footBtwrap clearfix">
					<li><button class="btn btn-info">이전</button></li>
					<li><button class="btn btn-info">작성</button></li>
				</ul>
			</div>
		</div>
	</form>
</body>
</html>