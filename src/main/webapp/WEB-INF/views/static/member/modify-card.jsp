<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "../include/header.jsp" %>
  <link rel="stylesheet" href="/resources/css/user/reg-card.css">

    <section>
      <div class="pm-card-info">
        <h4>Payment</h4>
        <p>카드사 선택</p>
        <form action="/static/member/modify-card" method="post">     
        	<input type="hidden" name="user_id" value="${member.user_id }">
        	<input type="hidden" name="card_num" value="${cvo.card_num }">
          <div class="pm-bank-btn-wrap">
            <div class="pm-bank-btn">
            
              <input type="radio" name="card_bank" id="bank1" value="국민은행" <c:if test="${cvo.card_bank == '국민은행'}">checked</c:if>/>
              <label class="btn btn-check" for="bank1">국민은행</label>
            </div>
            <div class="pm-bank-btn">
              <input type="radio" name="card_bank" id="bank2" value="신한은행" <c:if test="${cvo.card_bank == '신한은행'}">checked</c:if>/>
              <label class="btn btn-check" for="bank2">신한은행</label>
            </div>
            <div class="pm-bank-btn">
              <input type="radio" name="card_bank" id="bank3" value="우리은행" <c:if test="${cvo.card_bank == '우리은행'}">checked</c:if>/>
              <label class="btn btn-check" for="bank3">우리은행</label>
            </div>
            <div class="pm-bank-btn">
              <input type="radio" name="card_bank" id="bank4" value="현대카드" <c:if test="${cvo.card_bank == '현대카드'}">checked</c:if>/>
              <label class="btn btn-check" for="bank4">현대카드</label>
            </div>
            <div class="pm-bank-btn">
              <input type="radio" name="card_bank" id="bank5" value="삼성카드" <c:if test="${cvo.card_bank == '삼성카드'}">checked</c:if>/>
              <label class="btn btn-check" for="bank5">삼성카드</label>
            </div>
            <div class="pm-bank-btn">
              <input type="radio" name="card_bank" id="bank6" value="롯데카드" <c:if test="${cvo.card_bank == '롯데카드'}">checked</c:if>/>
              <label class="btn btn-check" for="bank6">롯데카드</label>
            </div>
          </div>       
          <ul class="pm-card-info-ul">
            <li>
              <!-- 이름 -->
              <p>Card Holder</p>
              <div class="pm-name-wrap flex-between">
                <input type="text" name="card_lastname" class="pm-name form-style" required value="${cvo.card_lastname }"/>
                <input type="text" name="card_firstname" class="pm-name form-style" required value="${cvo.card_firstname }"/>
              </div>
            </li>
            <li>
              <!-- 카드 번호 -->
              <p>Card Number</p>
              <div class="pm-digit-wrap flex-between">
                <input type="text" name="card_digit1" maxLength="4" class="digit form-style" required value="${cvo.card_digit1 }" />
                <input type="text" name="card_digit2" maxLength="4" class="digit hidden-digit form-style" required value="${cvo.card_digit2 }"/>
                <input type="text" name="card_digit3" maxLength="4" class="digit hidden-digit form-style" required value="${cvo.card_digit3 }" />
                <input type="text" name="card_digit4" maxLength="4" class="digit form-style" required value="${cvo.card_digit4 }"/>
              </div>
            </li>
            <li class="flex-between">
              <!-- 유효년월 cvc -->
              <div>
                <p>Valid Date</p>
                <input type="month" name="card_expdate" class="exp-date form-style" required value="${cvo.card_expdate }"/>
              </div>
              <div>
                <p>CVC</p>
                <input type="text" name="card_cvc" maxLength="3" class="cvc form-style" required value="${cvo.card_cvc }"/>
              </div>
              <button type="submit" class="btn btn-carnex">카드 수정</button>
            </li>
          </ul>
        </form>
      </div>
    </section>

<%@include file = "../include/footer.jsp" %>
