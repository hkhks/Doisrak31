<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf"%>

<style type="text/css">
		#cardioImg, #weightImg{width:280px; height:220px;}
	</style>
</head>
	<div class="wrapper row3">
			<div class="content">
				<div id="gallery">
					<figure>
						<header class="heading">Free Workout Vedios</header>
						<ul class="nospace clear healthList_img_line">
							<li class="first healthList_img_size"><a href="/health/admin/weightList?health_category_no=1"><img id="weightImg"
									src="/dosirak31img/health/health_weight_weightMain1.JPG" alt="">웨이트 트레이닝</a></li>
							<li class="healthList_img_size"><a href="/health/admin/cardioList?health_category_no=2"><img id="cardioImg"
									src="/dosirak31img/health/health_cardio_cardioMain1.JPG" alt="">유산소 트레이닝</a></li>
						</ul>	
					</figure>
				</div>
			</div>		
			<div class="clear"></div>
	</div>
</body>
</html>