<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
	<title>address</title>
	<link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/static/common.css">
	<link rel="stylesheet" href="/resources/css/user/member.css">
	<script>
		function sendAddr(zipcode, area1, area2, area3, area4) {
			var address = area1+''+area2+''+area3+''+area4;
// 			opener.document.mbRegFrm.user_zipcode.value = zipcode;
// 			opener.document.mbRegFrm.user_address.value = address;
			opener.document.mbRegFrm.user_zipcode.value = zipcode;
			opener.document.mbRegFrm.user_address.value = address;
			self.close();
		}
	</script>
</head>
<body>
	<div class="addr-container">
		<form id="zip-frm" action="/static/member/reg-address" method="post">
			<div class="search-wrap">
				<input type="search" name="area3" placeholder="동 입력" required class="input-ad">
				<button type="submit" class="btn btn-carnex">우편번호 찾기</button>
				<button type="button" onclick="self.close()" class="btn btn-delete">창 닫기</button>
			</div>
		</form>
		<div class="addr-list">
		<c:forEach items="${addrList}" var="addrVO">
			<a href="javascript:sendAddr('${addrVO.zipcode }', '${addrVO.area1 }', '${addrVO.area2 }', '${addrVO.area3 }', '${addrVO.area4 }' )">
				${addrVO.zipcode } ${addrVO.area1 } ${addrVO.area2 } ${addrVO.area3 } ${addrVO.area4 }
			</a>
		</c:forEach>
		</div>
		<p class="addr-msg">&#8251 주소를 클릭하시면 자동입력됩니다.</p>
	</div>
</body>
</html>