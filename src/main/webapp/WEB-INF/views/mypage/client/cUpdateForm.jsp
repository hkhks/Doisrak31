<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %> 


   <style type="text/css">
         .btn{
            float: right;
         }
         .btn1{
            display :inline-block;
         }
         /* 중복아이디 존재하지 않는경우 */
      .id_input_re_1{
         color : green;
         display : none;
      }
      /* 중복아이디 존재하는 경우 */
      .id_input_re_2{
         color : red;
         display : none;
      }
         
   </style>
   
   <script type="text/javascript">
      $(function() {

         // 회원정보 수정 버튼 클릭 시 처리 이벤트
         $("#mypageClientUpdateBtn").click(function() {
            
            // 아이디 제한 정규식
            let idval = $('#client_id').val()
              let idvalcheck = /^[a-z0-9]+$/
              if (!idvalcheck.test(idval) || idval.length<6){
                 alert('아이디는 영소문자,숫자로 구성된 6글자 이상으로 조합하시오.')
                  $('#client_id').focus();
                  return false
              }
            
            // 비밀번호 일치 체크
            var client_pw=$('input[name=client_pw]').val();
            var client_pw_re=$('input[name=client_pw_re]').val();
            
            if(client_pw!=client_pw_re){
               alert('비밀번호와 비밀번호 재입력 값이 같아야 합니다.');
               return false;
            }
            
            
            // 비밀번호 제한 정규식
               let pwdval = $('#client_pw').val()
                 let pwdcheck =  /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
                 if (!pwdcheck.test(pwdval) || pwdval.length<8){
                    alert('비밀번호는 8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합해야합니다.')
                    $('#client_pw').focus();
                    return false;
                 } 
               if(idval == client_pw){
                    alert('아이디와 비밀번호를 다르게 입력하십시오.')
                    $('#client_pw').focus();
                    return false;
                 }
            
            // 주민번호 유효성 체크
            let rrnval = $('#client_rrn').val()
            let rrncheck = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4]{1}$/;
            
               if (!rrncheck.test(rrnval)){
                    alert('예시에 맞추어 생년월일과 주민번호 첫자리까지 입력해주세요.');
                    $('#client_rrn').focus();
                    return false;
                 } 
            // 입력값 체크
            if(!chkData("#client_id","아이디를")) return;
            else if(!chkData("#client_pw","비밀번호를")) return;
            else if(!chkData("#client_name","이름을")) return;
            else if(!chkData("#client_email","이메일을")) return;
            else if(!chkData("#client_phone","핸드폰 번호를")) return;
            else if(!chkData("#client_address","주소를")) return;
            else if(!chkData("#client_rrn","생년월일을")) return;
            else {
               if(confirm("수정하시겠습니까?")) {
               $("#updateForm").attr({
                  "method":"post",
                  "action":"/mypage/client/mypageClientUpdate"
               });
               $("#updateForm").submit();
            } else {
               alert("취소되었습니다.");
               }
            }
         });
 
         
         // 취소 버튼 클릭 시 처리 이벤트
         $("#cancleBtn").click(function() {
            
               this.reset();
            
            let password = "${sessionScope.client_info_client_pw}";
            console.log(password);

         });
         
         // 회원 탈퇴 버튼 클릭시 처리 이벤트
         $("#mypageClientDeleteBtn").click(function() {
            
            
            // 비밀번호 일치 체크
            var client_pw=$('input[name=client_pw]').val();
            var client_pw_re=$('input[name=client_pw_re]').val();
            
            if(client_pw!=client_pw_re){
               alert('비밀번호와 비밀번호 재입력 값이 같아야 합니다.');
               return false;
            }
            
            if(!chkData("#client_pw", "비밀번호를")) {
               return;
           
            } else   if(confirm("정말 탈퇴하시겠습니까?\n(다시는 되돌릴수 없습니다.)")) {
                  goUrl = "/mypage/client/mypageClientDelete";
                  
                  $("#f_data").attr("action",goUrl);
                  $("#f_data").submit();
                  alert("탈퇴 완료되었습니다.");
               } else {
                  alert("취소되었습니다.");
               }
             
            
            
            
            })
         });
         
      
      
      
      $(document).ready(function(){  //한글입력 안되게 처리 
         $("input[name=client_id]").keyup(function(event){    
         if (!(event.keyCode >=37 && event.keyCode<=40)) {    
            var inputVal = $(this).val();   
            $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));   
            }  
         });
      });
      
          
   </script>
   
   <script>
      function execDaumPostcode() {   // 주소 API function
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
  
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }
  
                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                  
                  } 
  
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample6_postcode').value = data.zonecode;
                  document.getElementById("sample6_address").value = addr;
                  
                  let client_addr = data.zonecode + addr;
                  
                  $("#client_address").val(client_addr);
              }
          }).open();
          
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
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/common/modify.jpg'); height: 370px;">
  
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
    <div class="content three_quarter"> 
      <!-- ################################################################################################ -->
        <div class="header-title" style="padding-bottom: 10px;">
              My page
           <span class="right-arrow">&gt;</span>
           <strong>Client_info</strong>
           </div>
             <h3 class="title">회원정보 수정</h3>
      
      <form name="f_data" id="f_data" method="post">
      	<input type="hidden" name="client_no" value="${sessionScope.client_info.client_no}"/>
      
     </form>
      
      <section id="container" style="width : 80%;">
         <form id="updateForm" name="updateForm" class="form-horizontal">
            <input type="hidden" id="client_no" name="client_no" value="${sessionScope.client_info.client_no}" />
            <table class="table table-bordered">
                     <colgroup>
                        <col width="20%" />
                        <col width="80%" />
                     </colgroup>
                     <tbody>
                        <tr>
                           <td>아이디</td>
                           <td class="text-left"><input type="text" name="client_id" id="client_id" class="form-control" 
                           value="<c:out value='${updateData.client_id}'/>" readonly="readonly"/>
                           <div><span class="id_input_re_1">사용 가능한 아이디입니다.</span>
                              <span class="id_input_re_2">아이디가 이미 존재합니다.</span></div>
                           </td>
                        <tr>
                           <td>이름</td>
                           <td class="text-left"><input type="text" name="client_name" id="client_name" class="form-control" readonly="readonly"
                           value="<c:out value='${updateData.client_name}'/>"/></td>
                        </tr>
                        <tr>
                           <td>주민등록번호</td>
                           <td class="text-left"><input type="text" name="client_rrn" id="client_rrn" class="form-control" maxlength="8" 
                           placeholder="ex) 9*****-1" readonly="readonly"
                           value="<c:out value='${updateData.client_rrn}'/>"/>
                           </td>
                        </tr>   
                        <tr>
                           <td>패스워드</td>
                           <td class="text-left"><input type="password" name="client_pw" id="client_pw" class="form-control"
                           value="<c:out value='${updateData.client_pw}'/>"/></td>
                        </tr>
                        <tr>
                           <td>패스워드 확인</td>
                           <td class="text-left"><input type="password" name="client_pw_re" id="client_pw_re" class="form-control" 
                           value="<c:out value='${updateData.client_pw}'/>"/></td>
                        </tr>

                        <tr>
                           <td>이메일</td>
                           <td class="text-left"><input type="text" name="client_email" id="client_email" class="form-control" 
                           placeholder="ex) javauser@gamil.com" 
                           value="<c:out value='${updateData.client_email}'/>"/></td>
                        </tr>
                        <tr>
                           <td>핸드폰번호</td>
                           <td class="text-left"><input type="text" name="client_phone" id="client_phone" class="form-control" 
                           placeholder="ex) 010-1234-5678" 
                           value="<c:out value='${updateData.client_phone}'/>"/></td>
                        </tr>
                        <tr>
                           <td>주소</td>
                           <td class="text-left"><input type="button" id="addBtn" style="width: 100%;" class="dosirakBtn3" value="주소검색" onclick="execDaumPostcode()" />
                              <div style="display: none;">
                              <input type="text" id="sample6_postcode" placeholder="우편번호">
                              <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                              <input type="text" id="sample6_address" placeholder="주소"><br>
                              </div>
                              <input type="text" name="client_address" id="client_address" class="form-control" 
                              placeholder="주소검색 후 상세주소를 입력해주세요." 
                              value="<c:out value='${updateData.client_address}'/>"/>
                              <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                           </td>
                        </tr>
                     </tbody>
                  </table>
                  <div class="text-right">
                     <input type="button" value="회원탈퇴" id="mypageClientDeleteBtn" class="dosirakBtn2">
                     <!-- <input type="button" value="취소" id="cancleBtn" class="dosirakBtn"> -->
                     <input type="button" value="회원정보 수정" id="mypageClientUpdateBtn" class="dosirakBtn">
                  </div>   
         
         </form>
      </section>
     
    </div>
    
    



      
    
    
    
    <div class="clear"></div>
  </main>
</div>

<!-- 상위로 가는버튼 -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 

   </body>
</html>