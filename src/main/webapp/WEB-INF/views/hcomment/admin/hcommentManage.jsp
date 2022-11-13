<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
button {
   margin: auto;
   background-color: rgba(0, 0, 0, 0);
   border: 0;
   outline: 0;
}

th, td {
   text-align: center;
}

#reviewList>div {
   margin: auto;
   text-align: center;
}

#here{
   display:none;
}


#dateCheck{
	display:none;
	margin-top: 3px;
	margin-bottom: 3px;
}



</style>


</head>
<body>
	  
      <h3>운동 게시판 - 댓글 전체 관리</h3>
      
       <%-- ==================== 검색 기능 시작 ========================= --%>
            <div class="well">
               <form id="f_search" name="f_search" class="form-inline">
               
                  <%-- 페이징 처리를 위한 파라미터 --%>
                  <input type="hidden" name="pageNum" id="pageNum" value="${pageMaker.cvo.pageNum}">
                  <input type="hidden" name="amount" id="amount" value="${pageMaker.cvo.amount}">
                 
                  <h3><span class="label label-success">검색조건</span> </h3>
                  <div class="form-group">
                     <select id="search" name="search" class="form-control">
                        <option value="all">전체</option>
                        <option value="client_id">작성자</option>
                        <option value="health_comment_contents">내용</option>
                     </select> 
                  </div>
                  
                  <div class="form-group" id="textCheck" >
                     <input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" class="form-control">
                  </div>
                  
                  <div class="form-group" id="dateCheck">
                  		<input type="date" name="start_date" id="start_date" placeholder="시작일자" class="form-control">
                  		<input type="date" name="end_date" id="end_date" placeholder="종료일자" class="form-control">
                  </div>
                  
                  <button type="button" id="searchData" class="dosirakBtn1" style="display:inline-block;">&nbsp;&nbsp;검색&nbsp;&nbsp;</button>
                  <button type="button" id="excelDownBtn" class="btn btn-primary" style="display:inline-block;">Excel Down</button>
               </form>
               
            </div>   
            
             <select id="change_amount" name="change_amount" onchange="changeSelect()">
               	<option value="10" <c:if test="${pageMaker.cvo.amount eq 10}">selected='selected'</c:if>>10개씩 조회</option>
               	<option value="20" <c:if test="${pageMaker.cvo.amount eq 20}">selected='selected'</c:if>>20개씩 조회</option>
               	<option value="30" <c:if test="${pageMaker.cvo.amount eq 30}">selected='selected'</c:if>>30개씩 조회</option>
             </select><br/>
      <%-- ==================== 검색 기능 종료 ========================= --%>


      <form name="comment_no_data" id="comment_no_data" method="get">
         <input type="hidden" id="health_comment_no" name="health_comment_no" />
      </form>

      <table class="table table-condensed">
         <thead>
            <tr>   
               <th class="text-center col-md-1" style="visibility: hidden;" id="here">댓글번호</th>
               <th class="text-center col-md-3" >글제목</th>
               <th class="text-center col-md-4">글내용</th>
               <th class="text-center col-md-1">아이디</th>
               <th class="text-center col-md-1">작성일</th>
               <th class="text-center col-md-1">삭제</th>
            </tr>
         </thead>

         <tbody id="hcommentList">
            <c:choose>
               <c:when test="${not empty list}">
                  <c:forEach var="hcomment" items="${list}">
                     <tr id="item-template">
                     	<td class="health_comment_no" data-health_comment_no="${hcomment.health_comment_no}" style="visibility: hidden;" id="here">${hcomment.health_comment_no}</td>
                        <td class="health_title" style="white-space:nowarp;">${hcomment.health_title}</td>
                        <td class="health_comment_contents">${hcomment.health_comment_contents}</td>
                        <td class="client_id">${hcomment.client_id}</td>
                        <td class="reg_date">${hcomment.reg_date}</td>
                        <td><button type="button" data-btn="delBtn" class="dosirakBtn3">삭제</button></td>
                     </tr>
                  </c:forEach>
               </c:when>

               <c:otherwise>
                  <tr>
                     <td colspan="6">등록된 게시글이 존재하지 않습니다.</td>
                  </tr>
               </c:otherwise>
            </c:choose>


         </tbody>

      </table>
      
      <%-- ======== 리스트 종료 ============ --%>
      
      
      <%-- ======== 페이징 처리를 커스텀태그(pagination)를 정의============ --%>
      <tag:pagination endPage="${pageMaker.endPage}" startPage="${pageMaker.startPage}" amount="${pageMaker.cvo.amount}" prev="${pageMaker.prev}" 
      pageNum="${pageMaker.cvo.pageNum}" next="${pageMaker.next}" />


      <script type="text/javascript">
         $(function() {
        	 
        	 let word = "<c:out value='${HCommentVO.keyword}'/>";
        	 
        	 if(word!=""){
        		 
        		 $("#keyword").val("<c:out value='${HCommentVO.keyword}'/>");
        		 
        		 $("#search").val("<c:out value='${HCommentVO.search}'/>");
        	
        	 }
        	 
        	
            $(".paginate_button a").click(function(e) {
            	
                     e.preventDefault();
                     
                     $("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
                     	   
                     goPage();
                     
             });
            
            <%--검색어 입력 후 엔터 눌렀을땐 이동안함 꼭 마우스로 클릭해야함 근처에있는 버튼을 찾기 때문--%>
    		$("#keyword").bind("keydown",function(event){
    			
    			if(event.keyCode == 13){
    				
    				event.preventDefault();
    			}
    		});

    		
    		<%--검색 대상이 변경될 때마다 처리 이벤트--%>
                   $("#search").change(function() {
                	  
                 		   if($("#search").val()=="all"){
                       			$("#keyword").val("게시글 전체를 조회합니다.");
                    			}else if($("#search").val()!="all"){
                       			$("#keyword").val("");
                       			$("#keyword").focus();
                   			}
                	 
                    		
                   });
                   
                 
             <%--검색 버튼 클릭 시 처리 이벤트--%>  
             $("#searchData").click(function() {
            	 
                   if($("#search").val()!="all"){ // 제목/내용/작성자 선택시 검색어 유효성 체크.
                       if(!chkData("#keyword","검색어를")) return;
                   }
                   
                   $("#pageNum").val(1); // 검색버튼을 클릭 시 새로 검색을 한다는 의미이므로 1페이지로 이동합니다.
                      
                   goPage();
                      
             });
             
             
             //엑셀 다운로드 버튼 클릭 시 처리 이벤트 
             $("#excelDownBtn").click(function(){
            	 $("#f_search").attr({
            		"method" : "get",
            		"action" : "/adminhreplies/hcommentExcel"
            	 });
            	 
            	 $("#f_search").submit();
             });
             
             
         });
         
		function changeSelect(){
        	 
        	 let amount = $("#change_amount option:selected").val(); //몇개씩 조회할 것인지 가져옴
        	 
        	 $("#amount").val(amount);
        	 
        	 $("#pageNum").val(1); 
             
             goPage();
        	 
         }
         
         <%--검색을 위한 실질적인 처리 함수--%>
         function goPage() {
        	 
        	 if($("#search").val() == "all"){  // 검색 대상이 all이면 그냥 게시글 전체를 가져오는것이니, 
     			
     			$("#keyword").val(""); //검색어를 입력했다해도 빈문자열로 바꿔서 가져갈 것이다. 
     		}	
        	 
            $("#f_search").attr({
               "method" : "post",
               "action" : "/adminhreplies/hcommentManage"
            });
            
            $("#f_search").submit();
         }
         
         
         $(document).on("click","button[data-btn='delBtn']",function() {

                  if (confirm("댓글을 삭제하시겠습니까?")) {

                     let health_comment_no = $(this).parents().prev().prev().prev().prev().prev().prev().attr("data-health_comment_no"); //헬스 댓글번호(primary key)를 가져옴

                     $("#health_comment_no").attr("value",health_comment_no);

                     $("#comment_no_data").attr("action","/adminreporthreplies/remove");
                     
                     $("#comment_no_data").submit();
                  }

         });
      </script>

      <!-- ################################################################################################ -->
      <!-- / main body -->
      <div class="clear"></div>


</body>
</html>