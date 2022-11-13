<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
      
      
      <script>
         $(function() {
            var client_pw_re = "${CheckPw.client_pw}";
            var client_pw = $('input[name=client_pw]').val();
            
            $("#updatePw").click(function() {
               if ($('input[name=client_pw]').val() != '${CheckPw.client_pw}'){
                  alert('입력하신 비밀번호를 확인해주세요.');
                  return false;
               } else {
                  $("#p_data").attr({
                     "method" : "post",
                     "action" : "/mypage/client/mypageCheck"
                  })
                  
                  $("#p_data").submit(); 
               }   
            })
            });
         
         
         
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

    <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
      <div id="comments">
            <form id="p_data" name="p_data">
        <section id="content">
           <div class="header-title">
              My page
           <span class="right-arrow">&gt;</span>
           <strong>Client_info</strong>
           </div>
             <h3 class="title">비밀번호 확인</h3>
            <input type="hidden" name="client_no" value="${sessionScope.client_info.client_no }">
            <input type="hidden" name="client_no" value="${CheckPw.client_no }">
            <table style="width: 80%;">
               <tr>  
                  <td class="apple" id="top">기존비밀번호</td>
                  <td class="second" id="top"><input type="password" id="client_pw_re" name="client_pw_re"
                     value="${CheckPw.client_pw}" readonly="readonly"></td>
               </tr>
               
               <tr>  
                  <td class="apple" id="bottom" style="width: 160px;">비밀번호 확인</td>
                  <td class="second" id="bottom"><input type="password" id="client_pw" name="client_pw"></td>
               </tr>
               
            </table>
               
      </section>
      <div style="margin-right: 20%; float: right" >
      <input type="button" value="회원정보 수정" id="updatePw" class="dosirakBtn">
      </div>      
            </form>   
      </div>
       
    </div>
 
    
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>

<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 

</body>
</html>