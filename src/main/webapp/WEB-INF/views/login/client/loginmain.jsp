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
            }
            
            span{
                text-align: center;
                font-size:12pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
            }
           
            #btn{
            	text-align: center
            }
            #error{ color : red; font-size: 3px; text-align:center;}
            
            #kakao {display: block; margin: 0px auto;width:510px; height: 70px; margin-bottom: 50px;
            		border-radius:12px;
            }
            		
            #rememberId{margin-left : 480px;}
           
            
            .or-seperator{text-align:center; }
            
            label[id="remember"]{
				all: initial;            
            }
            
			body{background-color:white;}
			
			
		</style>
		
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>
		<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	</head>
<body> 

		<div id="containers" >
            <header>
            <h2>Login</h2>
        	</header><br/>
        	<p id = "error"></p>
	
        <form id="loginForm" method="post" action="/client/userlogin">
        	
            <div class="input-box">
                <input id="client_id" type="text" name="client_id" placeholder="아이디" value="${cookie.id.value}">
                <label for="client_id">아이디</label> 
            </div>

            <div class="input-box">
                <input id="client_pw" type="password" name="client_pw" placeholder="비밀번호">
                <label for="client_pw">비밀번호</label> <p id = "error"></p>
            </div>
            
            <br/><br/>
            
            
            
            <span style="display:inline-block; margin-left:1%;">
            	<label id="remember" style="font-size:12pt; color:#a5d610;"><input type="checkbox" id="rememberId" name="rememberId" style="display: inline;" ${empty cookie.id.value ? " ":"checked"}/>아이디 저장</label> | <span><a href="/client/searchid">아이디 찾기</a></span> | <span><a href="/client/searchpw">비밀번호 찾기</a></span>
            </span>
            
            <div id="btn"> 
            <input type="submit" id="loginBtn" value="로그인" class="dosirakBtn1" style="width:510px;">
			</div>
			
			<div class="form-group row">
			<div class="or-seperator">
			</div>
			
		</div>
		
		<!-- 카카오 정보를 넘기기 위한 숨겨진 태그 -->
		<div class="form-group row" id="kakaologin">
			<div class="kakaobtn">
				<input type="hidden" name="kakaoemail" id="kakaoemail" /> <!-- 카카오 이메일 -->
				<input type="hidden" name="kakaoname" id="kakaoname" /> <!-- 카카오 이름 -->
				<a href="javascript:kakaoLogin();"> 
					<img src="/resources/img/common/kakao_login.png" id="kakao" />
				</a>
			</div>
		</div>
        
        </form>
        
	</div>
	
	<script type="text/javascript">
		$(function(){
			$("#loginForm").submit(function(){
				
				
				if($("#client_id").val().replace(/\s/g, "") == ""){ //아이디 값이 공백일 때
					
					let result = "아이디는 필수 입력 항목 입니다.";
				
					$("#error").show();
					$("#error").html(result);
					
					
					$("#client_id").click(function(){
						
						$("#error").html("");
						
					})
					
					
					return false;
					
				}
				
				
				if($("#client_pw").val().replace(/\s/g, "") == ""){
					
					let result = "비밀번호는 필수 입력 항목 입니다.";
					
					$("#error").show();
					$("#error").html(result);
					
					
					$("#client_pw").click(function(){
						
						$("#error").html("");
						
					})
					
					return false;
					
				}
				
				$("#loginForm").submit();
			});
		});
		
		window.Kakao.init("a5e7c28bb22688479344686904dbae70");
		function kakaoLogin(){
			window.Kakao.Auth.login({
				scope:'profile_nickname,account_email',
				success: function(authObj){
					window.Kakao.API.request({
						url: '/v2/user/me',
						success: res => {
							const email = res.kakao_account.email;
							const name = res.properties.nickname;
							
							$('#kakaoemail').val(email);
							$('#kakaoname').val(name);
							
							loginForm.action="/client/kakaologin";
							loginForm.submit();			
						}
					});
					
				}
			});
		}
	 	
	</script>
</body>
</html>