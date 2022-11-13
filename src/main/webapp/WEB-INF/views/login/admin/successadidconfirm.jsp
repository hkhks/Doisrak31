<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />
<%@ include file="/WEB-INF/views/common/common.jspf" %> 

      <link rel="shortcut icon" href="/resources/images/common/icon.png"/>
      <link rel="apple-touch-icon" href="/resources/images/common/icon.png"/>
      
      <title>login.jsp</title>

      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
      
      <style type="text/css">
         .here{ font-weight: bold;
               text-align: center;
               font-size : 30pt;
                   margin-top: 60px;
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
               text-align: center;
            }
      </style>
      
      
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>

      <script type="text/javascript">
       
      </script>
</head>
<body>
      <div class ="here">관리자님의 아이디는 <br/>
      <span id="emphasize">${adminid.admin_id}</span> 입니다.</div><br/><br/>
   
      <div class ="loginmain">
           <span><a href="/admin/login">로그인 하기</a></span>
       </div><br/><br/>
       
   
        <div id="btn"> 
            <input type="button" id="searchPw" value="비밀번호 찾기" onClick="location.href='/admin/adsearchpw'" class="dosirakBtn">
      </div>
      
</body>
</html>