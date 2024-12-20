<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/user/insert-op.css">
<script src="/resources/js/common.js"></script>
<script>
    $(function() {
      $("#userImg").on('change',function(){
        var fileName = $("#userImg").val();
        $(".pimg-op").val(fileName);
      });
    });
 </script>
	<section>
    <div class="login">
      <a href="" class="login-logo"><h3><span class="txt-y">C</span>ar<span class="txt-b">N</span>ex</h3></a>
      <h4>SIGN UP OPTION</h4>
      <div class="card-wrap">
        <div class="card-front">
          <form action="/static/member/insert-op" method="post" enctype="multipart/form-data" class="center-wrap">
            <h4>OPTION</h4>
            <p>선택사항이므로 추후 수정이 가능합니다.</p>
           	<input type="hidden" name="user_id" value="${insertop.user_id }">
            <ul class="section">
              <li>
                <input type="email" name="user_mail" placeholder="이메일" autofocus class="form-style">
                <i class="input-icon bi bi-at"></i>
              </li>
              <li>
                <select name="user_wishcar" class="form-style sel-op">
                  <option>선호하는 차량을 선택하세요.</option>
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
                <i class="input-icon bi bi-car-front-fill"></i>
              </li>
              <li>
                <select name="user_wishprice" class="form-style sel-op">
                  <option value="미정">선호하는 가격대를 선택하세요.</option>
                  <option value="500만원 이하">500만원 이하</option>
                  <option value="2,000만원 이하">2,000만원 이하</option>
                  <option value="5,000만원 이하">5,000만원 이하</option>
                  <option value="1억 이하">1억 이하</option>
                  <option value="2억 이하">2억 이하</option>
                </select>
                <i class="input-icon bi bi-coin"></i>
              </li>
              <li>
                <select name="user_path" class="form-style sel-op">
                  <option value="없음">가입경로가 무엇입니까?</option>
                  <option value="검색엔진">검색엔진</option>
                  <option value="SNS">SNS</option>
                  <option value="자사앱">자사앱</option>
                  <option value="지인소개">지인소개</option>
                  <option value="기타">기타</option>
                </select>
                <i class="input-icon bi bi-sign-turn-slight-right-fill"></i>
              </li>
              <li>
                <input placeholder="프로필 이미지등록" class="form-style pimg-op">
                <label for="userImg" class="btn btn-chack">파일찾기</label> 
                <input type="file" id="userImg" name="userImg" accept="image/*">
                <i class="input-icon bi bi-image"></i>
              </li>
              <li>
                <textarea name="user_intro" placeholder="소개말" class="form-style text-op"></textarea>
                <i class="input-icon bi bi-person-lines-fill"></i>
              </li>
              <li><button type="submit" class="btn btn-sub btn-carnex">submit</button></li>
            </ul>
          </form>
        </div>
      </div>
    </div>
  </section>

<%@include file = "../include/footer.jsp" %>