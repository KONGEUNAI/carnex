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
  <link rel="stylesheet" href="/resources/css/reset.css">
	<link rel="stylesheet" href="/resources/css/static/common.css">
  <script src="/resources/js/jquery-1.12.4.min.js"></script>
  <script src="/resources/js/common.js"></script>
	<script src="/resources/scrollout-splitting/splitting.js"></script>
  <script src="/resources/scrollout-splitting/scroll-out.min.js"></script>
</head>
<body>
	<header>
		<a href="/static" class="hd-logo"><img src="/resources/images/top-logo.png" alt="메인로고"></a>
		<a id="trigger" href="#">
			<span></span>
			<span></span>
			<span></span>
		</a>
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
		<nav>
			<div id="menu" class="menu">
				<ul class="menu-list">
					<li>
						<a href="#">About Us</a>
						<ul class="sub-menu">
							<li><a href="/static/aboutus">C o m p a n y</a></li>
							<li><a href="/static/campaign">C a m p a i g n</a></li>
							<li><a href="#">C E O</a></li>
						</ul>
					</li>
					<li>
						<a href="#">How To Deal</a>
						<ul class="sub-menu">
							<li><a href="/static/deal">R e g i s t e r &nbsp;&nbsp;C a r</a></li>
							<li><a href="/static/pay">P a y m e n t</a></li>
							<li><a href="/static/model">M o d e l</a></li>
						</ul>
					</li>
					<li>
						<a href="#">How To Pay</a>
						<ul class="sub-menu">
							<li><a href="/static/pay">P a y m e n t</a></li>
							<li><a href="#">C a s h</a></li>
						</ul>
					</li>
					<li>
						<a href="#">Model</a>
						<ul class="sub-menu">
							<li><a href="/static/model">M o d e l</a></li>
							<li><a href="#">D o m e s t i c</a></li>
							<li><a href="#">I m p o r t e d</a></li>
						</ul>
					</li>
					<c:if test="${session.user_type != 0 && session != null}">
					<li>
						<a href="#">Shop</a>
						<ul class="sub-menu">
							<li><a href="/static/goods/list?keyword=">C a r  L i s t</a></li>
							<li><a href="#">V i s i t</a></li>
						</ul> 
					</li>
					<li>
						<a href="#">Community</a>
						<ul class="sub-menu">
							<li><a href="/static/faq">F A Q</a></li>
							<li><a href="/static/board/list?num=1">B o a r d</a></li>
						</ul>
					</li>
					</c:if>
				</ul>
			</div>
		</nav>
	</header>


