/**
 * 
 */
 
 /*모든 페이지 공통*/
$(function(){
	$(".login").click(function(){
		let url="login.html";
		let name="login popup";
		let option="width=500,height=200,  top = 100, left = 200, location=no, scrollbars=no, toolbars=no, status=no";
		window.open(url,name,option);
	});
	
	$("#info").click(function(){
		alert("로그인 후 이용 가능합니다.");
		
	});
	
	$("#new").click(function(){
		let url="new.html";
		let name="new popup";
		let option="width=500,height=300,  top = 100, left = 200, location=no, scrollbars=no, toolbars=no, status=no";
		window.open(url,name,option);
	});
});