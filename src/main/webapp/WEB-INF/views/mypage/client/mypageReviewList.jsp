<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<style type="text/css">
			div.sidebar one_quarter first{
				height: 100%;
			}
			
			div.comcont {
				width: 100%;
			}
			
			a.goDetail {
				float: right;
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
        
         
         img{width:70px; height:70px;margin:5px;}
		.star{width:30px; height:30px; margin:3px;}
		.review{width:900px; height:250px;}
		.font{font-size:15px;}
		</style>

		<script type="text/javascript">
			$(function() {
				
				// 편집 클릭시 상세 페이지 이동
				$(".goDetail").click(function() {
					let review_no = $(this).attr("data-num");
					$("#review_no").val(review_no);
					console.log("글번호 : " + review_no);
					// 상세 페이지로 이동하기 위해 form 추가 (id : detailForm)
					$("#detailForm").attr({
						"method":"get",
						"action":"/mypage/client/mypageReviewDetail"
					});
					$("#detailForm").submit();
				});
				
				$(".paginate_button a").click(function(e) {
					e.preventDefault();
					$("#f_search").find("input[name='pageNum']").val($(this).attr("href"));
					goPage();
				});
			});
			
			function goPage() {
				$("#f_search").attr({
					"method" : "get",
					"action" : "/mypage/client/mypageReviewList"
				});
				$("#f_search").submit();
			}
			
			function orderList(client_no){
		         location.href="/mypage/client/mypageOrderList?client_no="+client_no;
		      }
		</script>
</head>
	<body>
		<body id="top">
<!-- ################################################################################################ -->

<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/common/mypagereview.jpeg'); height: 300px;">
  
    <div id="breadcrumb" class="clear"> 
      <!-- ################################################################################################ -->
      
      <!-- ################################################################################################ -->
    </div>
  
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body -->
    <!-- ################################################################################################ -->
    <div class="sidebar one_quarter first"> 
      <!-- ################################################################################################ -->
      <h6>Category</h6>
      <nav class="sdb_holder">
        <ul>
          <li><a href="/mypage/client/mypageMain">회원정보</a></li>
          <li><a href="javascript:orderList(${sessionScope.client_info.client_no })">주문 내역</a>
          <li><a href="/mypage/client/mypageReviewList">나의 리뷰</a></li>
        </ul>
      </nav>
      </div>
      <!-- ################################################################################################ -->
      <div class="content three_quarter">
      <div class="content">
	 <div id="comments">
	      <div class="header-title">
        		My page
        	<span class="right-arrow">&gt;</span>
        	<strong>Reviews</strong>
        	</div>
       		<h3 class="title">리뷰</h3>
	      	<form id="detailForm">
	      		<input type="hidden" id="review_no" name="review_no" />
	      	</form>
	   
	      	<!-- 페이징 처리를 위한 파라미터 -->
	      	<form id="f_search" name="f_search" class="form-inline">
	      		<input type="hidden" name="client_no" value="${sessionScope.client_no }">
	      		<input type="hidden" name="pageNum" value="${pageMaker.cvo.pageNum }">
	      		<input type="hidden" name="amount" value="${pageMaker.cvo.amount }">
	      	</form>
	      	
	      	
	      	<form name="f_data" id="f_data" method="post">
	      		<input type="hidden" name="review_no" value="${mypage.review_no }">
	      	</form>
	     
	      	<c:choose>
		      	<c:when test="${not empty mypageReviewList}" >
			      	<c:forEach var="mypage" items="${mypageReviewList}" varStatus="status">
				        <ul data-num="${mypage.review_no}">
				          <li class="review">
				            <article>
				              <header>
				                    <figure class="avatar">
							<img  class="imgda1" src="/dosirak31img/food/${mypage.food_img1 }">
			                <img  class="imgda2" src="/dosirak31img/food/${mypage.food_img2 }"><img  class="imgda3" src="/dosirak31img/food/${mypage.food_img3 }">
			                <img  class="imgda4" src="/dosirak31img/food/${mypage.food_img4 }"><img  class="imgda5" src="/dosirak31img/food/${mypage.food_img5 }">
			                </figure> 
			                <div>${mypage.dosirak_name}</div>
				                <address>
				                By <a >${mypage.review_name}</a>
				                </address>
				                <span>별점 : 
				                 <c:choose>
				                 <c:when test="${mypage.review_score ne 0 }">
				                <c:forEach begin="1" end="${mypage.review_score}">
				               
				                <img  class="star" src="/resources/images/common/star.png"/>
				                
				                </c:forEach>
				                </c:when>
				                <c:when test="${mypage.review_score eq 0 }">
				                 별점이 0점입니다.
				                </c:when>
				                </c:choose>
				                </span>
				                <div>${mypage.review_date}</div>
				              </header>
				              <div class="comcont">
				                <p>${mypage.review_contents}</p>
				              </div>
				              <a class="goDetail font" href="/mypage/client/mypageReviewDetail?review_no=${mypage.review_no }">편집</a>
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
	        
	        
	        </div>
	        <%-- ===================페이징 출력=================== --%>
     <tag:pagination pageNum="${pageMaker.cvo.pageNum }" amount="${pageMaker.cvo.amount }"
     startPage="${pageMaker.startPage }" endPage="${pageMaker.endPage }" prev="${pageMaker.prev }" next="${pageMaker.next }" />
      </div>

	 	</main>
	</div>	
	       
		
		<!-- ################################################################################################ -->
		<!-- ################################################################################################ -->
		 

	</body>
</html>