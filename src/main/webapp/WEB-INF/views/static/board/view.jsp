<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
	<link rel="stylesheet" href="/resources/css/user/board.css">
	<script src="/resources/ckeditor/ckeditor.js"></script>
	<script>
		$(function(){
			$('#board-delete').click(function(){
				if (confirm('정말 삭제하시겠습니까?') == true) {
					$('#board-delete').attr('href', '/static/board/delete?bno=${bvo.bno}');
				}
			});
			
			$('#btn-toggel').click(function(event){
				$('.bd-reg-content').slideToggle();
				$(this).find('i').toggleClass('off');
			});
			
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
							str += "<p> "+attach.fileName+"</p>";
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
// 			    updiv.style.display = 'none';
			}
			// 첨부 이미지 파일의 원본을 보여준다.
			function showImage(fileCallPath) {
				$(".bigPictureWrapper").fadeIn();
				$(".bigPicture").html("<img width='700px;' src='/static/board/display?fileName="+fileCallPath+"' >").fadeIn();
			}
			
			// 원본 이미지 클릭 시 원본 이미지 닫기
			$('.bigPictureWrapper').on('click', function(e){
				$('.bigPicture').fadeOut();
			    setTimeout(function() { $('.bigPictureWrapper').fadeOut(); }, 500);
			});
		});
	</script>
	
	<section>
		<div class="bd-view">
			<input type="hidden" id="bno" value=${bvo.bno }>
			<h1>Q. ${bvo.title }</h1>	
			<p><i class="bi bi-person-circle"></i> ${bvo.writer }&nbsp;	·&nbsp; 조회  ${bvo.viewcnt }&nbsp;	·&nbsp; 댓글 ${bvo.replycnt }</p>
			<div class="bd-view-wrap">
				<p><fmt:formatDate value="${bvo.reg_date}" pattern="yyyy.MM.dd (E)" /></p>
				<div class="bd-side-btn">
					<button type="button" class="side-btn">공유</button>
					<button type="button" class="side-btn">저장</button>
				</div>
			</div>
			<p class="bd-content">${bvo.content }</p>
			<div class="uploadResult" id="uploadResult">
				<ul id="uploadBox"></ul>
			</div>
			<div class="bigPictureWrapper">
				<div class="bigPicture"></div>
			</div>
		</div>

		
	<!-- 댓글 목록 처리 -->
		<c:if test="${empty replyList}">
		<div class="reply-list">
			<p>※ 등록된 댓글이 없습니다.</p>
		</div>
		</c:if>
		
		<c:if test="${not empty replyList}">
		<div class="reply-list">
			<!-- <div class="reply-list-bord"> -->
				<h2>댓글 리스트</h2>
				<c:forEach items="${replyList}" var="rvo">	
				<ul class="reply-content-wrap">
					<li>
					    <c:if test="${member.user_img == null }">
			    		<img src="/resources/images/noimage.jpg" class="img" alt="유저이미지"></img>
					    </c:if>
					    
					    <c:if test="${member.user_img != null }">
			      		<img src="${member.user_img }" class="img" alt="유저이미지"></img>
					    </c:if>
					    
					    <div class="reply-txt">
							<p>${rvo.writer }</p>
							<div class="reply-day">
								<p>작성일 : <fmt:formatDate value="${rvo.reg_date }" pattern="yyyy-MM-dd" /></p>
								<p>수정일 : <fmt:formatDate value="${rvo.up_date }" pattern="yyyy-MM-dd" /></p>
							</div>
						</div>
						<c:if test="${session != null or staffsess != null}">
						<c:if test="${rvo.writer == session.user_nick or rvo.writer == staffsess.staff_name or staffsess.staff_id == 'admin' or session.user_id == 'admin'}">
						<div class="bd-side-btn">
							<a href="/static/reply/modify?bno=${rvo.bno }&rno=${rvo.rno}" class="side-btn">수정</a>
							<a href="/static/reply/delete?bno=${rvo.bno}&rno=${rvo.rno}" class="side-btn" id="reply-delete">삭제</a>
						</div>
						</c:if>
						</c:if>	
					</li>
					<li>
						<div class="reply-content">${rvo.content }</div>
					</li>
				</ul>
				</c:forEach>
			<!-- </div> -->
		</div>
		</c:if>
		
		<!-- 댓글 처리 -->
		<div class="reply-reg-wrap">
			<form action="/static/reply/write" method="post" >
				<input type="hidden" name="bno" value="${bvo.bno }" id="bno">
				<div id="btn-toggel" class="reply-btn">
				<p>댓글 작성</p>          
				<div class="faq-icon">
		              <i class="bi bi-chevron-up off"></i>
		              <i class="bi bi-chevron-down"></i>
		            </div>
	            </div>
				<div class="bd-reg-content">
					<label for="reply-content" class="ck-title">
						<input type="hidden" name="writer" value="${session.user_nick }">
						<input type="hidden" name="user_id" value="${session.user_id }">
						<p>작성자 : ${session.user_nick}</p>
						<c:if test="${session != null or staffsess != null}">
						<button type="submit" class="side-btn">등 록</button>
						</c:if>
					</label>
					<textarea name="content" id="reply-content" class="reply-textarea"></textarea>
					<script>
						var ckeditor_config = {
							width: '100%',
							height: '300px',
							resize_enable: false,
							enterMode: CKEDITOR.ENTER_BR,
							shiftEnterMode: CKEDITOR.ENTER_P,
							filebrowserUploadUrl: "/static/board/ckUpload"
							// BoardController에서 '/board/ckUpload' 요청을 처리해야함
						};
						
						CKEDITOR.replace("reply-content", ckeditor_config);
						// textarea에 ckEditor를 적용함
					</script>
				</div>
			</form>
		</div>
		<div class="bd-view-btn">
			<a href="/static/board/list?num=1" class="btn btn-carnex">목 록</a>
			<c:if test="${session != null or staffsess != null}">
				<c:if test="${bvo.writer == session.user_nick or bvo.writer == staffsess.staff_id or staffsess.staff_id == 'admin' or session.user_id == 'admin'}">
				<a href="/static/board/modify?bno=${bvo.bno}" class="btn btn-carnex">수 정</a>
				<a href="" id="board-delete" class="btn btn-delete">삭 제</a>
				</c:if>	
			</c:if>
		</div>
	</section>
<%@include file = "../include/footer.jsp" %>