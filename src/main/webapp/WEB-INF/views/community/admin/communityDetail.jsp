<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
      <style type="text/css">
      </style>
      <script type="text/javascript">
            let buttonCheck = 0; // 수정버튼과 삭제버튼을 구별하기 위한 변수
            $(function() {
               $("#pwdChk").css("visibility","hidden");
               
               // 수정 버튼 클릭 시 처리 이벤트
               $("#updateFormBtn").click(function() {
                  $("#pwdChk").css("visibility","visible");
                  $("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
                  buttonCheck = 1;
               });
               
               // 삭제 버튼 클릭 시 처리 이벤트
               $("#communityDeleteBtn").click(function() {
                  $("#pwdChk").css("visibility","visible");
                  $("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
                  buttonCheck = 2;
                  
                  let adminName = "${sessionScope.admin_info.admin_id}";
                  if(adminName != ""){
                  if(confirm("정말 삭제하시겠습니까?")){
                     goUrl = "/community/admin/communityDelete";
                     $("#f_data").attr("action",goUrl);
                     $("#f_data").submit();
                  }
                  }
                  
               }); 
               
               
               //삭제 버튼 클릭 시 댓글 확인 후 처리 이벤트
               $("#communityDeleteBtn").click(function() {
                  $.ajax({
                     url : "/community/client/replyCnt",      // 전송 url
                     type : "post",               // 전송 시 method 방식
                     data : "community_no="+$("#community_no").val(),   // 폼전체 데이터 전송
                     dataType : "text",
                     error : function() {      // 실행시 오류가 발생하였을 경우
                        alert('시스템 오류 입니다. 관리자에게 문의 하세요');
                     },            
                     success : function(resultData) {
                        if(resultData==0){ // 댓글이 존재하지 않을 경우
                           $("#pwdChk").css("visibility","visible");
                           $("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
                           buttonCheck = 2;
                        } else{      // 댓글이 존재하는 경우
                           alert("댓글 존재시 게시물 삭제할 수가 없습니다. \n댓글 삭제 후 다시 확인해 주세요.");
                           return;
                        }
                     }
                  });
            
                  
                  
               });
               
               
               
               
               
               
               // 비밀번호 입력 양식 enter 제거
               $("#community_pw").bind("keydown", function(event) {
                  if(event.keycode === 13) { // 0 == "0" -> 값만 비교(true) /  0 ==="0" -> 값과 자료형 비교(false)
                     event.preventDefault();
                  }
               });
               
               // 비밀번호 확인 버튼 클릭 시 처리 이벤트
               $("#pwdBtn").click(function() {
                  communityPwdConfirm();
               });
               
               // 글쓰기 버튼 클릭 시 처리 이벤트
               $("#insertFormBtn").click(function() {
                  location.href = "/community/admin/writeForm";
               });
               
               // 목록 버튼 클릭 시 처리 이벤트
               $("#communityListBtn").click(function() {
                  let list_no ="${detail.community_category_no}";
                  console.log(list_no);
                  
                  if(list_no == 0){
                     location.href="/community/admin/communityList?community_category_no=0";
                  } else if(list_no == 1){
                     location.href="/community/admin/communityList?community_category_no=1";
                  }
                  
               });
               
               //비밀번호 확인 버튼 클릭시 실질적인 처리 함수
               function communityPwdConfirm(){
                  //if (!chkData("#community_pw","비밀번호를")) return;
                  let loginName = "${sessionScope.client_info.client_id}";
                  let adminName = "${sessionScope.admin_info.admin_id}";
                  console.log(loginName);
                  console.log(adminName);
                  
                  
                  
                  
                  if(!formCheck($('#community_pw'),$('#msg'),"비밀번호를")) return;
                  else{
                     $.ajax({
                        url : "/community/client/pwdConfirm",      // 전송 url
                        type : "post",               // 전송 시 method 방식
                        data : $("#f_pwd").serialize(),   // 폼전체 데이터 전송
                        dataType : "text",
                        error : function() {      // 실행시 오류가 발생하였을 경우
                           alert('시스템 오류 입니다. 관리자에게 문의 하세요');
                        },            
                        success : function(resultData) {   // 정상적으로 실행이 되었을 경우
                           let goUrl="";         // 이동할 경로를 저장할 변수
                           if(resultData=="불일치"){   // 일치하지 않을 경우
                              $("#msg").text("작성시 입력한 비밀번호가 일치하지 않습니다.").css("color","red");
                              $("#community_pw").select();
                           } else if(resultData=="일치"){   // 일치할 경우
                              $("#msg").text("");
                              if(buttonCheck==1){   //수정버튼 클릭시
                                 goUrl = "/community/admin/updateForm";
                                 $("#f_data").attr("action",goUrl);
                                 $("#f_data").submit();
                              } else if(buttonCheck==2){   // 삭제버튼 클릭시
                                 if(confirm("정말 삭제하시겠습니까?")){
                                    goUrl = "/community/admin/communityDelete";
                                    $("#f_data").attr("action",goUrl);
                                    $("#f_data").submit();
                                 }
                              }
                           }
                        }
                     });
                  }
               
               
            }
               
            });   
         </script>
      
</head>
   <body>
   

<div class="wrapper row3">
   <main class="container clear"> 
   
      <div class="contentContainer container">
         <!--    <div class="contentTit page-header"><h3 class="text-center">게시판 상세보기</h3></div>  -->
            
            <form name="f_data" id="f_data" method="post">
               <input type="hidden" name="community_no" value="${detail.community_no}"/>
               <input type="hidden" name="file_no" value="${detail.file_name}" />
               <input type="hidden" name="b_thumb" value="${detail.file_thumb}" />
               <input type="hidden" name="community_category_no" value="${detail.community_category_no}" />
            </form>
            
            <%-- 비밀번호 확인 버튼 및 버튼 추가 시작--%>
            <div id="boardPwdBut" class="row text-center">
               <div id="pwdChk" class="authArea col-md-8 text-left">
                  <form name="f_pwd" id="f_pwd" class="form-inline">
                     <input type="hidden" name="community_no" id="community_no" value="${detail.community_no}" />
                     <label for="b_pwd" id="l_pwd">비밀번호 : </label>
                     <input type="password" name="community_pw" id="community_pw" class="form-control" />
                     
                     <button type="button" id="pwdBtn" class="btn btn-default">확인</button>
                     <span id="msg"></span>
                  </form>
               
               </div>
            
               <div class="text-right">
                  <c:if test="${sessionScope.client_info.client_id == detail.client_id || sessionScope.admin_info.admin_id !=null}">
                     <input type="button" value="글수정" id="updateFormBtn" class="dosirakBtn">
                     <input type="button" value="글삭제" id="communityDeleteBtn" class="dosirakBtn">
                  </c:if>
                  <input type="button" value="글쓰기" id="insertFormBtn" class="dosirakBtn">
                  <input type="button" value="목록" id="communityListBtn" class="dosirakBtn2">
               </div>   
            </div>
            
            
            
            <%-- 비밀번호 확인 버튼 및 버튼 추가 종료 --%>
            
            
            
            <%-- 상세 정보 보여주기 시작 --%>
            <div class="contentTB text-center">
                  <table class="table table-bordered">
                     <tbody>
                        <tr>
                           <td class="col-md-3">작성자</td>
                           <td class="col-md-3 text-left">
                           <c:if test="${detail.client_id != null}">${detail.client_id} (조회수: ${detail.community_hits})</c:if>
                           <c:if test="${detail.admin_id != null}">${detail.admin_id} (조회수: ${detail.community_hits})</c:if>
                           </td>
                           <td class="col-md-3">작성일</td>
                           <td class="col-md-3 text-left">${detail.community_date}</td>
                        </tr>
                        <tr>
                           <td class="col-md-4">글제목</td>
                           <td colspan="3" class="col-md-8 text-left">${detail.community_title}</td>
                        </tr>
                        <tr class="table-tr-height">
                           <td class="col-md-4">글내용</td>
                           <td colspan="3" class="col-md-8 text-left">${detail.community_contents}</td>
                        </tr>
                        <c:if test="${not empty detail.file_name}">
                         <tr>
                           <td class="col-md-4">이미지</td>
                           <td colspan="3" class="col-md-8 text-left">
                              <img src="/dosirak31img/community/${detail.file_name}" />
                           </td>
                        </tr> 
                        </c:if>
                     </tbody>
                  </table>
            </div>
            <%-- 상세 정보 보여주기 종료 --%>
            <jsp:include page="reply.jsp" />
         </div>
      </main>
   </div>      
   </body>
</html>