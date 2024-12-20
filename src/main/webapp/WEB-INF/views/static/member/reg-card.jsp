<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file = "../include/header.jsp" %>
  <link rel="stylesheet" href="/resources/css/user/reg-card.css">
  <script>
  
  function inputMoveNumber(num) {
		if(isFinite(num.value) == false) {
			alert("카드번호는 숫자만 입력할 수 있습니다.");
			num.value = "";
			return false;
		}
		max = num.getAttribute("maxlength");
		if(num.value.length >= max) {
			num.nextElementSibling.focus();
		}
	}
  
  function moveFocus(currentInput, nextId) {
    if (currentInput.value.length == currentInput.maxLength) {
      const nextInput = document.getElementById(nextId);
      if (nextInput) {
        nextInput.focus();
      }
    }
  }
  
</script>

    <section>
      <div class="pm-card-info">
        <h4>Payment</h4>
        <p>카드사 선택</p>
        <form action="/static/member/reg-card" method="post" autocomplete="off">
        	<input type="hidden" name="user_id" value="${member.user_id }">
          <div class="pm-bank-btn-wrap">
            <div class="pm-bank-btn">
              <input type="radio" name="card_bank" id="bank1" value="국민은행" checked/>
              <label class="btn btn-check" for="bank1">국민은행</label>
            </div>
            <div class="pm-bank-btn">
              <input type="radio" name="card_bank" id="bank2" value="신한은행" />
              <label class="btn btn-check" for="bank2">신한은행</label>
            </div>
            <div class="pm-bank-btn">
              <input type="radio" name="card_bank" id="bank3" value="우리은행" />
              <label class="btn btn-check" for="bank3">우리은행</label>
            </div>
            <div class="pm-bank-btn">
              <input type="radio" name="card_bank" id="bank4" value="현대카드" />
              <label class="btn btn-check" for="bank4">현대카드</label>
            </div>
            <div class="pm-bank-btn">
              <input type="radio" name="card_bank" id="bank5" value="삼성카드" />
              <label class="btn btn-check" for="bank5">삼성카드</label>
            </div>
            <div class="pm-bank-btn">
              <input type="radio" name="card_bank" id="bank6" value="롯데카드" />
              <label class="btn btn-check" for="bank6">롯데카드</label>
            </div>
          </div>       
          <ul class="pm-card-info-ul">
            <li>
              <!-- 이름 -->
              <p>Card Holder</p>
              <div class="pm-name-wrap flex-between">
                <input type="text" name="card_lastname" class="pm-name form-style" required placeholder="성"/>
                <input type="text" name="card_firstname" class="pm-name form-style" required placeholder="이름"/>
              </div>
            </li>
            <li>
              <!-- 카드 번호 -->
              <p>Card Number</p>
              <div class="pm-digit-wrap flex-between">
                <input type="text" id="digit1" name="card_digit1" maxLength="4" oninput="moveFocus(this, 'digit2')" onKeyup="inputMoveNumber(this);" class="digit form-style" required placeholder="1234" />
                <input type="password" id="digit2" name="card_digit2" maxLength="4" oninput="moveFocus(this, 'digit3')" onKeyup="inputMoveNumber(this);" class="digit form-style" required placeholder="****"/>
                <input type="password" id="digit3" name="card_digit3" maxLength="4" oninput="moveFocus(this, 'digit4')" onKeyup="inputMoveNumber(this);" class="digit form-style" required placeholder="****" />
                <input type="text" id="digit4" name="card_digit4" maxLength="4" onKeyup="inputMoveNumber(this);" class="digit form-style" required placeholder="5678"/>
              </div>
            </li>
            <li class="flex-between">
              <!-- 유효년월 cvc -->
              <div>
                <p>Valid Date</p>
                <input type="month" name="card_expdate" class="exp-date form-style" required placeholder="YY/MM"/>
              </div>
              <div>
                <p>CVC</p>
                <input type="text" name="card_cvc" maxLength="3" class="cvc form-style" required placeholder="XXX"/>
              </div>
              <button type="submit" class="btn btn-carnex">카드 등록</button>
            </li>
          </ul>
        </form>
      </div>
    </section>

<%@include file = "../include/footer.jsp" %>
