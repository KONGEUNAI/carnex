<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "include/header.jsp" %>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<link rel="stylesheet" href="/resources/flexslider/cp-flexslider.css">
	<link rel="stylesheet" href="/resources/flexslider/cp-fs-slide.css">
	<link rel="stylesheet" href="/resources/css/static/campaign.css">
	<link href="/resources/aos-master/aos.css" rel="stylesheet">
	<script src="/resources/flexslider/jquery.flexslider.js"></script>
	<script>
		$(function() {
				$('.flexslider').flexslider({
						animation: "slide"
				});
		});
	</script>
	<script src="/resources/aos-master/aos.js"></script>

	<div class="bn">
		<svg viewBox="0 0 1320 300" class="bn-svg">
      <text x="50%" y="50%" text-anchor="middle">CAMPAIGN</text>
		</svg>
	</div>

	<section>
		<h3><span class="txt-y">S</span>afe <span class="txt-b">D</span>riving</h3>
		<p class="sub-txt">안전운전 캠페인</p>
	
		<div class="cp-wrap">
			<div class="cp-safe-video">
				<video src="/resources/video/cp-safe-video.mp4" controls loop autoplay muted >
			</div>

			<div class="cp-safe-wrap" data-scroll data-aos="fade-up">
				<h4 data-scroll data-splitting>안전 운전자가 타고 있어요</h4>
				<p class="cp-safe-txt1">혹시, 여러분은 어떤 운전자인가요?</p>
				<p class="cp-safe-txt2">성급한 운전자? 난폭한 운전자? 곡예하는 운전자? 이제는 우리 모두 안전한 운전문화 습관으로, 안전 운전자가 되어 보아요!!</p>
				<a href="#" class="cp-btn">자세히보기</a>
			</div> 
		</div>
	

		<h3 class="cp-mb-title"><span class="txt-y">S</span>ustaina<span class="txt-b">M</span>obility</h3>
		<p class="sub-txt">지속가능한 모빌리티</p>
		
		<div class="cp-sm-container">
			<div class="cp-wrap" >
				<div class="cp-mo-mou-bg" data-aos="fade-right"></div>
				<div class="cp-mo-mou" data-scroll>
					<h4 data-scroll data-splitting>환경 보호를 위한 MOU 체결</h4>
					<p>Car Nex와 환경부, 한국수자원공사, SK E&S는 각 제공 사례에 대한 조사 연구를 지원합니다.</p>
				</div>
			</div>
			
			<div class="cp-wrap">
				<div class="cp-mo-RE100">
					<h4 data-scroll data-splitting>RE100 가입승인 완료</h4>
					<p>이산화탄소 배출량을 0으로 만드는 '탄소제로'  경제 체제로의 전환에 동참하고 있습니다.</p>
				</div>
				<div class="cp-mo-RE100-bg" data-aos="fade-left"></div>
			</div>
		</div>
		
		<div class="cp-RE100-bar"></div>
		
		<p class="cp-re100-wrap" data-scroll>
			Car Nex는  ‘지속가능한 모빌리티 솔루션 프로 바이더’라는 비전 아래 다양한 이해관계자와 함께 나아갈 수 있는 방안을 고민하며, 혁신과 전환 속에서 모두의 지속가능한 삶을 위한 진정성 있는 행보를 이어가고자 노력하고 있습니다.
		</p>
		
		<h3 class="cp-sm-title"><span class="txt-y">T</span>raffic <span class="txt-y">L</span>aw <span class="txt-b">C</span>hallenge</h3>
		<p class="sub-txt">교통 법규 챌린지</p>
		
		<div class="flexslider cp">
			<ul class="slides">
				<li><div class="cp-traffic-law cp-traffic-law-bg1"></div></li>
				<li><div class="cp-traffic-law cp-traffic-law-bg2"></div></li>
				<li><div class="cp-traffic-law cp-traffic-law-bg3"></div></li>
			</ul>
		</div>
	</section>
	<script>
		AOS.init();
	</script>
	<script>
		Splitting();
		ScrollOut();
	</script>


<%@include file = "include/footer.jsp" %>