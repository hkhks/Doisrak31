<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style>
a{color:#a5d610}
</style>
</head>
<div id="hBoardList_board_img" class="wrapper row2 bgded"
   style="background-image: url('/resources/images/common/running.jpg');">
   <div class=" hBoardList_name_location">
      <div id="breadcrumb" class="hBoard_Name">무산소 운동</div>
   </div>
</div>
<div class="wrapper row3">
   <main class="container clear" id="health_main">
      <div class="content">
         <div id="gallery">
            <figure>
               <!-------------------------------------------------- 동영상 & 소개 공간 ---------------------------------------------------->
               <div>
                  <iframe width="930" height="500"
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
               <hr class="hr" />
               <div class="row marketing">
                  <div class="col-lg-6">
                     <jsp:include page="weightHcomment.jsp" />
                  </div>
               </div>

            </figure>
         </div>
      </div>
      <div class="clear"></div>
   </main>

</div>
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
<!-- JAVASCRIPTS -->
<script src="/resources/layout/scripts/jquery.min.js"></script>
<script src="/resources/layout/scripts/jquery.backtotop.js"></script>
<script src="/resources/layout/scripts/jquery.mobilemenu.js"></script>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script
   src="/resources/include/dist/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>