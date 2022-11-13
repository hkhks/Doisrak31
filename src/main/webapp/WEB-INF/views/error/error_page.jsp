<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
      <style type="text/css">
         body{background-color: white;}
         #errorimg{ text-align:center;
                  margin-top:150px;
     }
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
            <img src="/resources/images/common/error.jpg"/>
         </div>
         <h2 class="errorfont">예상하지 못한 오류가 발생했습니다.</h2>
         <p class="errorfont">일시적인 현상이거나 네트워크 문제일 수 있으니, 잠시 후 다시 시도해 주세요.<br />
         계속 발생하는 경우 홈페이지를 통해 문의해 주세요.<br />
         </p>
         
         <div class ="forgot">
               <span><a href="/">메인 화면으로 가기</a></span>
            </div>
</body>