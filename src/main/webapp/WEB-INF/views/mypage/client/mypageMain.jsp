<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
   
   <style type="text/css">


         .btn{
            float: right;
         }
         
         
   </style>
   <style type="text/css">
      table {
         all: unset;
      }
      
      
      .apple {
         
         width: 100px;
         text-align: center;
         vertical-align: middle;
         
      }
      
      .second {
         
         width:450px;
         text-align: left;
         height:auto;
         vertical-align: middle;
      }
      
      #top {
         border-top: 1px solid #999999;
      }
      
      #bottom {
         border-bottom: 1px solid #999999;
      }
      
      p {
         font-size: 7px;
         font-color: #FFFAFA;
      }
      
      
      
   </style>
   
   
   <script type="text/javascript">
      $(function() {
         
         // 회원수정,삭제 버튼 클릭시 처리 이벤트
         $("#client_infoUpdateBtn").click(function() {
            let client_no = "${mypageList.client_no }"
            location.href = "/mypage/client/mypageCheckForm?client_no="+client_no;
         });
      });
      
      function CheckForm(client_no){
            location.href="/mypage/client/mypageCheckForm?client_no="+client_no;
        }

      
      
      function orderList(client_no){
            location.href="/mypage/client/mypageOrderList?client_no="+client_no;
        }

   </script>
   
   
</head>
<body id="top">
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/common/mypage2.jpeg');
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
          <li><a href="/mypage/client/mypageReviewList">나의 리뷰</a></li>
        </ul>
      </nav>
      <!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    <!-- ################################################################################################ -->
      <form>
         <input type="hidden" name="client_no" value="${sessionScope.client_info.client_no }">
      </form> 
    <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
      <div id="comments">
        <section id="content">
           <div class="header-title">
              My page
           <span class="right-arrow">&gt;</span>
           <strong>Client_info</strong>
           </div>
             <h3 class="title">회원정보</h3>
         
            <table>
               <tr>  
                  <td class="apple" id="top">아이디</td>
                  <td class="second" id="top">${mypageList.client_id }</td>
               </tr>
               <tr>  
                  <td class="apple" style="width: 100px;">이름</td>
                  <td class="second">${mypageList.client_name }</td>
               </tr>
               <tr>  
                  <td class="apple" id="bottom">주민번호</td>
                  <td class="second" id="bottom">${mypageList.client_rrn }</td>
               </tr>
               
            </table>
               <p><em>  ※ 아이디, 이름, 주민번호는 변경이 불가합니다.</em></p>
            <table>
               <tr>  
                  <td class="apple" id="top">비밀번호</td>
                  <td class="second" id="top"><a href="javascript:CheckForm(${mypageList.client_no })">변경</a></td>
               </tr>
               <tr>  
                  <td class="apple">이메일</td>
                  <td class="second">${mypageList.client_email }</td>
               </tr>
               <tr>  
                  <td class="apple">휴대폰</td>
                  <td class="second">${mypageList.client_phone }</td>
               </tr>
               <tr>  
                  <td class="apple">주소</td>
                  <td class="second">${mypageList.client_address }</td>
               </tr>
               <tr>  
                  <td class="apple" id="bottom">가입일자</td>
                  <td class="second" id="bottom">${mypageList.client_date }</td>
               </tr>
               
               
            </table>
               
      </section>
      <div class="btn" style="margin-right: 15%;">
      <input type="button" value="회원정보 수정 및 탈퇴" id="client_infoUpdateBtn" class="dosirakBtn">
      </div>      
      </div>
      
      
      <!-- ################################################################################################ -->      
<!-- ################################################################################################ -->
    </div>
    <!-- ################################################################################################ -->
    
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 

</body>
</html>