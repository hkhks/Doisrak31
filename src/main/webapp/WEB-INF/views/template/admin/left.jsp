<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ page trimDirectiveWhitespaces="true" %> 
    

     
      <h6>관리자 페이지 목록</h6>

      <nav class="sdb_holder">
        <ul>
          <li><a href="#">게시판 관리</a>
            <ul>
              <li><a href="/food/admin/foodAdminBasicList">식품 목록 관리</a></li>
              <li><a href="/health/admin/hBoardList">운동 영상 관리</a></li>
                <li><a class="drop" href="/community/admin/communityList">COMMUNITY</a>
                <ul>
                  <li><a href="/community/admin/communityList?community_category_no=0">FREE COMMUNITY</a></li>
                  <li><a href="/community/admin/communityList?community_category_no=1">QnA COMMUNITY</a></li>
                </ul>
              </li>


               <li><a href="/foodReview/admin/adminfoodReviewList">식품 리뷰 관리</a></li>
               
               <li><a href="#">운동 댓글 관리</a>
                <ul>
                  <li><a href="/adminhreplies/hcommentManage">댓글 전체 관리</a></li>
                  <li><a href="/adminreporthreplies/hcommentReportManage">신고 댓글 관리</a></li>
                </ul>
            </ul>
          </li>
          <li><a href="#">회원 관리</a>
            <ul>
              <li><a href="/food/admin/orderhistory?order_status_no=3">회원 주문 내역</a></li>
              <li><a href="/adminPage/memberList">회원 목록</a></li>
            </ul>
          </li>
          <li><a href="/admin/logout">로그아웃</a></li>
        </ul>
      </nav>
      
      
      
      <!-- ################################################################################################ -->

 