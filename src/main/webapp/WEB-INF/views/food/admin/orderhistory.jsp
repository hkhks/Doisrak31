<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 	
 	
	<style type="text/css">
	 section#content ul li { display:inline-block; margin:10px; }
	 section#content div.goodsThumb img { width:200px; height:200px; }
	 section#content div.goodsName { padding:10px 0; text-align:center; }
	 section#content div.goodsName a { color:#000; }
	section#content ul.orderList{margin:0px 0px;}
	 section#content ul li { border:5px solid #eee; padding:10px 20px; margin:40px 0px 0px 0px; width:650px; height:230px;}
	 section#content .orderList span { font-size:15px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
	 
         /*레이어 창*/
        div#popup{
        	position:absolute;right:0;top:0;

        	padding:5px;
            color: yellow;
            width: 500px; height: 80px;
            background-color: gray;
        }
        div#popup>div{
            position: relative;
            background-color: #ffffff;
            width: 500px; height: auto;
            top: 0px; left:0px;
            border: 1px solid gray;
            padding: 10px;
            color: black;
        }
   
	 #trClone{display:none;}
	 #detailTable tr,td{border:1px solid; border-collapse:collapse;}
	 .dosirakBtn1{float:right;}
	 
	</style>
	
	<script type="text/javascript">
	/*스크롤에 따라 상세페이지 따라오도록*/
			$(window).scroll(function(){
			       let position = $(document).scrollTop();
			       $("#scroll").css('top',  position );     
			});
			
			function scroll_follow( id )
			{
			  $(window).scroll(function( )  //스크롤이 움직일때마다 이벤트 발생
			  { 
			      var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
			      $( id ).stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
			   });
			}
			 scroll_follow( "#popup" );
	
		$(function(){
			$("#popup").hide();
			
			 $('#closeBtn').click(function() {        /*닫기 버튼 누르면 팝업창을 숨김 처리함*/
	                $('#popup').hide();
	            });
			
			//검색 후 검색 대상과 검색 단어 출력
			let status=$("#status").val();
			if(status!=""){
				$("#search").val(status).attr("selected",true);
			}
			
			 		
			
			 //검색대상이 변경될 때마다 처리 이벤트
			 $("#search").change(function(){
				 $("#pageNum").val(1);
				 goPage();
			 });
			 
			
	
			//페이지버튼	 
			$(".paginate_button a").click(function(e){
				e.preventDefault();
				$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
				goPage();
			});
			
			//배달발송버튼
			$(document).on("click",".deliveryBtn",function(){
				let result=confirm("배달발송하시겠습니까?");
				if(result){
					let order_no=$(this).attr("data-num");
					location.href="/food/admin/delivery?order_no="+order_no;
				}
			})
			
			//결제취소버튼
			$(document).on("click",".paymentDelete",function(){
				let result=confirm("결제 취소하시겠습니까?");
				if(result){
					let order_no=$(this).attr("data-num");
					location.href="/food/admin/paymentDelete?order_no="+order_no;
				}
			})
			
			$("#orderGraphBtn").click(function(){
				location.href="/food/admin/orderGraph";
			})
			
		});//최상위함수
		
		//검색을 위한 실질적인 처리 함수
		function goPage(){
			
			$("#f_search").attr({
				"method":"get",
				"action":"/food/admin/orderhistory"
			})
			$("#f_search").submit();
		}
		
		//주문번호 클릭하면 ajax로 불러오기
		function popup(order_no){
			$(".detachTr").detach();
			//let order_no=$("#popUpBtn").html();
			let url="/food/admin/order/"+order_no;
			let order_price2=0;
			$.getJSON(url,function(data){
				$(data).each(function(){
					$("#on").html("주문번호: "+order_no);
					let dosirak_name=this.dosirak_name;
					let order_quantity=this.order_quantity;
					let order_price=this.order_price;
					order_price2+=this.order_price;
					console.log(dosirak_name,order_quantity,order_price);
					
					let $table=$("#detailTable");
					 $tr=$("#trClone").clone().removeAttr("id");
					 $tr.addClass("detachTr")
					 $tr.find(".dosirak_name").html(dosirak_name);
					 $tr.find(".order_quantity").html(order_quantity);
					 $tr.find(".order_price").html(order_price);
					 
					$table.append($tr);
					$('#popup').show();     //레이어 팝업창 띄울지 여부
				})
				$(".totalPrice").html("총 주문금액: "+order_price2);
			}).fail(function(){
	            alert("주문상세페이지부르기에 실패했습니다.개발자에게 문의하세요");
	         })
			
				
			
			 
			
		}
		
		
		
	
	</script>

</head>
	<body>
	<div class="wrapper row3">
	<!-- 상세정보 팝업창 -->
       <div id="popup" style="padding-left:0px;">
           <h2 align="center" id="on"></h2>
          
           <div align="right" id="detailDiv">        
             <table id="detailTable">
           		<tr>
           			<td>도시락이름</td>
           			<td>수량</td>
           			<td>가격</td>
           			
           			
           		</tr>
           		<tr id="trClone">
           			<td class="dosirak_name">a</td>
           			<td class="order_quantity">b</td>
           			<td class="order_price">c</td>
           			
           		</tr>
           		
           </table>
           	 <span class="totalPrice" style="padding-right:20px;"></span>
        	 <input type="button" value="닫기" class="dosirakBtn1" id="closeBtn" style="margin-top:-7px;">
          </div> 
       </div>
	<!-- 상세정보 팝업창 끝 -->
   <h3>최신순으로 조회</h3>
   <%--=======검색기능 시작 =========--%>
			<div id="boardSearch">
				<form id="f_search" name="f_search" class="form-inline">
				<%--페이징 처리를 위한 파라미터 --%>
				<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }" id="pageNum">
				<input type="hidden" name="amount" value="${pageMaker.cvo.amount }" id="amount"> <!-- ${pageMaker.cvo.amount } -->
					<div class="form-group">
						<select id="search" name="order_status_no" class="form-control">
							<!--  <option value="2">전체내역</option>-->
							<option value="3">주문내역</option>
							<option value="4">주문취소내역</option>
							<option value="5">배송완료내역</option>
						</select>
						<button type="button" class="dosirakBtn1 text-right" id="orderGraphBtn" style="margin-left:10px;">매출 통계</button>
					</div>
				</form>
			</div>
			
      <%--=======주문내역테이블 시작============--%>
       
	
       <div id="comments">
   		<c:set var="previousCol1" value=""/>   
			<c:forEach items="${orderhistory}" var="order">
					
			    <c:if test="${order.order_no ne previousCol1}">
			      <section id="content">
 
					 <ul class="orderList">
					 
					  <li>		
					  <div>
					   <p><span>주문번호</span><a href="javascript:popup(${order.order_no })" class="popUpBtn">${order.order_no }</a></p>
					   <p><span>주문상태</span><c:if test="${order.order_status_no eq 3}">주문 완료 / ${order.order_date}</c:if>
					   <c:if test="${order.order_status_no eq 4}">주문 취소</c:if>
					   <c:if test="${order.order_status_no eq 5}">배송 완료</c:if>
					   </p>
					   <input type="hidden" id="status" value="${order.order_status_no }"/>
					   <p><span>결제상태</span><c:if test="${order.payment_delete eq 0}">결제 완료</c:if>
					   	<c:if test="${order.payment_delete eq 1}">결제 취소</c:if>
					   	 / ${order.payment_method }
					   	 <c:if test="${order.order_status_no eq 4}">
					   	 	 <c:if test="${order.payment_delete eq 0}">&nbsp;&nbsp;&nbsp;
					   	 	 	<button type="button" class="dosirakBtn1 paymentDelete"  data-num="${order.order_no }">결제 취소</button>
					   	 	 </c:if>
					   	 </c:if>
					   	 
					   	 
					   </p>
					   
					 
     		
					   <p><span>주문자 정보</span>${order.client_name} / ${order.client_phone}</p>
					   <p><span>수령인 정보</span>${order.order_client_name} / ${order.order_client_phone}</p>
					   <p><span>주소</span>${order.order_address }
					   <c:if test="${order.order_status_no eq 3}">
					   	<button type="button" class="dosirakBtn1 deliveryBtn" data-num="${order.order_no }">배달 발송</button>				   
					   </c:if></p>				   
					  </div>				  
					  </li>
					 </ul>				
					</section>		      
			    </c:if>			
			    <c:set var="previousCol1" value="${order.order_no }"/>
			</c:forEach>

     		 </div>
     		  <%--=======주문내역테이블 끝============ --%>
    		<%--===================페이징 출력 시작============== --%>
    		<tag:pagination pageNum="${pageMaker.cvo.pageNum }" amount="${pageMaker.cvo.amount }"
			startPage="${pageMaker.startPage }" endPage="${pageMaker.endPage }" prev="${pageMaker.prev }" next="${pageMaker.next }"/>
			
			<%--===================페이징 출력 끝============== --%>
     
  <!-- ################################################################################################ --> 
    <!-- / main body -->
    <div class="clear"></div>
  
</div>

	
	</body>
</html>