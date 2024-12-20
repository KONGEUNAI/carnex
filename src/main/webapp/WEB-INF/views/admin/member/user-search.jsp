<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="/resources/css/reset.css" />
    <link rel="stylesheet" href="/resources/css/admin/admin.css" />
    <link rel="stylesheet" href="/resources/css/admin/usersearch.css" />
		<link rel="stylesheet" href="/resources/css/user/member.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
<script>
	$(function(){
		$('#mb-search').keyup(function(){
		    var value = $(this).val().toLowerCase();

		    $('.mb-info-wrap li').filter(function(index) {
		        // 첫 번째 li는 제외하고, 두 번째 li부터 선택
		        if (index > 0) { 
		            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
		        }
		    });
		});
	});
	
	function setUser(event){
		const userId = event.target.id;
		var id = document.getElementById('id-'+userId).value;
		var name= document.getElementById('name-'+userId).value;
		var tel = document.getElementById('tel-'+userId).value;
		var zipcode = document.getElementById('zipcode-'+userId).value;
		var address = document.getElementById('address-'+userId).value;
    
		opener.document.contractFrm.user_id.value = id;
		opener.document.contractFrm.user_name.value = name;
		opener.document.contractFrm.user_tel.value = tel;
		opener.document.contractFrm.user_zipcode.value = zipcode;
		opener.document.contractFrm.user_address.value = address;
		
		self.close();
	}
</script>
	<section>
		<div class="tab-content">
	    <div class="content-header flex-between">
	        <h3>회원 목록</h3>
	    </div>
    
	    <div class="content-wrap">
	    	<div class="mb-search-wrap">
					<input type="search" id="mb-search" placeholder="회원 닉네임 입력" class="input-frm input-sa">
				</div>
				<ul class="mb-info-wrap">
					<li>
						<p>아이디</p>
						<p>닉네임</p>
						<p>이름</p>
						<p>회원</p>
						<p>최종수정일</p>
					</li>
		<c:if test="${mbList != null }">
			<c:forEach items="${mbList}" var="mvo">
					<li>
						<input type="hidden" value="${mvo.user_id }" id="id-${mvo.user_id }">
						<input type="hidden" value="${mvo.user_name }" id="name-${mvo.user_id }">
						<input type="hidden" value="${mvo.user_tel }" id="tel-${mvo.user_id }">
						<input type="hidden" value="${mvo.user_zipcode }" id="zipcode-${mvo.user_id }">
						<input type="hidden" value="${mvo.user_address }" id="address-${mvo.user_id }">
						<p><a href="" id="${mvo.user_id }" onclick="javascript:setUser(event)">${mvo.user_id}</a></p>
						<p>${mvo.user_nick}</p>
						<p>${mvo.user_name}</p>
					<c:if test="${mvo.user_type == 0 }">
						<p>비회원</p>
					</c:if>
					<c:if test="${mvo.user_type == 1 }">
						<p>회원</p>
					</c:if>
						<p><fmt:formatDate value="${mvo.user_up_date}" pattern="yyyy년 MM월 dd일" /></p>
					</li>
			</c:forEach>
		</c:if>
				</ul>
			</div>
		</div>
	</section>
</body>
</html>
