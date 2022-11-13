<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page trimDirectiveWhitespaces="true" %>
 <style>
 	  .logo{width:80px; height:55px;}
    .size{width:40px; height:40px;}

 </style>
 <div class="wrapper row1">
  <header id="header" class="clear"> 
  
    <div id="logo" class="fl_left">
      <h1><a href="/"><img class="logo" src="/resources/images/common/dosirak31Logo.png" /></a></h1>
    </div>
    <nav id="mainav" class="fl_right">
      <ul class="clear">
        <li class="active"><a href="/">Home</a></li>
        <li><a href="/health/hBoardList">WORKOUT</a>  
        </li>
        <li><a href="/food/foodNoClientBasicList">FOOD</a>
          <ul>
            <li><a href="/food/foodNoClientBasicList">MY LUNCHBOX</a></li>
            <li><a href="/foodReview/client/foodNoClientReviewList">FOOD REVIEW</a>
            </li>
          </ul>
        </li>
        <li><a href="/community/client/communityList">COMMUNITY</a></li>

        <li><a href="/client/loginmain">LOGIN</a>     

        </li>
        <li><a href="/signup/client/signupForm">SIGN UP</a></li>
      </ul>
    </nav>
   
  </header>
</div>