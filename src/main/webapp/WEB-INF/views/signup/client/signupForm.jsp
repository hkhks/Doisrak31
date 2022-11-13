<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/common.jspf" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 
      <style type="text/css">
      	/* 중복아이디 존재하지 않는경우 */
		.id_input_re_1{
			color : green;
			display : none;
		}
		/* 중복아이디 존재하는 경우 */
		.id_input_re_2{
			color : red;
			display : none;
		}
		
		
		.dosirakBtn3 {
   text-decoration:none;
   font-family:Arial;
   box-shadow:inset #787878 0px 5px 8px -1px;
   o-box-shadow:inset #787878 0px 5px 8px -1px;
   -moz-box-shadow:inset #787878 0px 5px 8px -1px;
   -webkit-box-shadow:inset #787878 0px 5px 8px -1px;
   background:#4f4f4f;
   background:-o-linear-gradient(90deg, #4f4f4f, #5e5e5e);
   background:-moz-linear-gradient( center top, #4f4f4f 5%, #5e5e5e 100% );
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #4f4f4f), color-stop(1, #5e5e5e) );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#4f4f4f', endColorstr='#5e5e5e');
   background:-webkit-linear-gradient(#4f4f4f, #5e5e5e);
   background:-ms-linear-gradient(#4f4f4f, #5e5e5e);
   background:linear-gradient(#4f4f4f, #5e5e5e);
   text-indent:0px;
   line-height:23px;
   -moz-border-radius:6px;
   -webkit-border-radius:6px;
   border-radius:6px;
   text-align:center;
   vertical-align:middle;
   display:inline-block;
   font-size:12px;
   color:#ffffff;
   width:auto;
   height:auto;
   padding:7px;
   text-shadow:#7d7d7d 0px 1px 0px;
   border-color:#ffffff;
   border-width:0px;
   border-style:solid;
}

.dosirakBtn3:active {
   position:relative;
   top:5px
}

.dosirakBtn3:hover {
   background:#5e5e5e;
   background:-o-linear-gradient(90deg, #5e5e5e, #4f4f4f);
   background:-moz-linear-gradient( center top, #5e5e5e 5%, #4f4f4f 100% );
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #5e5e5e), color-stop(1, #4f4f4f) );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5e5e5e', endColorstr='#4f4f4f');
   background:-webkit-linear-gradient(#5e5e5e, #4f4f4f);
   background:-ms-linear-gradient(#5e5e5e, #4f4f4f);
   background:linear-gradient(#5e5e5e, #4f4f4f);
}
	
	
	.dosirakBtn2 {
   text-decoration:none;
   font-family:Arial;
   box-shadow:inset #787878 0px 5px 8px -1px,#333333 0px 5px 0px;
   o-box-shadow:inset #787878 0px 5px 8px -1px,#333333 0px 5px 0px;
   -moz-box-shadow:inset #787878 0px 5px 8px -1px,#333333 0px 5px 0px;
   -webkit-box-shadow:inset #787878 0px 5px 8px -1px,#333333 0px 5px 0px;
   background:#4f4f4f;
   background:-o-linear-gradient(90deg, #4f4f4f, #5e5e5e);
   background:-moz-linear-gradient( center top, #4f4f4f 5%, #5e5e5e 100% );
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #4f4f4f), color-stop(1, #5e5e5e) );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#4f4f4f', endColorstr='#5e5e5e');
   background:-webkit-linear-gradient(#4f4f4f, #5e5e5e);
   background:-ms-linear-gradient(#4f4f4f, #5e5e5e);
   background:linear-gradient(#4f4f4f, #5e5e5e);
   text-indent:0px;
   line-height:23px;
   -moz-border-radius:6px;
   -webkit-border-radius:6px;
   border-radius:6px;
   text-align:center;
   vertical-align:middle;
   display:inline-block;
   font-size:12px;
   color:#ffffff;
   width:auto;
   height:auto;
   padding:7px;
   text-shadow:#7d7d7d 0px 1px 0px;
   border-color:#ffffff;
   border-width:0px;
   border-style:solid;
}

.dosirakBtn2:active {
   box-shadow:inset #787878 0px 5px 8px -1px,#333333 0px 0 0px;
   o-box-shadow:inset #787878 0px 5px 8px -1px,#333333 0px 0 0px;
   -moz-box-shadow:inset #787878 0px 5px 8px -1px,#333333 0px 0 0px;
   -webkit-box-shadow:inset #787878 0px 5px 8px -1px,#333333 0px 0 0px;
   position:relative;
   top:5px
}

.dosirakBtn2:hover {
   background:#5e5e5e;
   background:-o-linear-gradient(90deg, #5e5e5e, #4f4f4f);
   background:-moz-linear-gradient( center top, #5e5e5e 5%, #4f4f4f 100% );
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #5e5e5e), color-stop(1, #4f4f4f) );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5e5e5e', endColorstr='#4f4f4f');
   background:-webkit-linear-gradient(#5e5e5e, #4f4f4f);
   background:-ms-linear-gradient(#5e5e5e, #4f4f4f);
   background:linear-gradient(#5e5e5e, #4f4f4f);
}	


.dosirakBtn3 {
   text-decoration:none;
   font-family:Arial;
   box-shadow:inset #787878 0px 5px 8px -1px;
   o-box-shadow:inset #787878 0px 5px 8px -1px;
   -moz-box-shadow:inset #787878 0px 5px 8px -1px;
   -webkit-box-shadow:inset #787878 0px 5px 8px -1px;
   background:#4f4f4f;
   background:-o-linear-gradient(90deg, #4f4f4f, #5e5e5e);
   background:-moz-linear-gradient( center top, #4f4f4f 5%, #5e5e5e 100% );
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #4f4f4f), color-stop(1, #5e5e5e) );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#4f4f4f', endColorstr='#5e5e5e');
   background:-webkit-linear-gradient(#4f4f4f, #5e5e5e);
   background:-ms-linear-gradient(#4f4f4f, #5e5e5e);
   background:linear-gradient(#4f4f4f, #5e5e5e);
   text-indent:0px;
   line-height:23px;
   -moz-border-radius:6px;
   -webkit-border-radius:6px;
   border-radius:6px;
   text-align:center;
   vertical-align:middle;
   display:inline-block;
   font-size:14px;
   color:#ffffff;
   width:100%;
   height:34px;
   padding:7px;
   text-shadow:#7d7d7d 0px 1px 0px;
   border-color:#ffffff;
   border-width:0px;
   border-style:solid;
}

.dosirakBtn3:active {
   position:relative;
   top:5px
}

.dosirakBtn3:hover {
   background:#5e5e5e;
   background:-o-linear-gradient(90deg, #5e5e5e, #4f4f4f);
   background:-moz-linear-gradient( center top, #5e5e5e 5%, #4f4f4f 100% );
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #5e5e5e), color-stop(1, #4f4f4f) );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5e5e5e', endColorstr='#4f4f4f');
   background:-webkit-linear-gradient(#5e5e5e, #4f4f4f);
   background:-ms-linear-gradient(#5e5e5e, #4f4f4f);
   background:linear-gradient(#5e5e5e, #4f4f4f);
}



		
      </style>
      <script type="text/javascript">
		$(function() {
			
			//아이디 중복검사. 해당 메서드는 input 태그(class="id_input")에 변화가 있을 때마다 실행
			$('#client_id').on("propertychange change keyup paste input", function(){

				//console.log("keyup 테스트");	
				var client_id = $('#client_id').val();			// #client_id에 입력되는 값
				var data = {client_id : client_id}				// '컨트롤에 넘길 데이터 이름' : '데이터(#client_id에 입력되는 값)'
				
				$.ajax({
					type : "post",
					url : "/signup/client/clientIdChk",
					data : data,
					success : function(result){
						 //console.log("성공 여부" + result);
						if(result != 'fail'){
							$('.id_input_re_1').css("display","inline-block");
							$('.id_input_re_2').css("display", "none");				
						} else {
							$('.id_input_re_2').css("display","inline-block");
							$('.id_input_re_1').css("display", "none");				
						}
						
					}// success 종료
				}); // ajax 종료

			});
			
			
			
			
			// 저장 버튼 클릭 시 처리 이벤트
			$("#signupBtn").click(function() {
				
				// 아이디 제한 정규식
				let idval = $('#client_id').val()
		        let idvalcheck = /^[a-z0-9]+$/
		        if (!idvalcheck.test(idval) || idval.length<6){
		        	alert('아이디는 영소문자,숫자로 구성된 6글자 이상으로 조합하시오.')
		            $('#client_id').focus();
		            return false
		        }
				
				// 비밀번호 일치 체크
				var client_pw=$('input[name=client_pw]').val();
				var client_pw_re=$('input[name=client_pw_re]').val();
				
				if(client_pw!=client_pw_re){
					alert('비밀번호와 비밀번호 재입력 값이 같아야 합니다.');
					return false;
				}
				
				// 비밀번호 제한 정규식
				let pwdval = $('#client_pw').val()
		        let pwdcheck =  /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
		        if (!pwdcheck.test(pwdval) || pwdval.length<8){
		        	alert('비밀번호는 8 ~ 16자 영문, 숫자, 특수문자를 최소 한가지씩 조합해야합니다.')
		        	$('#client_pw').focus();
		        	return false;
		        } 
				if(idval == client_pw){
		        	alert('아이디와 비밀번호를 다르게 입력하십시오.')
		        	$('#client_pw').focus();
		        	return false;
		        }
				
				// 주민번호 유효성 체크
				let rrnval = $('#client_rrn').val()
				let rrncheck = /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4]{1}$/;
				
					if (!rrncheck.test(rrnval)){
			        	alert('예시에 맞추어 생년월일과 주민번호 첫자리까지 입력해야합니다.');
			        	$('#client_rrn').focus();
			        	return false;
			        } 
				// 입력값 체크
				if(!chkData("#client_id","아이디를")) return;
				else if(!chkData("#client_pw","비밀번호를")) return;
				else if(!chkData("#client_name","이름을")) return;
				else if(!chkData("#client_email","이메일을")) return;
				else if(!chkData("#client_phone","핸드폰 번호를")) return;
				else if(!chkData("#client_address","주소를")) return;
				else if(!chkData("#client_rrn","생년월일을")) return;
				else {
					$("#signupForm").attr({
						"method":"post",
						"action":"/signup/client/signup"
					});
					alert('Dosirak31의 회원이 되어주셔서 감사합니다.');
					$("#signupForm").submit();
					
				}
			});
			
			
			// 취소 버튼 클릭 시 처리 이벤트
			$("#cancleBtn").click(function() {
				$("#signupForm").each(function() {
					this.reset();
				});
			});
			
			// 로그인 화면으로 클릭 시 처리 이벤트
			/* $("#loginBtnB").click(function() {
				location.href = "/client/loginmain";
			});*/
			
		}); 
		
		
		$(document).ready(function(){  //한글입력 안되게 처리 
			$("input[name=client_id]").keyup(function(event){    
			if (!(event.keyCode >=37 && event.keyCode<=40)) {    
				var inputVal = $(this).val();   
				$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));   
				}  
			});
		});
		
	 		
	</script>
	
	<script>
										    function execDaumPostcode() {	// 주소 API function
										        new daum.Postcode({
										            oncomplete: function(data) {
										                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
										
										                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
										                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
										                var addr = ''; // 주소 변수
										                var extraAddr = ''; // 참고항목 변수
										
										                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
										                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
										                    addr = data.roadAddress;
										                } else { // 사용자가 지번 주소를 선택했을 경우(J)
										                    addr = data.jibunAddress;
										                }
										
										                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
										                if(data.userSelectedType === 'R'){
										                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
										                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
										                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
										                        extraAddr += data.bname;
										                    }
										                    // 건물명이 있고, 공동주택일 경우 추가한다.
										                    if(data.buildingName !== '' && data.apartment === 'Y'){
										                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
										                    }
										                
										                } 
										
										                // 우편번호와 주소 정보를 해당 필드에 넣는다.
										                document.getElementById('sample6_postcode').value = data.zonecode;
										                document.getElementById("sample6_address").value = addr;
										                
										                let client_addr = data.zonecode + addr;
										                
										                $("#client_address").val(client_addr);
										            }
										        }).open();
										        
										    }
										</script>
      
</head>
	<body>
	<div id="hBoardList_board_img" class="wrapper row2 bgded"
   style="background-image: url('/resources/images/common/signup.jpg');">
   <div class=" hBoardList_name_location">
      <div id="breadcrumb" class="hBoard_Name">Sign Up</div>
   </div>
</div>

	<div class="wrapper row3">
	<main class="container clear"> 
		<section id="container">
			<form id="signupForm" name="signupForm" class="form-horizontal">
				<table class="table table-bordered">
							<colgroup>
								<col width="20%" />
								<col width="80%" />
							</colgroup>
							<tbody>
								<tr>
									<td>아이디</td>
									<td class="text-left"><input type="text" name="client_id" id="client_id" class="form-control" placeholder="아이디는 영소문자,숫자로 구성된 6글자 이상으로 작성해주세요." />
									<div><span class="id_input_re_1">사용 가능한 아이디입니다.</span>
										<span class="id_input_re_2">아이디가 이미 존재합니다.</span></div>
									</td>
									
								<tr>
									<td>패스워드</td>
									<td class="text-left"><input type="password" name="client_pw" id="client_pw" class="form-control" placeholder="비밀번호는 영대소문자,숫자로 구성된 8글자 이상으로 작성해주세요"/></td>
								</tr>
								<tr>
									<td>패스워드 확인</td>
									<td class="text-left"><input type="password" name="client_pw_re" id="client_pw_re" class="form-control" placeholder="비밀번호는 아이디와 중복될 수 없습니다." /></td>
								</tr>
								<tr>
									<td>이름</td>
									<td class="text-left"><input type="text" name="client_name" id="client_name" class="form-control" /></td>
								</tr>
								<tr>
									<td>주민등록번호</td>
									<td class="text-left"><input type="text" name="client_rrn" id="client_rrn" class="form-control" maxlength="8" placeholder="ex) man =  910403-1 or 3, woman =  910403-2 or 4" />
									</td>
								</tr>
								<tr>
									<td>이메일</td>
									<td class="text-left"><input type="text" name="client_email" id="client_email" class="form-control" placeholder="ex) javauser@gamil.com" /></td>
								</tr>
								<tr>
									<td>핸드폰번호</td>
									<td class="text-left"><input type="text" name="client_phone" id="client_phone" class="form-control" placeholder="ex) 010-1234-5678" /></td>
								</tr>
								<tr>
									<td>주소</td>
									<td class="text-left"><input type="button" id="addBtn" class="dosirakBtn3" value="주소검색" onclick="execDaumPostcode()" />
										<div style="display: none;">
										<input type="text" id="sample6_postcode" placeholder="우편번호">
										<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
										<input type="text" id="sample6_address" placeholder="주소"><br>
										</div>
										<input type="text" name="client_address" id="client_address" class="form-control" placeholder="주소검색 후 상세주소를 입력해주세요." />
										<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
									</td>
								</tr>
							</tbody>
						</table>
						<div class="text-center">
							<input type="button" value="회원가입" id="signupBtn" class="dosirakBtn">&nbsp;&nbsp;
							<input type="button" value="취소" id="cancleBtn" class="dosirakBtn2">
						</div>
						<!-- <div class="text-right">
							<input type="button" value="로그인" id="loginBtnB" class="dosirakBtn3">
						</div>	 -->
			
			</form>
		</section>
		</main>
	</div>
	</body>
</html>