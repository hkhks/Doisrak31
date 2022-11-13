<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
 <%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<title>Dosirak31</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="/resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body id="top">
  <!-- ##################  nav바 시작  ################### -->
<tiles:insertAttribute name="header"/>
<!-- ##################  nav바 끝 ################### -->
<!-- ##################  main 시작 ################### -->

   
      <tiles:insertAttribute name="body"/>
  

<!-- ##################  main 끝 ################### -->

<!-- 하단 -->

   	<tiles:insertAttribute name="footer"/>
    
<!-- 하단 끝 -->
<!-- ################################################################################################ -->
<a id="backtotop" href="#top"><i class="fa fa-chevron-up"></i></a> 
<!-- JAVASCRIPTS -->
<script src="/resources/layout/scripts/jquery.min.js"></script>
<script src="/resources/layout/scripts/jquery.backtotop.js"></script>
<script src="/resources/layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>