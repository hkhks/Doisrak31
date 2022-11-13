<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

</head>
<div id="hBoardList_board_img" class="wrapper row2 bgded"
	style="background-image: url('/resources/images/common/health_header.jpg');">
	<div class=" hBoardList_name_location">
		<div id="breadcrumb" class="hBoard_Name">
		운동 동영상 게시판
		</div>
	</div>
</div>
<div class="wrapper row3">

	<main class="container clear" style="padding-bottom:80px;">
		<div class="content">
			<div class="main_contents">
				
				<hr class="main_contents_hr">
				<div class="head">운동의 <span class="bold">가치</span>를 믿다</div>
				<hr class="main_contents_hr">
				
				<div class="hBoardListContents">Dosirak31은 <span class="bold">기본에 충실한 마음으로</span> 고객을 위한 최선의 트레이닝 방법을</div>
				<div class="hBoardListContents">찾고 <span class="bold">더 만족도 높은 결과를 만들기 위해 끊임없이 공부합니다.</span></div>
			</div>
			<div id="gallery">
				<ul class="nospace clear ul">
					<li class="li"><a href="/health/weightList?health_category_no=1"><img
							class="img"
							src="/dosirak31img/health/health_weight_weightMain1.JPG" alt=""><br /><br />
							<span class="span">
							웨이트 트레이닝 동영상 자세히 보기
							</span></a></li>
					<li class="li"><a href="/health/cardioList?health_category_no=2"><img
							class="img"
							src="/dosirak31img/health/health_cardio_cardioMain1.JPG" alt=""><br /><br />
							<span class="span">
							유산소 트레이닝 동영상 자세히 보기
							</span></a></li>
				</ul>
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
</body>
</html>