<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/adm-header.jsp" %>
	<link rel="stylesheet" href="/resources/css/admin/staff.css">
		<script>
			function deleteGoods(car_num) {
	        	var result = confirm('매물목록에서 ('+car_num+')번 매물을 정말 삭제하겠습니까?');
	        	if (result) location.href='/admin/goods/delete?car_num='+car_num; 
			}
		</script>
	<section>
		<div class="tab-content">
		    <div class="content-header flex-between">
	        	<h3>매물 상세 정보 : ${gvo.car_title}</h3>
	        	<div class="sec-btn">
	        	<c:if test="${gvo.car_status == '예약중' }">
	      			<a href="/admin/contract/contract?car_num=${gvo.car_num }">계약</a>
      			</c:if>
							<a href="/admin/goods/goodsList?carType=&keyword=&car_status=">매물 목록</a>
			     	<c:if test="${staffsess != null}">
				     	<c:if test="${staffsess.staff_part >= 2 }">
		      			<a href="/admin/goods/modify?car_num=${gvo.car_num}">수정</a>
		      			</c:if>
		      			
				     	<c:if test="${staffsess.staff_part == 3 }">
							<a href="javascript:deleteGoods(${gvo.car_num});">삭제</a>
	      			</c:if>
	    			</c:if>
			     </div>
		    </div>
		    
			<div class="content-wrap gd-content">
				<div>
					<h3>차량 상세 정보</h3>
					<ul class="gd-view">
						<li>
							<p>상품 번호</p>
							<p>${gvo.car_num}</p>
						</li>
						<li>
							<p>작성자</p>
							<p>${gvo.staff_id}</p>
						</li>
						<li>
							<p>제조사</p>
							<p>${gvo.car_brand}</p>
						</li>
						<li>
							<p>차 종</p>
							<p>${gvo.car_type}</p>
						</li>
						<li>
							<p>차량 모델</p>
							<p>${gvo.car_model}</p>
						</li>
						<li>
							<p>가 격</p>
							<c:if test="${gvo.car_price >= 100000000}">
					    	<p><fmt:formatNumber value="${gvo.car_price / 100000000}" pattern="#,##0" /> 억</p>
							</c:if>
							
							<c:if test="${gvo.car_price < 100000000}">
					    	<p><fmt:formatNumber value="${gvo.car_price / 10000}" pattern="#,##0" /> 만원</p>
							</c:if>
						</li>
						<li>
							<p>차 량</p>
							<p>${gvo.car_subtitle}</p>
						</li>
						<li>
							<p>본문 내용</p>
							<p>${gvo.car_content}</p>
						</li>
						<li>
							<p>사고 이력</p>
							<p>              
							<c:if test="${gvo.car_accident =='0'}">
		                		무사고
			                </c:if>
			             	<c:if test="${gvo.car_accident =='1'}">
								사고이력 있음
			            	</c:if>
			            	</p>
						</li>
						<li>
							<p>지 역</p>
							<p>${gvo.car_zone}</p>
						</li>
						<li>
							<p>판매 상태</p>
							<p>${gvo.car_status}</p>
						</li>
						<li>
							<p>등록일</p>
							<p><fmt:formatDate value="${gvo.car_reg_date}" pattern="yyyy년 MM월 dd일" /></p>
						</li>
						<li>
							<p>수정일</p>
							<p><fmt:formatDate value="${gvo.car_up_date}" pattern="yyyy년 MM월 dd일" /></p>
						</li>
					</ul>
				</div>
				
				<div class="gd-img">
					<h3>대표 이미지</h3>
					<div class="gd-thumb">
						
						<div class="gd-thumb-wrap">
							<c:if test="${gvo.car_thumbimg == null }">
				    		<img src="/resources/images/noimage.jpg" class="img" alt="차량썸네일이미지">
					    	</c:if>
					    	
					    	<c:if test="${gvo.car_thumbimg != null }">
							<img src="${gvo.car_thumbimg }" alt="${car_title }">
							</c:if>
						</div>
					</div>
					
					<h3>상세 이미지</h3>
					<div class="gd-subimg">
						
						<div class="gd-subimg-wrap">
						<c:if test="${carimg == null }">
			    		<img src="/resources/images/noimage.jpg" class="img" alt="차량이미지">
			    		<img src="/resources/images/noimage.jpg" class="img" alt="차량이미지">
			    		<img src="/resources/images/noimage.jpg" class="img" alt="차량이미지">
			    		<img src="/resources/images/noimage.jpg" class="img" alt="차량이미지">
				    	</c:if>
				    	
						<c:if test="${carimg != null }">
						<img src="${carimg[0]}"  alt="${car_title }">
						<img src="${carimg[1]}"  alt="${car_title }">
						<img src="${carimg[2]}"  alt="${car_title }">
						<img src="${carimg[3]}"  alt="${car_title }">
				    	</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>