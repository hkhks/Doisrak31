<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

      <style type="text/css">
          .btn{
            float:right;
         }
         
         
         /* input[name='review_score']{float:left;} */
           .bt{margin-right:7px;}
           .disflex{display:flex;}
         
      </style>
      
      
      <script type="text/javascript">
         $(function() {
            // submit 버튼 클릭시 처리 이벤트
            $("#foodReviewInsertBtn").click(function() {
               
              
                // 입력값 체크 
                if($("input[name='review_score']:radio:checked").length<1){
                    alert("점수를 선택하세요");
                    return;
                 }

               else if(!chkData("#review_contents", "내용을")) return;
               else {
                  $("#f_writeForm").attr({
                     "method" : "post",
                     "action" : "/foodReview/client/foodReviewInsert"
                  });
                  $("#f_writeForm").submit();
                  }
                alert("리뷰등록이 완료되었습니다.");
               });
               
               // 목록 버튼 클릭시 처리 이벤트
               $("#foodReviewListBtn").click(function() {
                  console.log("버튼누름");
                  location.href = "/foodReview/client/foodReviewList";
               
               });
         });
         
        function orderList(client_no){
            location.href="/mypage/client/mypageOrderList?client_no="+client_no;
         }
         
      </script>
</head>
<body id="top">
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/common/writeForm1.jpg'); height: 320px;">
  
    <div id="breadcrumb" class="clear"> 
      <!-- ################################################################################################ -->
     
      <!-- ################################################################################################ -->
    </div>
  
</div>

<div class="wrapper row3">
   
   <main class="container clear" style="padding-top: 30px;"> 
   <div class="sidebar one_quarter first"> 
      <!-- ################################################################################################ -->
      <h6>Category</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="/mypage/client/mypageMain">회원정보</a></li>
          <li><a href="javascript:orderList(${sessionScope.client_info.client_no })">주문 내역</a>
          <li><a href="/mypage/client/mypageReviewList">나의 리뷰</a></li>
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </div>
    
    <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
      <div>
        <section id="content">
   
           <div class="header-title" style= "padding-bottom: 10px;">
              My page
           <span class="right-arrow">&gt;</span>
              orderhistory
           <span class="right-arrow">&gt;</span>
           <strong>Review</strong>
           </div>
             <h3 class="title">리뷰</h3>
             <div class="contentTB text-center">
   
      
        <form  id="f_writeForm" name="f_writeForm">
           <input type="hidden" name="client_no" value="${sessionScope.client_info.client_no }">
           <input type="hidden" id="order_no" name="order_no" value="${data.order_no}" />

          <table class="table table-bordered">
                     <tbody>
                        <tr>
                           <td>작성자</td>
                           <td colspan="5" >
                           <input type="text" name="review_name" value="${sessionScope.client_info.client_id}" readonly="readonly" style="width:170px; text-align: left"></td>
                        </tr>
                        <tr>
                           <td>별점</td>
                           <td colspan="3" class="text-left disflex">
                                     <input type="radio" style="margin:0px 7px;" name="review_score" class="review_score bt" value="1"/>1
                                      <input type="radio" style="margin:0px 7px;" name="review_score" class="review_score bt" value="2"/>2
                                      <input type="radio" style="margin:0px 7px;" name="review_score" class="review_score bt" value="3"/>3
                                      <input type="radio" style="margin:0px 7px;" name="review_score" class="review_score bt" value="4"/>4
                                      <input type="radio" style="margin:0px 7px;" name="review_score" class="review_score bt" value="5"/>5   
                                      <input type="hidden" id="review_score" value="${updateData.review_score}"/>
                           </td>
                        </tr>
                        <tr class="table-tr-height">
                           <td>내용</td>
                           <td colspan="3" class="text-left">
                              <textarea name="review_contents" id="review_contents" class="form-control" rows="8" 
                              placeholder="자유로운 의견을 남겨주세요.">${updateData.review_contents}</textarea>
                           </td>
                        </tr>
                        
                        
                     </tbody>
                  </table>
     
          
        </form>
        </div>
        
        </section>
        <div class="btn">
            <input type="button" id="foodReviewListBtn text-center" value="목록" class="dosirakBtn2 text-center" >
           
            <input type="reset" value="취소" class="dosirakBtn2 text-center" >
            
            <input type="button" id="foodReviewInsertBtn" value="리뷰 쓰기" class="dosirakBtn text-center" >
          </div>
        </div>
        </div>
        
    <div class="clear"></div>
     </main>
   </div>
</body>
</html>