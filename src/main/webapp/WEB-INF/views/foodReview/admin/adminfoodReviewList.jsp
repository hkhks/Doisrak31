<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>    


   <script type="text/javascript">
   
   
   
      
   
      $(function() {
         
         // 삭제버튼 클릭시 삭제 처리
         $(".dosirakBtn3").click(function() {
            if(confirm("삭제 하시겠습니까?")) {
            	
               let review_no = $(this).parents().parents().attr("data-num");
               
               goUrl = "/foodReview/admin/adminReviewDelete";
               
               $("#review_no").attr("value",review_no);
               
               $("#del").attr("action",goUrl);
               
               $("#del").submit();
               
               alert("삭제되었습니다.");
               
            } else {
               alert("취소되었습니다.");
            }
            
            });
      
         
         /* //  검색 후 검색 대상과 검색 단어 출력
         let word ="<c:out value='${AdminReviewVO.keyword}' />";
         let value="";
         if(word!=""){
            $("#keyword").val("<c:out value='${AdminReviewVO.keyword}' />");
            $("#search").val("<c:out value='${AdminReviewVO.search}' />");
            
            if($("#search").val()!='review_contents'){
               //:contains()는 특정 텍스트를 포함한 요소반환
               if($("#search").val()=='review_contents') value = "#list tr td.goDetail";
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
         $("#searchBtn").click(function() {
            if($("#search").val()!="all"){ // 제목 /내용/작성자 선택시 검색어 유효성 체크.
               if(!chkData("#keyword","검색어를")) return;
            }
            $("#pageNum").val(1);
            goPage();
            
         }); */
         
         $(".paginate_button a").click(function(e) {
            e.preventDefault();
            $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
            goPage();
         });  
         
      });
      
       /* // 검색을 위한 실질적인 처리 함수
      function goPage(){
        
         $("#f_search").attr({
            "method":"get",
            "action":"/foodReview/admin/adminfoodReviewList"
         });
         $("#f_search").submit();
      } 
       */
   </script>

</head>
   <body>
      <div class="wrapper row3">
         <main class="container clear">
            <h2 class="sub-header">Review 관리</h2>
            
         <%-- ==================== 검색 기능 ========================= --%>
            
               <form id="f_search" class="form-inline">
                  <%-- 페이징 처리를 위한 파라미터 --%>
                  <input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum}">
                  <input type="hidden" name="amount" value="${pageMaker.cvo.amount}">
               </form>
                  <!-- <h3><span class="label label-success">검색조건</span> </h3>
                  <div class="form-group">
                     <select id="search" name="search" class="form-control">
                        <option value="reveiw_score">점수</option>
                        <option value="review_name">작성자</option>
                        <option value="review_contents">내용</option>
                        <option value="review_date">작성일자</option>
                     </select>
                  </div>
                  <div class="form-group" id="textCheck">
                     <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control">
                  </div>
                  <div class="form-group" id="dataCheck">   
                     <input type="date" name="start_date" id="start_date" placeholder="시작일자" class="form-control">
                     <input type="date" name="end_date" id="end_date" placeholder="종료일자" class="form-control">
                  </div>
                  <button type="button" id="searchBtn" class="btn btn-primary">Search</button>
                  <button type="button" id="allSearchBtn" class="btn btn-primary" >All Search</button> -->
               
             
         
         <%-- ===================== 게시판 리스트 ======================= --%>
         
          <form id="del" name="del" method="get">
                <input type="hidden" id="review_no" name="review_no" />
          </form>
                                 
                                 
            <div class="table-responsive table-height">
               <table class="table table-bordered" style="width: 80%;">
                  <thead>
                     <tr>
                        <th class="text-center" >글번호</th>
                        <th class="text-center">작성일</th>
                        <th class="text-center">내용</th>
                        <th class="text-center">점수</th>
                        <th class="text-center">작성자</th>
                        <th class="text-center">삭제</th>
                     </tr>
                  </thead>
                  <tbody>
                     <!-- 데이터 출력 -->
                     <c:choose>
                        <c:when test="${not empty adminReviewList }">
                           <c:forEach var="adminReview" items="${adminReviewList}" varStatus="status">
                                 
                              <tr class="text-center" data-num="${adminReview.review_no}">
                              
                                 <td>${count - status.index}</td>
                                 <td class="goDetail tal">${adminReview.review_date}</td>
                                 <td>${adminReview.review_contents}</td>
                                 <td class="name">${adminReview.review_score}</td>
                                 <td class="name">${adminReview.review_name}</td>
                                 <td>
                                 	<input type="button" value="삭제" name="review_no" class="dosirakBtn3" id="DeleteBtn">
                                 </td>
                              
                              </tr>
                           </c:forEach>
                        </c:when>
                        <c:otherwise>
                           <tr>
                              <td colspan="4" class="text-center">등록된 게시물이 존재하지 않습니다.</td>
                           </tr>
                        </c:otherwise>
                     </c:choose>
                  </tbody>
               </table>
            </div>

            <%-- ======== 페이징 처리를 커스텀태그(pagination)를 정의============ --%>
            <tag:pagination pageNum="${pageMaker.cvo.pageNum }" amount="${pageMaker.cvo.amount }" startPage="${pageMaker.startPage }" 
            endPage="${pageMaker.endPage }" prev="${pageMaker.prev }" next="${pageMaker.next }"/>
         
      </main>
      </div>
   </body>
</html>