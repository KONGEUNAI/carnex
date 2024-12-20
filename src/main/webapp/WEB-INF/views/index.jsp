<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>CarNex</title>
	<link rel="shortcut icon" href="/resources/images/favicon.ico" />
	<link rel="stylesheet" href="/resources/fullpage/jquery.fullPage.css" />
	<link rel="stylesheet" href="/resources/fullpage/fullpage.css" />
	<link rel="stylesheet" href="/resources/textillate-master/assets/animate.css" />
	<link rel="stylesheet" href="/resources/textillate-master/assets/style.css" />
	<link rel="stylesheet" href="/resources/vegas/vegas.min.css">
	<link rel="stylesheet" href="/resources/css/reset.css" />
	<link rel="stylesheet" href="/resources/css/static/common.css" />
	<link rel="stylesheet" href="/resources/css/static/index.css" />
	<script src="/resources/js/jquery-1.12.4.min.js"></script>
	<script src='https://cdnjs.cloudflare.com/ajax/libs/gsap/3.2.6/gsap.min.js'></script>
	<script type="text/javascript" src="/resources/fullpage/scrolloverflow.js"></script>
	<script type="text/javascript" src="/resources/fullpage/jquery.fullPage.js"></script>
	<script type="text/javascript" src="/resources/textillate-master/jquery.textillate.js"></script>
	<script type="text/javascript" src="/resources/textillate-master/assets/jquery.fittext.js"></script>
	<script type="text/javascript" src="/resources/textillate-master/assets/jquery.lettering.js"></script>
	<script type="text/javascript" src="/resources/vegas/vegas.min.js"></script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
	<script type="text/javascript" src="/resources/js/index.js"></script>
</head>

<body>
	<header>
		<a href="/" class="hd-logo"><img src="/resources/images/top-logo.png" alt="메인로고"></a>
			<c:if test="${session == null}">
				<ul class="top-menu">
					<li>
						<a href="/confirm"><i class="bi bi-person-fill-check"></i><span>로그인 &nbsp; / &nbsp; 회원가입</span></a>
					</li>
					<li>
						<a href="/confirm"><i class="bi bi-person-fill-add"></i></a>
					</li>
				</ul>
			</c:if>
			
			<c:if test="${session != null}">
				<ul class="top-menu">
					<li>
						<a href="/static/member/mypage?user_id=${session.user_id}"><i class="bi bi-person-circle"></i><span>마이페이지</span></a>
					</li>
					<li>
						<a href="/confirm/logout"><i class="bi bi-person-dash-fill"></i><span>로그아웃</span></a>
					</li>
				</ul>
			</c:if>
	</header>
	<div class="intro">
		<p class="intro-title hidden">CarNex</p>
		<div class="intro-background intro-background-left"></div>
		<div class="intro-background intro-background-right"></div>
	</div>
	<div id="fullpage">
		<div class="section fp-wrap-1" id="section0">
      <video class="bg-video" muted="" loop="" autoplay=""><source src="/resources/video/index-video.mp4" type="video/mp4"></video>
			<div class="bg-black"></div>
      <div class="fp-main-title">
        <p class="tlt-1">Buyer and</p>
        <p class="tlt-2">Seller's</p>
        <p class="tlt-3">Connection</p>
        <p class="tlt-4">Point</p>
      </div>
      <div class="down">
        <div class="down-icon"></div>
        <p>SCROLL DOWN</p>
      </div>
		</div>
		
		<div class="section fp-wrap-2" id="section1">
			<h2><span class="txt-y">E</span>asy <span class="txt-y">a</span>nd <span class="txt-b">F</span>ast</h2>
			<p>Car Nex에서 쉽고 빠르고 믿을 수 있는 중고차 거래가 가능합니다</p>
			<ul class="fp-content">
				<li class="fade-wrap-1">
					<h3><span class="txt-y">E</span>asy</h3>
					<div class="fp-img fp-img1"></div>
				</li>
				<li class="fade-wrap-2">
					<h3><span class="txt-b">F</span>ast</h3>
					<div class="fp-img fp-img2"></div>
				</li>
				<li class="fade-wrap-3">
					<h3><span class="txt-y">D</span>eal</h3>
					<div class="fp-img fp-img3"></div>
				</li>
			</ul>
			<a href="/static/deal" class="main-btn">read servise</a>
		</div>
	</div>
</body>
</html>
