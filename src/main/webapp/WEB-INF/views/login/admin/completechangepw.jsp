<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
      <style type="text/css">
         
         .here{ font-weight: bold;
               text-align: center;
               font-size : 40pt;
               margin-top: 130px;
               color: #0e4bef;
         }
         h1{ 
            text-align: center;
            color: black;
            font-weight: bold;
            margin-top: 80px;
            margin-bottom: 50px;
         }
         body{background-color: white;}
         
          .forgot{
                text-align: center;
                font-size:12pt;
                color:rgb(164, 164, 164);
                margin:10px 0px;
                margin-bottom: 190px;
            }
      </style>
      
      
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>

</head>
<body>
   <div class="here">비밀번호 변경 완료</div>
   <h1>새로운 비밀번호로 로그인 해주세요</h1>
   
   <div class ="forgot">
         <span><a href="/admin/login">로그인 화면으로</a></span>
    </div>
   
   
</body>
</html>