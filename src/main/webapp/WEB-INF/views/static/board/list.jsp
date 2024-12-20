<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/user/faq.css">
<script>
	$(function(){
		$('#search-btn').click(function(){
			var searchType = $('#searchType').val();
			var keyword = $('#keyword').val();
			
			location.href="/static/board/list?num=1&searchType="+searchType+"&keyword="+keyword;
		});
	});
</script>

	<div class="bn bn1">
      	<svg viewBox="0 0 1320 300" class="bn-svg">
          	<text x="50%" y="50%" text-anchor="middle">Board</text>
      	</svg>
 	</div>
  
	<section>
	    <h3>1:1 <span class="txt-y">N</span>otice <span class="txt-b">b</span>oard</h3>
	    <p class="sub-txt">문의 게시판</p>
	      
		<div class="bd-reg-wrap">
			<div>
				<select name="searchType" id="searchType" class="slect-box">
					<option value="title" selected>제목</option>
					<option value="title_writer">제목+작성자</option>
					<option value="writer">작성자</option>
				</select>
				<input type="search" name="keyword" id="keyword" placeholder="검색어 입력" class="inputform">
			</div>
			
			<div>
				<button id="search-btn" type="button" class="btn btn-kakao seaBtn">검 색</button>
				<c:if test="${session != null}">
				<a href="/static/board/register" class="btn btn-carnex seaBtn">작 성</a>
				</c:if>
			</div>
		</div>

		<div class="faq-user">
        	<ul class="poll-list"> 
	            <li><p>NO</p></li>
	            <li><p>제목</p></li>
	            <li><p>댓글수</p></li>
	            <li><p>조회수</p></li>
	            <li><p>작성자</p></li>
	            <li><p>작성일</p></li>
        	</ul>
        	
			<c:forEach items="${boardList}" var="bvo">
			<a href="/static/board/view?bno=${bvo.bno}">
				<ul class="repeat-list">
					<li>
						<p>${bvo.bno }</p>
					</li>
					<li>
						<p>${bvo.title }</p>
					</li>
					<li>
						<p>${bvo.replycnt }</p>
					</li>
					<li>
						<p>${bvo.viewcnt }</p>
					</li>
					<li>
						<p>${bvo.writer }</p>
					</li>
					<li>
						<p><fmt:formatDate value="${bvo.reg_date}" pattern="yyyy-MM-dd" /></p>
					</li>
				</ul>
			</a>
			</c:forEach>
      </div>
			
			
		<%-- Page 객체(DTO)를 사용한 페이징 처리 --%>
		<ul class="pagenation">
			<%-- prev 버튼 --%>
			<c:if test="${page.prev }">
			<li><a href="/static/board/list?num=${page.startPageNum - 1}" class="prev">이전</a></li>
			</c:if>
			
			<%-- page 번호 버튼 --%>
			<c:forEach begin="${page.startPageNum }" end="${page.endPageNum }" var="num">
			<li>
				<c:if test="${select != num }">
				<a href="/static/board/list?num=${num }">${num }</a>
				</c:if>
				<c:if test="${select == num}">
				<a href="/static/board/list?num=${num}" class="active">${num}</a>
				</c:if>
			</li>
			</c:forEach>
			
			<%-- next 버튼 --%>
			<c:if test="${page.next }">
			<li><a href="/static/board/list?num=${page.endPageNum + 1}" class="next">다음</a></li>
			</c:if>
		</ul>
	</section>

<%@include file = "../include/footer.jsp" %>