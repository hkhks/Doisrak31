<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %>

		<style type="text/css">
			.btn{
				float: right;
			}
			.btn1{
				display :inline-block;
			}
			.btn2{
				display :inline-block;
			}
			.btn3{
				display :inline-block;
			}
			.btn4{
				display :inline-block;
			}
			
			
		</style>

		<script type="text/javascript">
			let buttonCheck = 0;
			$(function() {
				// 수정버튼 클릭시 처리 이벤트
				$("#updateFormBtn").click(function() {
					goUrl = "/foodReview/client/updateForm";
					$("#f_data").attr("action",goUrl);
					$("#f_data").submit();
					
				});
				
				//삭제 버튼 클릭시 처리 이벤트
				$("foodReviewDeleteBtn").click(function() {
					if(confirm("정말 삭제하시겠습니까?")){
						goUrl = "/foodReview/client/foodReviewDelete";
						$("#f_data").attr("action",goUrl);
						$("#f_data").submit();
					}
				});
				
				//새글 작성 버튼 클릭시 처리 이벤트
				$("#insertFormBtn").click(function() {
					location.href= "/foodReview/client/writeForm";
				});
				
				//목록 버튼 클릭시 처리 이벤트
				$("#foodReviewListBtn").click(function() {
					location.href= "/foodReview/client/foodReviewList";
				});
			})
		
				function orderList(client_no){
		         location.href="/mypage/client/mypageOrderList?client_no="+client_no;
		      }
		</script>
</head>
	<body id="top">
<!-- ################################################################################################ -->
<div class="wrapper row1">
  <header id="header" class="clear"> 

    <div id="logo" class="fl_left">
      <h1><a href="/resources/index.html">DOSIRAK31</a></h1>
    </div>
    <nav id="mainav" class="fl_right">
      <ul class="clear">
        <li class="active"><a href="/resources/index.html">Home</a></li>
        <li><a href="/health/hBoardList">WORKOUT</a>  
        </li>
        <li><a class="drop" href="/food/foodNoClientBasicList">FOOD</a>
          <ul>
            <li><a href="/food/foodNoClientBasicList">FOOD</a>
            <li><a href="/foodReview/client/foodReviewList">FOOD REVIEW</a>
            </li>
          </ul>
        </li>
        <li><a href="/community/client/communityList">COMMUNITY</a></li>
        <li><a class="drop" href="/client/loginmain">LOGIN</a>
       	 <ul>
            <li><a href="/client/loginmain">CLIENT LOGIN</a></li>
            <li><a href="/food/foodAdminBasicList">ADMIN LOGIN</a></li>
          </ul>
        </li>
        <li><a href="/signup/client/signupForm">SIGN UP</a></li>
        <li><a href="/mypage/client/mypage">MY PAGE</a></li>
      </ul>
    </nav>
  </header>
</div>
<!-- ################################################################################################ -->
<!-- ################################################################################################ -->
<div class="wrapper row2 bgded" style="background-image:url('/resources/images/demo/backgrounds/01.png');">
  <div class="overlay">
    <div id="breadcrumb" class="clear"> 
      <!-- ################################################################################################ -->
      <ul>
        <li><a href="/client/successlogin">Home</a></li>
        <li><a href="/food/foodClientBasicList">FOOD</a></li>
        <li><a href="/foodReview/client/foodReviewList">FOOD REVIEW</a></li>
         <li><a href="/foodReview/client/foodReviewList">FOOD REVIEW</a></li>
      </ul>
      <!-- ################################################################################################ -->
    </div>
  </div>
</div>
<div class="wrapper row3">
	<main class="container clear"> 
    <div class="content"> 
    
		<form name="f_data" id="f_data" method="post">
			<input type="hidden" name="review_no" value="${detail.review_no }" />
			<input type="hidden" name="client_no" value="${sessionScope.client_info.client_no }">
		</form>
		
		<div>
        <h2>Review Detail</h2>
            <table>
            <tbody>
                <tr>
                    <th class="one_quarter">내용</th>
                    <td class="one_half">${detail.review_contents }</td>
                </tr>
                <tr>
                    <th class="one_quarter">작성자</th>
                    <td class="one_half">${detail.review_name }</td>
                </tr>
                <tr>
                    <th class="one_quarter">작성시간</th>
                    <td class="one_half">${detail.review_date }</td>
                </tr>
                <tr>
                    <th class="one_quarter">점수</th>
                    <td class="one_half">${detail.review_score }</td>
                </tr>
            </tbody>   
            </table>
            <div class="btn">
            <input type="button" value="글 수정" id="updateFormBtn" class="btn1">
            <input type="button" value="글 삭제" id="foodReviewDeleteBtn" class="btn2">
            <input type="button" value="새글 작성" id="insertFormBtn" class="btn3">
            <input type="button" value="목록으로" id="foodReviewListBtn" class="btn4">  
            </div> 
           </div>
    </div>
    <div class="clear"></div>
  	</main>
</div>
</body>
</html>