<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script type="text/javascript">
<!-- 이미지 클릭 시 운동 동영상 상세 페이지 이동을 위한 처리 이벤트 -->
   $(function() {
      $(".goImgDetail").click(function() {
         let health_no = $(this).parents("tr").attr("data-num");
         $("#health_no").val(health_no);
         console.log("헬스번호 : " + health_no);
         $("#detailForm").attr({
            "meothd" : "get",
            "action" : "/health/admin/cardioDetail"
         });
         $("#detailForm").submit();
      });
   });

   /*글쓰기 버튼 클릭 시 처리 이벤트*/
   $(function() {
      $("#insertFormBtn").click(function() {
         location.href = "/health/admin/healthWriteForm";
      });
      //검색 후 검색 대상과 검색 단어 출력
      let word = "<c:out value='${data.keyword}'/>";
      let value = "";
      if (word != "") {
         $("#keyword").val("<c:out value='${data.keyword}'/>");
         $("#search").val("<c:out value='${data.search}'/>");

         if ($("#search").val() != 'health_contents') {
            //:contains()는 특정텍스트를 포함한 요소반환

            if ($("#search").val() == 'health_title')
               value = "#list tr td.goDetail";
            //$("#list tr td.name:cotains('용기')").html()=>용기에 대한 제목 또는 작성자
            console.log($(value + ":contains('" + word + "')").html());
            //검색단어 빨간색으로 바꾸기
            $(value + ":contains('" + word + "')").each(
                  function() {
                     let regex = new RegExp(word, 'gi');
                     $(this).html(
                           $(this).html().replace(
                                 regex,
                                 "<span class='required'>" + word
                                       + "</span>"));
                  });

         }
      }

      //입력 양식 enter제거
      $("#keyword").bind("keydown", function(event) {
         if (event.keyCode == 13) {
            event.preventDefault();
         }
      });

      //검색대상이 변경될 때마다 처리 이벤트
      $("#search").change(function() {
         if ($("#search").val() == "all") {
            $("#keyword").val("전체 데이터 조회합니다.");
         } else if ($("#search").val() != "all") {
            $("#keyword").attr("readonly", false);
            $("#keyword").val("");
            $("#keyword").focus();
         }
      });

      //검색버튼 클릭 시 처리이벤트
      $("#searchData").click(function() {
         if ($("#search").val() != "all") {
            if (!chkData("#keyword", "검색어를"))
               return;
         }
         $("#pageNum").val(1);
         goPage();
      })

      // 페이징 처리 이벤트
      $(".paginate_button a").click(
            function(e) {
               e.preventDefault();
               $("#f_search").find("input[name='pageNum']").val(
                     $(this).attr("href"));

               goPage();
            })
   });//최상위함수

   //검색을 위한 실질적인 처리 함수
   function goPage() {
      if ($("#search").val() == "all") {
         $("#keyword").val("");
      }
      $("#f_search").attr({
         "method" : "get",
         "action" : "/health/admin/cardioList"
      })
      $("#f_search").submit();
   }
</script>

</head>
<div class="wrapper row3">
   <div class="content">
      <div id="gallery">
         <figure>
            <header class="heading">cardio Exercise</header>
            <!-- 히든 상세 게시판 -->
            <form id="detailForm">
               <input type="hidden" id="health_no" name="health_no" />
            </form>
            <!-------------------------------------------------- 유산소 게시판 운동 리스트(이미지) 시작 ---------------------------------------------------->
            <div id="cardioList" class="table-height">
               <table summary="헬스 게시판 리스트" class="table table-striped">
                  <tbody id="list" class="table-striped text-center">
                     <c:choose>
                        <c:when test="${not empty cardioList }">
                           <c:forEach var="imgBoard" items="${cardioList }"
                              varStatus="status">
                              <tr class="text-center" data-num="${imgBoard.health_no }">
                                 <td colspan="5"><img class="goImgDetail admin_img_size"
                                    src="/dosirak31img/health/${imgBoard.health_img }" /></td>
                              </tr>
                              <tr>
                                 <th data-value="health_no" class="order text-center col-md-1">글번호</th>
                                 <th class="text-left col-md-4">글제목</th>
                                 <th data-value="health_date" class="order col-md-2">작성일</th>
                                 <th class="text-center col-md-1">작성자</th>
                                 <th class="text-center col-md-1">조회수</th>
                              </tr>
                              <tr class="text-center" data-num="${imgBoard.health_no }">
                                 <td>${imgBoard.health_no }</td>
                                 <td class="goDetail text-left">${imgBoard.health_title }</td>
                                 <td class="text-left">${imgBoard.health_date }</td>
                                 <td class="name">${imgBoard.admin_id }</td>
                                 <td class="read">${imgBoard.health_hits }</td>
                              </tr>
                           </c:forEach>
                        </c:when>
                        <c:otherwise>
                           <tr>
                              <td colspan="4" class="tac text-center">유산소 동영상(이미지) 게시물이
                                 존재하지 않습니다</td>
                           </tr>
                        </c:otherwise>
                     </c:choose>
                  </tbody>
               </table>
            </div>
         </figure>
      </div>
      <!-------------------------------------------------- 유산소 게시판 운동 리스트(이미지) 끝 ---------------------------------------------------->

      <!-------------------------------------------------- 글 쓰가 버튼 시작 ---------------------------------------------------->
      <div class="text-right">
         <button type="button" id="insertFormBtn" class="dosirakBtn1">글쓰기</button>
      </div>
      <!-------------------------------------------------- 글 쓰가 버튼 끝 ---------------------------------------------------->

      <!-------------------------------------------------- 게시판 페이지 바 시작 ---------------------------------------------------->
      <tag:pagination pageNum="${pageMaker.cvo.pageNum }"
         amount="${pageMaker.cvo.amount }" startPage="${pageMaker.startPage }"
         endPage="${pageMaker.endPage }" prev="${pageMaker.prev }"
         next="${pageMaker.next  }" />

      <!-------------------------------------------------- 게시판 페이지 바 끝 ---------------------------------------------------->

      <!-------------------------------------------------- 검색 기능 시작 ---------------------------------------------------->
      <div id="boardSearch" class="text-right">
         <form id="f_search" name="f_search" class="form-inline">
            <%--페이징 처리를 위한 파라미터 --%>
            <input type="hidden" name="health_category_no" value="2"> <input
               type="hidden" name="pageNum" id="pageNum"
               value="${pageMaker.cvo.pageNum }"> <input type="hidden"
               name="amount" value="${pageMaker.cvo.amount }">
            <div class="form-group">
               <select id="search" name="search" class="form-control">
                  <option value="all">전체</option>
                  <option value="health_title">제목</option>
                  <option value="health_contents">내용</option>
               </select> <input type="text" name="keyword" id="keyword"
                  value="전체 데이터를 조회" class="form-control"
                  readonly="readonly" />
               <button type="button" id="searchData" class="dosirakBtn1">검색</button>
            </div>
         </form>
      </div>
      <!-------------------------------------------------- 검색 기능 끝 ---------------------------------------------------->
   </div>
   <div class="clear"></div>
</div>
</body>
</html>