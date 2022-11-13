<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
	<style type="text/css">
	.row3{background-color:#f9f9f9;}
	.row4{background-color:white;}
	/*기초대사량 계산*/
	#age,#height,#weight{width:300px; height:70px; display:block; font-size:18px; margin:0 auto;}
	.span1{font-size:20px; color:black;}
	.color{color:blue;}
	input[name='gender']{width:30px;height:30px;font-size:20pt}
	.fdImg{display:none;}
	.black{color:black;}
	#totalprice{color:black;}
	/*radio button */
	 .test_obj input[type="radio"] {
        display: none;
        
    }
 
    .test_obj input[type="radio"] + span {
        display: inline-block;
        float:left;
        padding: 15px 10px;
        border: 1px solid #dfdfdf;
        background-color: #ffffff;
        color:black;
        text-align: center;
        cursor: pointer;
        width:250px;
        height:50px;
    }
 
    .test_obj input[type="radio"]:checked + span {
        background-color: #113a6b;
        color: #ffffff;
    }
	
	/* 검섹버튼 위치 */
	.searchBtn{
	text-align: right;
    margin-right: 100px;
	}
	#comments input{width:80%;}
	#centerda{margin:0 auto; text-align:center;}
	
	/*tab 만드는 css*/
	ul.tabs{
		margin: 0px;
		padding: 0px;
		list-style: none;
	}
	ul.tabs li{
		background: none;
		color: #222;
		display: inline-block;
		padding: 10px 15px;
		cursor: pointer;
		font-weight:bold;
	}
	
	ul.tabs li.current{
		background:ghostwhite;
		
		color: #222;
		font-weight:bold;
	}
	 
	input[type="submit"], #comments input[type="reset"] {
    color: inherit;
    background-color: ghostwhite;
}
tr:nth-child(even), #comments li:nth-child(even) {
    color: inherit;
    background-color: ghostwhite;
}
	/*탭 안 내용*/
	.tab-content{
		display: none;
		background:ghostwhite; /*변경*/
		background-repeat:no-repeat;
		padding: 50px;
		text-align:center;
		width:980px;
		height:400px;
		overflow:auto;
	}
	
	.tab-content.current{
		display: inherit;
		padding: 50px;
		text-align:center;
	}
	td{color:black;}
	#comments div {
    color: black;
}
	/*탭 안 음식관련 ul 가로 정렬 */
	.clear{clear:none;}
	.clear, ul.nospace.clear.fd::after, .group {clear:none;}/*여긴보류*/
	#comments ul{margin:0px;}
	.white{color:black; font-size:20px;}/*변경*/
	.wd{width:300px; height:230px; box-shadow:0 4px 8px 0 rgba(0,0,0,0.3), 0 6px 20px 0 rgba(0,0,0,0.15);}
	/*이미지 정렬 및 탭안 li 가로정렬*/
	.img-thumbnail{width:200px; height:150px;}
	#comments li{margin:10px 10px;}
	.li_control{width:190px; height:300px; background-color:ghostwhite;/*변경*/
	 box-shadow:0 4px 8px 0 rgba(0,0,0,0.3), 0 6px 20px 0 rgba(0,0,0,0.15);}
	.one_half, .one_third, .two_third, .one_quarter, .two_quarter, .three_quarter{float:left;}
	#foodMenu{display:none;}
	/*폰트색*/
	#tab-1{color:black;}
	#total_price{color:orage; font-weight:bold;}
	#sallad{width:300px; height:200px;}
	
	/*테이블 설정*/
	#addFood{display:none;}
	#nutritionResult{border:1px solid gray;}
	th.text-center{background:ghostwhite; color:black;}
	.text-right {
    text-align: -webkit-right;
    }
    #totalPrice{font-size:16px;}
	/*수량크기 조절*/
		#comments input[type='number']{display:inline; width:7%; height:50%;}
	/*맨위사진*/
		.overlay{
	   height:280px;
	    background-color:rgba(0,0,0,0);
	    }
	    
	 /*동그라미*/
	 .circle{
	 	width:200px;
	 	height:200px;
	 	border-radius:50%;
	 	font-size:20px;
	 	color:black;
	 	text-align:center;
	 	line-height:70px;
	 	display:inline-block;
	 	float:left;
	 	margin:5px;
	 	
	 }
	 
	 #comment,#danResult{background-color: #a5d610;}
	 #tanResult,#jiResult{border:1px solid #a5d610;}
	 .hwasal{width:150px;height:200px;}
	 .center{text-align:center;}
	
	</style>
	<script type="text/javascript">
	<!--===================도시락 메뉴 탭 기능 =========================== -->
		$(document).ready(function(){
			$("#popup1").hide();
			$(".tabs li").click(function(){
				let tab_id = $(this).attr("data-tab");
	
				$(".tabs li").removeClass("current");
				$(".tab-content").removeClass("current");
	
				$(this).addClass("current");
				$("#"+tab_id).addClass("current");
			});
		});
		<!--===================도시락 메뉴 탭 기능 끝=========================== -->
		<!--===================기초대사량 계산 시작 =========================== -->
		$(function(){
			
			//장바구니화면
			let bag="${bag}";
			console.log(bag);
			if(bag!=""){
				 if (confirm('장바구니에 담겼습니다. 이동하시겠습니까?')) {
					location="/food/bagList";
					
	              } 
			}

	       
			$("#submitBtn").click(function(){
				if($("input[name='gender']:radio:checked").length<1){
					alert("성별을 선택하세요");
					return;
				}
				else if(!chkData("#height","키를")) return;
				else if(!chkData("#weight","몸무게를")) return;
				else if(!chkData("#age","나이를")) return;
				else{
					let gender=$("input[name='gender']").val();
					let height=parseInt($("#height").val());
					let weight=parseInt($("#weight").val());
					let age=parseInt($("#age").val());
					let bmr;
					
					if(gender=='man'){
						bmr=66+(13.8*weight)+(5*height)-(6.8*age);
					}else if(gender=="woman"){
						bmr=655+(9.6*weight)+(1.8*height)-(4.7*age);
					}
					bmr=bmr.toFixed(1);
					let tanResult=(bmr*0.5/4).toFixed(1);
					let danResult=(bmr*0.3/4).toFixed(1);
					let jiResult=(bmr*0.2/9).toFixed(1);
					$("#comment").append(" <br/> "+bmr+"kcal");
					$("#tanResult").append("  <br/>"+tanResult+"g");
					$("#danResult").append("  <br/>"+danResult+"g");
					$("#jiResult").append("  <br/>"+jiResult+"g");
					
				}
			})
			/*숫자만 입력되도록하는 함수*/
			$('input[onlyNumber]').on('keyup',function(){
				$(this).val($(this).val().replace(/[^0-9]/g,""));
			});
			<!--===================기초대사량 계산 끝=========================== -->
			<!--=========메뉴카테고리 탭 		선택시 그에 맞는 메뉴 출력====================-->
			for(let i=1; i<=5; i++){
				$("#menu"+i).click(function(){
					$(".fd").detach();
					let food_category=$(this).attr("data-value");
					let url="/food/all/"+food_category;
					/*ajax불러오기*/
					$.getJSON(url,function(data){
						$(data).each(function(){
							let food_no=this.food_no;
							let food_name=this.food_name;
							let food_img=this.food_img;
							let food_price=this.food_price;
							let food_kcal=this.food_kcal;
							let food_volume=this.food_volume;
							/*ajax불러온것 화면 구성*/
							let $div=$("#tab-"+(i+1));
							let $ul =$("#foodMenu").clone().removeAttr("id");
							$ul.find(".addBtn").attr("data-num",food_no);
							$ul.addClass("fd");
							$ul.find(".img-thumbnail").attr("src","/dosirak31img/food/"+food_img);
							$ul.find(".img-thumbnail").attr("data-name",food_img);
							$ul.find(".menuList").html(food_name+food_volume+"g<br/>"+food_kcal+"kcal<br/>"+food_price+"원");
							$div.append($ul);
							
						})
					}).fail(function(){
						alert("음식목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해주세요.");
					})
				})
				
				
			}
			<!--=========메뉴카테고리 탭 선택시 그에 맞는 메뉴 출력 끝====================-->
			<!--=========음식 클릭했을 때 영양정보 출력 시작====================-->
				let i=1;
				<!--음식을 클릭했을 때 그의 따른 영양정보와 가격을 추가하려고함 ajax로 구현함-->
				$(document).on("click",".addBtn",function(){
					
					if(i>5){
						alert("5개까지만 추가가능합니다.");
						return;
					}
					let food_no=$(this).attr("data-num");
					console.log(food_no);
					let url="/food/all2/"+food_no;
					/*ajax불러오기*/
					$.getJSON(url,function(data){
						$(data).each(function(){
							let food_no=this.food_no;
							let food_category=this.food_category;
							let food_name=this.food_name;
							let food_volume=this.food_volume;
							let food_price=this.food_price;
							let food_calb=this.food_calb;
							let food_protein=this.food_protein;
							let food_fat=this.food_fat;
							let food_kcal=this.food_kcal;
							let food_img=this.food_img;
							
							/*ajax불러온것 화면 구성*/
								
							let $tbody=$("#addMenu");
							let $tr=$("#addFood").clone().removeAttr("id");
							$tr.addClass(".plus")
							$tr.attr("data-num",food_no);
							$tr.find(".category").html(food_category);
							$tr.find(".name").html(food_name);
							$tr.find(".g").html(food_volume);
							$tr.find(".kcal").html(food_kcal);
							$tr.find(".tan").html(food_calb);
							$tr.find(".dan").html(food_protein);
							$tr.find(".ji").html(food_fat);
							$tr.find(".price").html(food_price);
							$tr.find(".fdImg").html(food_img);
							$tr.find(".delete").html("<input type='button' value='삭제' class='foodDelete dosirakBtn'/>");
							i++;
							$tbody.append($tr);
						
							/*테이블 안 계산*/
							let gplus=isNaN(parseInt($(".gplus").html()))?0:parseInt($(".gplus").html());
							let kcalplus=isNaN(parseFloat($(".kcalplus").html()))?0:parseFloat($(".kcalplus").html());
							let tanplus=isNaN(parseFloat($(".tanplus").html()))?0:parseFloat($(".tanplus").html());
							let danplus=isNaN(parseFloat($(".danplus").html()))?0:parseFloat($(".danplus").html());
							let jiplus=isNaN(parseFloat($(".jiplus").html()))?0:parseFloat($(".jiplus").html());
							let priceplus=isNaN(parseInt($(".priceplus").html()))?0:parseInt($(".priceplus").html());
							
							
							
							$(".gplus").html(gplus+food_volume+"g");
							$(".kcalplus").html((kcalplus+food_kcal).toFixed(1)+"kcal");
							$(".tanplus").html((tanplus+food_calb).toFixed(1)+"g");
							$(".danplus").html((danplus+food_protein).toFixed(1)+"g");
							$(".jiplus").html((jiplus+food_fat).toFixed(1)+"g");
							$(".priceplus").html(priceplus+food_price+"원");
							
						})
					}).fail(function(){
						alert("음식목록을 추가하는데 실패하였습니다. 잠시후에 다시 시도해주세요.");
					})
				})
				/*삭제버튼 눌렀을 때
				음식에서 삭제 버튼 누르면 사라지도록 함
				계산에서도 빠져야함*/
				
				$(document).on("click",".foodDelete",function(){
					let gplus=isNaN(parseInt($(".gplus").html()))?0:parseInt($(".gplus").html());
					let kcalplus=isNaN(parseFloat($(".kcalplus").html()))?0:parseFloat($(".kcalplus").html());
					let tanplus=isNaN(parseFloat($(".tanplus").html()))?0:parseFloat($(".tanplus").html());
					let danplus=isNaN(parseFloat($(".danplus").html()))?0:parseFloat($(".danplus").html());
					let jiplus=isNaN(parseFloat($(".jiplus").html()))?0:parseFloat($(".jiplus").html());
					let priceplus=isNaN(parseInt($(".priceplus").html()))?0:parseInt($(".priceplus").html());
					

					let gminus=parseInt($(this).parents("tr").children(".g").html());
					let kcalminus=parseFloat($(this).parents("tr").children(".kcal").html());
					let tanminus=parseFloat($(this).parents("tr").children(".tan").html());
					let danminus=parseFloat($(this).parents("tr").children(".dan").html());
					let jiminus=parseFloat($(this).parents("tr").children(".ji").html());
					let priceminus=parseFloat($(this).parents("tr").children(".price").html());
					
					$(".gplus").html(gplus-gminus+"g");
					$(".kcalplus").html((kcalplus-kcalminus).toFixed(1)+"kcal");
					$(".tanplus").html((tanplus-tanminus).toFixed(1)+"g");
					$(".danplus").html((danplus-danminus).toFixed(1)+"g");
					$(".jiplus").html((jiplus-jiminus).toFixed(1)+"g");
					$(".priceplus").html(priceplus-priceminus+"원");
					
					$(this).parents("tr").remove();
					i--;
					
					if($("#tabl>tbody>tr").length<6){
						$("#totalprice").html("");
						return;
					}
					
				});
				
				/*장바구니 버튼을 눌렀을 때 */
				$(document).on("click","#bagBtn",function(){
					
					if($("#client_no").val()==""){
						let login=confirm("로그인하시겠습니까?");
						if(login){
							location.href="/client/loginmain";
						}
						
						//로그인화면으로 이동 location.href="로그인가기위한url"
					}else{
						if($("#tabl>tbody>tr").length<6){
							alert("도시락은 5가지의 메뉴를 골라주셔야 완성됩니다.");
							return;
						}
						let food_name1=$('#addMenu>tr:nth-child(2)>.name').html();
						let food_name2=$('#addMenu>tr:nth-child(3)>.name').html();
						let food_name3=$('#addMenu>tr:nth-child(4)>.name').html();
						let food_name4=$('#addMenu>tr:nth-child(5)>.name').html();
						let food_name5=$('#addMenu>tr:nth-child(6)>.name').html();
						let order_quantity=parseInt($("#amount").val());
						let price=parseInt($(".priceplus").html());
						let order_price=order_quantity*price;
						let food_img1=$("#addMenu>tr:nth-child(2)>.fdImg").html();
						let food_img2=$("#addMenu>tr:nth-child(3)>.fdImg").html();
						let food_img3=$("#addMenu>tr:nth-child(4)>.fdImg").html();
						let food_img4=$("#addMenu>tr:nth-child(5)>.fdImg").html();
						let food_img5=$("#addMenu>tr:nth-child(6)>.fdImg").html();
						$("#dosirak_name").val(food_name1+"/"+food_name2+"/"+food_name3+"/"+food_name4+"/"+food_name5);
						
						$("#food_img1").val(food_img1);
						$("#food_img2").val(food_img2);
						$("#food_img3").val(food_img3);
						$("#food_img4").val(food_img4);
						$("#food_img5").val(food_img5);
						
						$("#order_quantity").val(order_quantity);
						$("#order_price").val(order_price);
						
						$("#bagForm").attr({
							"method":"get",
							"action":"/food/bagInsert"
						})
						$("#bagForm").submit();
						
						
					}
					
				})
							
				/*주문버튼 눌렀을때*/
				$("#orderBtn").click(function(){
					if($("#client_no").val()==""){
						let login=confirm("로그인하시겠습니까?");
						if(login){
							location.href="/client/loginmain";
						}
						//로그인화면으로 이동 location.href="로그인가기위한url"
					}else{
						if($("#tabl>tbody>tr").length<6){
							alert("도시락은 5가지의 메뉴를 골라주셔야 완성됩니다.");
							return;
						}
						let food_name1=$('#addMenu>tr:nth-child(2)>.name').html();
						let food_name2=$('#addMenu>tr:nth-child(3)>.name').html();
						let food_name3=$('#addMenu>tr:nth-child(4)>.name').html();
						let food_name4=$('#addMenu>tr:nth-child(5)>.name').html();
						let food_name5=$('#addMenu>tr:nth-child(6)>.name').html();
						let order_quantity=parseInt($("#amount").val());
						let price=parseInt($(".priceplus").html());
						let order_price=order_quantity*price;
						let food_img1=$("#addMenu>tr:nth-child(2)>.fdImg").html();
						let food_img2=$("#addMenu>tr:nth-child(3)>.fdImg").html();
						let food_img3=$("#addMenu>tr:nth-child(4)>.fdImg").html();
						let food_img4=$("#addMenu>tr:nth-child(5)>.fdImg").html();
						let food_img5=$("#addMenu>tr:nth-child(6)>.fdImg").html();
						$("#dosirak_name").val(food_name1+"/"+food_name2+"/"+food_name3+"/"+food_name4+"/"+food_name5);
						
						$("#food_img1").val(food_img1);
						$("#food_img2").val(food_img2);
						$("#food_img3").val(food_img3);
						$("#food_img4").val(food_img4);
						$("#food_img5").val(food_img5);
						
						$("#order_quantity").val(order_quantity);
						$("#order_price").val(order_price);
						
						
						
						$("#bagForm").attr({
							"method":"post",
							"action":"/food/orderList"
						})
						$("#bagForm").submit();
						
					
					
					}
					
					
				})
				
				/*총 가격 계산*/
				$("#priceBtn").click(function(){
					console.log()
					if($("#tabl>tbody>tr").length<6){
						alert("도시락은 5가지의 메뉴를 골라주셔야 완성됩니다.");
						return;
					}else{
						let price=parseInt($(".priceplus").html());
						let amount=parseInt($("#amount").val());
						$("#totalprice").html(amount+"개의 도시락 총 금액: "+price*amount+"원");
					}
				})
				
				
		});//최상위함수
		
		
		
	</script>

</head>
<div id="hBoardList_board_img" class="wrapper row2 bgded"
      style="background-image: url('/resources/images/common/lunchbox3.jpg');">
      <div class=" hBoardList_name_location">
      <div id="breadcrumb" class="hBoard_Name">DOSIRAK31 도시락 만들기</div>
   </div>
   </div>
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- 장바구니 insert해주기 위한 값들 -->
	<form id="bagForm" >
	<!-- session값 있는지 확인   나중에 sessionScope.client_info.client_no-->
	<input type="hidden" name="client_no" id="client_no" value="${sessionScope.client_info.client_no }"/>
	<input type="hidden" name="dosirak_name" id="dosirak_name" />
	<input type="hidden" name="food_img1" id="food_img1" />
	<input type="hidden" name="food_img2" id="food_img2" />
	<input type="hidden" name="food_img3" id="food_img3" />
	<input type="hidden" name="food_img4" id="food_img4" />
	<input type="hidden" name="food_img5" id="food_img5" />
	<input type="hidden" name="order_quantity" id="order_quantity"/>
	<input type="hidden" name="order_price" id="order_price"/>
	</form>
	<!-- 장바구니 insert해주기 위한 값들 끝-->
	
	<!--===================기초대사량 계산 시작=========================== -->
   <div id="comments"> 
         <div id="centerda">
       		<div class="form-inline">
       		<label for="comment"><span class="span1">고객님의 건강정보를 분석하여<br/>
       		 Dosirak31에서<span class="color"> 하루 영양 구성</span>을 제안합니다.<br/>
       		 도시락을 드시는 분의 정보를 입력해주세요.</span>
       	
       		</label><br/>
       		
       		<div class="form-group">
       		<label class="test_obj">
       		 <div>성별을 클릭해주세요</div>
		      <input type="radio" name="gender" value="man" id="radio1"/><span>남자</span>
		      </label>
		      <label class="test_obj">
		       <input type="radio" name="gender" value="woman" id="radio2"/><span>여자</span>
		       </label>
		     </div>
		
		  
		   <div class="block clear">
		    <div>키를 입력해주세요</div>
		    <input type="text" class="form-control" id="height" name="height" placeholder="예:165" onlyNumber>
		  </div>
		   <div class="block clear">
		     <div>몸무게를 입력해주세요</div>
		   
		    <input type="text" class="form-control" id="weight" name="weight" placeholder="예:56"  onlyNumber>
		  </div>
		   <div class="block clear">
		   <div>나이를 입력해주세요</div>
		   
		    <input type="text" class="form-control" id="age" name="age" placeholder="예:36"  onlyNumber>
		  </div>
		  <div class="block clear searchBtn">
		  	<button type="submit" id="submitBtn" class="dosirakBtn text-right"> &nbsp;&nbsp;  계산하기 &nbsp;&nbsp;</button>
		  </div>
          <div class="form-group">
         	
          	<div class="circle " id="comment">기초대사량</div>
          	
          	<div class="circle" id="tanResult" >탄수화물</div>
          	
          	<div class="circle" id="danResult">단백질</div>
          	<div class="circle" id="jiResult">지방</div>
          	
          </div>
           <!--  <label for="comment">기초대사량 계산결과</label>
            <textarea name="comment" id="comment" cols="10" rows="2" readonly="readonly"></textarea> -->
          </div> 
      </div>
      <br/><br/>
      	<!--===================기초대사량 계산 끝=========================== -->
      
      <div class="center"> <h3><label for="comment">계산된 영양을 바탕으로 식단 구성하기</label></h3></div>
      <!-- <div class="center btmspace-80"><img class="hwasal" src="/resources/images/common/hwasal.png"/></div> -->
      <hr/>

 	 <!--===================총금액,장바구니,바로구매 버튼 끝=========================== -->
     </div> 
  <!-- ################################################################################################ --> 
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>

<div class="wrapper row4">
  <section id="info" class="clear"> 
    <!-- ################################################################################################ -->
  
   <div id="comments"> 

   	<!--===================도시락 메뉴 리스트=========================== -->
   	<div class="block clear">
     <article>
     	 <h3><label for="comment">DOSIRAK31 건강 도시락 메뉴</label></h3>
			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1" >메뉴<br/></li>
				<li class="tab-link " data-tab="tab-2" data-value="야채" id="menu1">야채<br/></li>
				<li class="tab-link" data-tab="tab-3" data-value="토핑" id="menu2">토핑<br/></li>
				<li class="tab-link" data-tab="tab-4" data-value="사이드" id="menu3">사이드<br/></li>
				<li class="tab-link " data-tab="tab-5" data-value="과일" id="menu4">과일<br/></li>
			</ul>
			<div id="tab-1" class="tab-content current">
			<div>
				<span class="white">
			DOSIRAK31 도시락 구성 방법</span></div>
				<div>1. 원하는 메뉴 5가지를 골라주세요</div>
				<div>2. 샐러드볼은 기본 제공됩니다.</div>
				<div>
				<img src="/resources/images/common/sallad.jpg" id="sallad">
				</div>
				<div>3. 하루 영양성분을 고려하면 더 건강한 식단을 만들 수 있습니다.</div>
				<div>4. 다른 사람들의 후기가 궁금하다면?</div>
				<div><a href="/foodReview/client/foodReviewList"><span class="color">리뷰 보러가기 &raquo;</span></a></div>
				
				</div>
			</div>
			<div id="tab-2" class="tab-content" >
					<ul id="foodMenu"class="nospace clear">
		          	  <li class="one_quarter text-center li_control">
		         		<!-- <img src="/dosirak31img/food/이미지이름"/> --> 
				  		<img alt="식품이미지" class="img-thumbnail">
			     			<div class="menuList"></div>
			     			<button type="button" class="addBtn dosirakBtn3">추가</button>
			     		</li>
			     	</ul>   			
			</div>
			<div id="tab-3" class="tab-content" ></div>
			<div id="tab-4" class="tab-content"></div>
			<div id="tab-5" class="tab-content "></div>
			<div id="tab-6" class="tab-content "></div>
				
			</article>
		</div>	
     	<!--===================도시락 메뉴 끝=========================== -->
     	<!--===================도시락 고르기 테이블 보여주는것 =========================== -->
      <div class="scrollable">
        <table id="tabl">
          <thead>
            <tr>
              <th class="text-center">카테고리</th>
              <th class="text-center">음식이름</th>
			  <th class="text-center">중량(g)</th>
              <th class="text-center">열량(kcal)</th>
              <th class="text-center">탄수화물(g)</th>
              <th class="text-center">단백질(g)</th>
              <th class="text-center">지방(g)</th>
              <th class="text-center">가격(원)</th>
              <th class="text-center">비고</th>
            </tr>
          </thead>
          <tbody id="addMenu">
            <tr id="addFood">
              <td class="category text-center"></td>
              <td class="name text-center"></td>
              <td class="g text-center"></td>
              <td class="kcal text-center"></td>
              <td class="tan text-center"></td>
              <td class="dan text-center"></td>
              <td class="ji text-center"></td>
              <td class="price text-center"></td>
              <td class="delete text-center"></td>
              <td class="fdImg"></td>
            </tr>
           
          </tbody>
          <tfoot>
          	<tr id="nutritionResult">
          		<td colspan="2" class="text-center">하나의 도시락 total</td>
          		<td class="gplus text-right"></td>
          		<td class="kcalplus text-right"></td>
          		<td class="tanplus text-right"></td>
          		<td class="danplus text-right"></td>
          		<td class="jiplus text-right"></td>
          		<td colspan="2" class="priceplus text-right "></td>    		
          	</tr>
          </tfoot>
        </table>
      </div>
 	<!--===================도시락 고르기 테이블 보여주는것 끝 =========================== -->
 	<!--===================총금액,장바구니,바로구매 버튼 =========================== -->
 		<div class="text-right">
 		
 			<div class="black">도시락 수량<input type="number" value="1" id="amount" min="1"/><br/></div>
 			<div>
 			<span id="totalprice"></span>
 			<button type="button" class="dosirakBtn2" id="priceBtn">총 금액</button>
 			<button type="button" class="dosirakBtn text-right" id="bagBtn">장바구니</button>
 			<button type="button" class="dosirakBtn text-right" id="orderBtn">바로 구매</button>
 			
 			</div>
 		</div>
 	 <!--===================총금액,장바구니,바로구매 버튼 끝=========================== -->
     </div> 
    <!-- ################################################################################################ -->
    <div class="clear"></div>
  </section>
</div>
</body>
</html>