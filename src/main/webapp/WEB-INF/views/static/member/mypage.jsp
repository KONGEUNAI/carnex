<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
  <link rel="shortcut icon" href="/resources/images/favicon.ico" />
  <link rel="stylesheet" href="/resources/css/user/mypage.css">
  <script>
    $(function() {
      $('ul.tab li').click(function() {
        var activeTab = $(this).attr('data-tab');
        $('ul.tab li').removeClass('on');
        $('.tab-content').removeClass('on');
        $(this).addClass('on');
        $('#' + activeTab).addClass('on');
      })
    });
  </script>
  
<section>
	<c:if test="${member != null}">
    <div class="pro">
      <c:if test="${member.user_img == null }">
    		<img src="/resources/images/noimage.jpg" class="img" alt="유저이미지"></img>
      </c:if>
      <c:if test="${member.user_img != null }">
      		<img src="${member.user_img }" class="img" alt="유저이미지"></img>
      </c:if>

      <div class="pro-btn">
      	<c:if test="${member.user_type != 0 }">
        <h4>${member.user_nick}님은 정회원 입니다.</h4>
        </c:if>
        <c:if test="${member.user_type == 0 }">
        <h4>${member.user_nick}님은 비회원 입니다.</h4>
        </c:if>
        <div class="pro-info-wrap">
        <a href="/static/member/pwd-check?user_id=${member.user_id}" class="btn-info">
          <i class="bi bi-gear-fill"></i>
          <p>정보수정</p>
        </a>
		<a href="/static/member/delete?user_id=${member.user_id}" class="btn-info">
            <i class="bi bi-person-fill-dash"></i>
            <p>회원탈퇴</p>
          </a>
        </div>
      </div>

      <div class="status">
        <h4>거래상태</h4>
        <ul>
          <li>
            <p>입고</p>
            <i class="bi bi-arrow-right"></i>
          </li>
          <li>
            <p>점검</p>
            <i class="bi bi-arrow-right"></i>
          </li>
          <li>
            <p class="status-select">출고</p>
            <i class="bi bi-arrow-right"></i>
          </li>
          <li>
            <p>탁송</p>
            <i class="bi bi-arrow-right"></i>
          </li>
          <li>
            <p>인수</p>
          </li>
        </ul>
      </div>
    </div>

    <div class="info-tab">
      <ul class="tab">
        <li class="on" data-tab="tab1">
          <a href="#" onclick="return false">
            <i class="bi bi-person-circle"></i>
            <p>개인정보</p>
          </a>
        </li>
        <li data-tab="tab2">
          <a href="#" onclick="return false">
          	<i class="bi bi-credit-card"></i>
            <p>나의카드</p>
          </a>
        </li>
        <li data-tab="tab3">
          <a href="#" onclick="return false">
            <i class="bi bi-people-fill"></i>
            <p>상담예약</p>
          </a>
        </li>
        <li data-tab="tab4">
          <a href="#" onclick="return false">
          	<i class="bi bi-bag-fill"></i>
            <p>계약내역</p>
          </a>
        </li>
        <li data-tab="tab5">
          <a href="#" onclick="return false">
            <i class="bi bi-card-text"></i>
            <p>게시물</p>
          </a>
        </li>
        <li data-tab="tab6">
          <a href="#" onclick="return false">
            <i class="bi bi-chat-heart"></i>
            <p>관심차량</p>
          </a>
        </li>
        <li data-tab="tab7">
          <a href="#" onclick="return false">
            <i class="bi bi-ticket-perforated"></i>
            <p>쿠폰함</p>
          </a>
        </li>
        <li data-tab="tab8">
          <a href="#" onclick="return false">
            <i class="bi bi-alarm"></i>
            <p>입고 알람</p>
          </a>
        </li>
      </ul>
    </div>

    <div class="info-wrap">
      <!-- ============== 첫 번째 탭 ================ -->
      <div class="tab-content on" id="tab1">
        <div class="user-info">
          <h4>사용자 정보</h4>
          <ul>
            <li>
              <p>이름</p>
              <p>${member.user_id}</p>
            </li>
            <li>
              <p>닉네임</p>
              <p>${member.user_nick}</p>
            </li>
            <li>
              <p>생년월일</p>
              <p><fmt:formatDate value="${user_birth}" pattern="yyMMdd" />-*</p>
            </li>
            <li>
              <p>전화번호</p>
              <p>${member.user_tel}</p>
            </li>
            <li>
              <p>주소</p>
              <p>${member.user_address}</p>
            </li>
          </ul>
        </div>
		
		<c:if test="${empty conList}">
        <div class="status-null">
        	<h4>나의 거래</h4>
        	<ul>
	            <li><p>거래중인 계약건이 존재하지 않습니다.</p></li> 
	        </ul>
				</div>
		</c:if>
		<c:if test="${not empty conList}">
        <div class="status-info">
          <h4>나의 거래</h4>
          <c:forEach items="${conList}" var="con">
              <ul>
                <li>              
                	<p>거래 상태</p>
           		 		<p>${con.con_status}</p>
            	 	</li>
                <li>
    	          	<p>모델명</p>
					  			<p>${con.goodsVO.car_title}</p>
                </li>
                <li>
    	          	<p>차량 종류</p>
					  			<p>${con.goodsVO.car_type}</p>
                </li>
                <li>
                	<p>담당 딜러</p>
             	  	<p>${con.staffVO.staff_name}</p>
                </li> 
              </ul>
          </c:forEach>
        </div>
        </c:if>
      </div>
      <!-- ============== 첫 번째 탭 ================ -->
      
      
	 <!-- ============== 두 번째 탭 ================ -->
	      
	      <div class="tab-content" id="tab2">
	      <a href="/static/member/reg-card?user_id=${member.user_id }" class="btn btn-carnex">카드등록</a>
	          <ul class="card-registr">
	          <c:if test="${not empty cList}">
			  <c:forEach items="${cList }" var="cvo">
	            <li>
	              <img src="/resources/images/card-storage/card-01.jpg" alt="카드 이미지"></img>
	              <p>${cvo.card_bank } 카드번호 : ${cvo.card_digit1 } ${cvo.card_digit2 } ${cvo.card_digit3 } ${cvo.card_digit4 }</p>
	              <div class="tab-btn">
	                  <a href="/static/member/modify-card?card_num=${cvo.card_num }&user_id=${member.user_id}" class="btn btn-kakao">카드수정</a>
	                  <a href="/static/member/delete-card?card_num=${cvo.card_num }&user_id=${member.user_id}" class="btn btn-delete">카드삭제</a>
	              </div>
	            </li>
	            </c:forEach>
	      	 </c:if>
		      <c:if test="${empty cList}">	
		      	<p>등록된 카드가 없습니다.</p>
		      </c:if> 
	          </ul>
	      </div>
	
	      <!-- ============== 두 번째 탭 ================ -->
	      
	      
      <!-- ============== 세 번째 탭 ================ -->
      <div class="tab-content" id="tab3">
        <c:if test="${empty revList }">
        <div class="order">
       		<p>상담예약내역이 존재하지 않습니다.</p>
        </div>
        </c:if>
	      <c:if test="${not empty revList }">
	      <c:forEach items="${revList}" var="revList">
        <div class="order">
          <c:if test="${revList.goodsVO.car_thumbimg != null }">
       			<img alt="차량이미지" src="${revList.goodsVO.car_thumbimg }">
       		</c:if>
       		<c:if test="${revList.goodsVO.car_thumbimg == null }">
       			<img alt="차량이미지" src="/resources/images/noimage.jpg">
       		</c:if>
          <div class="order-info">
            <ul>
              <li>
                <p>차량 정보</p>
                <p>${revList.goodsVO.car_title }</p>
              </li>
              <li>
                <p>차량 제원</p>
                <p>${revList.goodsVO.car_subtitle}</p>
              </li>
              <li>
                <p>종류</p>
                <p>${revList.goodsVO.car_type}</p>
              </li>
              <li>
                <p>가격</p>
					<c:if test="${revList.goodsVO.car_price >= 100000000}">
		    			 <p><fmt:formatNumber value="${revList.goodsVO.car_price / 100000000}" pattern="#,##0" /> 억</p>
					</c:if>
					<c:if test="${revList.goodsVO.car_price < 100000000}">
		    			<p><fmt:formatNumber value="${revList.goodsVO.car_price / 10000}" pattern="#,##0" /> 만원</p>
					</c:if>
              </li>
              <li>
                <p>담당 딜러</p>
                <p>${revList.staffVO.staff_name}</p>
              </li>
              <li>
                <p>상담 날짜</p>
                <p>
							<c:if test="${revList.rev_date != null}">
							    <fmt:formatDate value="${rev_date}" pattern="yyyy년 MM월 dd일" />
							</c:if>
							<c:if test="${revList.rev_time != null}">
							    <fmt:formatDate value="${rev_time}" pattern="HH:mm" />
							</c:if>
                </p>
              </li>
            </ul>
            <div class="tab-btn">
              <a href="/static/member/revModify?rev_no=${revList.rev_no}" class="btn btn-carnex">예약변경</a>
              <a href="/static/member/delete-rev?rev_no=${revList.rev_no}" class="btn btn-delete">예약취소</a>
            </div>
          </div>
        </div>
        </c:forEach>
        </c:if>
      </div>
      <!-- ============== 세 번째 탭 ================ -->

      <!-- ============== 네 번째 탭 ================ -->
      <div class="tab-content" id="tab4">
       <c:if test="${not empty conList}">
        <c:forEach items="${conList}" var="con">
        <div class="order">
        	<c:if test="${con.goodsVO.car_thumbimg == null }">
	    		<img src="/resources/images/noimage.jpg" class="img" alt="차량이미지"></img>
	      </c:if>
	      <c:if test="${con.goodsVO.car_thumbimg != null }">
      		<img src="${con.goodsVO.car_thumbimg}" class="img" alt="차량이미지"></img>
	      </c:if>
          <div class="order-info">
            <ul>
              <li>
                <p>브랜드</p>
                <p>${con.goodsVO.car_brand}</p>
              </li>
              <li>
                <p>모델명</p>
                <p>${con.goodsVO.car_model}</p>
              </li>
              <li>
                <p>종류</p>
                <p>${con.goodsVO.car_type}</p>
              </li>
              <li>
                <p>가격</p>
								<c:if test="${con.goodsVO.car_price >= 100000000}">
				    		<p><fmt:formatNumber value="${con.goodsVO.car_price / 100000000}" pattern="#,##0" /> 억</p>
								</c:if>
								<c:if test="${con.goodsVO.car_price < 100000000}">
				    		<p><fmt:formatNumber value="${con.goodsVO.car_price / 10000}" pattern="#,##0" /> 만원</p>
								</c:if>
              </li>	
            </ul>
            <div class="tab-btn">
              <a href="/confirm/contract-success?con_no=${con.con_no}&user_id=${member.user_id}" class="btn btn-carnex">계약확인</a>
            </div>
          </div>
        </div>
        </c:forEach>
        </c:if>
        <c:if test="${empty conList}">
        <div class="order">
       		<p>거래 중인 계약건이 존재하지 않습니다	.</p>
     		</div>
        </c:if>
      </div>
      <!-- ============== 네 번째 탭 ================ -->

     

      <!-- ============== 다섯 번째 탭 ================ -->
      <div class="tab-content" id="tab5">
        <div class="post">
          <h4>나의 게시물</h4>
          <ul>
            <c:if test="${not empty bList }">
            <li>
              <div class="post-txt">
                <p>제목</p>
                <p>조회수</p>
                <p>작성일</p>
              </div>
            </li>
            <c:forEach items="${bList }" var="bvo">
            <li>
              <div class="post-txt">
                <p>${bvo.title}</p>
                <p>${bvo.viewcnt}</p>
                <p><fmt:formatDate value="${bvo.reg_date}" pattern="yyyy-MM-dd" /></p>	
              </div>
              <div class="post-btn">
                <a href="/static/board/view?bno=${bvo.bno}"class="btn btn-carnex">게시물 조회</a>
                <a href="/static/board/delete?bno=${bvo.bno}&user_id=${bvo.user_id}"  class="btn btn-delete">게시물 삭제</a>
              </div>
            </li>
           </c:forEach>
           </c:if>	
          <c:if test="${empty bList}">
          	<p>작성하신 게시물이 존재하지 않습니다.</p>
          </c:if>
          </ul>
        </div>

        <div class="post">
          <h4>나의 댓글</h4>
          <ul>
            <c:if test="${not empty rList}">
            <li>
              <div class="post-txt">
                <p>내용</p>
                <p>작성자</p>
                <p>작성일</p>
              </div>
            </li>
           <c:forEach items="${rList }" var="rvo">
            <li>
              <div class="post-txt">
                <p>${rvo.content}</p>
                <p>${rvo.writer}</p>
                <p><fmt:formatDate value="${rvo.reg_date}" pattern="yyyy-MM-dd" /></p>	
              </div>
              <div class="post-btn">
                <a href="/static/board/view?bno=${rvo.bno}"class="btn btn-carnex">댓글 수정</a>
                <a href="/static/reply/delete?bno=${rvo.bno}&rno=${rvo.rno}" class="btn btn-delete">댓글 삭제</a>
              </div>
            </li>
            </c:forEach>
            </c:if>
          <c:if test="${empty rList}">
          	<p>나의 댓글이 존재하지 않습니다.</p>
          </c:if>
          </ul>
        </div>
      </div>
      <!-- ============== 다섯 번째 탭 ================ -->

      <!-- ============== 여섯 번째 탭 ================ -->
      <div class="tab-content" id="tab6">
        <c:forEach items="${secondGoods}" var="sgvo">
        <div class="order">
         	<c:if test="${sgvo.car_thumbimg != null }">
       			<img alt="차량이미지" src="${sgvo.car_thumbimg }">
       		</c:if>
       		<c:if test="${sgvo.car_thumbimg == null }">
       			<img alt="차량이미지" src="/resources/images/noimage.jpg">
       		</c:if>
          <div class="order-info">
            <div class="tab-btn">
              <a href="/static/goods/view?car_num=${sgvo.car_num}" class="btn btn-carnex">상세보기</a>
              <a href="#" class="btn btn-delete">관심삭제</a>
            </div>
            <ul>
              <li>
                <p>차량 정보</p>
                <p>${sgvo.car_title}</p>
              </li>
              <li>
                <p>차량 제원</p>
                <p>${sgvo.car_subtitle}</p>
              </li>
              <li>
                <p>종류</p>
                <p>${sgvo.car_type}</p>
              </li>
              <li>
                <p>가격</p>
					<c:if test="${sgvo.car_price >= 100000000}">
		    			 <p><fmt:formatNumber value="${sgvo.car_price / 100000000}" pattern="#,##0" /> 억</p>
					</c:if>
					<c:if test="${sgvo.car_price < 100000000}">
		    			<p><fmt:formatNumber value="${sgvo.car_price / 10000}" pattern="#,##0" /> 만원</p>
					</c:if>
              </li>
            </ul>
          </div>
        </div>
			</c:forEach>
      </div>
      <!-- ============== 여섯 번째 탭 ================ -->

      <!-- ============== 일곱 번째 탭 ================ -->
      <div class="tab-content" id="tab7">
        <ul class="coupon-registr">
          <li>
            <div class="coupon-img">
              <p>COUPON</p>
            </div>
            <p>WELCOME 쿠폰 5%</p>
            <p>만료기한 : 2025-06-13</p>
            <div class="tab-btn">
              <a href="#" class="btn btn-carnex">쿠폰사용</a>
              <a href="#" class="btn btn-delete">쿠폰삭제</a>
            </div>
          </li>
          <li>
            <div class="coupon-img">
              <p>COUPON</p>
            </div>
            <p>WELCOME 쿠폰 5%</p>
            <p>만료기한 : 2025-06-13</p>
            <div class="tab-btn">
              <a href="#" class="btn btn-carnex">쿠폰사용</a>
              <a href="#" class="btn btn-delete">쿠폰삭제</a>
            </div>
          </li>
          <li>
            <div class="coupon-img">
              <p>COUPON</p>
            </div>
            <p>WELCOME 쿠폰 5%</p>
            <p>만료기한 : 2025-06-13</p>
            <div class="tab-btn">
              <a href="#" class="btn btn-carnex">쿠폰사용</a>
              <a href="#" class="btn btn-delete">쿠폰삭제</a>
            </div>
          </li>
        </ul>
      </div>
      <!-- ============== 일곱 번째 탭 ================ -->



      <!-- ============== 여덟 번째 탭 ================ -->
      <div class="tab-content" id="tab8">
        <ul class="alarm-registr">
        <c:forEach items="${firstGoods}" var="fgvo">
          <li>
            <c:if test="${fgvo.car_thumbimg != null }">
       			<img alt="차량이미지" src="${fgvo.car_thumbimg }">
       			</c:if>
       			<c:if test="${fgvo.car_thumbimg == null }">
       			<img alt="차량이미지" src="/resources/images/noimage.jpg">
       		</c:if>
            <p>${fgvo.car_title }</p>
            <div class="tab-btn">
              <div class="btn">입고 대기중</div>
              <a href="#" class="btn btn-delete">알람삭제</a>
            </div>
          </li>
<!--           <li> -->
<!--             <div class="alarm-img"></div> -->
<!--             <p>113 기계화 보병대대 5기갑여단 k201 장갑차</p> -->
<!--             <div class="tab-btn"> -->
<!--               <div href="#" class="btn btn-carnex">입고 대기중</div> -->
<!--               <a href="#" class="btn btn-delete">알람삭제</a> -->
<!--             </div> -->
<!--           </li> -->
<!--           <li> -->
<!--             <div class="alarm-img"></div> -->
<!--             <p>113 기계화 보병대대 5기갑여단 k201 장갑차</p> -->
<!--             <div class="tab-btn"> -->
<!--               <div href="#" class="btn btn-carnex">입고 완료</div> -->
<!--               <a href="#" class="btn btn-delete">알람삭제</a> -->
<!--             </div> -->
<!--           </li> -->
        </c:forEach>
        </ul>
      </div>
      </div>
      </c:if>
  </section>

<%@include file = "../include/footer.jsp" %>
