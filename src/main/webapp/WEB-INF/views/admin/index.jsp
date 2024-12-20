<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/adm-header.jsp" %>
<link rel="stylesheet" href="/resources/css/admin/adminchart.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

  <section>
    <div class="tab-content">
      <div class="content-header flex-between">
        <h3>대시보드</h3>
        <!-- 
        <div class="sec-btn">
          <a href="#">연장 업그레이드</a>
          <a href="#">나가기</a>
        </div>
         -->
      </div>

      <div class="content-wrap">
        <h3>직원, 회원수 및 차량 판매상태</h3>
        <ul class="top-chart">
          <li><p>직원수 : ${dbdto.staff_count }</p></li>
          <li><p>회원수 : ${dbdto.member_count }</p></li>
          <li><p>판매완료 : ${dbdto.car_comp }</p></li>
          <li><p>거래중 : ${dbdto.car_ing }</p></li>
        </ul>
        
        <div class="chart-wrap">
          <div>
            <h3>차량별 조회</h3>
            <div class="barChart">
              <canvas id="barChart"></canvas>
            </div>
          </div>
          <script type="text/javascript">
		      	var carTypes = [];
		      	var carCounts = [];
		      	var wishCarTypes = [];
		      	var wishCarCounts = [];
		      	var wishPrice = [];
		      	var wishPriceCount = [];
		
						<c:forEach var="item" items="${dbdto.carTypeCounts}">
				        carTypes.push('${item.car_type}');
				        carCounts.push((${item.count}));
				    </c:forEach>
				        
						<c:forEach var="userItem" items="${dbdto.userWishCounts}">
				        wishCarTypes.push('${userItem.user_wishcar}');
				        wishCarCounts.push((${userItem.count}));
				    </c:forEach>
				    
						<c:forEach var="wish" items="${dbdto.userWishPrice}">
				        wishPrice.push('${wish.user_wishprice}');
				        wishPriceCount.push((${wish.count}));
				    </c:forEach>
				    console.log(wishPrice);
				    console.log(wishPriceCount);
						
						var wishCarCountMap = {};
					    for (var i = 0; i < wishCarTypes.length; i++) {
					        var carType = wishCarTypes[i];
					        var count = wishCarCounts[i];
					        if (wishCarCountMap[carType]) {
					            wishCarCountMap[carType] += count;
					        } else {
					            wishCarCountMap[carType] = count;
					        }
					    }

				    var finalWishCarCounts = carTypes.map(function(carType) {
				        return wishCarCountMap[carType] || 0;
				    });

            var context = document.getElementById('barChart').getContext('2d');
  					
            var myChart = new Chart(context, {
              type: 'bar',
              data: {
                labels: carTypes,
                datasets: [
                  {
                    label: '회원 선호차량',
                    fill: false,
                    data: finalWishCarCounts,
                    backgroundColor: [
                      'rgba(255, 99, 132, 0.2)',
                      'rgba(54, 162, 235, 0.2)',
                      'rgba(255, 206, 86, 0.2)',
                      'rgba(75, 192, 192, 0.2)',
                      'rgba(153, 102, 255, 0.2)',
                      'rgba(255, 159, 64, 0.2)',
                      'rgba(255, 159, 64, 0.2)',
                      'rgba(255, 159, 64, 0.2)',
                      'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                      'rgba(255, 99, 132, 1)',
                      'rgba(54, 162, 235, 1)',
                      'rgba(255, 206, 86, 1)',
                      'rgba(75, 192, 192, 1)',
                      'rgba(153, 102, 255, 1)',
                      'rgba(255, 159, 64, 1)',
                      'rgba(255, 159, 64, 1)',
                      'rgba(255, 159, 64, 1)',
                      'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                  },
                {
                  label: '차량 등록 수',
                  fill: false,
                  data: carCounts,
                  backgroundColor: 'rgb(157, 109, 12)',
                  borderColor: 'rgb(157, 109, 12)'
                  }
                ]
              },
              options: {
                scales: {
                  yAxes: [
                    {
                      ticks: {
                        beginAtZero: true
                      }
                    }
                  ]
                }
              }
            });
          </script>

          <div>
            <h3>회원 선호 가격</h3>
            <div class="pieChart">
              <canvas id="pieChart"></canvas>
            </div>
          </div>
          <script type="text/javascript">
            var context = document.getElementById('pieChart').getContext('2d');
  
            var myChart = new Chart(context, {
	              type: 'pie',
	              data: { 
	                labels: wishPrice,
	                datasets: [{ 
	                  data: wishPriceCount,
	                  backgroundColor: [
	                    'rgba(255, 99, 132, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(255, 206, 86, 0.2)',
	                    'rgba(75, 192, 192, 0.2)',
	                    'rgba(153, 102, 255, 0.2)'
	                  ],
	                  borderColor: [
	                    'rgba(255, 99, 132, 1)',
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(255, 206, 86, 1)',
	                    'rgba(75, 192, 192, 1)',
	                    'rgba(153, 102, 255, 1)'
	                  ],
	                  borderWidth: 1 
	                }]
	              },
	              options: {
	                Plugins: {
	                  title: {
	                    display: true,
	                    text: 'Pie Chart Example'
	                  },
	                  legend: {
	                    display: true,
	                    position: 'right'
	                  }
	                }
	              }
	            });
          </script>
        </div>
        
        <div class="reser-list">
        <c:if test="${not empty revList }">
          <h3>방문 신청 예약리스트</h3>
          <div class="list-wrap">
            <ul>
                  <li>담당자</li>
                  <li>회원 아이디</li>
                  <li>날짜</li>
                  <li>시간</li>
                  <li>지점</li>
                  <li>차량종류</li>
            </ul>
            <c:forEach items="${revList}" var="rev">
                <ul>
                    <li>${rev.staff_id}</li>
                    <li>${rev.user_id}</li>
                    <li>${rev.rev_date}</li> 
                    <li>${rev.rev_time}</li>         
                    <li>${rev.goodsVO.car_zone}</li> 
                    <li>${rev.goodsVO.car_type}</li> 
                </ul>
            </c:forEach>
          </div>
          </c:if>
          
          <c:if test="${empty revList }">
              <h3>방문 신청 예약리스트</h3>
              <div class="no-info-wrap">
                <ul ><li>등록된 예약 내역이 없습니다.</li></ul>
              </div>
            </c:if>
        </div>
      </div>
    </div>
  </section>

</body>
</html>
</body>
</html>