<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

  <link rel="stylesheet" href="/resources/css/user/goods.css">
  <script src="/resources/js/jquery.easing.1.3.js"></script>
 	 <script>
		$(function(){
			
			$('#filter-trigger').click(function(event){
				event.preventDefault();
				$(this).parent().toggleClass('active');
				$('#filter-trigger > i:first-child').toggleClass('off');
				$('#filter-trigger > i:last-child').toggleClass('off');
			});
			
			$('#search-btn').click(function(){
				var keyword = document.querySelector('input[name="car-type-01"]:checked').value;
				
				location.href="/static/goods/list?keyword="+keyword;
			});
			
		});
	</script>
	
    <div class="bn">
	    <svg viewBox="0 0 1320 300" class="bn-svg">
	        <text x="50%" y="50%" text-anchor="middle">for sale</text>
		</svg>
	</div>
	
	<section>
        <h4>매물 조회</h4>
        <div class="sec-01">
	        <ul id="content" class="content">
            <c:forEach var="GoodsVO" items="${glist}">
            	<!-- 
				<li class="listToChange">
					<h5 class="content-title" data-cno="${GoodsVO.car_num }">${GoodsVO.car_title }</h5>
					<c:if test="${GoodsVO.car_thumbimg != null }">
					<img src="${GoodsVO.car_thumbimg }" alt="${car_model }">
					</c:if>
					
					<c:if test="${GoodsVO.car_thumbimg == null }">
					<img src="/resources/images/noimage.jpg" alt="${car_model }">
					</c:if>
					<div class="content-text-wrap">
						<div class="content-text">
							<c:if test="${GoodsVO.car_price >= 100000000}">
						    <h5><fmt:formatNumber value="${GoodsVO.car_price / 100000000}" pattern="#,##0" /> 억</h5>
							</c:if>
							
							<c:if test="${GoodsVO.car_price < 100000000}">
						    <h5><fmt:formatNumber value="${GoodsVO.car_price / 10000}" pattern="#,##0" /> 만원</h5>
							</c:if>
							<p>${GoodsVO.car_subtitle }</p>
			        	</div>
						<a href="/static/goods/view?car_num=${GoodsVO.car_num }" class="btn btn-carnex">구매하러 가기</a>
			        </div>
			        
			        <div class="content-op">
		        		<p class="content-op-check">${GoodsVO.car_status }</p>
			        	<c:if test="${GoodsVO.car_accident == 0}">
			        	<p>무사고 차량</p>
			        	</c:if>
			        	
			        	<c:if test="${GoodsVO.car_accident != 0}">
			        	<p>사고내역있음</p>
			        	</c:if>
			        	<p>A/S 보증가능</p>
			        	<p>즉시 출고</p>
			        </div>
				</li>
				 -->
				
				
				
				<li class="listToChange">
					<c:if test="${GoodsVO.car_thumbimg != null }">
					<img src="${GoodsVO.car_thumbimg }" alt="${car_model }">
					</c:if>
					
					<c:if test="${GoodsVO.car_thumbimg == null }">
					<img src="/resources/images/noimage.jpg" alt="${car_model }">
					</c:if>
					
					<h5 class="content-title" data-cno="${GoodsVO.car_num }">${GoodsVO.car_title }</h5>
					
					<c:if test="${GoodsVO.car_price >= 100000000}">
				    <p><fmt:formatNumber value="${GoodsVO.car_price / 100000000}" pattern="#,##0" /> 억</p>
					</c:if>
					
					<c:if test="${GoodsVO.car_price < 100000000}">
				    <p><fmt:formatNumber value="${GoodsVO.car_price / 10000}" pattern="#,##0" /> 만원</p>
					</c:if>
					
					<p>${GoodsVO.car_subtitle }</p>
					<a href="/static/goods/view?car_num=${GoodsVO.car_num }" class="btn btn-carnex">구매하러 가기</a>
				</li>
				</c:forEach>
	        </ul>
	        
	        <div class="filter">
				<a id="filter-trigger" href="#" class="btn btn-carnex">
					<i class="bi bi-chevron-double-up"></i>
					<i class="bi bi-chevron-double-down off"></i>
				</a>
				<!-- <h4>조건검색창</h4> -->
				<div class="filter-wrap">
					<h5>차종 분류</h5>
					<ul class="filter-radio">
						<li>
							<input type="radio" name="car-type-01" id="type-10" value="" class="filter-op" checked></input>
							<input type="radio" name="car-type-01" id="type-01" value="세단" class="filter-op"></input>
							<label class="filter-op-check" for="type-01">세단</label>
						</li>
						<li>
							<input type="radio" name="car-type-01" id="type-02" value="쿠페" class="filter-op"></input>
							<label class="filter-op-check" for="type-02">쿠페</label>
						</li>
						<li>
							<input type="radio" name="car-type-01" id="type-03" value="웨건" class="filter-op"></input>
							<label class="filter-op-check" for="type-03">웨건</label>
						</li>
						<li>
							<input type="radio" name="car-type-01" id="type-04" value="SUV" class="filter-op"></input>
							<label class="filter-op-check" for="type-04">SUV</label>
						</li>
						<li>
							<input type="radio" name="car-type-01" id="type-05" value="컨버터블" class="filter-op"></input>
							<label class="filter-op-check" for="type-05">컨버터블</label>
						</li>
						<li>
							<input type="radio" name="car-type-01" id="type-06" value="해치백" class="filter-op"></input>
							<label class="filter-op-check" for="type-06">해치백</label>
						</li>
						<li>
							<input type="radio" name="car-type-01" id="type-07" value="리무진" class="filter-op"></input>
							<label class="filter-op-check" for="type-07">리무진</label>
						</li>
						<li>
							<input type="radio" name="car-type-01" id="type-08" value="밴" class="filter-op"></input>
							<label class="filter-op-check" for="type-08">밴</label>
						</li>
						<li>
							<input type="radio" name="car-type-01" id="type-09" value="픽업트럭" class="filter-op"></input>
							<label class="filter-op-check" for="type-09">픽업트럭</label>
						</li>
					</ul>
				</div>
				<button id="search-btn" class="btn btn-carnex">검색</button> 
        	</div>
       	</div>
      	<div id="loading">Loading...</div>
    </section>
    
    <!-- <script src="js/searchtest.js"></script> -->
    <script>
	    function formatCarPrice(price) {
	    	  if (price >= 100000000) {
	    	    var carPriceInHundredMillion = price / 100000000;
	    	    return carPriceInHundredMillion.toLocaleString('ko-KR') + " 억";
	    	  } else {
	    	    var carPriceInTenThousand = price / 10000;
	    	    return carPriceInTenThousand.toLocaleString('ko-KR') + " 만원";
	    	  }
	    	}
		    var lastScrollTop = 0;
		    var loading = false;
		    var endPage = false;
		    var easeEffect = 'easeInQuint';
		    const loadingDiv = document.getElementById('loading');
		    
		    $(window).scroll(function(){
		    	if (loading || endPage) return;
		    	
		    	var currentScrollTop = $(window).scrollTop();
		    	
		    	if (currentScrollTop - lastScrollTop > 0) {
		    		console.log("down-scroll");
		    		
		    		if ($(window).scrollTop() >= ($(document).height() - $(window).height())) {
		    			loading = true;
		    			loadingDiv.style.display = 'block';
		    			var lastcno = $(".content-title:last").attr("data-cno");
		    			
		    			// 현재 URL에서 'keyword' 파라미터를 추출
              var urlParams = new URLSearchParams(window.location.search);
              var keyword = urlParams.get('keyword');  // 'keyword' 값을 추출

              console.log("Keyword: " + keyword);  // 'sedan' 값 확인
		    			setTimeout(function(){
			    			$.ajax({
			    				type : 'post',
			    				url : 'infiniteScrollDown?keyword='+keyword,
			    				headers : {
			    					"Content-Type" : "application/json",
			    					"X-HTTP-Method-Override" : "POST"
			    				},
			    				dataType : 'json',
			    				data : JSON.stringify({
			    					car_num : lastcno
			    				}),
			    				success : function(data){
			    					var str = "";
			    					console.log(data);
			    					if (data.length === 0){
			    						
			    						$("#loading").text("더 이상 매물이 없습니다.");
			    						endPage = true;
			    					} else {
			    						
			    						$(data).each(
			    							function(){
			    								console.log(this);
			    									str += "<li class=" + "'listToChange'" + ">"
														if (this.car_thumbimg != null){
															str += "<img src='"+this.car_thumbimg+"' alt='"+ this.car_model+"'>";
														} else {
															str += "<img src='/resources/images/noimage.jpg' alt='" + this.car_model + "'>";
														}
			    									str += "<h5 class=" + "'content-title'" + " data-cno='" + this.car_num + "'>"
			    									+		this.car_title
			    									+	"</h5>"
			    									+ "<p>" + formatCarPrice(this.car_price) +"</p>"
			    									+ "<p>" + this.car_subtitle +"</p>"
			    									+ "<a href="+"/static/goods/view?car_num="+this.car_num + " class='"+"btn btn-carnex'"+">" + '구매하러가기' +"</a>"
// 			    									str += "<div class=" + "'content-text-wrap'" +">"
// 			    									+ "<div class=" + "'content-text'" +">"
// 			    									+ "</div>"
// 			    									+ "</div>"
// 			    									+ "<div class=" + "'content-op'" +">"
// 			    									+ "<p class='content-op-check'>" + this.car_status +"</p>"
// 			    									if(this.car_accident == 0) {
// 				    									str += "<p>" + "무사고차량" +"</p>"
// 			    									} else{
// 					    								str	+= "<p>" + "사고내역있음" +"</p>"
// 			    									}
			    									
// 			    									str += "<p>A/S 보증가능</p>"
// 			    									+ "<p>즉시 출고</p>"
			    									
// 			    									+ "</div>"
			    									+ "</li>";
			    						});
		    							$("#content").append(str);
			    					}
			    					
		    					},
		    					complete : function() {
		    						if (!endPage){
			    						loadingDiv.style.display = 'none';
		    						}
		    						loading=false;
		    					}
			    			});
		    				
		    			}, 1000);
		    		}
		    	}
		    	});
    </script>
</body>
</html>