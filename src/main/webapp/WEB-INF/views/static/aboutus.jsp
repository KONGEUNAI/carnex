<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "include/header.jsp" %>
  <link rel="stylesheet" href="/resources/css/static/aboutus.css">
  <script src="/resources/js/jquery.easing.1.3.js"></script>
  <script>
    $(function () {
      $('.tabsBtn').click(function (event) {
        event.preventDefault();
        $('.tabsBtn').removeClass('on');
        $('.au-lt-wrap').removeClass('on');
        $(this).addClass('on');
        $(this).next().addClass('on');
      });
    });
  </script>
  <div class="bn au-bn-bg">
    <svg viewBox="0 0 1320 300" class="bn-svg">
        <text x="50%" y="50%" text-anchor="middle">about as</text>
    </svg>
  </div>
  
  <section>
    <h3><span class="txt-y">m</span>ott<span class="txt-b">o</span></h3>
    <p class="sub-txt">회사의 모토를 여러분들에게</p>

    <div class="au-mt">
      <div class="au-mt-bg"></div>
      <div class="au-mt-txt">
        <h5><span class="txt-y">c</span>ar<span class="txt-b">n</span>ex ?</h5>
        <p><span class="txt-y">C</span>ar Nex 는 Car + Nexus 의 합성어로 고객이 편안하게 중고차를 거래할 수 있게 하는 것이 회사의 목적입니다.</p>
      </div>
    </div>

    <h3><span class="txt-y">v</span>isio<span class="txt-b">n</span></h3>
    <p class="sub-txt">회사의 미래에 대하여 보시겠습니다</p>
	
    <ul class="au-vs">
      <li>
			  <div class="au-vs-bg"></div>
          <p class="au-vs-title">Vehicle Information</p>
          <h4>열려있는 구조</h4>
          <p class="au-vs-txt">열려있는 구조로 남녀노소 모두에게 편리하게 ...</p>
			  <div class="vs-btn">More</div>
      </li>
      <li>
        <div class="au-vs-bg"></div> 
          <p class="au-vs-title">Perfect Commercialization Processing</p> 
          <h4>완벽한 상품화처리</h4>
          <p class="au-vs-txt">완벽한 상품화처리를 하여 고객에게 클릭 한번에 ...</p>
          <div class="vs-btn">More</div>
		    </div>
      </li>
      <li>
        <div class="au-vs-bg"></div> 
          <p class="au-vs-title">Vehicle Information Provided</p>
          <h4>차량 정보를 제공</h4>
          <p class="au-vs-txt">고객에게 클릭 한 번에 모든 차량의 정보 제공...</p>  
          <div class="vs-btn">More</div>
      </li>
    </ul>

    <h3><span class="txt-y">l</span>oca<span class="txt-b">t</span>ion</h3>
    <p class="sub-txt">전국에 있는 각지점의 위치와 지도</p>

    <div class="au-lt-container">
      <a href="#" class="tabsBtn on one">광교</a>
      <div class="au-lt-wrap on first">
        <div class="au-lt-bg lt-inner1">
          <svg width="100%" height="100%">
            <line x1="50" x2="50" y1="0" y2="-430" class="top"></line>
            <line x1="0" x2="-260" y1="440" y2="440" class="left"></line>
            <line x1="270" x2="270" y1="480" y2="600" class="bottom"></line>
            <line x1="1200" x2="610" y1="370" y2="370" class="right"></line>
          </svg>
          <div class="au-lt-txt"> 
            <svg viewBox="0 0 30 40" class="au-lt-svg">
              <text x="50%" y="60%" text-anchor="middle">Inside the company</text>
            </svg>
          </div>
        </div>
        <div class="au-lt-bg lt-outer1">
          <svg width="100%" height="100%">
            <line x1="50" x2="50" y1="0" y2="-430" class="top"></line>
            <line x1="0" x2="-260" y1="440" y2="440" class="left"></line>
            <line x1="270" x2="270" y1="480" y2="600" class="bottom"></line>
            <line x1="1200" x2="610" y1="370" y2="370" class="right"></line>
          </svg>
          <div class="au-lt-txt">   
            <svg viewBox="0 0 30 40" class="au-lt-svg">
              <text x="50%" y="60%" text-anchor="middle">company building</text>
            </svg>
          </div>  
        </div>
	
		  <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d3171.684433156248!2d127.10708307656616!3d37.34997897209558!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1zIOuvuOq4iOyXrQ!5e0!3m2!1sko!2skr!4v1722911925586!5m2!1sko!2skr"
			allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
      </iframe>
      </div>

      <a href="#" class="tabsBtn second">용인</a>
      <div class="au-lt-wrap two">
        <div class="au-lt-bg lt-inner2">
          <svg width="100%" height="100%">
            <line x1="50" x2="50" y1="0" y2="-430" class="top"></line>
            <line x1="0" x2="-260" y1="440" y2="440" class="left"></line>
            <line x1="270" x2="270" y1="480" y2="600" class="bottom"></line>
            <line x1="1200" x2="610" y1="370" y2="370" class="right"></line>
          </svg>
          <div class="au-lt-txt"> 
            <svg viewBox="0 0 30 40" class="au-lt-svg">
              <text x="50%" y="60%" text-anchor="middle">Inside the company</text>
            </svg>
          </div>
        </div>
        <div class="au-lt-bg lt-outer2">
          <svg width="100%" height="100%">
            <line x1="50" x2="50" y1="0" y2="-430" class="top"></line>
            <line x1="0" x2="-260" y1="440" y2="440" class="left"></line>
            <line x1="270" x2="270" y1="480" y2="600" class="bottom"></line>
            <line x1="1200" x2="610" y1="370" y2="370" class="right"></line>
          </svg>
          <div class="au-lt-txt"> 
            <svg viewBox="0 0 30 40" class="au-lt-svg">
              <text x="50%" y="60%" text-anchor="middle">company building</text>
            </svg>
          </div>
        </div>
        <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d3171.684433156248!2d127.10708307656616!3d37.34997897209558!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1zIOuvuOq4iOyXrQ!5e0!3m2!1sko!2skr!4v1722911925586!5m2!1sko!2skr"
			allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
        </iframe>
      </div>
      <a href="#" class="tabsBtn third">분당</a>
      <div class="au-lt-wrap three">
        <div class="au-lt-bg lt-inner3">
          <svg width="100%" height="100%">
            <line x1="50" x2="50" y1="0" y2="-430" class="top"></line>
            <line x1="0" x2="-260" y1="440" y2="440" class="left"></line>
            <line x1="270" x2="270" y1="480" y2="600" class="bottom"></line>
            <line x1="1200" x2="610" y1="370" y2="370" class="right"></line>
          </svg>
          <div class="au-lt-txt"> 
            <svg viewBox="0 0 30 40" class="au-lt-svg">
              <text x="50%" y="60%" text-anchor="middle">Inside the company</text>
            </svg>
          </div>
        </div>
        <div class="au-lt-bg lt-outer3">
          <svg width="100%" height="100%">
            <line x1="50" x2="50" y1="0" y2="-430" class="top"></line>
            <line x1="0" x2="-260" y1="440" y2="440" class="left"></line>
            <line x1="270" x2="270" y1="480" y2="600" class="bottom"></line>
            <line x1="1200" x2="610" y1="370" y2="370" class="right"></line>
          </svg>
          <div class="au-lt-txt"> 
            <svg viewBox="0 0 30 40" class="au-lt-svg">
              <text x="50%" y="60%" text-anchor="middle">company building</text>
            </svg>
          </div>
        </div>
        <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d3171.684433156248!2d127.10708307656616!3d37.34997897209558!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1zIOuvuOq4iOyXrQ!5e0!3m2!1sko!2skr!4v1722911925586!5m2!1sko!2skr"
			allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
      </iframe>
      </div>
    </div>
   </section>
<%@include file = "include/footer.jsp" %>