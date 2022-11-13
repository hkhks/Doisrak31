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
           position:absolute;right:10%;top:0;
           padding:5px;
            color: white;
            width: 600px; height: 80px;
            background-color: #29AB87;
     
        }
        div#popup>div{
            position: relative;
            background-color: #ffffff;
            width: 600px; height: auto;
            top: -5px; right:5px;
            border: 1px solid gray;
            padding: 10px;
            color: black;
        }
        
        h2 {
           margin-top: 20px;
        }
   
    #trClone{display:none;}
    #detailTable tr,td{border:1px solid; border-collapse:collapse; vertical-align: middle}
    	
    	img {
    	width: 75px; 
    	height: 75px;
    	}
    
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
         

         
   
         //페이지버튼    
         $(".paginate_button a").click(function(e){
            e.preventDefault();
            $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
            goPage();
         });
         
      
         
         
         
      });//최상위함수
      
      //검색을 위한 실질적인 처리 함수
      function goPage(){
         
         $("#f_search").attr({
            "method":"get",
            "action":"/mypage/client/mypageOrderList"
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
               let food_img1=this.food_img1;
               let food_img2=this.food_img2;
               let food_img3=this.food_img3;
               let food_img4=this.food_img4;
               let food_img5=this.food_img5;
               
               console.log(dosirak_name,order_quantity,order_price);
               
               let $table=$("#detailTable");
                $tr=$("#trClone").clone().removeAttr("id");
                $tr.addClass("detachTr")
                $tr.find(".dosirak_name").html(dosirak_name);
                $tr.find(".order_quantity").html(order_quantity);
                $tr.find(".order_price").html(order_price);
                $tr.find(".order_img1").html("<img src='/dosirak31img/food/"+food_img1+"'>");
                $tr.find(".order_img2").html("<img src='/dosirak31img/food/"+food_img2+"'>");
                $tr.find(".order_img3").html("<img src='/dosirak31img/food/"+food_img3+"'>");
                $tr.find(".order_img4").html("<img src='/dosirak31img/food/"+food_img4+"'>");
                $tr.find(".order_img5").html("<img src='/dosirak31img/food/"+food_img5+"'>");
                
                
               $table.append($tr);
               $('#popup').show();     //레이어 팝업창 띄울지 여부
            })
            $(".totalPrice").html("총 주문금액: "+order_price2);
         }).fail(function(){
               alert("주문상세페이지부르기에 실패했습니다.개발자에게 문의하세요");
            })
      }
      
      // 주문 취소 버튼 클릭시 이벤트
      $(function() {
       
         $(".mypageOrderDeleteBtn").click(function() {
            if(confirm("주문을 취소하시겠습니까?")) {
             
               let order_no=$(this).attr("data-num");
              location.href = "/mypage/client/mypageOrderDelete?order_no="+order_no;
            }
               
            
         });
      });
      
      
      // 리뷰쓰기 버튼 클릭시 이벤트
      $(function() {
       $(".writeForm").click(function() {
          let order_no=$(this).attr("data-num");
          location.href = "/foodReview/client/writeForm?order_no="+order_no;
          
          
       })  
      })
      
     function orderList(client_no){
            location.href="/mypage/client/mypageOrderList?client_no="+client_no;
         }
   
   </script>

</head>
   </head>
<body id="top">
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/common/orderhistory.jpeg');
    height: 350px;">
  
    <div id="breadcrumb" class="clear"> 
      <!-- ################################################################################################ -->
     
      <!-- ################################################################################################ -->
    </div>
  
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="sidebar one_quarter first"> 
      <!-- ################################################################################################ -->
      <h6>Category</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="/mypage/client/mypageMain">회원정보</a></li>
          <li><a href="javascript:orderList(${sessionScope.client_info.client_no })">주문 내역</a>
          <li><a href="/mypage/client/mypageReviewList">나의 리뷰</a>
            <ul>
              
              
            </ul>
          </li>
          
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
      <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
         <div class="header-title" style="padding-bottom: 10px;">
              My page
           <span class="right-arrow">&gt;</span>
           <strong>Order_history</strong>
           </div>
             <h3 class="title">주문 내역</h3>
         
   <!-- 상세정보 팝업창 -->
       <div id="popup">
           <h2 align="center" id="on" style="font-family:vtfont;"></h2>
          
           <div align="right" id="detailDiv">        
             <table id="detailTable">
                 <tr>
                    <td>도시락</td>
                    <td>수량</td>
                    <td>가격</td>
                    <td colspan="5" style="text-align: center">상품 내용</td>
                    
                    
                    
                 </tr>
                 <tr id="trClone">
                    <td class="dosirak_name">a</td>
                    <td class="order_quantity">b</td>
                    <td class="order_price">c</td>
                    <td class="order_img1"></td>
                    <td class="order_img2"></td>
                    <td class="order_img3"></td>
                    <td class="order_img4"></td>
                    <td class="order_img5"></td>
                 </tr>
                 
           </table>
               <span class="totalPrice"></span>
            <input type="button" value="닫기" id="closeBtn">
          </div> 
       </div>
   <!-- 상세정보 팝업창 끝 -->
<!-- ################################################################################################ -->
<form id="f_search" name="f_search" class="form-inline">
            <%--페이징 처리를 위한 파라미터 --%>
            <input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }" id="pageNum">
            <input type="hidden" name="amount" value="${pageMaker.cvo.amount }" id="amount"> <!-- ${pageMaker.cvo.amount } -->
            <input type="hidden" id="client_no" value="${sessionScope.client_info.client_no}" name="client_no"/>  
            </form>
            
      
        <div id="comments">
         <c:set var="previousCol1" value=""/>   
         <c:forEach items="${mypageOrderList}" var="order">
               
             <c:if test="${order.order_no ne previousCol1}">
               <section id="content">
                 <form name="f_data" class="f_data" method="post">
                  <input type="hidden" class="order_no" name="order_no" value="${order.order_no }"/>
                </form>
                <ul class="orderList">
                    
                 <li style="height: 300px;">      
                 <div>
                  <p><span>주문번호</span><a href="javascript:popup(${order.order_no })" class="popUpBtn">${order.order_no }</a></p>
                  <p><span>주문상태</span><c:if test="${order.order_status_no eq 3}">주문 완료 / ${order.order_date} &nbsp;<a class="mypageOrderDeleteBtn" data-num="${order.order_no }">주문취소</a> </c:if>
                  <c:if test="${order.order_status_no eq 4}">주문 취소</c:if>
                  <c:if test="${order.order_status_no eq 5}">배송 완료</c:if>
                  </p>
                  <input type="hidden" id="status" value="${order.order_status_no }"/>
                  <p><span>결제상태</span><c:if test="${order.payment_delete eq 0}">결제 완료</c:if>
                     <c:if test="${order.payment_delete eq 1}">결제 취소</c:if>
                      / ${order.payment_method }
                      <c:if test="${order.order_status_no eq 4}">
                          <c:if test="${order.payment_delete eq 0}">&nbsp;&nbsp;&nbsp;
   
                          </c:if>
                      </c:if>
                      
                      
                  </p>
                  
                
           
                  <p><span>주문자 정보</span>${order.client_name} / ${order.client_phone}</p>
                  <p><span>수령인 정보</span>${order.order_client_name} / ${order.order_client_phone}</p>
                  <p><span>주소</span>${order.order_address }</p>
                  <p><span>주문일시</span>${order.order_date }</p>             
                  <p style="text-align:right;">
                   <c:if test="${order.order_status_no eq 5}">
                  <a class="writeForm" data-num="${order.order_no }">리뷰 쓰기</a>
                  </c:if>
                  </p>
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
      
      
      </div>
      <!-- ################################################################################################ --> 
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 


   </body>
</html>