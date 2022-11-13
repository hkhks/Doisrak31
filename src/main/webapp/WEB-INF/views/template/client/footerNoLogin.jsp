<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page trimDirectiveWhitespaces="true" %>
 <style>
 .center{text-align:center;}
 </style>
 <script>
 $(function(){
	 $("#loginBtn").click(function(){
		if($("#client_id").val().replace(/\s/g, "") == ""){ //아이디 값이 공백일 때	
			alert("아이디는 필수 입력 항목 입니다.");
			
			return false;
			
		}else if($("#client_pw").val().replace(/\s/g, "") == ""){
			
			alert("비밀번호는 필수 입력 항목 입니다.");
			return false;
			
		}else{
			$("#loginForm").submit();
		}
		
	});
})
 </script>
 <div class="wrapper row5">
  <footer id="footer" class="clear"> 
    <!-- ################################################################################################ -->
    <div class="one_quarter first center">
      <h6 class="title">DOSIRAK31</h6>
      <hr/>
      <address class="btmspace-10">
      DOSIRAK31<br>	
      Seoul City&amp; GangNam<br>
      Dosirak Town<br>
      06234
      </address>
      <ul class="nospace">	
        <li class="btmspace-10"><span class="fa fa-phone"></span> 1558-7890</li>
        <li><span class="fa fa-envelope-o"></span> dosirak31@domain.com</li>
      </ul>
    </div>
    <div class="one_quarter center">
      <h6 class="title">Quick Links</h6>
      <hr/>
      <ul class="nospace linklist">
        <li class="active"><a href="/">HOME</a></li>
        <li><a href="/health/hBoardList">WORKOUT</a>  
        <li><a class="drop" href="/food/foodNoClientBasicList">FOOD</a>
        <li><a href="/foodReview/client/foodNoClientReviewList">FOOD REVIEW</a>
        <li><a href="/community/communityList">COMMUNITY</a></li>
      </ul>
    </div>
    <div class="one_quarter center">
      <h6 class="title">개인정보처리방침</h6>
      <hr/>
      <article>
        <p>도시락31주식회사(이하 ‘도시락31’ 또는 회사’)는 서비스 기획부터 종료까지 개인정보보호법 등 국내의 개인정보 보호 법령을 철저히 준수합니다. 
        또한 OECD의 개인정보 보호 가이드라인 등 국제 기준을 준수하여 서비스를 제공합니다.</p>
      </article>
    </div>
     <div class="one_quarter center">
      <h6 class="title">고객센터</h6>
      <hr/>
      <article>
      <ul class="nospace">
        <li class="btmspace-10"><span class="fa fa-phone"></span> 1558-7890</li>
       </ul>
       <address class="btmspace-15">
      월요일~금요일 운영<br/> 공휴일 주말 제외<br/><br/>
      운영시간: 9:00~18:00
      </address>
      </article>
    </div>
    <!-- <div class="one_quarter">
      <h6 class="title">LOGIN</h6>
      <form id="loginForm" method="post" action="/client/userlogin">
        <fieldset>
          <legend>Newsletter:</legend>
          <input class="btmspace-15" id="client_id" type="text" name="client_id" placeholder="아이디">
           <input class="btmspace-15" id="client_pw" type="password" name="client_pw" placeholder="비밀번호">
           <input type="submit" id="loginBtn" value="로그인">
        </fieldset>
      </form>
    </div> -->
  </footer>
</div>