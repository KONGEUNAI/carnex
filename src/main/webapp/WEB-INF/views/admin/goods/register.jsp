<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "../include/adm-header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin/goods-register.css">
<script src="/resources/ckeditor/ckeditor.js"></script>
<script>
	$(function(){
		$('#register-btn').click(function(){
			const carBrand = $('input[name="car_brand"]').val();
			const carType = $('input[name="car_type"]:checked').val();
			const carModel = $('input[name="car_model"]').val();
// 			const carStatus = $('input[name="car_status"]:checked').val();
// 			const carZone = $('input[name="car_zone"]:checked').val();

	        if (!carBrand) {
	            alert('제조사를 입력해주세요.');
	            event.preventDefault();
	            return;
	        }
	        if (!carType) {
	            alert('차량 타입을 선택해주세요.');
	            event.preventDefault();
	            return;
	        }
	        if (!carModel) {
	            alert('차량 모델을 입력해주세요.');
	            event.preventDefault();
	            return;
	        }
// 	        if (!carStatus) {
// 	            alert('판매 상태를 선택해주세요.');
// 	            event.preventDefault();
// 	            return;
// 	        }
// 	        if (!carZone) {
// 	            alert('보유 지점를 선택해주세요.');
// 	            event.preventDefault();
// 	            return;
// 	        }
	        
			if (confirm('정말 등록 하시겠습니까?') == true) {
				$('#registerFrm').attr('action','/admin/goods/register');
				$('#registerFrm').submit();
			}
		});
	});
</script>
  <section>	
	  	<div class="tab-content">
		    <div class="content-header flex-between">
		        <h3>차량 등록</h3>
		        <div class="sec-btn">
		        	<c:if test="${staffsess != null}">
   					<button id="register-btn" type="submit">매물 등록</button>
   					</c:if>
					<a href="/admin/goods/goodsList?carType=&keyword=&car_status=">매물 목록</a>
		        </div>
		    </div>
		    
		    <div class="content-wrap goods-reg">
		    	<h3>차량 정보 입력</h3>
			    <form id="registerFrm" action="" method="post" enctype="multipart/form-data" class="center-wrap">
			    	<input type="hidden" name="staff_id" value="${staffsess.staff_id }">
				    <ul class="gd-reg-frm">
				      <li>
				      	<p>자동차 제조사</p>
				        <input type="text" name="car_brand"  required autofocus class="input-frm input-mb">
				      </li>
				      <li>
				      	<p>자동차 분류</p>
				        <input type="radio" id="type-01" name="car_type" value="세단" required class="input-frm input-mb">
				        <label class="filter-op-check" for="type-01">세단</label>
				        
				        <input type="radio" id="type-02" name="car_type" value="쿠페" required class="input-frm input-mb">
				        <label class="filter-op-check" for="type-02">쿠페</label>
				        
				        <input type="radio" id="type-03" name="car_type" value="웨건" required class="input-frm input-mb">
				        <label class="filter-op-check" for="type-03">웨건</label>
				        
				        <input type="radio" id="type-04" name="car_type" value="SUV" required class="input-frm input-mb">
				        <label class="filter-op-check" for="type-04">SUV</label>
				        
				        <input type="radio" id="type-05" name="car_type" value="컨버터블" required class="input-frm input-mb">
				        <label class="filter-op-check" for="type-05">컨버터블</label>
				        
				        <input type="radio" id="type-06" name="car_type" value="해치백" required class="input-frm input-mb">
				        <label class="filter-op-check" for="type-06">해치백</label>
				        
				        <input type="radio" id="type-07" name="car_type" value="리무진" required class="input-frm input-mb">
				        <label class="filter-op-check" for="type-07">리무진</label>
				        
				        <input type="radio" id="type-08" name="car_type" value="밴" required class="input-frm input-mb">
				        <label class="filter-op-check" for="type-08">밴</label>
				        
				        <input type="radio" id="type-09" name="car_type" value="픽업트럭" required class="input-frm input-mb">
				        <label class="filter-op-check" for="type-09">픽업트럭</label>
				      </li>
				      <li>
				      	<p>자동차 모델</p>
				        <input type="text" name="car_model"  required class="input-frm input-mb">
				      </li>
				      <li>
				      	<p>자동차 가격</p>
				        <input type="number" name="car_price" class="input-frm input-mb">
				      </li>
				      <li>
				      	<p>제목 입력</p>
				      	<div class="mb-frm-check">
					        <input type="text" name="car_title" class="input-frm input-mb">
					        <p id="num-check-msg">※ 브랜드 / 타입 / 모델 / 등급 순으로 작성하세요.</p>
							  </div>
				      </li>
				      <li>
				      	<p>차량 제원 입력</p>
							  <div class="mb-frm-check">
					        <input type="text" name="car_subtitle" class="input-frm input-mb">
					        <p id="num-check-msg">※ 년식 / 키로수 / 연료 / 지역</p>
							  </div>
				      </li>
				      <li>
				      	<p>사고 유무</p>
							  <div class="mb-frm-check">
					        <input type="number" name="car_accident" class="input-frm input-mb">
					        <p id="num-check-msg">※ 무사고 : 0, 사고이력있음 : 1</p>
							  </div>
				      </li>
				      <li>
				      	<p>판매 상태</p>
				      	<input type="radio" id="status-01" name="car_status" value="판매완료" required class="input-frm input-mb">
				        <label class="filter-op-check" for="status-01">판매완료</label>
				        
				        <input type="radio" id="status-02" name="car_status" value="예약중" required class="input-frm input-mb">
				        <label class="filter-op-check" for="status-02">예약중</label>
				        
				        <input type="radio" id="status-03" name="car_status" value="판매중" required class="input-frm input-mb">
				        <label class="filter-op-check" for="status-03">판매중</label>
				        
				        <input type="radio" id="status-04" name="car_status" value="임시등록" required class="input-frm input-mb">
				        <label class="filter-op-check" for="status-04">임시등록</label>
				        
				        <input type="radio" id="status-05" name="car_status" value="판매보류" required class="input-frm input-mb">
				        <label class="filter-op-check" for="status-05">판매보류</label>
				      </li>
				      <li>
				      	<p>보유 지점</p>
				      	<input type="radio" id="zone-02" name="car_zone" value="광교" required class="input-frm input-mb">
				        <label class="filter-op-check" for="zone-02">광교1호점</label>
				        
				        <input type="radio" id="zone-03" name="car_zone" value="광교" required class="input-frm input-mb">
				        <label class="filter-op-check" for="zone-03">광교2호점</label>
				        
				        <input type="radio" id="zone-04" name="car_zone" value="용인" required class="input-frm input-mb">
				        <label class="filter-op-check" for="zone-04">용인</label>
				        
				        <input type="radio" id="zone-05" name="car_zone" value="분당" required class="input-frm input-mb">
				        <label class="filter-op-check" for="zone-05">분당</label>
				      </li>
				      <li>
				      	<p>썸네일 이미지</p>
				        <input  type="file" id="uploadFile" name="uploadFile" accept="image/*" class="input-frm input-mb">
				      </li>
				      <li>
				      	<p>상세 이미지</p>
				        <input  type="file" id="carImage" name="carImage" accept="image/*" multiple class="input-frm input-mb">
				      </li>
				      <li><p>본문 설명</p></li>
				      <li>
								<textarea name="car_content" id="contents"></textarea>
								<script>
									var ckeditor_config = {
										width: '100%',
										height: '350px',
										resize_enable: false,
										enterMode: CKEDITOR.ENTER_BR,
										shiftEnterMode: CKEDITOR.ENTER_P,
										filebrowserUploadUrl: "/static/board/ckUpload"
									};
									
									CKEDITOR.replace("contents", ckeditor_config);
								</script>
							</li>
				    </ul>
			    </form>
		    </div>
	    </div>
  </section>
</body>
</html>