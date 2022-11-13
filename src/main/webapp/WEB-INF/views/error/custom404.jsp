<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
      <style type="text/css">
         body{background-color: white;}
         #errorimg{ text-align:center;
                  margin-top:150px;}
         h2{font-weight:bold;
            font-size: 40px;}
            
         .errorfont{text-align:center;}
         
         .forgot{
                text-align: center;
                font-size:12pt;
                color:rgb(164, 164, 164);
                
                margin-top: 40px;
             
            }
            
         p{font-size:15px;}
         
      </style>

      <script type="text/javascript">
            
      </script>

</head>
<body>      
         <div id="errorimg">
            <img src="/resources/images/common/errorimg.jpg"/>
            <img src="/resources/images/common/error404.jpg"/>
         </div>
         <h2 class="errorfont">페이지를 찾을 수 없습니다.</h2>
         <p class="errorfont">페이지가 존재하지 않거나, 사용할 수 없는 페이지 입니다.</p>
         
         <div class ="forgot">
               <span><a href="/">메인 화면으로 가기</a></span>
            </div>
</body>