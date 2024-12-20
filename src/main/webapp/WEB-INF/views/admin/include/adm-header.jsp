<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="shortcut icon" href="/resources/images/favicon.ico" />
    <link rel="stylesheet" href="/resources/css/reset.css" />
    <link rel="stylesheet" href="/resources/css/admin/admin.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
  <header>
    <nav>
	    <div class="scroll-custom">
	      <a href="/admin?staff_id=${staffsess.staff_id }" class="hd-logo"><img src="/resources/images/top-logo.png" alt="메인로고"></a>
				<c:if test="${staffsess == null}">
					<ul class="nav-top">
						<li>
							<a href="/confirm">로그인</a>
						</li>
					</ul>
				</c:if>
				
				<c:if test="${staffsess != null}">
					<ul class="nav-top">
						<li>
							<a href="/admin/staff/mypage?staff_id=${staffsess.staff_id}">${staffsess.staff_name}님</a>
						</li>
						<li><a href="/static">사이트 바로가기</a></li>
						<li>
							<a href="/confirm/logout">로그아웃</a>
						</li>
					</ul>
				</c:if>
				<!-- 
				<h3><a href="/admin?staff_id=${staffsess.staff_id }">대시보드</a></h3>
				 -->
	
	      <h3>회원 관리</h3>
	      <ul>
	        <li><a href="/admin/member/register">회원 등록</a></li>
	        <li><a href="/admin/member/list">회원 목록</a></li>
	        <li><a href="/admin/member/nglist">비회원 목록</a></li>
	      </ul>
	
	      <h3>직원 관리</h3>
	     	<ul class="sub-menu">
					<c:if test="${staffsess.staff_type == 1}">
						<c:if test="${staffsess.staff_part >= 3}">
					<li><a href="/admin/staff/register">직원등록</a></li>
							<li><a href="/admin/staff/list">직원목록</a></li>
						</c:if>
						<c:if test="${staffsess.staff_part == 1}">
							<li><a href="/admin/staff/partlist?staff_part=${staffsess.staff_part}">C/S부 직원목록</a></li>
						</c:if>
						<c:if test="${staffsess.staff_part == 2}">
							<li><a href="/admin/staff/partlist?staff_part=${staffsess.staff_part}">영업부 직원목록</a></li>
						</c:if>
						<c:if test="${staffsess.staff_part == 3}">
							<li><a href="/admin/staff/partlist?staff_part=${staffsess.staff_part}">임원실 임원목록</a></li>
						</c:if>
					</c:if>
				</ul>
				
	      <h3>매물 관리</h3>
	      <ul>
	        <li><a href="/admin/goods/register">차량 등록</a></li>
	        <li><a href="/admin/goods/goodsList?carType=&keyword=&car_status=">차량 목록</a></li>
	        <c:if test="${staffsess.staff_part >= 2}">
	        <li><a href="/admin/goods/goodsList?carType=&keyword=&car_status=예약중">예약중인 차량</a></li>
	        <li><a href="/admin/goods/goodsList?carType=&keyword=&car_status=판매완료">판매완료 차량</a></li>
	        </c:if>
	      </ul>
	      
	      <h3>계약 관리</h3>
	      <ul>
<!-- 	        <li><a href="/admin/contract/contract?car_num=0">계약서 양식</a></li> -->
	        <li><a href="/admin/contract/list">계약 내역</a></li>
	      </ul>
	      
	      
	      <h3>문의 관리</h3>
	      <ul>
	        <li><a href="/admin/board/list">문의 조회</a></li>
	        <li><a href="">상담 신청내역</a></li>
	      </ul>
		</div>
    </nav>
  </header>
  


