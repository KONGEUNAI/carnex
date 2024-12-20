<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/user/faq.css">
<script>
	$(function(){
		$('#search-btn').click(function(){
			var searchType = $('#searchType').val();
			var keyword = $('#keyword').val();
			
			location.href="/static/board/list?num=1&searchType="+searchType+"&keyword="+keyword;
		});
	});
	
    $(function(){
		$('.faq-register > li').click(function(event){
    $(this).toggleClass('active-faq');
			$(this).children('.faq-txt').slideToggle();
			$(this).find('i').toggleClass('off');
		});
	});
</script>
  
  	<div class="bn">
      <svg viewBox="0 0 1320 300" class="bn-svg">
          <text x="50%" y="50%" text-anchor="middle">F A Q</text>
      </svg>
  	</div>
  
	<section>
		<h3><span class="txt-y">F</span>requently Asked<span class="txt-b"> Q</span>uestions</h3>
   		<p class="sub-txt">자주 하는 질문</p>

		<ul class="faq-register">
	      <li>
	        <div class="faq-tab">
	          <p>차량 구매 후 차량 하자 발견시에는 어느곳으로 연락을 해야할까요?</p>
	          <div class="faq-icon">
	            <i class="bi bi-chevron-up off"></i>
	            <i class="bi bi-chevron-down"></i>
	          </div>
	        </div>
	        <div class="faq-txt">
	          <p>차량 구매 후 문제 발생 시에는 차량 판매자(딜러)에게 연락해서 해당 내용을 전달해야 합니다.</p>
	          <p>구매 후 하자 발생 시에는 구매자의 운행으로 발생 할 수도 있으므로 구매 전 꼭 차량상태를 꼼꼼히 살펴보고 미리 사진을 찍어 두면 좋습니다.</p>
	        </div>
	      </li>
	
	      <li>
	        <div class="faq-tab">
	          <p>방문예약했으나 방문이 어려워 취소 하고 싶습니다. 어떻게 해야할까요?</p>
	          <div class="faq-icon">
	            <i class="bi bi-chevron-up off"></i>
	            <i class="bi bi-chevron-down"></i>
	          </div>
	        </div>
	        <div class="faq-txt">
	          <p>방문 예약 후 취소를 원할 경우</p>
	          <p>왼쪽 상단 삼선 버튼 클릭 ▶ 마이페이지에서 방문예약 관리 버튼 클릭 ▶ 예약 취소 처리 하면 됩니다.</p>
	          <p>PC 메뉴바에 이름 클릭 ▶ 방문예약 내역 클릭 ▶ 예약 취소 처리 하면 됩니다.</p>
	          <p>예약 취소 사유는 꼭 기재해주시고, 해당 차량 판매자에게 연락하여 취소 안내 해주셔도 좋습니다.</p>
	        </div>
	      </li>
	
	      <li>
	        <div class="faq-tab">
	          <p>회원가입을 하지않고 서비스를 이용할 순 없나요?</p>
	          <div class="faq-icon">
	            <i class="bi bi-chevron-up off"></i>
	            <i class="bi bi-chevron-down"></i>
	          </div>
	        </div>
	        <div class="faq-txt">
	          <p>CARNEX의 서비스는 회원가입을 하셔야 이용하실 수 있어요.</p>
	          <p>고객님에 대해 알고 알맞은 서비스를 제공해드리기 위함이니 양해 부탁 드릴게요.</p>
	          <p>다만, 고객님께서 보다 편리하게 가입하실 수 있도록 SNS 계정으로도 CARNEX 회원가입을 지원하고 있으니<br>간편하게 가입하시고 CARNEX의 다양한 서비스 이용해보세요.</p>
	        </div>
	      </li>
	
	      <li>
	        <div class="faq-tab">
	          <p>회원가입은 어떻게 하나요?</p>
	          <div class="faq-icon">
	            <i class="bi bi-chevron-up off"></i>
	            <i class="bi bi-chevron-down"></i>
	          </div>
	        </div>
	        <div class="faq-txt">
	          <p>CARNEX 회원가입은 APP은 물론 PC와 모바일웹에서도 가능하세요.</p>
	          <p>로그인 페이지에 있는 회원가입 버튼을 누르시면 휴대폰 본인 인증과 함께 간단한 정보 입력 후 CARNEX 회원으로 가입하실 수 있답니다.</p> 
	        </div>
	      </li>
	
	      <li>
	        <div class="faq-tab">
	          <p>휴대폰 번호를 변경했는데 비밀번호가 생각 나지 않아요.</p>
	          <div class="faq-icon">
	            <i class="bi bi-chevron-up off"></i>
	            <i class="bi bi-chevron-down"></i>
	          </div>
	        </div>
	        <div class="faq-txt">
	          <p>이미 휴대폰 번호가 변경되었다면, 비밀번호 변경 관련 인증번호를 받을 수가 없어요.</p>
				    <p>기존 이용하는 서비스가 없다면 고객센터로 연락하여 탈퇴요청 후 신규 가입으로 진행해주세요.</p>
	        </div>
	      </li>
	
	      <li>
	        <div class="faq-tab">
	          <p>방문예약신청을 했는데 확정은 언제되나요?</p>
	          <div class="faq-icon">
	            <i class="bi bi-chevron-up off"></i>
	            <i class="bi bi-chevron-down"></i>
	          </div>
	        </div>
	        <div class="faq-txt">
	          <p>방문 예약 신청은 딜러가 해당 내역을 확인 후 확정하게 된답니다.</p>
				    <p>딜러가 해당 내역을 익일까지 확정 혹은 딜러의 사정에 의해 거부할 수 있고, 딜러분이 확인하지 못할 경우 부득이하게 관리자에 의해 신청 내역이 삭제되는 점 양해 부탁드릴게요. </p>
	        </div>
	      </li>
	
	      <li>
	        <div class="faq-tab">
	          <p>헛걸음보상서비스는 어떻게 이용하나요?</p>
	          <div class="faq-icon">
	            <i class="bi bi-chevron-up off"></i>
	            <i class="bi bi-chevron-down"></i>
	          </div>
	        </div>
	        <div class="faq-txt">
	          <p>헛걸음 보상 서비스는 중고차 허위매물 근절 및 고객님께서 보다 안심하고 중고차를 구매하실 수 있도록 방문 예약하신 차량이 없거나 다른 차량으로 구매 유도 시 위로금 20만원을 지급해드리는 안심 서비스에요.</p>
	          <p><strong>[서비스 이용법]</strong></p>
	          <p>① 헛걸음 보상 서비스 마크가 부착된 차량을 방문 예약</p>
	          <p>② 방문 예약 확정 및 안심번호(050)로 전화 통화</p>
	          <p>③ 예약하신 시간에 매매단지를 방문하셔서 차량을 확인하시면 끝!</p>
	          <p>④ 서비스 신청은 KB차차차 대표번호 1670-4777에서 가능해요.</p>
	          <p>고객님의 소중한 발걸음 옆에 언제나 든든한 KB차차차가 함께하겠습니다.</p>
	        </div>
	      </li>
	
	      <li>
	        <div class="faq-tab">
	          <p>보증수리는 아무곳에서나 받을 수 있나요?</p>
	          <div class="faq-icon">
	            <i class="bi bi-chevron-up off"></i>
	            <i class="bi bi-chevron-down"></i>
	          </div>
	        </div>
	        <div class="faq-txt">
	          <p>보증수리는 지정 정비업체에서만 가능합니다. 보증수리접수시 가까운 지점으로 안내받을 수 있습니다.</p>
	        </div>
	      </li>
	
	      <li>
	        <div class="faq-tab">
	          <p>성능진단은 어떤 항목들을 점검하는 건가요?</p>
	          <div class="faq-icon">
	            <i class="bi bi-chevron-up off"></i>
	            <i class="bi bi-chevron-down"></i>
	          </div>
	        </div>
	        <div class="faq-txt">
	          <p>성능진단 서비스는 자동차 성능점검상태기록부와 보험개발원에서 제공하는 자동차 사고이력정보를 포함한 총 82가지 사항에 대한 점검을 진행합니다.</p>
				    <p>성능진단이 완료된 차량은 무사고 여부와 주요골격에 대한 사고 여부가 검증된 차량으로 안심하고 구매 하실 수 있습니다 ^^*</p>
	        </div>
	      </li>
	
	      <li>
	        <div class="faq-tab">
	          <p>후기평가는 어떻게 입력하나요?</p>
	          <div class="faq-icon">
	            <i class="bi bi-chevron-up off"></i>
	            <i class="bi bi-chevron-down"></i>
	          </div>
	        </div>
	        <div class="faq-txt">
	          <p>방문예약, 차량 상담, 차량 구매 등 CARNEX의 다양한 서비스를 이용하신 고객님들의 의견을 수렴하고자<br> 만족도 평가 문자를 보내드리고 있어요.</p>
	          <p>고객님께서 등록해주신 후기는 딜러홈에 노출될 뿐 아니라 고객님의 소중한 의견을 바탕으로 보다 나은<br> 서비스를 제공하기 위함이니 고객님의 소중한 후기를 들려주세요. :)</p>
	          <p>	* 이용약관 제12조(게시물의 관리), 제16조(회원의 의무 )의거하여 폄하, 비방, 욕설, 채팅글 도배 및 사실과<br> 다른 글을 작성할 경우에는 통보없이 즉시 삭제처리 될 수 있습니다. *</p>
	        </div>
	      </li>
	    </ul>
	</section>
<%@include file = "include/footer.jsp" %>