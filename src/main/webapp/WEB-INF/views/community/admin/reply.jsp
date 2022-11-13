<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
      <style>
      #item-template{display: none;}
     </style>
      <script type="text/javascript">
      $(function() {
         // 기본 덧글 목록 불러오기
         let community_no = ${detail.community_no};
         listAll(community_no);
      
      
         // 글 입력을 위한 Ajax 연동 처리
         //$("#replyInsertBtn").click(function() {
          $(document).on("click", "#replyInsertBtn", function(){   // 댓글 수정도 함꼐하기 위해 동적으로
            let insertUrl = "/replies/client/replyInsert";
            
            // JSON.stringify() : JavaScript 값이나 객체를 JSON 문자열로 변환
            let value = JSON.stringify({
               community_no:community_no,
               client_id:$("#client_id").val(),
               reply_pw:$("#reply_pw").val(),     // 삭제
               reply_contents:$("#reply_contents").val()
            });
            
            $.ajax({
               url : insertUrl, // 전송 url
               type : "post",   // 전송 시 method 방식
               headers : {
                  "Content-Type":"application/json"
               },
               dataType:"text",
               data : value,
               error: function(xhr, textStatus, errorThrown) {// 실행시 오류가 발생하였을 경우
                  alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
               },
               beforeSend : function() {
                  //if(!checkForm("#r_name","작성자를")) return false;
                  if(!checkForm("#reply_pw","비밀번호를")) return false;      // 주석
                  else if (!checkForm("#reply_contents","댓글내용을")) return false;
               },
               success : function(result) {
                  if(result=="SUCCESS"){
                     alert("댓글 등록이 완료되었습니다.");
                     dataReset();
                     listAll(community_no);
                  }
               }
            });
            
         }); 
         /* 비밀번호 확인없이 수정버튼 제어 */
         $(document).on("click", "button[data-btn='upBtn']", function() {
            let panel = $(this).parents("div.panel")
            let reply_no = panel.attr("data-num");
            updateForm(reply_no, panel);
         });
         
         /* 수정 폼 화면 구현 함수 */
         function updateForm(reply_no, panel) {
            $("#client_id").val(panel.find(".panel-title .name").html());
            $("#client_id").prop("readonly", true);
            
            let content = panel.find(".panel-body").html();
            content = content.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n'); // <br><br/><br /> ==> \r\n으로 변경
            $("#reply_contents").val(content);
            
            $("#replyForm button[type='button']").attr("id", "replyUpdateBtn");
            $("#replyForm button[type='button']").attr("data-reply_no", reply_no);
            
         }
         
         /* 수정을 위한 Ajax 연동 처리 */
         $(document).on("click", "#replyUpdateBtn", function(){
            let reply_no = $(this).attr("data-reply_no");
            $.ajax({
               url : '/replies/client/'+reply_no, // 전송 url
               type : 'put',   // 전송 시 method 방식
               headers : {
                  "Content-Type":"application/json",
                  "X-HTTP-Method-Override" : "PUT" },
               data:JSON.stringify({
                  reply_contents:$("#reply_contents").val(),
                  reply_pw:$("#reply_pw").val() // 삭제
               }),   
               dataType:'text',
               error: function(xhr, textStatus, errorThrown) {// 실행시 오류가 발생하였을 경우
                  alert(textStatus + " (HTTP-" + xhr.status + " / " + errorThrown + ")");
               },
               beforeSend : function() {
                  if (!checkForm("#reply_contents","댓글내용을")) return false;
               },
               success : function(result) {
                  console.log("result: " + result);
                  if(result=="SUCCESS"){
                     alert("댓글 등록이 완료되었습니다.");
                     dataReset();
                     listAll(community_no);
                  }
               }
            
            });
         });
         
         
         
         
         /* 비밀번호 확인없이 삭제버튼 제어 */
         $(document).on("click", "button[data-btn='delBtn']", function() {
            let reply_no = $(this).parents("div.panel").attr("data-num");
               deleteBtn(community_no, reply_no);
         });
         
      });// 최상위 $ 종료
      
      // 댓글 목록 보여주는 함수
      function listAll(community_no) {
         $(".reply").detach(); // detach() : 선택한 요소를 DOM 트리에서 삭제.
         
         let url = "/replies/client/all/"+community_no;
         
         $.getJSON(url, function(data) {   // data == [r_num:1. r_name:"홍ㄱ길동"}. {}]
            $(data).each(function() {
               let reply_no = this.reply_no;
               let client_id = this.client_id;
               let reply_contents = this.reply_contents;
               let reply_date = this.reply_date;
               reply_contents = reply_contents.replace(/(\r\n|\r|\n)/g, "<br />");
               template(reply_no, client_id, reply_contents, reply_date);
            });
         }).fail(function() {
            alert("덧글 목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해 주세요.")
         });
         
      }
      
      // 새로운 글을 화면에 추가하기(보여주기) 위한 함수
      function template(reply_no, client_id, reply_contents, reply_date) {
         let $div = $('#reviewList');
         
         let $element = $('#item-template').clone().removeAttr('id');
         $element.attr("data-num", reply_no);
         $element.addClass("reply");
         $element.find('.panel-heading > .panel-title > .name').html(client_id + "님");
         $element.find('.panel-heading > .panel-title > .date').html(" / " + reply_date);
         
         let loginName = "${sessionScope.client_info.client_id}";
         let adminName = "${sessionScope.admin_info.admin_id}";
         console.log(adminName);
         if(loginName != client_id && adminName == ""){
            $element.find('.panel-heading > .panel-title > button').detach();
         }
         
         
         $element.find('.panel-body').html(reply_contents);
         
         $div.append($element); 
      }
      
      // 입력 폼 초기화
      function dataReset() {
         $("#replyForm").each(function() {
            this.reset();
         });
         
         $("#client_id").prop("readonly", false);
         $("#replyForm button[type='button']").removeAttr("data-rnum");
         $("#replyForm button[type='button']").attr("id", "replyInsertBtn");
      }
      
      /** 글 삭제를 위한 Ajax 연동 처리 */
      function deleteBtn(community_no, reply_no) {
         if(confirm("선택하신 댓글을 삭제 하시겠습니까?")) {
            $.ajax({
               //url : '/replies/' + b_num + '/' + r_num,
               url : '/replies/client/' + reply_no,
               type : 'delete', // method - get(조회)/post(입력)/put(수정)/delete(삭제) 존재
               headers : {
                  "X-HTTP-Method-Override" : "DELETE"
               },
               dataType : 'text',
               error: function(xhr, textStatus, errorThrown) { // 실행시 오류가 발생하였을 경우
                  alert(textStatus + " (HTTP-)" + xhr.status + " / " + errorThrown + ")");
                  // alert("시스템에 문제가 있어 잠시 후 다시 진행해 주세요.")
               },
               success : function(result) {
                  console.log("result" + result);
                  if(result == 'SUCCESS') {
                     alert("댓글 삭제가 완료되었습니다.");
                     listAll(community_no);
                  }
               }
            });
         }
      }
      
   </script>
      
</head>
   <body>
      <div id="replyContainer">
         
         <%-- 댓글 입력 화면 --%>
         <form id="replyForm" name="replyForm">
            <div class="panel panel-default">
               <table class="table">
                  <tbody>
                     <tr>
                        <td class="col-md-1">작성자</td>
                        <td class="col-md-3 text-left">
                           <input type="text" name="client_id" id="client_id" value="<c:out value='${sessionScope.admin_info.admin_id}'/>" readonly="readonly" />
                        </td>
                        <td class="col-md-1">비밀번호</td>
                        <td class="col-md-3 text-left">
                           <input type="password" name="reply_pw" id="reply_pw" maxlength="18" class="form-control" />
                        </td>   
                        <td class="col-md-4">
                           <button type="button" id="replyInsertBtn" class="dosirakBtn1">저장</button>
                        </td>
                     </tr>
                     <tr>
                        <td class="col-md-1">댓글내용</td>
                        <td colspan="4" class="col-md-11 text-left">
                           <textarea name="reply_contents" id="reply_contents" class="form-control" rows="3"></textarea>
                        </td>
                     </tr>
                  </tbody>
               </table>
            </div>
         </form>
         
         
         <%-- 리스트 영역 --%>
         <div id="reviewList">
            <div id="item-template" class="panel panel-success">
               <div class="panel-heading">
                  <h3 class="panel-title">
                     <span class="name"></span>
                     <span class="date"></span>
                        <button type="button" data-btn="upBtn" class="btn btn-default gap">수정하기</button>
                        <button type="button" data-btn="delBtn" class="btn btn-default gap">삭제하기</button>
                  </h3>
               </div>
               <div class="panel-body"></div>
            </div>
         </div>
         
      </div>
   </body>
</html>