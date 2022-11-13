<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 

		<style type="text/css">
			.here{ font-weight: bold;
					text-align: center;
					font-size : 30pt;
                	margin-top: 80px;
                	color:black;
					}
					
			.input-box{
                position:relative;
                margin:10px 500px;
            }
			#emphasize{
				color: #72aa00;
			}
			
			 input[type=button]{
               
                width:37%;   
                height:70px;
                font-size: 16pt;
                font-weight:bold;
                margin-top:40px;
                display:inline-block;
                text-align:center;
                margin-bottom: 50px;
                
            }
            
            .loginmain{
                text-align: center;
                font-size:12pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
            }
            
             #btn{
            	text-align: center
            }
            
            body{background-color:white;}
            
            span{color:#a5d610;}
            
		</style>
		
		
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>

		<script type="text/javascript">
		 
		</script>
</head>
<body>
		<div class ="here">회원님의 아이디는 <br/><br/><br/>
		<span id="emphasize">${clientsearchid.client_id}</span> 입니다.</div><br/><br/>
	
		<div class ="loginmain">
     		<span><a href="/client/loginmain">로그인 하기</a></span>
    	</div><br/><br/>
    	
   
        <div id="btn"> 
            <input type="button" id="searchPw" value="비밀번호 찾기" onClick="location.href='/client/searchpw'" class="dosirakBtn">
		</div>
		
	
</body>
</html>