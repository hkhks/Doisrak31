<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
 <%@ page trimDirectiveWhitespaces="true" %>

<!DOCTYPE html>
<html>
<head>
<title>관리자 페이지</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="/resources/layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
 <!-- header시작 -->
<tiles:insertAttribute name="header"/>
 <!-- header끝 -->
 
<div class="wrapper row3">
  <main class="container clear"> 
    <!-- main body -->
     <div class="sidebar one_quarter first"> 
    <!-- left시작 -->
    <tiles:insertAttribute name="left"/>
    <!-- left끝 -->
    </div>
    <div class="content three_quarter">   
    <!-- body시작 -->
    <tiles:insertAttribute name="main"/>
    <!-- body끝 -->
    </div>
    <!-- / main body -->
    <div class="clear"></div>
  </main>
</div>
 
<!-- JAVASCRIPTS -->
<script src="/resources/layout/scripts/jquery.min.js"></script>
<script src="/resources/layout/scripts/jquery.backtotop.js"></script>
<script src="/resources/layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>