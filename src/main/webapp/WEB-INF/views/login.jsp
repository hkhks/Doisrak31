<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
	<style type="text/css">
	.overlay{background-color:rgba(0,0,0,0); height:550px; }
  	h2{color:black; font-size:40px; }
	h3{color:black; font-size:30px; }
	.heading{font-weight:bold; font-size:30px;}
		.heading2{font-weight:bold; font-size:25px;}
	.fs{font-size:20px;}
	.kj{font-weight:bold; color:#a5d610;}
	.wd{width:200px; height:180px;}
	.green{color:#9bc224;}
	.row3{background-color:#f9f9f9; color:black;}
	.row4{background-color:white; color:black;}
	.ht{height:550px;}
	::marker{display:none;}
	.homeLocation{float:left; width:300px;}
	.hBoardList_name_location{height:600px;}
	dt{font-size:20px;}
	#breadcrumb{line-height:200px; font-size: 30px;}
	.small{width:40px;height:40px; float:left;}
	.small2{width:220px; height:100px;float:left;}
	.n1,.n2,.n3{background-color:white;}
	#comments li:nth-child(even), #comments li {background-color:white;} 
	
	
	#sidebox { 
		background-color:#F0F0F0; 
		position:absolute; 
		width:175px; 
		top:540px; 
		left:20px;
		padding: 3px 10px }
	</style>  
	
	<script type="text/javascript">
	
	
	
	</script>

<body id="top">
  <!-- ##################  nav바 시작  ################### -->

<!-- ##################  nav바 끝 ################### -->
<!-- ##################  main 시작 ################### -->
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/common/main.jpg');">
  <div class="overlay">
    <section id="pageintro" class="clear"> 
      
      <div class="center btmspace-80">
        <h2 class="heading xxl uppercase btmspace-30"></h2>
        <p class="xl nospace capitalise"><br/><br/><br/><br/><br/><br/><br/>
     <h3>dosirak31과 함께라면 <span class="green">건강한 삶</span>은 현실이 된다.</h3></p>
      </div>
    </section>
  </div>
</div>




<div class="wrapper row3">
  <main class="container clear">
    <!-- main body -->
    
    <div class="group">
      <div class="one_third first"><img class="ht" src="/resources/images/common/foodProduct.jpg" alt=""></div>
      <div class="two_third">
        <p class="heading btmspace-80">DOSIRAK31의<br/> 내맘대로 구성하는 건강도시락</p>
        <p class="btmspace-80 fs">저희 DOSIRAK31은 다음과 같은 <span class="kj">3가지 약속</span>을 지키겠습니다. </p>
        <ul class="nospace group">
          <li class="one_third first ">
            <h6 class="nospace btmspace-10"><a>1.DOSIRAK31 농장</a></h6>
            <p class="nospace">직접 운영하는 농장에서 키운 재료들로 최상의 맛과 품질을 유지하고 있습니다.</p>
            <img class="wd homeLocation" src="/resources/images/common/nongJang.jpg"/>
          </li>
          <li class="one_third ">
            <h6 class="nospace btmspace-10"><a>2.신선한 재료들</a></h6>
            <p class="nospace">DOSIRAK31에서 판매하는 모든 야채와 과일, 원재료들은 모두 유기농으로 키웁니다.</p>
             <img class="wd homeLocation" src="/resources/images/common/organic.jpg"/>
          </li>
          <li class="one_third last ">
            <h6 class="nospace btmspace-10"><a>3.새벽 배송</a></h6>
            <p class="nospace">신선함을 유지한 도시락을 받아 보실 수 있도록 당일 새벽 배송으로 보내드립니다.</p>
             <img class="wd homeLocation" src="/resources/images/common/delivery.jpg"/>
          </li>
          <hr/>
        </ul>
      </div>
    
    </div>
    
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<div class="wrapper row4" style="padding-bottom:20px;">
  <section id="info" class="clear"> 
    
  
   <div id="comments"> 
   <div style="vertical-align:middle;">
    <img  class="small " src="/resources/images/common/deliveryIcon.JPG"/><p class="heading2 btmspace-80" style="vertical-align:middle;">DOSIRAK31 직배송 안내</p>
	</div>
	<img  src="/resources/images/common/delivery_visual.jpg"/>
   	<ul class="list">
			<li class="n1 ">
				<dl>
				<br/>
				<img  class="small2 " src="/resources/images/common/deliveryImage1.JPG"/>
					<dt>새벽 출입 여부와 카드키, 비밀번호</dt>
					<dd>
						배송출입 제한시에는 반드시 새벽 내 출입가능 여부를 확인 부탁 드립니다. <br>
						카드키와 공동현관 비밀번호의 경우 미리 공유 부탁드립니다.
					</dd>
				</dl>
			</li>
			<hr/>
			<li class="n2 ">
				<dl>
				<img  class="small2 homeLocation" src="/resources/images/common/deliveryImage2.JPG"/>
					<dt>아이스 가방. 팩</dt>
					<dd>
						아이스가방과 팩은 회수 이후 깨끗하게 소독하여 사용되는 제품입니다.<br>
						청결한 위생을 위하여 아이스 팩 외 기타 쓰레기는 넣지 말아 주세요.
					</dd>
				</dl>
			</li>
				<hr/>
			<li class="n3 ">
				<dl>
				<img  class="small2 homeLocation" src="/resources/images/common/deliveryImage3.JPG"/>
					<dt>영업일 기준 3일전 일시중지</dt>
					<dd>
						고객님께서 미수령한 식단은 다음 배송 시 100% 수거를 진행하는 부분으로 간주하여 수거됩니다. <br>
						추가 처리가 어려우니 영업일 기준 3일전에 일시중지 부탁 드립니다.
					</dd>
				</dl>
			</li>
		</ul>
	</div>
	<div>
		<div >
		<img  class="small" src="/resources/images/common/deliveryIcon.JPG"/><p class="heading2 btmspace-80">DOSIRAK31 배송과정</p>
		</div>
		<div >
			<div >
				<ul style="list-style:none;">
					<li><img class="homeLocation" src="https://www.homeal.net/_skin/homeal_220722/img/etc/guide_dlv_process_1.png" alt="제품 제조"></li>
					<li><img class="homeLocation" src="https://www.homeal.net/_skin/homeal_220722/img/etc/guide_dlv_process_2.png" alt="제품 소분"></li>
					<li><img class="homeLocation" src="https://www.homeal.net/_skin/homeal_220722/img/etc/guide_dlv_process_3.png" alt="제품 포장"></li>
					<li><img class="homeLocation" src="https://www.homeal.net/_skin/homeal_220722/img/etc/guide_dlv_process_4.png" alt="제품 출고"></li>
					<li><img class="homeLocation" src="https://www.homeal.net/_skin/homeal_220722/img/etc/guide_dlv_process_5.png" alt="고객 배송"></li>
					<li><img class="homeLocation" src="https://www.homeal.net/_skin/homeal_220722/img/etc/guide_dlv_process_6.png" alt="배송 완료"></li>
				</ul>
			</div>
		</div>
	</div>
     </div> 
    
    <div class="clear"></div>
  </section>
</div>
<!-- ##################  main 끝 ################### -->

<!-- 하단 -->

<!-- 하단 끝 -->

<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 

</body>
</html>