<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>
<style>
a{color:#a5d610}

</style>

</head>
<div class="black-bg" id="modal">
  		<div class="white-bg">
  			<form id="reportForm">
  				<b>신고 사유 선택</b><br/><br/>
				
				<input type="hidden" id="report_client_id" name="report_client_id"/>
				<input type="hidden" id="reported_id" name="reported_id"/>
				<input type="hidden" id="report_health_hcomment_no" name="report_health_hcomment_no"/>
				<input type="hidden" id="current_health_no" name="current_health_no"/>
  				
  				<p><input type="radio" name="reason_report" value="욕설,비방,차별,혐오"/>욕설,비방,차별,혐오</p>
  				<p><input type="radio" name="reason_report" value="홍보,영리목적"/>홍보,영리목적</p>
  				<p><input type="radio" name="reason_report" value="불법정보"/>불법정보</p>
  				<p><input type="radio" name="reason_report" value="음란,청소년 유해"/>음란,청소년 유해</p>
  				<p><input type="radio" name="reason_report" value="개인정보 노출,유포,거래"/>개인정보 노출,유포,거래</p>
  				<p><input type="radio" name="reason_report" value="도배,스팸"/>도배,스팸</p>
  			</form><br/>
  			
    		
    		<button class="dosirakBtn" id="sendreport" style="margin-left:5px; width:50px;">확인</button>
    		<button class="dosirakBtn2" id="closereport" style="width:50px;" onclick="document.getElementById('modal').classList.remove('show-modal')">취소</button><br/>
  		</div>
	</div> 
<div id="hBoardList_board_img" class="wrapper row2 bgded"
   style="background-image: url('/resources/images/common/running.jpg');">
   <div class=" hBoardList_name_location">
      <div id="breadcrumb" class="hBoard_Name">유산소 운동</div>
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
                     src="https://www.youtube.com/embed/${cardioDetail.health_url }?mute=1&autoplay=1"></iframe>
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
               <hr class="hr" />
               <div class="row marketing">
                  <div class="col-lg-6">
                     <jsp:include page="cardioHcomment.jsp" />
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