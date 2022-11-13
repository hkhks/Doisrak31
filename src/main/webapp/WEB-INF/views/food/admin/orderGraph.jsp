<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 	<style type="text/css">
	.orderGraphLeft{padding-right: 100px}
	</style>
	 <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<!-- 부트스트랩 -->
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
    integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
	<script type="text/javascript">
	

	</script>
	
</head>
	<body>
	<div class="wrapper row3 orderGraphLeft">
	<%Date now = new Date();%>
	<% SimpleDateFormat sf= new SimpleDateFormat("yyyy년MM월dd일 E요일 a hh:mm:ss");
	String today = sf.format(now);
	%>
	<h2><%=today %>기준</h2><br>
  	<h2>오늘 매출: ${orderMonth.today }원</h2>

    <div class="container">
     	 <input type="hidden" id="beforeMonday" value="${orderBeforeWeek.monday }"/> 
     	 <input type="hidden" id="beforeTuesday" value="${orderBeforeWeek.tuesday }"/> 
     	 <input type="hidden" id="beforeWednesday" value="${orderBeforeWeek.wednesday }"/> 
     	 <input type="hidden" id="beforeThursday" value="${orderBeforeWeek.thursday }"/> 
     	 <input type="hidden" id="beforeFriday" value="${orderBeforeWeek.friday }"/> 
     	 <input type="hidden" id="beforeSaturday" value="${orderBeforeWeek.saturday }"/> 
     	 <input type="hidden" id="beforeSunday" value="${orderBeforeWeek.sunday }"/> 
     	 <input type="hidden" id="afterMonday" value="${orderCurrentWeek.monday }"/> 
     	 <input type="hidden" id="afterTuesday" value="${orderCurrentWeek.tuesday }"/> 
     	 <input type="hidden" id="afterWednesday" value="${orderCurrentWeek.wednesday }"/> 
     	 <input type="hidden" id="afterThursday" value="${orderCurrentWeek.thursday }"/> 
     	 <input type="hidden" id="afterFriday" value="${orderCurrentWeek.friday }"/> 
     	 <input type="hidden" id="afterSaturday" value="${orderCurrentWeek.saturday }"/> 
     	 <input type="hidden" id="afterSunday" value="${orderCurrentWeek.sunday }"/> 
     	 <input type="hidden" id="beforeMonth" value="${orderMonth.beforeMonth }"/> 
     	 <input type="hidden" id="currentMonth" value="${orderMonth.currentMonth }"/> 
     	 
     	 
     	 
    <canvas id="chart2" width="600" height="350" style="display: block; width: 400px; height: 200px; padding-right:200px; margin-bottom: 80px;" class="chartjs-render-monitor"></canvas> 	 
    <canvas id="chart" width="600" height="350" style="display: block; width: 400px; height: 200px; padding-right:200px; margin-bottom: 80px;" class="chartjs-render-monitor"></canvas>
    <canvas id="myChart" style="display: block; width: 400px; height: 200px; padding-right:200px; margin-bottom: 80px;" class="chartjs-render-monitor"></canvas>
  	
  	</div>

  
  <!-- 차트 -->
  <script>
    let ctx = document.getElementById('chart');
    let b_m=document.getElementById('beforeMonday').value;
    let b_tu=document.getElementById('beforeTuesday').value;
    let b_w=document.getElementById('beforeWednesday').value;
    let b_th=document.getElementById('beforeThursday').value;
    let b_f=document.getElementById('beforeFriday').value;
    let b_sa=document.getElementById('beforeSaturday').value;
    let b_su=document.getElementById('beforeSunday').value;
    let myChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['월', '화', '수', '목', '금', '토','일'],
        datasets: [{
         label: '매출 단위(원)',
          data: [b_m, b_tu, b_w, b_th, b_f, b_sa,b_su],
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 99, 132, 0.2)'
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)',
            'rgba(255, 99, 132, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        },
        title:{
        	display:true,
        	text:'지난주 요일별 매출'
        }
      }
    });
    
    
    
    
    let ctx2 = document.getElementById('chart2');
    let a_m=document.getElementById('afterMonday').value;
    let a_tu=document.getElementById('afterTuesday').value;
    let a_w=document.getElementById('afterWednesday').value;
    let a_th=document.getElementById('afterThursday').value;
    let a_f=document.getElementById('afterFriday').value;
    let a_sa=document.getElementById('afterSaturday').value;
    let a_su=document.getElementById('afterSunday').value;
    let myChart2 = new Chart(ctx2, {
      type: 'bar',
      data: {
        labels: ['월', '화', '수', '목', '금', '토','일'],
        datasets: [{
         label: '매출 단위(원)',
          data: [a_m, a_tu, a_w, a_th, a_f, a_sa,a_su],
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 99, 132, 0.2)'
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)',
            'rgba(153, 102, 255, 1)',
            'rgba(255, 159, 64, 1)',
            'rgba(255, 99, 132, 1)'
          ],
          borderWidth: 1
        }]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            }
          }]
        },
        title:{
        	display:true,
        	text:'이번주 요일별 매출'
        }
      }
    });
    
    let ctx3 = document.getElementById('myChart').getContext('2d');
    let beforeMonth=document.getElementById('beforeMonth').value;
    let currentMonth=document.getElementById('currentMonth').value;
    let chart3 = new Chart(ctx3, {
      // 챠트 종류를 선택
      type: 'line',

      // 챠트를 그릴 데이타
      data: {
        labels: ['지난달', '이번달'],
        datasets: [{
          label: '월별 매출(원)',
          backgroundColor: 'transparent',
          borderColor: 'red',
          data: [beforeMonth,currentMonth]
        }]
      },
      // 옵션
      options: {}
    });

  </script>
  <!-- ################################################################################################ --> 
    <!-- / main body -->
    <div class="clear"></div>
  
	</div>
		
	</body>
</html>