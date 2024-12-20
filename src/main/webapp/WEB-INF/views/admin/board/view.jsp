<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/adm-header.jsp" %>
	<link rel="stylesheet" href="/resources/css/admin/staff.css">
	<script src="/resources/ckeditor/ckeditor.js"></script>
	<script>
	function deleteBoard(bno) {
        var result = confirm('('+bno+')번 게시물을 정말 삭제하겠습니까?');
        
        if (result) location.href='/admin/board/delete?bno='+bno; 
    }
	
	function deleteReply(rno, bno) {
        var result = confirm('('+rno+')번 댓글을 정말 삭제하겠습니까?');
        
        if (result) location.href='/admin/reply/delete?rno='+rno+'&bno='+bno;
    }
	$(function(){
		// ※ 첨부 파일 보여주기
		(function() {
			var bno = $('#bno').val();
			$.getJSON('/static/board/getAttachList', {bno:bno}, function(arr) {
				
				console.log(arr);
				var str = '';
				
				$(arr).each(function(i, attach) {
					if (attach.fileType == "true") {
						var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
						str += "<img src='/static/board/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str +"</li>";
					} else {      
						str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' >";
						str += "<p style='color:#222;'> "+attach.fileName+"</p>";
						str += "<img src='/resources/images/attach.jpg'></a>";
						str +"</li>";
					}
				});
				
				$(".uploadResult ul").html(str);
					});
				})();
				
				
				// 첨부 파일 클릭 : 이미지일 경우 원본 이미지 파일 보여주기, 일반 파일일 경우 파일 다운로드 구현
				$('.uploadResult').on('click','li', function(e) {	
					var liObj = $(this);
					var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
				    
					if(liObj.data("type")) {
						showImage(path.replace(new RegExp(/\\/g),"/"));
				    } else {
						self.location ="/static/board/download?fileName="+path;
				    }
				});
				const updiv = document.getElementById('uploadResult');
				const ul = document.getElementById('uploadBox');
				if (ul.children.length == 0) {
		//			    updiv.style.display = 'none';
				}
				// 첨부 이미지 파일의 원본을 보여준다.
				function showImage(fileCallPath) {
					$(".bigPictureWrapper").fadeIn();
					$(".bigPicture").html("<img style='width:800px;' src='/static/board/display?fileName="+fileCallPath+"' >").fadeIn();
				}
				
				// 원본 이미지 클릭 시 원본 이미지 닫기
				$('.bigPictureWrapper').on('click', function(e){
					$('.bigPicture').fadeOut();
				    setTimeout(function() { $('.bigPictureWrapper').fadeOut(); }, 500);
				});
			});
	</script>
	<section>
		<div class="tab-content">
	    <div class="content-header flex-between">
        <h3>문의 상세 정보</h3>
        <div class="sec-btn">
       		<a href="/admin/board/list?num=1">문의 목록</a>
				<a href="/admin/board/modify?bno=${bvo.bno}">수정</a>
				<a href="javascript:deleteBoard('${bvo.bno}');">삭제</a>
        </div>
	    </div>
	    
	    <div class="container">
		    <h3>게시글</h3>
		    <div class="sa-view">
				<c:if test="${bvo != null }">
				<input type="hidden" id="bno" value="${bvo.bno }">
				<ul class="sa-bd-info">
					<li>
						<p>제 목</p>
						<p>${bvo.title}</p>
					</li>
					<li>
						<p>작성자</p>
						<p>${bvo.writer }</p>
					</li>
					<li>
						<p>조회수</p>
						<p>${bvo.viewcnt}</p>
					</li>
					<li>
						<p>댓글수</p>
						<p>${bvo.replycnt }</p>
					</li>
					<li>
						<p>작성일</p>
						<p><fmt:formatDate value="${bvo.reg_date}" pattern="yyyy년 MM월 dd일" /></p>
					</li>
					<li>
						<p>수정일</p>
						<p><fmt:formatDate value="${bvo.up_date}" pattern="yyyy년 MM월 dd일" /></p>
					</li>
					<li>
						<p>본문내용</p>
						<p>${bvo.content }</p>
					</li>
				</ul>
				</c:if>
				<div class="uploadResult" id="uploadResult">
					<ul id="uploadBox"></ul>
				</div>
				<div class="bigPictureWrapper">
					<div class="bigPicture"></div>
				</div>
			</div>

			
			<div>
				<h3>댓글 작성</h3>
				<div class="sa-view">
					<form action="/admin/reply/write" method="post" >
						<input type="hidden" name="bno" value="${bvo.bno }" id="bno">
						<ul class="sa-bd-info">
							<li>
								<div class="sa-bd-reply">
									<p><label for="reply-writer">댓글 작성자</label></p>
									<p><input id="reply-writer" type="text" name="writer" value="${staffsess.staff_name}" readonly class="inputFrm input-mb"></p>
									<input type="hidden" name="staff_id" value="${staffsess.staff_id }">
								</div>
							</li>
							<li>
								<p><label for="reply-content" class="">댓글 본문내용</label></p>
								<textarea name="content" id="reply-content" class=""></textarea>
								<script>
									var ckeditor_config = {
										width: '640px',
										height: '200px',
										resize_enable: false,
										enterMode: CKEDITOR.ENTER_BR,
										shiftEnterMode: CKEDITOR.ENTER_P,
										filebrowserUploadUrl: "/static/board/ckUpload"
										// BoardController에서 '/board/ckUpload' 요청을 처리해야함
									};
									
									CKEDITOR.replace("reply-content", ckeditor_config);
									// textarea에 ckEditor를 적용함
								</script>
							</li>
						</ul>
					<c:if test="${staffsess != null}">
						<div class="reply-btn">
							<button type="submit" class="btn btn-info">작 성</button>
						</div>
					</c:if>
					</form>
				</div>
			</div>
			
			
			<div>
				<h3>댓글리스트</h3>
				<c:if test="${rvo != null}">
				   <c:forEach var="rvo" items="${rvo}">
					<div class="content-wrap sa-view">
						<ul class="sa-bd-info">
							<li>
								<p>댓글 작성자</p>
								<p>${rvo.writer }</p>
							</li>
							<li>
								<p>댓글내용</p>
								<p>${rvo.content }</p>
							</li>
							<li>
								<p>작성일</p>
								<p><fmt:formatDate value="${rvo.reg_date}" pattern="yyyy년 MM월 dd일" /></p>
							</li>
							<li>
								<p>수정일</p>
								<p><fmt:formatDate value="${rvo.up_date}" pattern="yyyy년 MM월 dd일" /></p>
							</li>
						</ul>
						<div class="bd-view-btn">
						<c:if test="${session != null or staffsess != null}">
							<c:if test="${rvo.writer == session.user_nick or rvo.writer == staffsess.staff_name or staffsess.staff_id == 'admin' or session.user_id == 'admin'}">
								<div class="reply-btn">
									<a href="/admin/reply/modify?bno=${rvo.bno }&rno=${rvo.rno}" class="btn btn-info">수정</a>
									<a href="/admin/reply/delete?bno=${rvo.bno}&rno=${rvo.rno}" class="reply-delete btn btn-info" id="reply-delete">삭제</a>
								</div>
							</c:if>
						</c:if>	
						</div>
					</div>
					</c:forEach>
				</c:if>
 				<c:if test="${rvo == null}">
 				<div class="content-wrap sa-view">
					<p class="cf-msg">※ 등록된 댓글이 없습니다.</p>
				</div>
				</c:if> 
			</div>
		</div>
	</section>
</body>
</html>	