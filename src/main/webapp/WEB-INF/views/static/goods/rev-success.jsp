<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/user/detailed-success.css">

	<section>
    <div class="login">
      <a href="index.html" class="login-logo"><h3><span class="txt-y">C</span>ar<span class="txt-b">N</span>ex</h3></a>
      <div class="succ-wrap">
        <h4>상담신청이 완료되었습니다.</h4>
        <ul class="succ-txt">
          <li class="flex-between">
            <p>아이디</p>
            <p>${revvo.user_id}</p>
          </li>
          <li class="flex-between">
            <p>담당 딜러</p>
            <p>${svo.staff_name}</p>
          </li>
          <li class="flex-between">
            <p>담당 연락처</p>
            <p>${svo.staff_phone}</p>
          </li>
          <li class="flex-between">
            <p>차량</p>
            <p>${gvo.car_title}</p>
          </li>
          <li class="flex-between">
            <p>상담시간</p>
            <p>${revvo.rev_date}&nbsp;${revvo.rev_time }</p>
          </li>
        </ul>
        <p>카넥스로 간편하게 거래하세요. 최선을 다하겠습니다.</p>
        <a href="/static/goods/list?keyword=" class="btn btn-sub btn-carnex">back to page</a>
      </div>
    </div>
  </section>
</body>
</html>
