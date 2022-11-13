<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
      <style type="text/css">
         
         .here{ font-weight: bold;
               text-align: center;
               font-size : 40pt;
               margin-top: 130px;
               color:red;
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
   <div class="here">ID SEARCH FAIL</div>
   <h1>이름,전화번호를 다시 확인해주세요</h1>
   
   <div class ="forgot">
         <span><a href="/admin/adsearchid">이전 페이지</a></span>
    </div>
   
   
</body>
</html>