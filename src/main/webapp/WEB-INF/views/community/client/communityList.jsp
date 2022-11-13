<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
      <style type="text/css">
           
          
     
        
         table,table-striped{
            border-left: none;
             border-right: none;
         }
       
          .table>tbody>tr>td, 
          .table>tbody>tr>th {
             text-align: center;
             vertical-align: middle;
             border-left: none;
             border-right: none;
         }
    
    
          th{
             color: #000000;
             background: ghostwhite;
             border-left: none;
             border-right: none;
             
             }
             
          td{
             background-color: #FFFFFF;
             font-size: 15px;
          }
             
          .container {
             color: #000000;
             padding-top: 0px;
             padding-right: 0px;
             padding-bottom: 40px;
             padding-left: 0px;
         }
         
         .pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover, .pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover {
             z-index: 2;
             color: #fff;
             cursor: default;
             background-color: #a5d610;
             border-color: #a5d610;
         }
         
         .pagination>li>a, .pagination>li>span {
             position: relative;
             float: left;
             padding: 6px 12px;
             margin-left: -1px;
             line-height: 1.42857143;
             color: #337ab7;
             text-decoration: none;
             background-color: #fff;
             border: 1px solid #ddd;
         }
          
          
          
         .dosirakBtn1{
   text-decoration:none;
   font-family:Arial;
   box-shadow:inset #a4d610 0px 5px 8px -1px;
   o-box-shadow:inset #a4d610 0px 5px 8px -1px;
   -moz-box-shadow:inset #a4d610 0px 5px 8px -1px;
   -webkit-box-shadow:inset #a4d610 0px 5px 8px -1px;
   background:#99c40e;
   background:-o-linear-gradient(90deg, #99c40e, #88ad10);
   background:-moz-linear-gradient( center top, #99c40e 5%, #88ad10 100% );
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #99c40e), color-stop(1, #88ad10) );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#99c40e', endColorstr='#88ad10');
   background:-webkit-linear-gradient(#99c40e, #88ad10);
   background:-ms-linear-gradient(#99c40e, #88ad10);
   background:linear-gradient(#99c40e, #88ad10);
   text-indent:0px;
   line-height:23px;
   -moz-border-radius:6px;
   -webkit-border-radius:6px;
   border-radius:6px;
   text-align:center;
   vertical-align:middle;
   display:inline-block;
   font-size:12px;
   color:#ffffff;
   width:auto;
   height:auto;
   padding:5.2px;
   text-shadow:#7d7d7d 0px 1px 0px;
   border-color:#ffffff;
   border-width:0px;
   border-style:solid;
}

.dosirakBtn1:active {
   box-shadow:inset #a4d610 0px 5px 8px -1px,#658205 0px 0 0px;
   o-box-shadow:inset #a4d610 0px 5px 8px -1px,#658205 0px 0 0px;
   -moz-box-shadow:inset #a4d610 0px 5px 8px -1px,#658205 0px 0 0px;
   -webkit-box-shadow:inset #a4d610 0px 5px 8px -1px,#658205 0px 0 0px;
   position:relative;
   top:5px
}

.dosirakBtn1:hover {
   background:#88ad10;
   background:-o-linear-gradient(90deg, #88ad10, #99c40e);
   background:-moz-linear-gradient( center top, #88ad10 5%, #99c40e 100% );
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #88ad10), color-stop(1, #99c40e) );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#88ad10', endColorstr='#99c40e');
   background:-webkit-linear-gradient(#88ad10, #99c40e);
   background:-ms-linear-gradient(#88ad10, #99c40e);
   background:linear-gradient(#88ad10, #99c40e);
} 
          
         
      </style>
      <script type="text/javascript">
            $(function() {
            
               // 검색 후 검색 대상과 검색 단어 출력
               let word ="<c:out value='${communityVO.keyword}' />";
               let value="";
               if(word!=""){ 
                  $("#keyword").val("<c:out value='${communityVO.keyword}' />");
                  $("#search").val("<c:out value='${communityVO.search}' />");
                  
                  if($("#search").val()!='community_contents'){
                     //:contains()는 특정 텍스트를 포함한 요소반환
                     if($("#search").val()=='community_title') value = "#list tr td.goDetail";
                     else if($("#search").val()=='client_id') value="#list tr td.name";
                     console.log($(value+":contains('"+word+"')").html());
                     
                     $(value+":contains('"+word+"')").each(function() {
                        let regex = new RegExp(word,'gi');
                        $(this).html($(this).html().replace(regex,"<span class='required'>"+word+"</span>"));
                     });
                  }
                  
               }
               
               // 입력 양식 enter 제거
               $("#keyword").bind("keydown", function(evnet){
                  if(event.keyCode == 13){
                     event.preventDefault();
                  }
               });
               
               // 검색 대상이 변경될 때마다 처리 이벤트
               $("#search").change(function() {
                  if($("#search").val()=="all"){
                     $("#keyword").val("전체 데이터 조회합니다.");
                  }else if($("#search").val()!="all"){
                     $("#keyword").val("");
                     $("#keyword").focus();
                  }
               });
               
               // 검색 버튼 클릭 시 처리 이벤트
               $("#searchData").click(function() {
                  if($("#search").val()!="all"){ // 제목 /내용/작성자 선택시 검색어 유효성 체크.
                     if(!chkData("#keyword","검색어를")) return;
                  }
                  $("#pageNum").val(1);
                  goPage();
                  
               });
               
               
               // 글쓰기 버튼 클릭시 처리 이벤트.
               $("#insertFormBtn").click(function() {
                  
                  location.href = "/community/client/writeForm";
                  
               });
               
               
               // 제목 클릭시 상세 페이지 이동을 위한 처리 이벤트
               $(".goDetail").click(function() {
                  let community_no = $(this).parents("tr").attr("data-num");
                  $("#community_no").val(community_no);
                  console.log("글번호 : " + community_no);
                  
                  let community_category_no = $(this).parents("tr").attr("data-numc");
                  $("#community_category_no").val(community_category_no);
                  console.log("카테고리번호 : " + community_category_no);
                  
                  // 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
                  $("#detailForm").attr({
                     "method":"get",
                     "action":"/community/client/communityDetail"
                  });
                  $("#detailForm").submit();
               });
               
               $(".paginate_button a").click(function(e) {
                  e.preventDefault();
                  $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
                  goPage();
               });
               
            });
            
            // 검색을 위한 실질적인 처리 함수
            function goPage(){
               if($("#search").val()=="all"){
                  $("#community_category_no").val($("#community_category_no"));
                  $("#keyword").val("");
               }
               $("#f_search").attr({
                  "method":"get",
                  "action":"/community/client/communityList"
               });   
               $("#f_search").submit();
            }
            
         
            
            
         </script>
      
</head>
<body>
<!-- 이미지를 위한-->      
<!-- <div class="wrapper row2 bgded"
      style="background-image: url('/resources/images/common/community3.jpg');">
      <div class="overlay">
         
      </div>
   </div>  -->
   <div id="hBoardList_board_img" class="wrapper row2 bgded"
   style="background-image: url('/resources/images/common/community3.jpg');">
   <div class=" hBoardList_name_location">
      <div id="breadcrumb" class="hBoard_Name">커뮤니티</div>
   </div>
</div>
<!-- 이미지를 위한 끝-->      
<div class="wrapper row3" style="padding-bottom:45px; padding-top:50px;">
   <main class="container clear">
   
      <div class="contentContainer container">
         <c:if test="${pageMaker.cvo.community_category_no == 0}">
         
         
         <div class="main_contents">
            
            <hr class="main_contents_hr">
            <div class="head"><span class="bold">자유 게시판</span></div>
            <hr class="main_contents_hr">
            
            <div class="hBoardListContents">Dosirak31과 함께 <span class="bold">건강한 삶</span> 을 공유하세요.</div>
         </div>
         
         </c:if>
         <c:if test="${pageMaker.cvo.community_category_no == 1}">
            
         <div class="main_contents">
            
            <hr class="main_contents_hr">
            <div class="head"><span class="bold">Q & A 게시판</span></div>
            <hr class="main_contents_hr">
            
            <div class="hBoardListContents">Dosirak31은 <span class="bold"> 최상의 서비스 </span> 를 제공해드리기 위해</div>
            <div class="hBoardListContents">고객님의 <span class="bold"> 작은 목소리에도 귀 기울이겠습니다.</span></div>
         </div>
         
         </c:if>      
            <form id="detailForm">
               <input type="hidden" id="community_no" name="community_no" />
               <input type="hidden" id="community_category_no" name="community_category_no" />
            </form>
            
            <form id="writeForm">
               <input type="hidden" id="community_category_no" name="community_category_no" />
            </form>
            
               
            
            <%-- ==================== 리스트 시작 ========================= --%>
            <div id="communityList" class="table-height">
               <table summary="게시판 리스트" class="table table-striped">
                  <thead>
                     <tr>
                        <th data-value="community_no" class="order text-center col-md-1" >글번호</th>
                        <th class="text-center col-md-4">글제목</th>
                        <th class="text-center col-md-2">작성자</th>
                        <th data-value="community_date" class="order col-md-2 text-center">작성일</th>
                        <th class="text-center col-md-1">조회수</th>
                        <th class="text-center col-md-4">이미지</th>
                     </tr>
                  </thead>
                  <tbody id="list" class="table-striped">
                     <!-- 데이터 출력 -->
                     <c:choose>
                        <c:when test="${not empty communityList}">
                           <c:forEach var="community" items="${communityList}" varStatus="status">
                              <tr class="text-center" data-num="${community.community_no}" data-numc="${community.community_category_no}">
                                 <td>${community.community_no}</td>
                                 <c:if test="${community.community_closed == 1}">
                                 
                                    <c:choose>
                                       <c:when test="${community.client_id eq sessionScope.client_info.client_id || sessionScope.admin_info.admin_id != null}">
                                          <td class="goDetail text-left" style="text-align: left;">
                                          <c:out value="${community.community_title}" />   
                                          <c:if test="${community.reply_cnt > 0}"><span class="reply_count">[${community.reply_cnt}]</span></c:if>
                                          </td>
                                       </c:when>
                                       <c:otherwise>
                                       <td class="text-left" style="text-align: left;">
                                       <span><img alt="비밀글로고" src="/resources/images/common/secret.png" style="width:20px; height:20px;">&nbsp;&nbsp;&nbsp;</span>해당 게시물은 비밀글입니다.
                                       </td>
                                       </c:otherwise>
                                    </c:choose>
                                 
                                 </c:if>
                                 <c:if test="${community.community_closed == 0}">
                                 <td class="goDetail text-left" style="text-align: left;">
                                    <c:if test="${community.community_category_no == 1}"><span><img alt="qna로고" src="/resources/images/common/qna3.png" style="width:35px; height:15px;">&nbsp;&nbsp;</span></c:if>
                                    <c:if test="${community.community_notify == 1}"><span style="color: blue; font-weight: bold;">[공지사항]
                                    ${community.community_title} </span></c:if> 
                                    <c:if test="${community.community_notify == 0}">${community.community_title}</c:if> 
                                    <c:if test="${community.reply_cnt > 0}"><span class="reply_count">[${community.reply_cnt}]</span></c:if>
                                    <c:if test="${community.reply_cnt > 0 && community.community_category_no == 1}"><span> [답변완료]</span></c:if>
                                 </td>
                                 </c:if>
                                 <c:if test="${community.client_id != null && community.admin_id == null}">
                                 <td class="name">${community.client_id}</td>
                                 </c:if>
                                 <c:if test="${community.admin_id != null && community.client_id == null}">
                                 <td class="name">${community.admin_id}</td>
                                 </c:if>
                                 <td class="text-center">${community.community_date}</td>
                                 <td class="text-center">${community.community_hits}</td>
                                 <td>
                                    <c:if test="${not empty community.file_thumb}">
                                       <img src="/dosirak31img/community/thumbnail/${community.file_thumb}" style="height: 100px;"/>
                                    </c:if>
                                    <c:if test="${empty community.file_thumb}">
                                       <img src="/resources/images/common/noimage.png" style="height: 100px;" />
                                    </c:if>
                                 </td>
                              </tr>
                           </c:forEach>
                        </c:when>
                        <c:otherwise>
                           <tr>
                              <td colspan="5" class="tac text-center">등록된 게시물이 존재하지 않습니다.</td>
                           </tr>
                        </c:otherwise>
                     </c:choose>
                  </tbody>
               </table>
            </div>
               <%-- ==================== 리스트 종료 ========================= --%>
               
               <%-- ==================== 글쓰기 버튼 출력 시작 ========================= --%>
            <div class="contentBtn text-right">
               <c:if test="${sessionScope.client_info.client_id != null || sessionScope.admin_info.admin_id != null}">
                  <input type="button" value="글쓰기" id="insertFormBtn" class="dosirakBtn">
               </c:if>
            </div>
               <%-- ==================== 글쓰기 버튼 출력 종료 ========================= --%>
               
            <%-- ======== 페이징 처리를 커스텀태그(pagination)를 정의============ --%>
            <tag:pagination endPage="${pageMaker.endPage}" startPage="${pageMaker.startPage}" amount="${pageMaker.cvo.amount}" 
            prev="${pageMaker.prev}" pageNum="${pageMaker.cvo.pageNum}" next="${pageMaker.next}" />      
               
               
            <%-- ==================== 검색 기능 시작 ========================= --%>
            <div id="communitySearch" class="contentBtn text-center">
               <form id="f_search" name="f_search" class="form-inline">
                  <%-- 페이징 처리를 위한 파라미터 --%>
                  <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
                  <input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
                  <input type="hidden" id="community_category_no" name="community_category_no" value="${pageMaker.cvo.community_category_no}" />
                  <div class="form-group">
                     <select id="search" name="search" class="form-control">
                        <option value="all">전체</option>
                        <option value="community_title">제목</option>
                        <option value="community_contents">내용</option>
                        <option value="client_id">작성자</option>
                     </select>
                     <input type="text" name="keyword" id="keyword" value="검색어를 입력하세요" class="form-control">
                     <button type="button" id="searchData" class="dosirakBtn1">&nbsp;&nbsp;검색&nbsp;&nbsp;</button>
                  </div>
               </form>
            </div>   
               <%-- ==================== 검색 기능 종료 ========================= --%>   
               
         </div>
   </main>      
</div>
   </body>
</html>