<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/adm-header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin/staff.css">
<script src="/resources/ckeditor/ckeditor.js"></script>

	<section>
		<div class="container">
		    <h3>댓글 수정</h3>
		    <div class="sa-view">
		        <form action="/admin/reply/modify" method="post" onsubmit="updateEditorContent()">
		            <input type="hidden" name="bno" value="${reply.bno}" id="bno">
		            <input type="hidden" name="rno" value="${reply.rno}" id="rno">
		            <ul class="sa-bd-info">
		                <li>
		                    <div class="sa-bd-reply">
		                        <p><label for="reply-writer">댓글 작성자</label></p>
		                        <p><input id="reply-writer" type="text" name="writer" value="${reply.writer}" readonly class="inputFrm input-mb"></p>
		                        <input type="hidden" name="staff_id" value="${staffsess.staff_id}">
		                    </div>
		                </li>
		                <li>
		                    <p><label for="reply-content" class="">댓글 본문내용</label></p>
		                    
		                    <textarea name="content" id="reply-content" class="ckeditor">${reply.content}</textarea>
		                    <script>
		                        var ckeditor_config = {
		                            width: '640px',
		                            height: '200px',
		                            resize_enable: false,
		                            enterMode: CKEDITOR.ENTER_BR,
		                            shiftEnterMode: CKEDITOR.ENTER_P,
		                            filebrowserUploadUrl: "/static/board/ckUpload"
		                        };
		
		                        var editor = CKEDITOR.replace("reply-content", ckeditor_config);
		
		                        function updateEditorContent() {
		                            var content = editor.getData();
		                            
		                            document.getElementById("reply-content").value = content;
		                        }
		                    </script>
		                </li>
		            </ul>
		            <c:if test="${staffsess != null}">
		                <div class="reply-btn">
		                    <button type="submit" class="btn btn-info">수정</button>
			         					<a href="/admin/board/view?bno=${reply.bno }" class="btn btn-info">이전</a>
		                </div>
		            </c:if>
		        </form>
		    </div>
		</div>
	</section>
</body>
</html>