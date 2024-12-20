<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "include/header.jsp" %>
   <link rel="stylesheet" href="/resources/css/flexslider.css">
   <link rel="stylesheet" href="/resources/css/user/member-index.css">
   <script src="/resources/flexslider/jquery.flexslider.js"></script>
   <script>
    $(function() {
      $('.flexslider').flexslider({ 
        animation: "slide" 
      });
      
      $('#search-btn').click(function(){
			var keyword = $(".form-style.sel-op").val();
			location.href="/static/goods/list?keyword="+keyword;
			});
    });
  </script>
  
  <section>
    <div class="flexslider sec-01">
      <ul class="slides">
        <li><a href="#" class="ts-bg ts-bg-1"></a></li>
        <li><a href="#" class="ts-bg ts-bg-2"></a></li>
        <li><a href="#" class="ts-bg ts-bg-3"></a></li>
        <li><a href="#" class="ts-bg ts-bg-4"></a></li>
      </ul>
    </div>

    <div class="sec-02">
      <div class="sec-02-01">
        <h4>모델 검색</h4>
        <div class="sec-02-01-frm">
          <select class="form-style sel-op">
            <option value="">차종</option>
            <option value="세단">Sedan</option>
            <option value="쿠페">Coupe</option>
            <option value="웨건">Station Wagon</option>
            <option value="SUV">SUV</option>
            <option value="컨버터블">Convertible</option>
            <option value="해치백">Hatch Back</option>
            <option value="리무진">Limousine</option>
            <option value="밴">VAN</option>
            <option value="픽업트럭">Pick-up Truck</option>
          </select>
          <button type="button" id="search-btn" class="btn btn-carnex">검색</button>
        </div>
      </div>

      <div class="sec-02-02-kategorie">
        <h4>추천 태마</h4>
        <ul class="flex-between scroll-custom">
          <li><a href="#"># CarNex 중고인증차</a></li>
          <li><a href="#"># 래인지로버</a></li>
          <li><a href="#"># 최대 12개월 연장보증</a></li>
          <li><a href="#"># 신차급 중고차</a></li>
        </ul>
      </div>
    </div>

    <div class="sec-03">
      <div class="sec-03-01">
        <h4>취향저격! 추천차량</h4>
        <ul class="flex-between">
        <c:forEach items="${firstGoods}" var="fgvo">
	        <li>
	        	<a href="">
	        		<c:if test="${fgvo.car_thumbimg != null }">
	        		<img alt="차량이미지" src="${fgvo.car_thumbimg }">
	        		</c:if>
	        		<c:if test="${fgvo.car_thumbimg == null }">
	        		<img alt="차량이미지" src="/resources/images/noimage.jpg">
	        		</c:if>
	        		<p>${fgvo.car_title }</p>
	           	 	<p><strong><fmt:formatNumber value="${fgvo.car_price}" pattern="#,##0" /></strong>원</p>
	        	</a>
        	</li>
        </c:forEach>   
        </ul>
      </div>
      <div class="sec-03-02">
        <h4>매거진</h4>
        <div class="flexslider sec-03-02-01">
          <ul class="slides">
            <li><a href="#" class="ms-bg ms-bg-1"></a></li>
            <li><a href="#" class="ms-bg ms-bg-2"></a></li>
            <li><a href="#" class="ms-bg ms-bg-3"></a></li>
            <li><a href="#" class="ms-bg ms-bg-4"></a></li>
          </ul>
        </div>
      </div>
    </div>
  </section>

  <div class="sec-04">
    <div class="sec-04-wrap">
      <h4>맞춤 차량 정보</h4>
      <ul class="flex-between">
      <c:forEach items="${secondGoods}" var="sgvo">
      	<li>
        	<a href="">
        		<c:if test="${sgvo.car_thumbimg != null }">
        		<img alt="차량이미지" src="${sgvo.car_thumbimg }">
        		</c:if>
        		<c:if test="${sgvo.car_thumbimg == null }">
        		<img alt="차량이미지" src="/resources/images/noimage.jpg">
        		</c:if>
        		<p>${sgvo.car_title }</p>
            	<p><strong><fmt:formatNumber value="${sgvo.car_price}" pattern="#,##0" /></strong>원</p>
        	</a>
       	</li>
      </c:forEach>
      </ul>
    </div>
  </div>

  <section>
    <div class="flexslider sec-05">
      <ul class="slides">
        <li><a href="#" class="bs-bg bs-bg-1"></a></li>
        <li><a href="#" class="bs-bg bs-bg-2"></a></li>
        <li><a href="#" class="bs-bg bs-bg-3"></a></li>
        <li><a href="#" class="bs-bg bs-bg-4"></a></li>
      </ul>
    </div>

    <div class="sec-06">
      <h4>딜러 검색</h4>
      <ul class="sec-06-wrap">
        <li>
          <input type="radio" name="dealer" value="딜러명" class="dealer" id="neme">
          <label class="btn btn-chack dealer-name" for="neme">딜러명</label>
          <input type="radio" name="dealer" value="연락처" class="dealer" id="tel">
          <label class="btn btn-chack dealer-tel" for="tel">연락처</label>
        </li>
        <li>
          <input type="text" placeholder="검색어를 입력해 주세요." class="form-style">
          <button type="button" class="btn btn-carnex">검색</button>
        </li>
        <li><p>CarNex에 광고 중인 3만명의 딜러 검색이 가능합니다.</p></li>
      </ul>
    </div>
  </section>
  
<%@include file = "include/footer.jsp" %>