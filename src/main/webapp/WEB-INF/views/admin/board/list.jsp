<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/adm-header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin/staff.css">
<script>
	$(function(){
		$('#sa-search').keyup(function(){
			// 검색 입력폼에서 입력한 검색어를 얻음
			var value = $(this).val().toLowerCase();
			
			// 목록화면에서 직원 정보 텍스트를 얻음
			// indexOf()는 동일한 값이 없으면 -1을 반환함
			$('.bd-list-item').filter(function(){
				$(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
				});
			});
		
			$('.ac').click(function(){
				
					var bno = $(this).next().attr("data-bno");
					console.log(bno);
					$.getJSON('/admin/board/getAttachList', {bno:bno}, function(arr) {
						
						console.log(arr);
						var str = '';
						
						$(arr).each(function(i, attach) {
							if (attach.fileType) {
								var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
								str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
								str += "<img src='/board/display?fileName="+fileCallPath+"'>";
								str += "</div>";
								str +"</li>";
							} else {      
								str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
								str += "<span> "+attach.fileName+"</span><br/>";
								str += "<img src='/resources/imgs/attach.png'></a>";
								str += "</div>";
								str +"</li>";
							}
						});
						
						$(".uploadResult ul").html(str);
					});
				});
			});
		function deleteBoard(bno) {
	        var result = confirm('게시물목록에서 ('+bno+')번 게시물을 정말 삭제하겠습니까?');
	        
	        if (result) location.href='/admin/board/delete?bno='+bno; 
	    }
		
		function deleteReply(rno, bno) {
	        var result = confirm('게시물목록에서 ('+rno+')번 댓글을 정말 삭제하겠습니까?');
	        
	        if (result) location.href='/admin/reply/delete?rno='+rno+'&bno='+bno;
	    }
</script>

	<section>
			<div class="tab-content">
			    <div class="content-header flex-between">
		        	<h3>게시판 목록</h3>
			    </div>
		    
				<div class="content-wrap board-list">
					<h3>게시글 검색</h3>
					<div class="sa-search-wrap">
						<input type="search" id="sa-search" placeholder="검색어 입력" class="input-frm input-sa">
						<c:if test="${staffsess != null}">
						<a href="/admin/board/register" class="btn btn-info">등 록</a>
						</c:if>
					</div>
					
					<h3>게시글 목록</h3>
					<div class="bd-txt-wrap">
						<div class="bd-list-title">
				            <p>제목</p>
				            <p>작성자</p>
				            <p>조회수</p>
				            <p>댓글수</p>
				            <p>작성일</p>
				        </div>
       			<c:if test="${not empty boardList }">
						<c:forEach items="${boardList}" var="bvo">
						<ul class="bd-list-item">
							<li>
								<p><a href="/admin/board/view?bno=${bvo.bno}">${bvo.title }</a></p>
							</li>
							<li><p>${bvo.writer }</p></li>
							<li><p>${bvo.viewcnt }</p></li>
							<li><p>${bvo.replycnt }</p></li>
							<li><p><fmt:formatDate value="${bvo.reg_date}" pattern="yyyy-MM-dd" /></p></li>
						</ul>
						</c:forEach>
						</c:if>
						<c:if test="${empty boardList }">
						<p> ※ 조회된 게시물이 없습니다.</p>
						</c:if>
					</div>
				</div>
			</div>
	</section>
</body>
</html>