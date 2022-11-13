<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
      <style type="text/css">
      </style>
      <script type="text/javascript">
            $(function() {
               // 수정 버튼 클릭 시 처리 이벤트
               $("#communityUpdateBtn").click(function() {
                  //입력값 체크
                  if(!chkData("#community_title","제목을")) return;
                  else if(!chkData("#community_contents","작성할 내용을")) return;
                  else{
                     if($("#file").val()!=""){
                        if(!chkFile($("#file"))) return;
                     }
                     $("#f_updateForm").attr({
                        "method":"post",
                        "enctype":"multipart/form-data",
                        "action":"/community/client/communityUpdate"
                     });
                     $("#f_updateForm").submit();
                  }
               });
               
               // 취소 버튼 클릭시 처리 이벤트
               $("#communityCancelBtn").click(function() {
                  $("#f_updateForm").each(function() {
                     this.reset();
                  });
               });
               
               // 목록 버튼 클릭 시 처리 이벤트
               $("#communityListBtn").click(function() {
                  
                  let list_no ="${updateData.community_category_no}";
                  console.log(list_no);
                  
                  if(list_no == 0){
                     location.href="/community/client/communityList?community_category_no=0";
                  } else if(list_no == 1){
                     location.href="/community/client/communityList?community_category_no=1";
                  }
                  
                  
               });
               
               
            });
         </script>
      
</head>
   <body>
   <div id="hBoardList_board_img" class="wrapper row2 bgded"
   style="background-image: url('/resources/images/common/update.jpg');">
   <div class=" hBoardList_name_location">
      <div id="breadcrumb" class="hBoard_Name">Update</div>
   </div>
</div>

<div class="wrapper row3">
   <main class="container clear"> 
   
      <div class="contentContainer container">
         <!--    <div class="contentTit page-header"><h3 class="text-center">게시판 글수정</h3></div>  -->
            
            <div class="contentTB text-center">
               <form id="f_updateForm" name="f_updateForm">
                  <input type="hidden" id="community_no" name="community_no" value="${updateData.community_no}" />
                  <input type="hidden" id="b_file" name="b_file" value="${updateData.file_name}" />
                  <input type="hidden" id="b_thumb" name="b_thumb" value="${updateData.file_thumb}" />
                  <input type="hidden" id="community_category_no" name="community_category_no" value="${updateData.community_category_no}" />
                  <table class="table table-bordered">
                     <tbody>
                        <tr>
                           <td class="col-md-3">글번호</td>
                           <td class="text-left col-md-3">${updateData.community_no}</td>
                           <td class="col-md-3">작성일</td>
                           <td class="text-left col-md-3">${updateData.community_date}</td>
                        </tr>
                        <tr>
                           <td>작성자</td>
                           <td colspan="3" class="text-left">${updateData.client_id}</td>
                        </tr>
                        <tr>
                           <td>글제목</td>
                           <td colspan="3" class="text-left">
                              <input type="text" name="community_title" id="community_title" value="${updateData.community_title}" class="form-control" />
                           </td>
                        </tr>
                        <tr class="table-tr-height">
                           <td>내용</td>
                           <td colspan="3" class="text-left">
                              <textarea name="community_contents" id="community_contents" class="form-control" rows="8">${updateData.community_contents}</textarea>
                           </td>
                        </tr>
                        <tr class="form-inline">
                           <td>비밀번호</td>
                           <td colspan="3" class="text-left">
                              <input type="password" name="community_pw" id="community_pw" class="form-control" maxlength="18" />
                              <label>수정할 비밀번호를 입력해 주세요.</label>
                           </td>
                        </tr>
                        <tr>
                           <td>파일첨부</td>
                           <td colspan="3" class="text-left"><input type="file" name="file" id="file" /></td>
                        </tr>
                     </tbody>
                  </table>
               </form>      
            </div>
            
            
            <div class="contentBtn text-right">
               <input type="button" value="수정" id="communityUpdateBtn" class="dosirakBtn1">
               <input type="button" value="취소" id="communityCancelBtn" class="dosirakBtn1">
               <input type="button" value="목록" id="communityListBtn" class="dosirakBtn3">
            </div>   
         </div>
      </main>
   </div>      
   </body>
</html>