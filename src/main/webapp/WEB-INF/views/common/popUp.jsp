<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" />

		<link rel="shortcut icon" href="/resources/images/common/icon.png"/>
		<link rel="apple-touch-icon" href="/resources/images/common/icon.png"/>
		
		<title>Insert</title>

		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css"/>
		<link rel="stylesheet" type="text/css" href="/resources/include/css/default.css"/>
		<style type="text/css">

		</style>
		<script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
		<script type="text/javascript" src="/resources/include/js/common.js"></script>
		<script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>


		<style type="text/css"></style>
		
		
		<script type="text/javascript">
		
		function setPopUpStart(obj){
			
			let expireDate = new Date();
			
			expireDate.setDate(expireDate.getDate() + 1);
			
			document.cookie = "notShowPop="+"true"+";path=/; expires=" + expireDate.toUTCString(); // 쿠키 생성(팝업창 안띄우겠다고 체크한 상태)
			//오늘하루동안 안띄우겠다 -> 오늘날짜로부터 하루값을 계산한뒤 하루동안 유지되는 쿠키 생성
		
			window.close();
		
		}
		</script>

	</head> 
	<body>	
		<div style="text-align:center;">
			<img src="/resources/images/common/deliveryPopUp.png" style="width:400px;height:400px;"/>
		</div>
		<br>
		<form>
			<input type="checkbox" onClick="setPopUpStart(this)" style="margin-left:2%;"> 오늘 더 이상 팝업창 띄우지 않기
		</form>
		
	</body>
</html>