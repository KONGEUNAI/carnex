<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/user/board.css">
<script src="/resources/ckeditor/ckeditor.js"></script>
	<script>
		$(document).ready(function(e) {
			var formObj = $('form[role="form"]');
			
			$('button[type="submit"]').on('click', function(e) {
				e.preventDefault();
				var str = '';
				var title = $('#title').val()
				var writer = $('#writer').val()
				var editorData = CKEDITOR.instances.contents.getData(); // CKEditor 인스턴스에서 내용 가져오기

					if (title == '') {
						alert('제목을 입력하세요');
						return;
					}
					if (writer == '') {
						alert('로그인을 먼저 하세요');
						return;
					}
					if (editorData.trim() === '') {
						alert('내용을 입력하세요');
						return;
					}
			    $('.uploadResult ul li').each(function(i, obj) {
					var jobj = $(obj);
					
					str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
					str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
				});
			    
				formObj.append(str).submit( );
			});

			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 104857600;

			function checkExtension(fileName, fileSize) {
				if(fileSize >= maxSize) {
					alert('업로드 파일 사이즈를 초과했습니다.');
					return false;
				}
	
				if(regex.test(fileName)) {
					alert('해당 종류의 파일은 업로드할 수 없습니다.');
					return false;
				}
				
				return true;
			}
			
			$('input[type="file"]').change(function(e) {
				var formData = new FormData();
			    var inputFile = $('input[name="uploadFile"]');
			    var files = inputFile[0].files;
			    
			    for(var i = 0; i < files.length; i++) {
					if(!checkExtension(files[i].name, files[i].size)) {
						return false;
					}
			    	
					formData.append("uploadFile", files[i]);
				}
			    			    
				$.ajax({
					url: '/static/board/uploadAjaxAction',
					processData: false,
					contentType: false,
					data: formData, // 업로드 파일의 정보(uploadFile)
					type: 'POST',
					dataType: 'json',
					
					success: function(result) {
						console.log('응답 결과 : '+result);
						showUploadResult(result);
					}
			    });
			});
			
			function showUploadResult(uploadResultArr) {
				console.log('응답 결과 : '+uploadResultArr);
				if(!uploadResultArr || uploadResultArr.length == 0) { return; }
			    
				var uploadUL = $('.uploadResult ul');
				var str ="";
			    
				$(uploadResultArr).each(function(i, obj) { // obj : 업로드 파일(AttachDTO)
					if (obj.image) { // 업로드 파일이 이미지이면
						var fileCallPath =  encodeURIComponent(obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
						str += "<li data-path='"+obj.uploadPath+"'";
						str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
						str += "<p>"+ obj.fileName+"</p>";
						str += "<button style='width:20px; padding:0 20px;'type='button' data-file=\'"+fileCallPath+"\' "
						str += "data-type='image' class='btn btn-delete'>X</button><br>";
						str += "<img src='/static/board/display?fileName="+fileCallPath+"'>";
						str += "</div>";
						str +"</li>";
					} else {
						var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
					    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
						str += "<li "
						str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
						str += "<p> "+ obj.fileName+"</p>";
						str += "<button style='width:20px; padding:0 20px;' type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
						str += "class='btn btn-delete'>X</button><br>";
						str += "<img src='/resources/images/attach.jpg'></a>";
						str += "</div>";
						str +"</li>";
					}
			    });
			    
			    uploadUL.append(str);
			}
			  
			$('.uploadResult').on('click', 'button', function(e) {
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				var targetLi = $(this).closest("li");
				
				$.ajax({
					url: '/static/board/deleteFile',
					data: {fileName:targetFile, type:type},
					dataType:'text',
					type: 'POST',
					
					success: function(result) {
						alert(result);
					}
				});
				
				targetLi.remove();
			});
		});
	</script>

	
	<section>
		<form id="updateFrm" role="form" action="/static/board/modify" method="post">
			<c:if test="${session != null }">
			<input type="hidden" name="user_id" value="${session.user_id }">
			</c:if>
			<c:if test="${staffsess != null }">
			<input type="hidden" name="staff_id" value="${staffsess.staff_id }">
			</c:if>
			<input type="hidden" name="bno" value="${modify.bno }">
			<ul class="bd-reg-frm">
				<li>
					<input id="title" type="text" name="title" placeholder="제목 입력" autofocus class="inputFrm input-mb input-title" value="${modify.title }">
				</li>
				<li>
					<input id="writer" type="text" name="writer" value="${session.user_nick}${staffsess.staff_id}" readonly class="inputFrm input-mb">
				</li>
				<li>
					<input type="file" name="uploadFile" multiple class="input-frm input-bd">
				</li>
				<li>
					<textarea name="content" id="contents">${modify.content }</textarea>
					<script>
						var ckeditor_config = {
							width: '100%',
							height: '350px',
							resize_enable: false,
							enterMode: CKEDITOR.ENTER_BR,
							shiftEnterMode: CKEDITOR.ENTER_P,
							filebrowserUploadUrl: "/static/board/ckUpload"
							// BoardController에서 '/board/ckUpload' 요청을 처리해야함
						};
						
						CKEDITOR.replace("contents", ckeditor_config);
					</script>
				</li>
				<li>
				<c:if test="${modify.writer == session.user_nick or modify.writer == staffsess.staff_id or staffsess.staff_id == 'admin' or session.user_id == 'admin'}">				
					<button id="updateBtn" type="submit" class="btn btn-carnex">수 정</button>
				</c:if>
					<a href="/static/board/list?num=1"class="btn btn-kakao">목 록</a>
				</li>
			</ul>
		</form>
		
<!-- 		<div class="attach-wrap"> -->
<!-- 			<input type="file" name="uploadFile" multiple class="input-frm input-bd"> -->
<!-- 		</div> -->
		
		<div class="uploadResult">
			<ul></ul>
		</div>
	</section>

<%@include file = "../include/footer.jsp" %>
