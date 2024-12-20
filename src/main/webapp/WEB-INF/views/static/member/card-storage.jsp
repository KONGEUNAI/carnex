<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>contract</title>

 <link rel="stylesheet" href="/resources/css/reset.css">
 <link rel="stylesheet" href="/resources/css/static/common.css">
 <link rel="stylesheet" href="/resources/css/user/card-storage.css">
 <script>
    function getRadioText(event)  {
      const radioId = event.target.id;
      const query = 'label[for="'+ radioId + '"]'
      
      var cardNum = document.getElementById('num-'+radioId).value;
      var bank = document.getElementById('bank-'+radioId).value;
      var lastname = document.getElementById('lastname-'+radioId).innerText;
      var firstname = document.getElementById('firstname-'+radioId).innerText;
      var cvc = document.getElementById('cvc-'+radioId).value;
      var digit1 = document.getElementById('digit1-'+radioId).innerText;
      var digit2 = document.getElementById('digit2-'+radioId).innerText;
      var digit3 = document.getElementById('digit3-'+radioId).innerText;
      var digit4 = document.getElementById('digit4-'+radioId).innerText;
      var expdate = document.getElementById('expdate-'+radioId).innerText;
      
      
      document.getElementById('selNum').value = cardNum;
      document.getElementById('selBank').value = bank;
      document.getElementById('selLastname').innerText = lastname;
      document.getElementById('selFirstname').innerText = firstname;
      document.getElementById('selCvc').value = cvc;
      document.getElementById('selDigit1').innerText = digit1;
      document.getElementById('selDigit2').innerText = digit2;
      document.getElementById('selDigit3').innerText = digit3;
      document.getElementById('selDigit4').innerText = digit4;
      document.getElementById('selExpdate').innerText = expdate;
    }
    
    function setLink() {
        var userId = document.getElementById('searchid').value;
        var carNum = document.getElementById('carNum').value;
        location.href = "/static/member/card-storage?user_id=" + userId+"&car_num="+carNum;
      }
    function sendCard() {
        
    		var num = document.getElementById('selNum').value;
    		var bank = document.getElementById('selBank').value;
    		var lastname = document.getElementById('selLastname').innerText;
        var firstname = document.getElementById('selFirstname').innerText;
    		var cvc = document.getElementById('selCvc').value;
        var digit1 = document.getElementById('selDigit1').innerText;
        var digit2 = document.getElementById('selDigit2').innerText;
        var digit3 = document.getElementById('selDigit3').innerText;
        var digit4 = document.getElementById('selDigit4').innerText;
        
				opener.document.contractFrm.card_num.value = num;
				opener.document.contractFrm.card_bank.value = bank;
				opener.document.contractFrm.card_lastname.value = lastname;
				opener.document.contractFrm.card_firstname.value = firstname;
				opener.document.contractFrm.card_cvc.value = cvc;
				opener.document.contractFrm.card_digit1.value = digit1;
				opener.document.contractFrm.card_digit2.value = digit2;
				opener.document.contractFrm.card_digit3.value = digit3;
				opener.document.contractFrm.card_digit4.value = digit4;
				
				self.close();
			}
  </script>
</head>
<body>  
  <section>
      <div class="card-title">
        <h4>Card number</h4>
        <p>카드를 선택해 주세요.</p>
      </div>
      <div class="card-search">
        <input type="text" id="searchid" placeholder="아이디 검색" class="input-frm input-mb">
        <button type="button" onclick="javascript:setLink()" id="link" class="btn-info">검색</button>
			</div>
		<div class="wrapper">
        <div class="card-wrap">
         	<c:forEach items="${cList }" var="cvo">
	          <label class="card card-1" for="${cvo.card_num }">
	            <input type="radio" name="card" value="1" id="${cvo.card_num }" class="radio" onclick='getRadioText(event)'>
            	<input type="hidden" value="${cvo.card_num }" id="num-${cvo.card_num }">
            	<input type="hidden" value="${cvo.card_cvc }" id="cvc-${cvo.card_num }">
            	<input type="hidden" value="${cvo.card_bank }" id="bank-${cvo.card_num }">
	            <ul class="card-txt">
	              <li><p id="lastname-${cvo.card_num }">${cvo.card_lastname }</p> <p id="firstname-${cvo.card_num }">${cvo.card_firstname }</p></li>
	              <li>
	              	<p id="digit1-${cvo.card_num }">${cvo.card_digit1 }</p>
	              	<p id="digit2-${cvo.card_num }">${cvo.card_digit2 }</p>
	              	<p id="digit3-${cvo.card_num }">${cvo.card_digit3 }</p>
	              	<p id="digit4-${cvo.card_num }">${cvo.card_digit4 }</p>
              	</li>
	              <li><p id="expdate-${cvo.card_num }">${cvo.card_expdate }</p></li>
	            </ul>
	          </label>
        	</c:forEach>
        </div>

        <div class="info">
        	<a id="filter-trigger" href="#" class="btn btn-carnex">
						<i class="bi bi-chevron-double-up"></i>
						<i class="bi bi-chevron-double-down off"></i>
					</a>
        	
          <div class="info-car">
            <c:if test="${gvo.car_thumbimg == null }">
		    		<img src="/resources/images/noimage.jpg" class="img" alt="차량썸네일이미지">
			    	</c:if>
			    	<c:if test="${gvo.car_thumbimg != null }">
						<img src="${gvo.car_thumbimg }" alt="${car_title }">
						</c:if>
            <input type="hidden" id="carNum" value="${gvo.car_num }">
            <h5>${gvo.car_title }</h5>
            <ul class="info-car-txt flex-center">
              <li>${gvo.car_subtitle }</li>
            </ul>
						<c:if test="${gvo.car_price >= 100000000}">
					    <p><fmt:formatNumber value="${gvo.car_price / 100000000}" pattern="#,##0" /> 억</p>
							</c:if>
							<c:if test="${gvo.car_price < 100000000}">
					    <p><fmt:formatNumber value="${gvo.car_price / 10000}" pattern="#,##0" /> 만원</p>
							</c:if>
          </div>

		  <h5>선택한 카드</h5>
          <ul class="info-txt" id="result">
            <li><p id="selLastname">성 : ***</p> &nbsp;<p id="selFirstname">이름 : </p></li>
            
            <li>
            	<input type="hidden" value="" id="selNum">
            	<input type="hidden" value="" id="selBank">
            	<input type="hidden" value="" id="selCvc">
            	<p>카드번호 :&nbsp;</p>&nbsp;
            	<p id="selDigit1">****</p>&nbsp;
            	<p id="selDigit2">****</p>&nbsp;
            	<p id="selDigit3">****</p>&nbsp;
            	<p id="selDigit4">****</p>
           	</li>
            <li>
            	<p>카드기한 :&nbsp;</p>
            	<p id="selExpdate"> **/**</p>
           	</li>
          </ul>
          <a href="javascript:sendCard()" class="btn btn-carnex">해당카드로 결제</a>
        </div>

      </div>
  </section>
</body>
</html>
     


