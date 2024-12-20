<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>contract</title>
	<link rel="stylesheet" href="/resources/css/admin/contract.css">
</head>
<script>
	console.log("staffsess:", ${staffsess});
</script>
<body>
	<div class="contract-wrap">
		<h2>계약서 확인<br><br></h2>
		<h3>구매자 정보</h3>
		<ul class="contract-info">
			<li>
				<p>이름</p>
				<p>${mvo.user_name }</p>
			</li>
			<li>
				<p>전화번호</p>
				<p>${mvo.user_tel }</p>
			</li>
			<li>
				<p>우편번호</p>
				<p>${mvo.user_zipcode }<p>
			</li>
			<li>
				<p>주소</p>
				<p>${mvo.user_address }</p>
			</li>
		</ul>
	</div>
	
	<div class="contract-wrap">
		<h3>카드 정보</h3>
		<ul class="contract-info">
			<li>
				<p>은행</p>
				<p>${cvo.card_bank }</p>
			</li>
			<li>
				<p>이름</p>
				<p>${mvo.user_name }</p>
			</li>
			<li>
				<p>카드번호</p>
				<p>${cvo.card_digit1} ${cvo.card_digit2} ${cvo.card_digit3} ${cvo.card_digit4}<p>
			</li>
		</ul>
	</div>

	<div class="contract-wrap wrap-1">
		<div class="contract-container">
			<h3>상품 정보</h3>
			<ul class="contract-info">
				<li>
					<p>계약 날짜</p>
					<p><fmt:formatDate value="${convo.con_reg_date }" pattern="yyyy년 MM월 dd일" /></p>
				</li>
				<li>
					<p>상품 제목</p>
					<p>${gvo.car_title }</p>
				</li>
				<li>
					<p>상품 부제</p>
					<p>${gvo.car_subtitle }</p>
				</li>
				<li>
					<p>상품 가격</p>
					<p>${gvo.car_price }</p>
				</li>
			</ul>
		</div>

		<div class="sing-wrap">
			<h3>서명</h3>
			<img src="${convo.con_sign}" />
		</div>
	</div>
	
	<div class="contract-wrap wrap-2">
		<div class="contract-container">
			<h3>판매자 정보</h3>
			<ul class="contract-info">
				<li>
					<p>이름</p>
					<p>${convo.staff_id }</p>
				</li>
				<li>
					<p>부서</p>
					<c:if test ="${svo.staff_part == 1 }">
					<p>C/S</p>
					</c:if>
					<c:if test ="${svo.staff_part == 2 }">
					<p>영업</p>
					</c:if>
					<c:if test ="${svo.staff_part == 3 }">
					<p>임원</p>
					</c:if>
				</li>
				<li>
					<p>연락처</p>
					<p>${svo.staff_phone }</p>
				</li>
			</ul>
			<c:if test="${staffsess != null }">
				<a href="/admin/contract/list" class="btn btn-info btn-confirm">확 인</a>
			</c:if>
			<c:if test="${staffsess == null }">
				<a href="javascript:void(0);" onclick="history.back();" class="btn btn-info btn-confirm">확 인</a>
			</c:if>
		</div>
	</div>
	
</body>
</html>