<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
  <link rel="stylesheet" href="/resources/flexslider/flexslider.css">
  <link rel="stylesheet" href="/resources/css/user/detailed.css">
  <script src="/resources/flexslider/jquery.flexslider.js"></script>
  <script>
     $(window).load(function() {
       $('.flexslider').flexslider({
         animation: "slide",
         controlNav: "thumbnails"
       });
     });
  </script>
  
 <section>
    <div class="content-wrap-01">
      <div class="info-wrap-01">
        <h4>${gvo.car_title}</h4>
        <c:if test="${gvo.car_price >= 100000000}">
		    <h4><fmt:formatNumber value="${gvo.car_price / 100000000}" pattern="#,##0" /> 억</h4>
				</c:if>
				<c:if test="${gvo.car_price < 100000000}">
		    <h4><fmt:formatNumber value="${gvo.car_price / 10000}" pattern="#,##0" /> 만원</h4>
				</c:if>
      </div>

      <div class="content-container">
        <div class="flexslider">
          <ul class="slides">
          <c:if test="${carimg != null }">
            <li data-thumb="${carimg[0]}">
              <img src="${carimg[0]}" />
            </li>
            <li data-thumb="${carimg[1]}">
              <img src="${carimg[1]}" />
            </li>
            <li data-thumb="${carimg[2]}">
              <img src="${carimg[2]}" />
            </li>
            <li data-thumb="${carimg[3]}">
              <img src="${carimg[3]}" />
            </li>
           </c:if>
           <c:if test="${carimg == null }">
           <li data-thumb="/resources/images/noimage.jpg">
			    		<img src="/resources/images/noimage.jpg" class="img" alt="차량이미지">
	    		 </li>
           <li data-thumb="/resources/images/noimage.jpg">
			    		<img src="/resources/images/noimage.jpg" class="img" alt="차량이미지">
	    		 </li>
           <li data-thumb="/resources/images/noimage.jpg">
			    		<img src="/resources/images/noimage.jpg" class="img" alt="차량이미지">
	    		 </li>
           <li data-thumb="/resources/images/noimage.jpg">
			    		<img src="/resources/images/noimage.jpg" class="img" alt="차량이미지">
	    		 </li>
		    	 </c:if>
          </ul>
        </div>

        <div class="info-car-txt">
          <h5>${gvo.car_subtitle}</h5>
          <ul class="info-car-icon">
            <li>
              <div><i class="bi bi-wrench-adjustable"></i></div>
              <p>점검완료</p>
            </li>
            <li>
              <div><i class="bi bi-file-earmark-text"></i></div>
              <c:if test="${gvo.car_accident =='0'}">
                	<p>무사고</p>
                </c:if>
             	<c:if test="${gvo.car_accident =='1'}">
									<p>사고이력</p>
									<p>있음</p>
            	</c:if>
            </li>
            <li>
              <div><i class="bi bi-sign-merge-right"></i></div>
              <p>주행거리</p>
            </li>
            <li>
              <div><i class="bi bi-car-front-fill"></i></div>
              <p>기본정보</p>
            </li>
          </ul>

          <ul class="info-car-benefit">
            <li><h5>CarNex 4.9% 최저금리 추천 금융상품</h5></li>
            <li>
              <p>월 납입 442,442원</p>
              <button type="button" class="btn btn-carnex">대출계산하기</button>
            </li>
            <li>
              <p>리스 이용 금융상담문의</p>
              <button type="button" class="btn btn-carnex">금융상담문의</button>
            </li>
          </ul>
        </div>

        <div class="info-submit">
          <h5>판매자 정보</h5>
          <div class="submit-seller-info">
          	<c:if test="${svo.staff_img != null }">
            <img src="${svo.staff_img }" alt="딜러프로필">
            </c:if>
            <c:if test="${svo.staff_img == null }">
            <img src="/resources/images/noimage.jpg" alt="딜러프로필">
            </c:if>
            <p>${svo.staff_name} 딜러</p>
            <p>${svo.staff_phone}</p>
          </div>

		  <form action="/static/goods/view"  method="post">
				<input type="hidden" name="user_id" value="${session.user_id }">
				<input type="hidden" name="staff_id" value="${svo.staff_id }">
				<input type="hidden" name="car_num" value="${gvo.car_num}">
				<div class="info-time">
				  <h5>예약 날짜 / 시간대 설정</h5>
				  <input type="date" name="rev_date" class="form-style"> 
				  <input type="time"  name="rev_time"  class="form-style">
				</div>
	​			
	
				<h5>판매자와 편리하게 상담해 보세요.</h5>
				<c:if test="${session != null }">
				<div class="info-btn flex-between">
				  <button type="button" class="btn btn-kakao">카카오톡 상담요청</button>
				  <c:if test="${gvo.car_status != '예약중' }">
				  <button type="submit" class="btn btn-carnex">방문예약</button>
				  </c:if>
				  <c:if test="${gvo.car_status == '예약중' }">
				  <button type="button" class="btn btn-carnex">예약중</button>
				  </c:if>
				</div>
				</c:if>
		</form>
			
		  </div>
		</div>
	  </div>


    <div class="content-wrap-02">
      <div class="diagnosis-01">
        <h4>프레임 및 외부패널 진단</h4>
        <div class="diagnosis-img flex-between">
          <img src="/resources/images/test/bg_repair01_s.png" alt="#">
          <img src="/resources/images/test/bg_repair02_s.png" alt="#">
        </div>
        <p>판금/용접 0회 교환 0회</p>
        <div class="diagnosis-wrap flex-between">
          <h5>프레임 <span class="txt-y">정상</span></h5>
          <h5>외부패널 <span class="txt-y">정상</span></h5>
        </div>
      </div>
      <div class="diagnosis-02 diagnosis-info">
        <h4>프레임</h4>
        <ul>
          <li>
            <p>후드</p>
            <p><strong>정상</strong></p>
          </li>
          <li>
            <p>프론트 휀더</p>
            <p><strong>정상</strong></p>
          </li>
          <li>
            <p>프론트 도어</p>
            <p><strong>정상</strong></p>
          </li>
          <li>
            <p>리어 도어</p>
            <p><strong>정상</strong></p>
          </li>
          <li>
            <p>트렁크 리드</p>
            <p><strong>정상</strong></p>
          </li>
        </ul>
      </div>
      <div class="diagnosis-03 diagnosis-info">
        <h4>외부패널</h4>
        <ul>
          <li>
            <p>프론트 패널 / 인사이드 패널</p>
            <p><strong>정상</strong></p>
          </li>
          <li>
            <p>앞/뒤 휠하우스</p>
            <p><strong>정상</strong></p>
          </li>
          <li>
            <p>A,B필러패널 / 대시패널 / 플로어패널</p>
            <p><strong>정상</strong></p>
          </li>
          <li>
            <p>사이드실 패널 / 쿼터패널</p>
            <p><strong>정상</strong></p>
          </li>
          <li>
            <p>리어패널 / 트렁크 플로어</p>
            <p><strong>정상</strong></p>
          </li>
          <li>
            <p>사이드멤버 / 후프패털 / 패키지트레이</p>
            <p><strong>정상</strong></p>
          </li>
        </ul>
      </div>
    </div>

    <div class="content-wrap-03">
      <h4>지금 보고 계신 차량의 주요 서비스</h4>
      <ul>
        <li class="event-01">
          <h5>신규등록 매물 알림 <i class="bi bi-chevron-right"></i></h5>
          <div class="event-txt">
            <p>신규매물 등록 알림 서비스</p>
            <img src="/resources/images/test/event-1.png" alt="#">
          </div>
        </li>
        <li class="event-02">
          <h5>헛걸음보상 <i class="bi bi-chevron-right"></i></h5>
          <div class="event-txt">
            <p>방문예약 후 헛걸음 시 20만원 지급</p>
            <img src="/resources/images/test/event-2.png" alt="#">
          </div>
        </li>
        <li class="event-03">
          <h5>CarNex 제휴카드 이벤트 <i class="bi bi-chevron-right"></i></h5>
          <div class="event-txt">
            <p>CarNex 제휴카드 사용 시 5% 할인</p>
            <img src="/resources/images/test/event-3.png" alt="#">
          </div>
        </li>
      </ul>
    </div>

    <div class="content-wrap-04">
      <h4>판매자 정보</h4>
      <div class="seller-info">
      	<c:if test="${svo.staff_img != null }">
        <img src="${svo.staff_img }" alt="딜러프로필">
        </c:if>
        <c:if test="${svo.staff_img == null }">
        <img src="/resources/images/noimage.jpg" alt="딜러프로필">
        </c:if>
        <div class="seller-info-txt">
          <p><strong>${svo.staff_name} 딜러</strong> | ${svo.staff_phone }</p>
          <p>${svo.staff_intro }</p>
        </div>
      </div>

      <div class="list-area">
		<p>${gvo.car_content}</p>
      </div>
    </div>

  </section>

<%@include file = "../include/footer.jsp" %>