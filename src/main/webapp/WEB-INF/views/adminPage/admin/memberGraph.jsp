<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 	<style type="text/css">
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
	
	
</head>
	<body>
	<div class="wrapper row3">
	
    <div class="container">
    
	<h2>${today} 기준</h2><br>
	
  	<b>오늘 가입 회원 수: ${countMember.today}명</b><br/>
    
     	 <input type="hidden" id="man" value="${genderGraph.man }"/> 
     	 <input type="hidden" id="woman" value="${genderGraph.woman}"/> 
     	 <input type="hidden" id="lowerTwenty" value="${ageGraph.lowerTwenty }"/> 
     	 <input type="hidden" id="twenty" value="${ageGraph.twenty }"/> 
     	 <input type="hidden" id="thirdy" value="${ageGraph.thirdy }"/> 
     	 <input type="hidden" id="fourty" value="${ageGraph.fourty }"/> 
     	 <input type="hidden" id="fifty" value="${ageGraph.fifty }"/> 
     	 <input type="hidden" id="sixty" value="${ageGraph.sixty }"/> 
     	 <input type="hidden" id="seventy" value="${ageGraph.seventy}"/> 
     	 
     	 
   
        <div class="col" style="margin-top:50px;margin-bottom:25px;">
           <b style="font-size: 20px;">회원 성별 비율</b>
        </div>
       
		<div class="row py-2">
            <div class="col-md-4 py-1">
                <div class="card">
                    <div class="card-body">
                        <canvas id="chDonut1" style="display: block; width: 400px; height: 250px;"></canvas>
                    </div>
                </div>
            </div>
		</div>
		
		<div class="col" style="margin-top:90px;">
           <b style="font-size: 20px;">나이대별 회원수</b>
        </div>
  		<canvas id="chart" width="600" width="600" height="350" style="display: block; width: 400px; height: 200px; padding-right:200px;"  class="chartjs-render-monitor"></canvas>
   		
   		</div>
  <!-- 차트 -->
  <script>
  // chart colors
   let woman = document.getElementById('woman').value;
   let man = document.getElementById('man').value;
   let colors = ['red','skyblue','yellowgreen','#c3e6cb','#dc3545','#6c757d'];

  /* 3 donut charts */
  let donutOptions = {
    cutoutPercentage: 30, //도넛두께 : 값이 클수록 얇아짐
    legend: {position:'bottom', padding:5, labels: {pointStyle:'circle', usePointStyle:true}}
  };

  // donut 1
  var chDonutData1 = {
      labels: ['여자', '남자'],
      datasets: [
        {
          backgroundColor: colors.slice(0,3),
          borderWidth: 0,
          data: [woman,man]
        }
      ]
  };

  var chDonut1 = document.getElementById("chDonut1");
    if (chDonut1) {
      new Chart(chDonut1, {
        type: 'pie',
        data: chDonutData1,
        options: donutOptions
    });
  }
    
    
    let ctx2 = document.getElementById('chart');
    let lw=document.getElementById('lowerTwenty').value;
    let tw=document.getElementById('twenty').value;
    let th=document.getElementById('thirdy').value;
    let fo=document.getElementById('fourty').value;
    let fi=document.getElementById('fifty').value;
    let si=document.getElementById('sixty').value;
    let se=document.getElementById('seventy').value;
    let myChart2 = new Chart(ctx2, {
      type: 'bar',
      data: {
        labels: ['20세미만', '20대', '30대', '40대', '50대', '60대','70세이상'],
        datasets: [{
         label: '나이대 별 회원수(명)',
          data: [lw,tw,th,fo,fi,si,se],
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
        }
      }
    });
     
 
  </script>

    
    
 
  <!-- ################################################################################################ --> 
    <!-- / main body -->
    <div class="clear"></div>
  
	</div>
		
	</body>
</html>