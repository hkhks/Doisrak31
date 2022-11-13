<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>


<script type="text/javascript">
   $(function() {
      <!-- 이미지 클릭 시 운동 동영상 상세 페이지 이동을 위한 처리 이벤트 -->
      $(".goImgDetail").click(function() {
         let health_no = $(this).parents("div").attr("data-num");
         $("#health_no").val(health_no);
         console.log("헬스번호 : " + health_no);
         $("#detailForm").attr({
            "meothd" : "get",
            "action" : "/health/cardioDetail"
         });
         $("#detailForm").submit();
      });
      
               //검색 후 검색 대상과 검색 단어 출력
               let word="<c:out value='${data.keyword}'/>";
               let value="";
               if(word!=""){
                  $("#keyword").attr("readonly",false);
                  $("#keyword").val("<c:out value='${data.keyword}'/>");
                  $("#search").val("<c:out value='${data.search}'/>");
               
                   
                  if($("#search").val()!='health_contents'){
                     //:contains()는 특정텍스트를 포함한 요소반환
                     
                        if($("#search").val()=='health_title') value="#list tr td.goDetail";
                        //$("#list tr td.name:cotains('용기')").html()=>용기에 대한 제목 또는 작성자
                        console.log($(value+":contains('"+word+"')").html());
                        //검색단어 빨간색으로 바꾸기
                        $(value+":contains('"+word+"')").each(function(){
                           let regex=new RegExp(word,'gi');
                           $(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
                        });
                  
                  }
               }
             
                //입력 양식 enter제거
                $("#keyword").bind("keydown",function(event){
                   if(event.keyCode==13){
                      event.preventDefault();
                   }
                });
                
                //검색대상이 변경될 때마다 처리 이벤트
                $("#search").change(function(){
                   if($("#search").val()=="all"){
                      $("#keyword").val("전체 데이터 조회합니다.");
                   }else if($("#search").val()!="all"){
                      $("#keyword").attr("readonly",false);
                      $("#keyword").val("");
                      $("#keyword").focus();
                   }
                });
                
                //검색버튼 클릭 시 처리이벤트
                $("#searchData").click(function(){
                   if($("#search").val()!="all"){
                      if(!chkData("#keyword","검색어를")) return;
                   }
                   $("#pageNum").val(1);
                   goPage();
                })
    
                // 페이징 처리 이벤트
               $(".paginate_button a").click(function(e){
                  e.preventDefault();
                  $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
   
                  goPage();
               })
            });//최상위함수
            
            //검색을 위한 실질적인 처리 함수
            function goPage(){
               if($("#search").val()=="all"){
                  $("#keyword").val("");
               }
               $("#f_search").attr({
                  "method":"get",
                  "action":"/health/cardioList"
               })
               $("#f_search").submit();
            }
</script>

</head>

<div id="hBoardList_board_img" class="wrapper row2 bgded"
   style="background-image: url('/resources/images/common/health_List.jpg');">
   <div class=" hBoardList_name_location">
      <div id="breadcrumb" class="hBoard_Name">유산소 운동</div>
   </div>
</div>
<div>
   <main id="health_main" style="padding-top:60px; padding-bottom:40px">
      <!-- main body -->
      <div >
         <div>
            <figure>
               
               <!-- 히든 상세 게시판 -->
               <form id="detailForm">
                  <input type="hidden" id="health_no" name="health_no" />
               </form>

               <!-------------------------------------------------- 유산소 게시판 운동 리스트(이미지) 시작 ---------------------------------------------------->
               <div id="cardioList" class="health_contents">


                  <c:choose>
                     <c:when test="${not empty cardioList }">
                        <c:forEach var="imgBoard" items="${cardioList }"
                           varStatus="status">
                           <div class="health_div">
                              <div data-num="${imgBoard.health_no }">
                                 <img class="goImgDetail img_size"
                                    src="/dosirak31img/health/${imgBoard.health_img }" />
                              </div>
                              <div data-num="${imgBoard.health_no }" class="all_contents">
                                 <div class="goDetail health_title white_space">${imgBoard.health_title }</div>
                                 <div>
                                    <div class="health_board_info">
                                       <img class="health_logoImg"
                                          src="/resources/images/common/Logo.png" />
                                    </div>
                                    <div class="health_writer_hits">${imgBoard.admin_id }</div>
                                    <div class="health_writer_hits">${imgBoard.health_hits }views</div>
                                 </div>
                              </div>
                           </div>
                        </c:forEach>
                     </c:when>
                     <c:otherwise>
                        <div class="no_page">
                           등록된 게시물이 없습니다.
                        </div>
                     </c:otherwise>
                  </c:choose>
               </div>
            </figure>
         </div>

         <!-------------------------------------------------- 유산소 게시판 운동 리스트(이미지) 끝 ---------------------------------------------------->

         <!-------------------------------------------------- 게시판 페이지 바 시작 ---------------------------------------------------->
         <tag:pagination pageNum="${pageMaker.cvo.pageNum }"
            amount="${pageMaker.cvo.amount }"
            startPage="${pageMaker.startPage }" endPage="${pageMaker.endPage }"
            prev="${pageMaker.prev }" next="${pageMaker.next }"  />

         <!-------------------------------------------------- 게시판 페이지 바 끝 ---------------------------------------------------->

         <!-------------------------------------------------- 검색 기능 시작 ---------------------------------------------------->
         <div id="boardSearch" class="text-right">
            <form id="f_search" name="f_search" class="form-inline search_bar">
               <%--페이징 처리를 위한 파라미터 --%>
               <input type="hidden" name="health_category_no" value="2"> <input
                  type="hidden" name="pageNum" id="pageNum"
                  value="${pageMaker.cvo.pageNum }"> <input type="hidden"
                  name="amount" id="amount" value="${pageMaker.cvo.amount }">
               <div class="form-group">
                  <select id="search" name="search" class="form-control">
                     <option value="all">전체</option>
                     <option value="health_title">제목</option>
                     <option value="health_contents">내용</option>
                  </select> <input type="text" name="keyword" id="keyword" value="전체 데이터를 조회" class="form-control" readonly="readonly"/>
                  <button type="button" id="searchData" class="dosirakBtn1">검색</button>
               </div>
            </form>
         </div>
         <!-------------------------------------------------- 검색 기능 끝 ---------------------------------------------------->

      </div>
      <!-- / main body -->
      <div class="clear"></div>
   </main>
</div>

<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="/resources/layout/scripts/jquery.min.js"></script>
<script src="/resources/layout/scripts/jquery.backtotop.js"></script>
<script src="/resources/layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>