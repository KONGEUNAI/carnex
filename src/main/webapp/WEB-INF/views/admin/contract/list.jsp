<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/adm-header.jsp" %>
	<link rel="stylesheet" href="/resources/css/admin/staff.css">
	<script>
		$(function(){
			$('#sa-search').keyup(function(){
				var value = $(this).val().toLowerCase();
				
				$('.con-info-item > li').filter(function(){
					$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
				});
			});
		});
	</script>
	
	<section>
		<div class="tab-content">
	    <div class="content-header flex-between">
        <h3>계약 내역</h3>
	    </div>
	    
	    <div class="content-wrap contract-list">
	    	<h3>계약 내역 검색</h3>
			<div class="sa-search-wrap">
				<input type="search" id="sa-search" placeholder="검색어 입력" class="input-frm input-sa">
			</div>
			
			<h3>계약 내역 목록</h3>
			<div class="sa-info-wrap">
				<div class="con-info-title">
					<p>순번</p>
					<p>구매자</p>
					<p>판매자</p>
					<p>상태</p>
					<p>계약날짜</p>
				</div>
				<ul class="con-info-item">
				<c:forEach items="${cvo}" var="conList">
					<c:if test="${not empty cvo}">
					<li>
						<p><a href="/confirm/contract-success?con_no=${conList.con_no }">${conList.con_no}</a></p>
						<p>${conList.user_id} 님</p>
						<p>${conList.staff_id} 님</p>
						<p>${conList.con_status}</p>
						<p><fmt:formatDate value="${conList.con_reg_date}" pattern="yyyy-MM-dd" /></p>
					</li>
					</c:if>
				</c:forEach>
					<c:if test="${empty cvo}">
					<li>
						<p style="width:200px;"> ※ 조회된 계약이 없습니다.</p>
					</li>
					</c:if>
				</ul>
			</div>
			</div>
		</div>
	</section>
</body>
</html>