<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "include/header.jsp" %>
  <link rel="stylesheet" href="/resources/flexslider/flexslider.css">
  <link rel="stylesheet" href="/resources/owlcarousel/owlcarousel/css/owl.carousel.min.css">
  <link rel="stylesheet" href="/resources/owlcarousel/owlcarousel/css/owl.theme.default.min.css">
  <link rel="stylesheet" href="/resources/owlcarousel/style.css">
  <link rel="stylesheet" href="/resources/css/static/model.css">
  <script src="/resources/flexslider/jquery.flexslider.js"></script>
  <script src="/resources/owlcarousel/owlcarousel/js/owl.carousel.js"></script>
  <script src="/resources/js/model.js"></script>

  <div class="bn">
    <svg viewBox="0 0 1320 300" class="bn-svg">
      <text x="50%" y="50%" text-anchor="middle">Model</text>
    </svg>
  </div>

  <section>
    <div class="sec">
      <h3><span class="txt-y">D</span>isplacement and <span class="txt-b">S</span>cale</h3>
      <p class="sub-txt">배기량과 크기에 따른 분류</p>
      <div class="flexslider">
        <ul class="slides">
          <li>
            <div class="dcs-bg dcs-bg-1"></div>
            <div class="dcs-contents">
              <h4>경차</h4>
              <p>차체의 길이 3.6m, 너비 1.6m, 높이 2.0m 이하</p>
              <p>배기량 1000cc 미만</p>
              <a class="dcs-more" href="#">more</a>
            </div>
          </li>
          <li>
            <div class="dcs-bg dcs-bg-2"></div>
            <div class="dcs-contents">
              <h4>소형차</h4>
              <p>길이 4.7m, 너비 1.7m, 높이 2.0m 이하</p>
              <p>배기량 1600cc 미만</p>
              <a class="dcs-more" href="#">more</a>
            </div>
          </li>
          <li>
            <div class="dcs-bg dcs-bg-3"></div>
            <div class="dcs-contents">
              <h4>중형차</h4>
              <p>길이 4.7m, 너비 1.7m, 높이 2.0m 중 하나 초과</p>
              <p>1600cc 이상 2000cc 미만</p>
              <a class="dcs-more" href="#">more</a>
            </div>
          </li>
          <li>
            <div class="dcs-bg dcs-bg-4"></div>
            <div class="dcs-contents">
              <h4>대형차</h4>
              <p>길이 4.7m, 너비 1.7m, 높이 2.0m 중 하나 초과</p>
              <p>배기량 2000cc 이상</p>
              <a class="dcs-more" href="#">more</a>
            </div>
          </li>
        </ul>
      </div>
    </div>

    <div class="sec">
      <h3><span class="txt-y">F</span>eatures</h3>
      <p class="sub-txt">특징에 따른 분류</p>
      <div class="owl-container">
        <div class="owl-carousel owl-theme">
          <div class="item" ontouchstart="this.classList.toggle('hover');">
            <div class="container">
              <div class="front item-bg-1">
                <div class="inner">
                  <h4>Sedan</h4>
                </div>
              </div>
              <div class="back">
                <div class="inner">
                  <p>문이 4개인 일반적인 자동차</p>
                  <a href="/static/goods/list?keyword=세단">MORE</a>
                </div>
              </div>
            </div>
          </div>
          <div class="item" ontouchstart="this.classList.toggle('hover');">
            <div class="container">
              <div class="front item-bg-2">
                <div class="inner">
                  <h4>Coupe</h4>
                </div>
              </div>
              <div class="back">
                <div class="inner">
                  <p>문이 2개이고 천장이 낮은 자동차</p>
                  <a href="/static/goods/list?keyword=쿠페">MORE</a>
                </div>
              </div>
            </div>
          </div>
          <div class="item" ontouchstart="this.classList.toggle('hover');">
            <div class="container">
              <div class="front item-bg-3">
                <div class="inner">
                  <h4>Station Wagon</h4>
                </div>
              </div>
              <div class="back">
                <div class="inner">
                  <p>천장이 트렁크까지 수평 구조인 자동차</p>
                  <a href="/static/goods/list?keyword=웨건">MORE</a>
                </div>
              </div>
            </div>
          </div>
          <div class="item" ontouchstart="this.classList.toggle('hover');">
            <div class="container">
              <div class="front item-bg-4">
                <div class="inner">
                  <h4>SUV</h4>
                </div>
              </div>
              <div class="back">
                <div class="inner">
                  <p>세단 대비 전고와 지상고가 높은 자동차</p>
                  <a href="/static/goods/list?keyword=SUV">MORE</a>
                </div>
              </div>
            </div>
          </div>
          <div class="item" ontouchstart="this.classList.toggle('hover');">
            <div class="container">
              <div class="front item-bg-5">
                <div class="inner">
                  <h4>Convertible</h4>
                </div>
              </div>
              <div class="back">
                <div class="inner">
                  <p>천장의 개폐가 가능한 자동차</p>
                  <a href="/static/goods/list?keyword=컨버터블">MORE</a>
                </div>
              </div>
            </div>
          </div>
          <div class="item" ontouchstart="this.classList.toggle('hover');">
            <div class="container">
              <div class="front item-bg-6">
                <div class="inner">
                  <h4>Hatch-back</h4>
                </div>
              </div>
              <div class="back">
                <div class="inner">
                  <p>트렁크와 뒷 유리가 함께 열리는 차량</p>
                  <a href="/static/goods/list?keyword=해치백">MORE</a>
                </div>
              </div>
            </div>
          </div>
          <div class="item" ontouchstart="this.classList.toggle('hover');">
            <div class="container">
              <div class="front item-bg-7">
                <div class="inner">
                  <h4>Limousine</h4>
                </div>
              </div>
              <div class="back">
                <div class="inner">
                  <p>운전석과 뒷좌석 사이를 칸막이로 분리한 승용차</p>
                  <a href="/static/goods/list?keyword=리무진">MORE</a>
                </div>
              </div>
            </div>
          </div>
          <div class="item" ontouchstart="this.classList.toggle('hover');">
            <div class="container">
              <div class="front item-bg-8">
                <div class="inner">
                  <h4>VAN</h4>
                </div>
              </div>
              <div class="back">
                <div class="inner">
                  <p>뒷 열의 적재공간이 넓고 활용도가 높은 자동차</p>
                  <a href="/static/goods/list?keyword=밴">MORE</a>
                </div>
              </div>
            </div>
          </div>
          <div class="item" ontouchstart="this.classList.toggle('hover');">
            <div class="container">
              <div class="front item-bg-9">
                <div class="inner">
                  <h4>Pick-up Truck</h4>
                </div>
              </div>
              <div class="back">
                <div class="inner">
                  <p>지붕이 없는 적재함이 있는 자동차</p>
                  <a href="/static/goods/list?keyword=픽업트럭">MORE</a>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

<%@include file = "include/footer.jsp" %>