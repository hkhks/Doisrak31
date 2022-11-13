<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<!-- Bootstrap core CSS -->
<link href="/resources/include/dist/css/bootstrap.min.css"
   rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/include/dist/css/jumbotron-narrow.css"
   rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
   src="/resources/include/dist/assets/js/ie-emulation-modes-warning.js"></script>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

 <script type="text/javascript">
         $(function(){
            /*수정 버튼 클릭 시 처리 이벤트*/
            $("#weightUpdateFormBtn").click(function(){
               goUrl = "/health/admin/healthUpdateForm";
                $("#weightData").attr("action",goUrl);
                $("#weightData").submit();
            })
            
            /* 삭제 버튼 */
            $("#weightDeleteBtn").click(function(){
               if(confirm("정말 삭제하시겠습니까?")){
                    goUrl = "/health/admin/healthBoardDelete";
                    $("#weightData").attr("action",goUrl);
                    $("#weightData").submit();
            }
            })
            
            /*삭제버튼 클릭 시 댓글 확인 후 처리 이벤트
            $("#weightDeleteBtn").click(function(){
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
            $("#weightInsertFormBtn").click(function(){
               location.href="/health/admin/healthWriteForm";
            })
            
            //목록 버튼
            $("#weightListBtn").click(function(){
               location.href="/health/admin/weightList?health_category_no=1"
            })
          
         });
</script>

</head>
   <div class="wrapper row3">      
         <div class="content">
            <div id="gallery">
               <figure>
                  <form name="weightData" id="weightData" method="post">
                        <input type="hidden" name="health_no" value="${weightDetail.health_no }"/>
                        <input type="hidden" name="health_category_no" value="${weightDetail.health_category_no }"/>
                      
                     </form>
                  <!-------------------------------------------------- 동영상 & 소개 공간 ---------------------------------------------------->
                  <div>
                  <iframe width="600" height="500"
                     src="https://www.youtube.com/embed/${weightDetail.health_url }?mute=1&autoplay=1"></iframe>
               </div>
               <div class="health_title2">${weightDetail.health_title }</div>
               <div>
                  <div class="health_board_info2">
                     <img class="health_logoImg2"
                        src="/resources/images/common/Logo.png" />
                  </div>
                  <div class="health_writer_hits2">${weightDetail.admin_id }</div>
                  <div class="health_writer_hits2">${weightDetail.health_hits }views</div>
               </div>

               <hr class="health_hr" />
               <div class="health_comments_part">
                  <h3>Detail</h3>
                  <div>${weightDetail.health_contents }</div>
                  </div>
                  <div>
                     <input type="button" value="글수정" id="weightUpdateFormBtn" class="dosirakBtn1" />
                         <input type="button" value="글삭제" id="weightDeleteBtn" class="dosirakBtn1" />
                         <input type="button" value="글쓰기" id="weightInsertFormBtn" class="dosirakBtn1" />
                         <input type="button" value="목록" id="weightListBtn" class="dosirakBtn1" />
                  </div>
               </figure>
            </div>
         </div>
         <div class="clear"></div>

   </div>
   
</body>
</html>