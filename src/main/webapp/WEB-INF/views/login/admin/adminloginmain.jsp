<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 

		<style type="text/css">
			header{
                display:flex;
                justify-content: center;
                margin-top: 50px;
            }
            h2{
            	font-weight: bold;
            	text-align:center;
            	color: black;
            }
            form{ 
                padding:10px;
            }
            .input-box{
                position:relative;
                margin:10px 500px;
            }
            .input-box > input{
                background:transparent;
                border:none;
                border-bottom: solid 1px #ccc;
                padding:20px 0px 5px 0px;
                font-size:14pt;
                width:100%;
            }
            input::placeholder{
                color:transparent;
            }

            input:placeholder-shown + label{
                color:#aaa;
                font-size:14pt;
                top:15px;

            }
            input:focus + label, label{
                color: #a5d610;
                font-size:10pt;
                pointer-events: none;
                position: absolute;
                left:0px;
                top:0px;
                transition: all 0.2s ease ;
                -webkit-transition: all 0.2s ease;
                -moz-transition: all 0.2s ease;
                -o-transition: all 0.2s ease;
            }

            input:focus, input:not(:placeholder-shown){
                border-bottom: solid 1px #8aa1a1;
                outline:none;
            }
            input[type=submit]{
                
                width:37%;   
                height:70px;
                font-size: 16pt;
                font-weight:bold;
                margin-top:40px;
                display:inline-block;
                text-align:center;
                margin-bottom: 50px;
            }
            
            .forgot{
                text-align: center;
                font-size:12pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
            }
            #btn{
            	text-align: center
            }
            #error{ color : red; font-size: 3px; text-align:center;}
            
            #kakao {display: block; margin: 0px auto;width:250px; height: 40px; margin-bottom: 50px;}
            
            .or-seperator{text-align:center; }
            
			
			body{background-color:white;}
		</style>
		
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
	
	<body> 

		<div id="containers" >
            <header>
            <h2>Admin Login</h2>
        	</header><br/>
        	<p id = "error"></p>
	
        <form id="loginForm" method="post" action="/admin/userlogin">
        	
            <div class="input-box">
                <input id="admin_id" type="text" name="admin_id" placeholder="아이디">
                <label for="admin_id">아이디</label> 
            </div>

            <div class="input-box">
                <input id="admin_pw" type="password" name="admin_pw" placeholder="비밀번호">
                <label for="admin_pw">비밀번호</label> <p id = "error"></p>
            </div>
            
            <br/><br/>
            
            <div class ="forgot">
            	<span><a href="/admin/adsearchid">아이디 찾기</a> | </span><span><a href="/admin/adsearchpw">비밀번호 찾기</a></span>
            </div>
            
            <div id="btn"> 
            	<input type="submit" id="loginBtn" value="로그인" class="dosirakBtn">
			</div>
			
        </form>
        
	</div>
	
	<script type="text/javascript">
		$(function(){
			$("#loginBtn").click(function(){
				
				if($("#admin_id").val().replace(/\s/g, "") == ""){ //아이디 값이 공백일 때
					
					let result = "아이디는 필수 입력 항목 입니다.";
				
					$("#error").show();
					$("#error").html(result);
					
					
					$("#admin_id").click(function(){
						
						$("#error").html("");
						
					})
					
					
					return false;
					
				}
				
				
				if($("#admin_pw").val().replace(/\s/g, "") == ""){
					
					let result = "비밀번호는 필수 입력 항목 입니다.";
					$("#error").show();
					$("#error").html(result);
					
					
					$("#admin_pw").click(function(){
						
						$("#error").html("");
						
					})
					
					return false;
					
				}
				
				$("#loginForm").submit();
			});
		});
	 	
	</script>
</body>
</html>