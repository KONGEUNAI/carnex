<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/user/insert-success.css">
<script src="/resources/js/common.js"></script>

	<section>
	    <div class="login">
	      <a href="/" class="login-logo"><h3><span class="txt-y">C</span>ar<span class="txt-b">N</span>ex</h3></a>
	      <div class="succ-wrap">
	        <h4>회원가입을 축하드립니다.</h4>
	        <ul class="succ-txt">
	          <li class="flex-between">
	            <p>아이디</p>
	            <p>${member.user_id }</p>
	          </li>
	          <li class="flex-between">
	            <p>가입일</p>
	            <p><fmt:formatDate value="${member.user_reg_date}" pattern="yyyy년 MM월 dd일" /></p>
	          </li>
	          <li class="flex-between">
	            <p>회원혜택</p>
	            <p>카넥스 전용 1% 포인트 적립</p>
	          </li>
	        </ul>
	        <p>카넥스로 간편하게 거래하세요. 최선을 다하겠습니다.</p>
	        <c:if test="${session == null}">
	        <a href="/confirm" class="btn btn-sub btn-carnex">back to login</a>
	        </c:if>
	      </div>
	    </div>
	  </section>

<%@include file = "../include/footer.jsp" %>