<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>
		<style type="text/css">
      /*이미지를 위한*/
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
         
         .overlay{
	 		 height:200px;
	  		 background-color:rgba(0,0,0,0);
		}
       
        img{width:70px; height:70px;margin:5px;}
		.star{width:30px; height:30px; margin:3px;}

	</style>
		<script type="text/javascript">
			$(function() {
				$(".paginate_button a").click(function(e) {
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();

				});
			});
			
			function goPage() {
				$("#f_search").attr({
					"method" : "get",
					"action" : "/foodReview/client/foodReviewList"
				});
				$("#f_search").submit();
			}
			
			

		</script>
</head>
	<body>

<!-- 이미지를 위한-->			
<div class="wrapper row2 bgded"
      style="background-image: url('/resources/images/common/reviewpage.jpeg');
      height: 350px;">
      <div class="overlay">
         
      </div>
      <div class="container">
</div>
   </div>
<!-- 이미지를 위한 끝-->		
<!-- main body @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<div class="wrapper row3">
	<main class="container clear" style="padding: 40px 0;"> 
    <div class="content"> 
    
     
      <div id="comments">
	      <h2>Reviews</h2>
	      <p style="color: #999999; padding-bottom:10px;">※ 심한 욕이나 좋지않은 언행은 삼가주시기 바랍니다.</p>
	      	<!-- 페이징 처리를 위한 파라미터 -->
	      	<form id="f_search" name="f_search" class="form-inline">
	      		<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
	      		<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
	      	</form>
	      	<!-- 페이징 처리를 위한 파라미터 -->
	      	
	      	<c:choose>
		      	<c:when test="${not empty foodReviewList}" >
			      	<c:forEach var="review" items="${foodReviewList}" varStatus="status">
				        <ul data-num="${review.review_no}">
				          <li>
				            <article>
				              <header>
				                <figure class="avatar">
							<img  class="imgda1" src="/dosirak31img/food/${review.food_img1 }">
			                <img  class="imgda2" src="/dosirak31img/food/${review.food_img2 }"><img  class="imgda3" src="/dosirak31img/food/${review.food_img3 }">
			                <img  class="imgda4" src="/dosirak31img/food/${review.food_img4 }"><img  class="imgda5" src="/dosirak31img/food/${review.food_img5 }">
			                </figure> 
				                
				                
				                
				                <div>${review.dosirak_name}</div>
				                <address>
				                By <a >${review.review_name}</a>
				                </address>
				                <span>별점 : 
				                 <c:choose>
				                 <c:when test="${review.review_score ne 0 }">
				                <c:forEach begin="1" end="${review.review_score}">
				               
				                <img  class="star" src="/resources/images/common/star.png"/>
				                
				                </c:forEach>
				                </c:when>
				                <c:when test="${review.review_score eq 0 }">
				                 별점이 0점입니다.
				                </c:when>
				                </c:choose>
				                </span>
				                <div>${review.review_date}</div>
				              </header>
				              <div class="comcont">
				                <p>${review.review_contents}</p>
				              </div>
				            </article>
				          </li>
				        </ul> 
			        </c:forEach>
		        </c:when>
		        <c:otherwise>
		        	<div>등록된 게시글이 존재하지 않습니다.</div>
		        </c:otherwise>
	        </c:choose>
      </div>
      
     <%-- ===================페이징 출력=================== --%>
     <tag:pagination pageNum="${pageMaker.cvo.pageNum }" amount="${pageMaker.cvo.amount }"
     startPage="${pageMaker.startPage }" endPage="${pageMaker.endPage }" prev="${pageMaker.prev }" next="${pageMaker.next }" />
     
     
     
      
    </div>
    <div class="clear"></div>
  	</main>
</div>
<!-- main body @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->







<!-- 상단으로 올라가는 페이지@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a>
	</body>
</html>