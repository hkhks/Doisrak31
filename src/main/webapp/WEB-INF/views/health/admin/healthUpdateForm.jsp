<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<script type="text/javascript">
   $(function() {
      let testCategories = $("#health_category_no").val();
      let wCategory = $("#w_category_no").val();
      let cCategory = $("#c_category_no").val();

      if (testCategories == wCategory) {
         $("#w_category_no").attr("checked", true);
      } else {
         $("#c_category_no").attr("checked", true);
      }

      //저장 버튼 클릭 시 처리 이벤트
      $("#boardUpdateBtn")
            .click(
                  function() {
                     //입력값체크
                     if (!chkData("#admin_id", "이름을"))
                        return;
                     if ($("input[name='health_category_no']:radio:checked").length < 1) {
                        alert("카테고리를 선택하세요");
                        return;
                     } else if (!chkData("#health_title", "제목을"))
                        return;
                     else if (!chkData("#health_contents", "내용을"))
                        return;
                     else if (!chkData("#url", "동영상 url을"))
                        return;
                     else if (!chkFile($("#file")))
                        return;
                     else {
                        $("#h_updateForm").attr({
                           "method" : "post",
                           "enctype" : "multipart/form-data",
                           //enctype 속성의 기본값은 "application/x-www.form-urlcencoded". POST방식 폼 전송에 기본값으로 사용
                           "action" : "/health/admin/healthUpdate"
                        });
                        $("#h_updateForm").submit();
                     }
                  });
   });
</script>
</head>
<body>
   <div class="wrapper row3">
      <div class="text-center">
         <h3>게시판 글 작성</h3>
      </div>
      <form class="form-horizontal" id="h_updateForm" name="h_updateForm">
         <input type="hidden" name="health_no"
            value="${healthUpdate.health_no }">
         <div class="form-group">
            <label for="author" class="col-sm-2 control-label">작 성 자</label>
            <div class="col-sm-10">
               <input type="text" class="form-control" id="admin_id"
                  name="admin_id" placeholder="작성자 입력" value="관리자"
                  readonly="readonly">
            </div>
         </div>
         <div class="form-group">
            <label for="author" class="col-sm-2 control-label">카 테 고 리</label>
            <div class="col-sm-10">
               <input type="hidden" id="health_category_no"
                  value="${healthUpdate.health_category_no }"> <input
                  type="radio" id="w_category_no" name="health_category_no"
                  value="1">웨이트 <input type="radio" id="c_category_no"
                  name="health_category_no" value="2">유산소
            </div>
         </div>
         <div class="form-group">
            <label for="title" class="col-sm-2 control-label">글 제 목</label>
            <div class="col-sm-10">
               <input type="text" class="form-control" id="health_title"
                  name="health_title" value="${healthUpdate.health_title }">
            </div>
         </div>
         <div class="form-group">
            <label for="content" class="col-sm-2 control-label">글 내 용</label>
            <div class="col-sm-10">
               <textarea id="health_contents" name="health_contents" rows="8"
                  class="form-control">${healthUpdate.health_contents }</textarea>
            </div>
         </div>
         <div class="form-group">
            <label for="url" class="col-sm-2 control-label">동영상 url</label>
            <div class="col-sm-10 youtube_main">
               <div class="youtube">https://www.youtube.com/watch?v=</div>
               <input type="text" class="form-control" id="url" name="health_url"
                  value="${healthUpdate.health_url }" />
            </div>
            <div class="form-group">
               <label for="file" class="col-sm-2 control-label">이미지파일첨부</label>
               <div class="col-sm-10 file_location">
                  <input type="file" class="form-control file_location1" id="file"
                     name="file" />
               </div>
            </div>
         </div>
      </form>
      <div class="text-right">
         <button type="button" class="dosirakBtn1" id="boardUpdateBtn">수정
            완료</button>
      </div>
   </div>
</body>
</html>
