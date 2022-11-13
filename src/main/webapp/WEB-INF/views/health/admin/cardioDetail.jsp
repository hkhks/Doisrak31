<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<!-- Bootstrap core CSS -->
<link href="/resources/include/dist/css/bootstrap.min.css"
   rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/include/dist/css/jumbotron-narrow.css"
   rel="stylesheet">

<script
   src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

 <script type="text/javascript">
         $(function(){
            /*수정 버튼 클릭 시 처리 이벤트*/
            $("#cardioUpdateFormBtn").click(function(){
               goUrl = "/health/admin/healthUpdateForm";
                $("#cardioData").attr("action",goUrl);
                $("#cardioData").submit();
            })
            
            /* 삭제 버튼 */
            $("#cardioDeleteBtn").click(function(){
               if(confirm("정말 삭제하시겠습니까?")){
                    goUrl = "/health/admin/healthBoardDelete";
                    $("#cardioData").attr("action",goUrl);
                    $("#cardioData").submit();
            }
            })
            
            /*삭제버튼 클릭 시 댓글 확인 후 처리 이벤트
            $("#cardioDeleteBtn").click(function(){
               $.ajax({
                  url:"/board/replyCnt",
                  type:"post",
                  data:"health_no="+$("#health_no").val(),
                  dataType:"text",
                  error:function(){
                     alert("시스템 오류")
                  },
                  success:function(resultData){
                     if(resultData==0){//댓글이 존재하지 않을 경우
                        $("#pwdChk").css("visibility","visible");
                        $("#msg").text("작성시 입력한 비밀번호를 입력해 주세요.").css("color","#000099");
                        buttonCheck=2;
                     }else{ //댓글이 존재하는 경우
                        alert("댓글 존재시 게시물 작성할 수가 없습니다.\n댓글 삭제 후 다시 확인해주세요.");
                        return;
                     }
                  }
               })
            })*/
           
            //글쓰기 버튼
            $("#cardioInsertFormBtn").click(function(){
               location.href="/health/admin/healthWriteForm";
            })
            
            //목록 버튼
            $("#cardioListBtn").click(function(){
               location.href="/health/admin/cardioList?health_category_no=2"
            })
          
         });
</script>

</head>
   <div class="wrapper row3">
         <div class="content">
            <div id="gallery">
               <figure>
                  <form name="cardioData" id="cardioData" method="post">
                        <input type="hidden" name="health_no" value="${cardioDetail.health_no }"/>
                        <input type="hidden" name="health_category_no" value="${cardioDetail.health_category_no }"/>
                     </form>
                  
                  <!-------------------------------------------------- 동영상 & 소개 공간 ---------------------------------------------------->
                  <div>
                  <iframe width="600" height="500"
                     src="https://www.youtube.com/embed/${cardioDetail.health_url }?mute=1&autoplay=1"></iframe>
                     <input type="hidden" name="health_url" value="${weightDetail.health_url }"/>
               </div>
               <div class="health_title2">${cardioDetail.health_title }</div>
               <div>
                  <div class="health_board_info2">
                     <img class="health_logoImg2"
                        src="/resources/images/common/Logo.png" />
                  </div>
                  <div class="health_writer_hits2">${cardioDetail.admin_id }</div>
                  <div class="health_writer_hits2">${cardioDetail.health_hits }views</div>
               </div>

               <hr class="health_hr" />
               <div class="health_comments_part">
                  <h3>Detail</h3>
                  <div>${cardioDetail.health_contents }</div>
                  </div>
                  <div>
                     <input type="button" value="글수정" id="cardioUpdateFormBtn" class="dosirakBtn1" />
                         <input type="button" value="글삭제" id="cardioDeleteBtn" class="dosirakBtn1" />
                         <input type="button" value="글쓰기" id="cardioInsertFormBtn" class="dosirakBtn1" />
                         <input type="button" value="목록" id="cardioListBtn" class="dosirakBtn1" />
                  </div>
               </figure>
            </div>
         </div>
         <div class="clear"></div>
   </div>
</body>
</html>