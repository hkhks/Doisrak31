<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
	<style type="text/css">
		img{width:70px; height:70px;margin:5px;}
		input.order_quantity{width:80px;}
		
		#bagLi{display:none;}
		.quantity{font-size:15px;}
		.price{font-weight:bold; }
		.minusBtn,.plusBtn{background-color:}
		/*테이블설정*/
		#total{width: 500px;}
		td,label,span{color:black;}
		#totalPrice{height:60px; font-size:20px; vertical-align:middle;}
	</style>
	<script type="text/javascript">
		$(function(){
			let client_no=$("#client_no").val();
	         listAll(client_no);
	         
	         //수량 줄이기 (-)
	          $(document).on("click",".minusBtn",function(){
	        	 let quantity=parseInt($(this).parents("td").find(".quantity").html());
	       
	        	 if(quantity==1){
	        		 alert("최소 수량입니다.");
	        		 return;
	        	 }else{
	        		 $(this).parents("td").find(".quantity").html(quantity-1);
	        		 
	        		
	        		 let dosirak_no=$(this).parents("tr").attr("data-dosirak");
	        		 let order_quantity2=parseInt($(this).parents("td").find(".quantity").html());
	        		 let order_price2=
	        		parseInt($(this).parents("tr").find(".dosirak_price").html())*order_quantity2;
	        		 updateMethod(dosirak_no,order_quantity2,order_price2);
	        		
	        	 }
	         })//수량 줄이기(-)끝
	         
	       //수량 늘이기 (+)
	          $(document).on("click",".plusBtn",function(){
	        	  
	        	 let quantity=parseInt($(this).parents("td").find(".quantity").html());
	        	  $(".quantity").html(quantity+1);
	        	  let dosirak_no=$(this).parents("tr").attr("data-dosirak");
        		 let order_quantity2=parseInt($(this).parents("td").find(".quantity").html());
        		 let order_price2=
        		parseInt($(this).parents("tr").find(".dosirak_price").html())*order_quantity2;
        		 updateMethod(dosirak_no,order_quantity2,order_price2);
	        	 
	         })//수량 줄이기(-)끝
	         
	         //삭제버튼 클릭 시 
	         $(document).on("click",".deleteBtn",function(){
	        	 let dosirak_no=$(this).parents("tr").attr("data-dosirak");
	        	 let client_no=$("#client_no").val();
	        	 let order_no=$(this).parents("tr").attr("data-order");
	        	 
	        	 
	        	 if(confirm("선택하신 도시락을 장바구니에서 삭제하시겠습니까?")){
	        		
		    		  $.ajax({
		    			  url:"/order/"+dosirak_no+"/"+order_no,
		    			  type:'get',//method-get(조회)/post(입력)/put(수정)/delete(삭제) 존재
		    			  dataType:'text',
		    			  error:function(xhr,textStatus,errorThrown){//실행시 오류가 발생하였을 경우
		    				  alert("장바구니에서 상품 삭제에 문제가 있습니다.관리자에게 문의하세요");
		    			  
		    			  },
		    			  success:function(result){
		    				  
		    				  if(result=='SUCCESS'){
		    					  alert("장바구니에서 삭제가 완료되었습니다.");
		    					  listAll(client_no);
		    				  }
		    			  }
		    		  })
		    	  }
	         })
	       //장바구니 목록 불러오는 함수
		      function listAll(client_no){
		         
		         $(".bag").detach();//detach():선택한 요소를 dom트리에서 삭제
		         let url="/order/bag/"+client_no;
		         
		         $.getJSON(url,function(data){
		        	 if(data==""){
		            		let $div=$("<div>").html("장바구니가 비어있습니다.");
		            		$("#bagUl").append($div);
		            	}
		        	 let totalPrice=0;
		        	 let i=0;
		            $(data).each(function(){
		            	
		               let dosirak_name=this.dosirak_name;
		               let order_price=this.order_price;
		               let order_quantity=this.order_quantity;
		               let dosirak_no=this.dosirak_no;
		               let order_no=this.order_no;
		               let food_img1=this.food_img1;
		               let food_img2=this.food_img2;
		               let food_img3=this.food_img3;
		               let food_img4=this.food_img4;
		               let food_img5=this.food_img5;

		  
		               totalPrice+=this.order_price;
		               
		               template(dosirak_name,order_price,order_quantity,dosirak_no,order_no,i,food_img1,food_img2,
		            		   food_img3,food_img4,food_img5
		            		   );
		               i++;
		            });
		            $("#totalPrice").html(totalPrice);
		         }).fail(function(){
		            alert("장바구니 불러오는데 실패했습니다.관리자에게 문의하세요");
		         })
		      }
		   
		      
		      
		      
		      //수정을 위한 함수
		      function updateMethod(dosirak_no,order_quantity2,order_price2){
		    	  let client_no=$("#client_no").val();
		    	  $.ajax({
		        		url:"/order/"+dosirak_no,
		        		type:"put",
		        		headers:{
		        			"Content-Type":"application/json",
		        			"X-HTTP-Method-Override":"PUT"
		        			
		        		},
		        		data:JSON.stringify({
		        			order_quantity:order_quantity2,
		        			order_price:order_price2
		        		
		        		}),
		        		dataType:"text",
		        		error:function(xhr,textStatus,errorThrown){
		        			alert("수량 변경에 문제가 있습니다.관리자에게 문의하세요");
		        		},
		        		success:function(result){
		        			if(result=="SUCCESS"){
		        				listAll(client_no);
		        			}
		        		}
		        		
		        	
		        	})
		      }
	         
	         
	         
	        	
	       		//장바구니를 화면에 보여주기 위한 함수
		      function template(dosirak_name,order_price,order_quantity,dosirak_no,order_no,i,food_img1,food_img2,
           		   food_img3,food_img4,food_img5){
		         /////////////////////여기서부터
		    	 let $ul=$("#bagUl");
		         //<img src="/dosirak31img/food/이미지이름"/>
		         let $li=$("#bagLi").clone().removeAttr("id");
		         //$element.attr("data-num",r_num);
		         $li.addClass("bag");
		         $li.find(".food_img1").val(food_img1);
		         $li.find(".food_img2").val(food_img2);
		         $li.find(".food_img3").val(food_img3);
		         $li.find(".food_img4").val(food_img4);
		         $li.find(".food_img5").val(food_img5);
		         $li.find(".imgda1").attr("src","/dosirak31img/food/"+food_img1);
		         $li.find(".imgda2").attr("src","/dosirak31img/food/"+food_img2);
		         $li.find(".imgda3").attr("src","/dosirak31img/food/"+food_img3);
		         $li.find(".imgda4").attr("src","/dosirak31img/food/"+food_img4);
		         $li.find(".imgda5").attr("src","/dosirak31img/food/"+food_img5);
		        
		         $li.find(".dataNum").attr("data-dosirak",dosirak_no);
		         $li.find(".dataNum").attr("data-order",order_no);
		         $li.find(".name").html(dosirak_name);
		         $li.find(".dosirak_price").html(order_price/order_quantity);
		         $li.find(".price").html(order_price);
		         $li.find(".quantity").html(order_quantity);
		         /*order로 정보넘길때 사용할 부분 type="hidden" 부분*/
		         $li.find(".orderlist_orderno").attr("name","orderlist["+i+"].order_no").val(order_no);
		         $li.find(".orderlist_name").attr("name","orderlist["+i+"].dosirak_name").val(dosirak_name);
		         $li.find(".orderlist_quantity").attr("name","orderlist["+i+"].order_quantity").val(order_quantity);
		         $li.find(".orderlist_price").attr("name","orderlist["+i+"].order_price").val(order_price);
		         $li.find(".food_img1").attr("name","orderlist["+i+"].food_img1").val(food_img1);
		         $li.find(".food_img2").attr("name","orderlist["+i+"].food_img2").val(food_img2);
		         $li.find(".food_img3").attr("name","orderlist["+i+"].food_img3").val(food_img3);
		         $li.find(".food_img4").attr("name","orderlist["+i+"].food_img4").val(food_img4);
		         $li.find(".food_img5").attr("name","orderlist["+i+"].food_img5").val(food_img5);
		         
		         
		         
		         $ul.append($li);
		        
		        
		      }
		      
	         
	         /*바로구매하기*/
			$("#orderBtn").click(function(){
				$("#orderForm").attr({
					"method":"post",
					"action":"/food/orderList2"
				})
				
				$("#orderForm").submit();
			})	     
			
			$("#foodBtn").click(function(){
				location.href="/food/foodClientBasicList";
			})
	         
		});//최상위함수
		
		
	      
	      
	      
	</script>

</head>

<div class="wrapper row3" style="padding-bottom:80px; padding-top:20px;">
<input type="hidden" id="client_no" value="${sessionScope.client_info.client_no}"/>	
  <main class="container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="content"> 
      <form id="orderForm" name="OrderDetailVO" >
      	<div id="comments">
        	<h2>장바구니 목록</h2>
					<ul id="bagUl">
			          <li id="bagLi">
			          <input type="hidden" class="food_img1" />
			          <input type="hidden" class="food_img2" />
			          <input type="hidden" class="food_img3" />
			          <input type="hidden" class="food_img4" />
			          <input type="hidden" class="food_img5" />
			            <article>
			              <header>
			                <figure class="avatar"><img  class="imgda1" >
			                <img  class="imgda2" ><img  class="imgda3" >
			                <img  class="imgda4" ><img  class="imgda5" >
			                </figure>
			                <address>
			               	<label>도시락: </label><span class="name"></span>
			               	<input type="hidden" class="orderlist_orderno"/>
			               	<input type="hidden" class="orderlist_name"/>
			                </address>
			              </header>
			              <div class="comcont">
			            
			                	<table>
			                		<tr class="text-center">
										<td>판매가</td>
										<td>X</td>
										<td>수량</td>
										<td>+</td>
										<td>배송비</td>
										<td>=</td>
										<td>주문금액</td>
										<td>비고</td>
										
			                		</tr>
			                		
			                		<tr class="text-center dataNum">
			                			<td class="dosirak_price"></td>
			                			<td>X</td>
										<td><button type="button" class="dosirakBtn3 minusBtn">-</button><span class="quantity" style="padding:0px 10px;"></span><button type="button" class="dosirakBtn3 plusBtn">+</button></td>
										<input type="hidden" class="orderlist_quantity"/>
										<td>+</td>
										<td>[무료배송] 0원</td>
										<td>=</td>
										<td class="price"></td>
										<input type="hidden" class="orderlist_price"/>
										<td><button type="button" class="dosirakBtn3 deleteBtn">삭제하기</button></td>
			                		</tr>
			                	</table>                
			                
			              </div>
			            </article>
			          </li>
			        </ul>
			        
						<table id="total" class="text-center">
							<tr class="warning">
								<td class="warning">총 주문금액</td>
							</tr>
							<tr class="danger">
								<td class="danger" id="totalPrice"></td>
							</tr>
						</table>
					<div class="text-right">	
						<button type="button" class="dosirakBtn2 text-right" id="foodBtn">계속 쇼핑하기</button>
						<button type="button" class="dosirakBtn text-right" id="orderBtn">바로 구매하기</button>
        			</div>

      	</div>
      </form>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>

</body>
</html>