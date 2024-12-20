<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/adm-header.jsp" %>
	<link rel="stylesheet" href="/resources/css/admin/staff.css">
	<script>
		$(function(){
			$('#type-search').click(function(){
				var type = document.getElementById('keyword');
				var search = document.getElementById('sa-search');
				// 선택된 option의 value 가져오기
			  var carType = type.value;
			  var keyword = search.value;
			  var urlParams = new URLSearchParams(window.location.search);
			  var status = urlParams.get('car_status');
				location.href="/admin/goods/goodsList?carType="+carType+"&keyword="+keyword+"&car_status="+status;
			});
		});
	</script>
	
	<section>
		<div class="tab-content">
	    <div class="content-header flex-between">
        	<h3>차량 목록</h3>
	    </div>
	    
			<div class="content-wrap goods-list" id="gd-wrap">
		    	<h3>차량 검색</h3>
				<div class="gd-search-wrap">
					<input type="search" id="sa-search" placeholder="차량 입력" class="input-frm input-sa">
					<select name="keyword" id="keyword">
						<option value="">전체</option>
						<option value="세단">세단</option>
						<option value="쿠페">쿠페</option>
						<option value="웨건">웨건</option>
						<option value="SUV">SUV</option>
						<option value="컨버터블">컨버터블</option>
						<option value="해치백">해치백</option>
						<option value="리무진">리무진</option>
						<option value="밴">밴</option>
						<option value="픽업트럭">픽업트럭</option>
					</select>
					<a href="#" id="type-search" class="btn btn-info">검색</a>
				</div>
				
				<h3>차량 목록</h3>
				<div class="gd-info-wrap">
					<div class="gd-info-title">
						<p>상품제목</p>
						<p>판매상태</p>
						<p>상품지역</p>
						<p>상품가격</p>
						<p>차 종</p>
						<p>등록일</p>
					</div>
					<ul class="sa-info-item" id="gd-wrap">
					<c:if test="${not empty goodsList}">
					<c:forEach items="${goodsList}" var="gvo">
						<li>
							<p><a href="/admin/goods/view?car_num=${gvo.car_num}">${gvo.car_title}</a></p>
							<p>${gvo.car_status}</p>	
							<p>${gvo.car_zone}</p>
							<c:if test="${gvo.car_price >= 100000000}">
					    <p><fmt:formatNumber value="${gvo.car_price / 100000000}" pattern="#,##0" /> 억</p>
							</c:if>
							<c:if test="${gvo.car_price < 100000000}">
					    <p><fmt:formatNumber value="${gvo.car_price / 10000}" pattern="#,##0" /> 만원</p>
							</c:if>
							<p>${gvo.car_type }</p>
							<p><fmt:formatDate value="${gvo.car_reg_date}" pattern="yyyy년 MM월 dd일" /></p>
						</li>
						</c:forEach>
						</c:if>
						<c:if test="${empty goodsList}">
						<li>
							<p style="width:200px;">※ 조회된 차량이 없습니다.</p>
						</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</section>
</body>
</html>