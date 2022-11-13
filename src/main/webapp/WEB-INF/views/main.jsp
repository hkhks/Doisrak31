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
	li img{float:left; width:300px;}
	.hBoardList_name_location{height:600px;}
	dt{font-size:20px;}
	#breadcrumb{line-height:200px; font-size: 30px;}
	.small{width:40px;height:40px; float:left;}
	.small2{width:220px; height:100px;float:left;}
	.n1,.n2,.n3{background-color:white;}
	#comments li:nth-child(even), #comments li {background-color:white;}
	
	button {
  border: 0;
  background: none;
  cursor:pointer;
}

.main_popup {
  position: fixed;
  z-index: 1005;
  -webkit-box-shadow: 0px 13px 40px -6px #061626;
  box-shadow: 0px 13px 40px -6px #061626;
  top: 50px;
  right: 100px;
  display: none;
  }

  .on {
    display: block;
    background-color: #fff;
  }

  .img_wrap {
    width: 300px;
    height: 400px;
    display:flex;
    justify-content:center;
    align-items:center;
  }
	.btn_close{
		float: right;
	}

  
	</style>
	
	<script type="text/javascript">
	
		$(function(){
			pageLoad();
			toggleMainPopup();
		});
	
		
		function pageLoad(){
			
			notShowPop = getCookieValue();
			
			if(notShowPop != "true"){ //true = 하루동안 유지되는 쿠키 있음, false= 하루동안 유지되는 쿠키 없음, false일때 팝업창을 띄운다
				
				window.open("/common/popUp","pop","width=400,height=500,history=no,resizeable=no,status=no,scrollbars=yes,menubar=no");
				//scrollbars(스크롤바),resizeable(사이즈 변경)을 지정하지 않으면 호출하는 url화면이 지정한 팝업사이즈보다 클 경우 상하 및 좌우스크롤이 자동으로 생성된다. 
				
			}
			
		}
		
		//쿠키 읽어오는 함수
		function getCookieValue(){
			
			let result = "false";
			
			//쿠키 여부 확인
			if(document.cookie != ""){ //쿠키값이 공백이 아닐 때 -> 쿠키에 값이 저장되어있음, 즉 하루동안 유지되는 쿠키 존재 
				
					cookie = document.cookie.split(";");
				
					for(let i = 0; i<cookie.length; i++){
					
						element = cookie[i].split("=");
					
						value = element[0];
					
						value = value.replace(/^\s*/,'');
					
						if(value == "notShowPop"){
							
							result = element[1]; // 쿠키값이 존재한다면, true가 반환됨
							
						}
					}
				
				return result;
			}
					
		}
		
		function deleteCookie(){
			document.cookie = "notShowPop="+"false"+";path=/; expires=-1";
			
		}
		
		function toggleMainPopup(){
			  
			  /* 쿠키 제어 함수 정의 */
			  let handleCookie = {
			    
				//쿠키 생성 -> 객체에서의 메소드 정의
			    	setCookie: function (name, val, exp) { 
			    		
			      		let date = new Date();
			      		date.setTime(date.getTime() + exp * 24 * 60 * 60 * 1000); //쿠키 만료 시간 설정
			     
			   
			      		document.cookie = name + "=" + val + ";expires=" + date.toUTCString() + ";";
			    	},
			    
			    //쿠키 읽기 -> 객체에서의 메소드 정의
			    	getCookie: function (name) { 
			    		
			      		var value = document.cookie.match("(^|;) ?" + name + "=([^;]*)(;|$)");
			      		
			      		return value ? value[2] : null;
			      		
			    	}
			    
			  };
			  
			  
			  if (handleCookie.getCookie("today") == "y") { // 쿠키가 존재하면 팝업창을 띄우지 않음 
				  
			    $(".main_popup").removeClass("on"); //display: block; 속성을 제거
			    
			  } else { // 쿠키가 존재하지 않으면 
				  
			    $(".main_popup").addClass("on"); // display: block; 속성을 붙여 팝업창을 보여줌
			    
			  }

			  
			  // 오늘하루 보지 않기 버튼
			  $(".main_popup").on("click", ".btn_today_close", function () {
				  
			    handleCookie.setCookie("today", "y", 1);// 유효기간이 하루인 쿠키를 생성 후, 
			    
			    $(this).parents(".main_popup.on").removeClass("on"); // display:block; 속성 제거하여 display:none으로 바꿔줌
			    
			  });

			  
			  // 일반 닫기 버튼
			  $(".main_popup").on("click", ".btn_close", function () {
				  
			    $(this).parents(".main_popup.on").removeClass("on"); // 그냥 닫기 버튼을 클릭시 display:block; 속성 제거하여 display:none으로 바꿔줌
			    
			  });
			  
			}
		
		
	
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
    
    <div class="main_popup">
     	<!-- 그냥 닫기 --->
      	<button class="btn_close" ><span>ⓧ</span>close</button>	
  		<div class="layer_cont">
   		 	<div class="img_wrap">
     		 	<img src="/resources/images/common/welcome.png"/>
    		</div>
    	<div class="btn_wrap">
      		<!-- 오늘 하루 보지 않기 --->
      		<input type="checkbox" class="btn_today_close" style="display:inline-block; margin-bottom: 6px; margin-left: 5px; margin-right:2px;">오늘 더 이상 팝업창 띄우지 않기
    	</div>
  </div>
</div>
    
    
    
    <div class="group">
      <div class="one_third first"><img class="ht" src="/resources/images/common/foodProduct.jpg" alt=""></div>
      <div class="two_third">
        <p class="heading btmspace-80">DOSIRAK31의<br/> 내맘대로 구성하는 건강도시락</p>
        <p class="btmspace-80 fs">저희 DOSIRAK31은 다음과 같은 <span class="kj">3가지 약속</span>을 지키겠습니다. </p>
        <ul class="nospace group">
          <li class="one_third first">
            <h6 class="nospace btmspace-10"><a>1.DOSIRAK31 농장</a></h6>
            <p class="nospace">직접 운영하는 농장에서 키운 재료들로 최상의 맛과 품질을 유지하고 있습니다.</p>
            <img class="wd" src="/resources/images/common/nongJang.jpg"/>
          </li>
          <li class="one_third">
            <h6 class="nospace btmspace-10"><a>2.신선한 재료들</a></h6>
            <p class="nospace">DOSIRAK31에서 판매하는 모든 야채와 과일, 원재료들은 모두 유기농으로 키웁니다.</p>
             <img class="wd" src="/resources/images/common/organic.jpg"/>
          </li>
          <li class="one_third last">
            <h6 class="nospace btmspace-10"><a>3.새벽 배송</a></h6>
            <p class="nospace">신선함을 유지한 도시락을 받아 보실 수 있도록 당일 새벽 배송으로 보내드립니다.</p>
             <img class="wd" src="/resources/images/common/delivery.jpg"/>
          </li>
          <hr/>
        </ul>
      </div>
    
    </div>
    
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<div class="wrapper row4">
  <section id="info" class="clear"> 
    
  
   <div id="comments"> 
   <div style="vertical-align:middle;">
    <img  class="small" src="/resources/images/common/deliveryIcon.JPG"/><p class="heading2 btmspace-80" style="vertical-align:middle;">DOSIRAK31 직배송 안내</p>
	</div>
	<img src="/resources/images/common/delivery_visual.jpg"/>
   	<ul class="list">
			<li class="n1">
				<dl>
				<br/>
				<img  class="small2" src="/resources/images/common/deliveryImage1.JPG"/>
					<dt>새벽 출입 여부와 카드키, 비밀번호</dt>
					<dd>
						배송출입 제한시에는 반드시 새벽 내 출입가능 여부를 확인 부탁 드립니다. <br>
						카드키와 공동현관 비밀번호의 경우 미리 공유 부탁드립니다.
					</dd>
				</dl>
			</li>
			<hr/>
			<li class="n2">
				<dl>
				<img  class="small2" src="/resources/images/common/deliveryImage2.JPG"/>
					<dt>아이스 가방. 팩</dt>
					<dd>
						아이스가방과 팩은 회수 이후 깨끗하게 소독하여 사용되는 제품입니다.<br>
						청결한 위생을 위하여 아이스 팩 외 기타 쓰레기는 넣지 말아 주세요.
					</dd>
				</dl>
			</li>
				<hr/>
			<li class="n3">
				<dl>
				<img  class="small2" src="/resources/images/common/deliveryImage3.JPG"/>
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
					<li><img src="https://www.homeal.net/_skin/homeal_220722/img/etc/guide_dlv_process_1.png" alt="제품 제조"></li>
					<li><img src="https://www.homeal.net/_skin/homeal_220722/img/etc/guide_dlv_process_2.png" alt="제품 소분"></li>
					<li><img src="https://www.homeal.net/_skin/homeal_220722/img/etc/guide_dlv_process_3.png" alt="제품 포장"></li>
					<li><img src="https://www.homeal.net/_skin/homeal_220722/img/etc/guide_dlv_process_4.png" alt="제품 출고"></li>
					<li><img src="https://www.homeal.net/_skin/homeal_220722/img/etc/guide_dlv_process_5.png" alt="고객 배송"></li>
					<li><img src="https://www.homeal.net/_skin/homeal_220722/img/etc/guide_dlv_process_6.png" alt="배송 완료"></li>
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