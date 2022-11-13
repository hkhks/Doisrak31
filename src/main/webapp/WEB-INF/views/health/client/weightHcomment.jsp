<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
    
      <link rel="shortcut icon" href="/resources/img/common/icon.png"/>
      <link rel="apple-touch-icon" href="/resources/img/common/icon.png"/>
      
      <title>hComment.jsp</title>

      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap.min.css"/>
      <link rel="stylesheet" type="text/css" href="/resources/include/dist/css/bootstrap-theme.min.css"/>
      
      <style type="text/css">
      
         
         ul{list-style:none; margin: 0; padding: 0;}
         
         #reviewList > li {
         
             background-color: #f9f9fa;
             list-style-type: none;
             padding : 18px 18px 9px 18px;
         }
         
         .update{
            font-size:9pt;
             color : rgb(97,97,97);
             padding: 8px 0 8px 0;
             margin : 0 8px 0 0;
         }
         
         
         }
         #reviewList > button {
             font-size:9pt;
             color : rgb(97,97,97);
             padding: 8px 0 8px 0;
             text-decoration: none;
             margin : 0 6px 0 0;
         }
         
         .health_comment_contents {
             overflow-wrap: break-word;
         }
         
         
         
         .dosirakBtn {
             
             float : right;
         }
         
         .dosirakBtn2 {
             
             float : right;
         }
         
         
         li > button{
             border : 0;
              padding : 0;
              background-color: rgba( 255, 255, 255, 0.5 );
              display: inline-block;
         }
         
         #exampleInputName2{
            margin-top: 13px;
         }
         
         #wrtRepBtn{
         
             font-size:10pt;
               color : rgb(97,97,97);
             background-color: #eff0f2;
             text-decoration: none;
             padding : 9px 10px 9px 10px;
             border-radius: 5px;
             float : right;
             border : 0;
             padding : 0;
             background-color: rgba( 255, 255, 255, 0.5 );
             display: inline-block;
             margin-top:6px;
         
         
         }
         
         #modBtn{
            margin-right: 5px;
         
         }
         
         #item-template{
         
         	display: none;
         }
         
         a{
         	color:#a5d610;
         }
         
         .black-bg {
  			width : 40%;
  			height : 62%;
  			position : fixed;
  			margin-left: 35%;
  			background : rgba(0,0,0,0.5);
 			z-index : 5;
 			padding: 40px;
 			border-radius: 5px;
 			display: none;
		}
		
		.white-bg {
  			background: white;
  			border-radius: 5px;
  			padding: 30px;
  			align:center;
		} 
		
		.show-modal{
			display:block;
		}
		
		input[type="radio"]{
			display: inline;
			margin-top: 10px;
		}
         
         
      </style>
      
      <script type="text/javascript" src="/resources/include/js/jquery-1.12.4.min.js"></script>
      <script type="text/javascript" src="/resources/include/js/common.js"></script>
      <script type="text/javascript" src="/resources/include/dist/js/bootstrap.min.js"></script>

   
</head>
<body>
    <div class="black-bg" id="modal">
  		<div class="white-bg">
  			<form id="reportForm">
  				<b>신고 사유 선택</b><br/><br/>
				
				<input type="hidden" id="report_client_id" name="report_client_id"/>
				<input type="hidden" id="reported_id" name="reported_id"/>
				<input type="hidden" id="report_health_hcomment_no" name="report_health_hcomment_no"/>
				<input type="hidden" id="report_health_no" name="report_health_no"/>
				<input type="hidden" id="report_health_comment_contents" name="report_health_comment_contents"/>
  				
  				<p><input type="radio" name="reason_report" value="욕설,비방,차별,혐오"/>욕설,비방,차별,혐오</p>
  				<p><input type="radio" name="reason_report" value="홍보,영리목적"/>홍보,영리목적</p>
  				<p><input type="radio" name="reason_report" value="불법정보"/>불법정보</p>
  				<p><input type="radio" name="reason_report" value="음란,청소년 유해"/>음란,청소년 유해</p>
  				<p><input type="radio" name="reason_report" value="개인정보 노출,유포,거래"/>개인정보 노출,유포,거래</p>
  				<p><input type="radio" name="reason_report" value="도배,스팸"/>도배,스팸</p>
  			</form><br/>
  			
    		
    		<button class="dosirakBtn" id="sendreport" style="margin-left:5px; width:50px;">확인</button>
    		<button class="dosirakBtn2" id="closereport" style="width:50px;" >취소</button><br/>
  		</div>
	</div> 
    
    
    
    <ul id = "reviewList">
      <li id = "item-template">   
         <span style="font-weight: bold; font-size: 15px;" class="client_id"></span><br/>
         <span class="health_comment_contents"></span><br/>
         <span class="up_date"></span>
         <button type="button" data-btn ="replyBtn" class="btn-write">답글쓰기</button>
         <button type="button" data-btn ="modBtn" class="btn-modify">수정</button>
         <button type="button" data-btn="delBtn" class="btn-delete">삭제</button>
         <img src="/resources/images/common/reporticon.png" style ="width:28px; height:20px;" id="reportIcon"/>
       </li>
    </ul>
    
    
    <div id="replyForm" style="display:none" class="form-group">
       <input type="text" name="replyComment" class="form-control" id="exampleInputName2" placeholder="답글을 입력하세요"/>
       <button type="button" id="wrtRepBtn">답글 등록</button><br/>
    </div>
    
    
    <div class="form-group">
       <input type="text" name ="comment" class="form-control" placeholder="댓글을 입력하세요"/><br/>
       <button id="sendBtn" type="button"  class="dosirakBtn" style = "color: white; border:none; ">댓글 등록</button>
       <button id="modBtn" type="button"  class="dosirakBtn2" style = "color: white; border:none;">수정 완료</button><br/><br/><br/>
    </div>
    
     
    <script type="text/javascript">
       
       let health_no = ${weightDetail.health_no};
       
       let report_client_id = 0;
       let reported_id = "";
       let report_health_hcomment_no = 0;
       let report_parent_health_comment_no = 0;
       
       /*********************************************************************
       DOM이 만들어지면 실행됨
    *******************************************************************/
       $(document).ready(function(){ 
          
    /*********************************************************************
       댓글 목록 보기
    *******************************************************************/
    
            showList(health_no);
            
    	
     /*********************************************************************
          댓글 달기
     *******************************************************************/
       		$(document).on("click", "#sendBtn", function(){   // 보내기 버튼을 눌렀을 때
            
             	let health_comment_contents = $("input[name=comment]").val(); // comment 텍스트창에 적혀있는 댓글 내용을 가져온다.
            
             	/**댓글 입력칸이 공백이면 댓글을 입력해달라는 경고창이 뜸 **/
             	if(health_comment_contents.trim() == ''){
                
                		alert("댓글 내용을 입력해주세요");
                		$("input[name=comment]").focus();
                
                		return;
            		}
             
             	/**댓글 입력창 전송**/
             	$.ajax({
                     type:'POST',       // http 메서드
                     url: '/hreplies/comments',
                     headers : {
                     	
                     		"Content-Type":"application/json"
                     		
                     },
                     data: JSON.stringify({health_no:health_no,health_comment_contents:health_comment_contents}), //서버로 전송할 데이터
                     
                     success : function(result){
                       
                        showList(health_no); //요청이 성공하면 댓글 목록을 갱신하여 다시 보여준다. 
                        
                        $("input[name=comment]").val('');
                        
                     },
                     error : function(){ alert("댓글을 입력할 수 없습니다.") } // 댓글 등록을 실패했을 때 , 경고창을 띄운다. 
                 }); 
             
         	});
       
       /*********************************************************************
          댓글 수정
       *******************************************************************/
       		$(document).on("click", "#modBtn", function(){   // 댓글 수정버튼을 클릭했을 때 
            
            		let health_comment_contents = $("input[name=comment]").val();  
            		let health_comment_no = $(this).attr("data-health_comment_no"); 
             
             	/**댓글 수정(입력)칸 이 공백이면 댓글을 입력해달라는 경고창이 뜸 **/
             	if(health_comment_contents.trim() == ''){
                
                		alert("댓글 내용이 없어 수정 불가능합니다.");
                
                		$("input[name=comment]").focus();
                
                		return;
             	}
             
             /**댓글 수정(입력)창 전송 -> 댓글옆에 달린 수정버튼으로 해당 댓글의 정보를 최상위 태그로 보내줬었음, 그것을 컨트롤러로 전송 **/
             	$.ajax({
                     type:'PATCH',       // 요청 메서드
                     url: '/hreplies/comments/'+health_comment_no,  //정보를 여기로 보냄
                     headers : {
                     	
                     	"Content-Type":"application/json"
                     	
                     },
                     data: JSON.stringify({health_comment_no:health_comment_no,health_comment_contents:health_comment_contents}), //서버로 전송할 데이터
                     
                     success : function(result){
                        
                        showList(health_no); //요청이 성공하면 댓글 목록을 갱신하여 다시 보여준다. 
                        
                        $("input[name=comment]").val('');
                        
                     },
                     error : function(){ alert("댓글 수정을 실패하였습니다."); } 
                 }); 
             
         	});
       
       
       /*********************************************************************************************************
           수정버튼을 클릭하면 댓글의 정보를 가지고 컨트롤러로 간뒤, 수정작업을 진행
        *********************************************************************************************************/
        		$(document).on("click", "button[data-btn='modBtn']", function(){ // 여기 있는 수정버튼은 댓글마다 달린 수정 버튼 
     
         		let health_no = $(this).parents().attr("data-health_no");
         		let health_comment_no = $(this).parents().attr("data-health_comment_no");
         		let health_comment_contents = $("span.health_comment_contents",$(this).parent()).text(); //클릭된 수정버튼의 부모에 있는 span.health_comment_contents만 가져옴
         
         		//1. comment의 내용을 입력창에 띄워준다. (기존 댓글을 보여줌 -> 추후 기존 댓글을 지우고 댓글을 입력하면 새로운 댓글 내용이 셋팅됨)
          		$("input[name=comment]").val(health_comment_contents);
         
         		//2. 수정버튼에 댓글 번호를 전달한다. 
         		$("#modBtn").attr("data-health_comment_no",health_comment_no);
         
   
      
       		});
             
       
          /*********************************************************************
                댓글 삭제
          *******************************************************************/
            $(document).on("click", "button[data-btn='delBtn']", function(){
         	   
         	   if(confirm("댓글을 삭제하시겠습니까?")){
               
            		let health_no = $(this).parents().attr("data-health_no");
            		let health_comment_no = $(this).parents().attr("data-health_comment_no");
            
            		deleteBtn(health_no, health_comment_no);
         	   
         	   }
            
            });
          

          /*********************************************************************
             답글 달기전 사전작업
          *******************************************************************/
            $(document).on("click", "button[data-btn='replyBtn']", function(){
               
               	//1. replyForm을 옮긴다. -> replyBtn의 부모 즉, li태그의 맨 뒤에 붙인다.
              	$("#replyForm").appendTo($(this).parent());
               
               	//2. 답글을 입력할 폼을 보여준다.
               	$("#replyForm").css("display","block");
               
         	});
          
          /*********************************************************************
             답글 달기
          **********************************************************************/
          	$(document).on("click", "#wrtRepBtn", function(){   // 보내기 버튼을 눌렀을 때
            
            		let health_comment_contents = $("input[name=replyComment]").val(); // comment 텍스트창에 적혀있는 댓글 내용을 가져온다.
            		let parent_health_comment_no = $("#replyForm").parent().attr("data-parent_health_comment_no");
             
             	/**댓글 입력칸이 공백이면 댓글을 입력해달라는 경고창이 뜸 **/
             	if(health_comment_contents.trim() == ''){
                
                		alert("답글 내용을 입력해주세요");
                		$("input[name=replyComment]").focus();
                
                		return;
             	}
            
             /**댓글 입력창 전송**/
             	$.ajax({
                     type:'POST',       
                     url: '/hreplies/comments',  
                     headers : {
                     	
                     	"Content-Type":"application/json"
                     	
                     },
                     data: JSON.stringify({parent_health_comment_no:parent_health_comment_no,health_no:health_no,health_comment_contents:health_comment_contents}), //서버로 전송할 데이터
                     
                     success : function(result){
                        
                        showList(health_no); //요청이 성공하면 댓글 목록을 갱신하여 다시 보여준다. 
                       
                     },
                     error : function(){ alert("댓글을 입력할 수 없습니다.") } // 댓글 등록을 실패했을 때 , 경고창을 띄운다. 
                 }); // $.ajax()
                 
                 
                 $("#replyForm").css("display","none"); //완료된 뒤 안보이게함
                 $("input[name=replyComment]").val(''); // 값도 비워줌
                 $("#replyForm").appendTo("body"); // 특정 댓글 밑이 아닌 원래 위치로 되돌림
                 
             
         	}); 
          

            /*********************************************************************
               신고 아이콘을 눌렀을 때 값을 가져와서 변수에 셋팅
            **********************************************************************/
         	$(document).on("click", "#reportIcon", function(){
         		
         		 $(".black-bg").addClass("show-modal");
         		 
         		 report_client_id = "${sessionScope.client_info.client_id}";
         		 reported_id = $(this).parents().attr("data-client_id");
         	     report_health_hcomment_no = $(this).parents().attr("data-health_comment_no");
         	     report_health_no = health_no;
         	     report_parent_health_comment_no = $(this).parents().attr("data-parent_health_comment_no");
         	     
         	     
         	    $("#report_client_id").val(report_client_id); // 신고하는 사람 아이디
           	 	$("#reported_id").val(reported_id); // 신고당한 사람 아이디
           	 	$("#report_health_hcomment_no").val(report_health_hcomment_no); //헬스 댓글 번호
           	 	$("#current_health_no").val(health_no);
           	    
         	     
         	});
         	

            /*********************************************************************
               신고 사유 선택하고 확인 버튼을 눌렀을 때
            **********************************************************************/
			$(document).on("click", "#sendreport", function(){
				
				let reportformdata = $("#reportForm").serialize();

	            console.log(reportForm);
         		
           	 	sendformreportdata(reportformdata);
           	 	
           	 	$('#reportForm').each(function(){
      				this.reset();
      			});
           	 	
        	});
         	
         	

             /*********************************************************************
                신고 취소 버튼을 눌렀을 때
             **********************************************************************/
         	$(document).on("click","#closereport",function(){
         		
         		document.getElementById('modal').classList.remove('show-modal');
         		
         		$('#reportForm').each(function(){
         			this.reset();
         		});
         		
         	});
         	
           
     });   //최상위 함수 종료
    
     
     function sendformreportdata(reportformdata){
         
  	   $.ajax({
             type:'POST',       
             url: '/report/reportIn',  
             data: reportformdata, //서버로 전송할 데이터
             contentType : "application/x-www-form-urlencoded; charset=UTF-8",
             async : false,
             dataType:'text',
             success : function(result){
          	   
            	 if(result == "SUCCESS"){
              	   
         	   	   	alert("댓글 신고가 접수되었습니다.");
         	   	   	
                    	$(".black-bg").removeClass("show-modal");
         	   	}
                     
                    
             },
             error : function(){ 
           	
          	   alert("댓글 신고를 실패하였습니다. 잠시 후 다시 시도해주세요.");
             	   $(".black-bg").removeClass("show-modal");} 
         
  	   }); // $.ajax()
      	  
     }
    
     
     /*********************************************************************
       댓글 목록의 값을 받아오는 함수
    *******************************************************************/
    function showList(health_no) {
         $(".reply").detach(); //선택한 요소를 DOM트리에서 삭제
         
         let url = "/hreplies/comments/"+health_no; 
         
         $.getJSON(url, function(data) {  //댓글 목록들을 받아왔음
            
         	$(data).each(function() {
                  
                      let health_no = this.health_no; //게시글번호 
                      let health_comment_no = this.health_comment_no; //댓글번호
                      let parent_health_comment_no = this.parent_health_comment_no; //모댓글 번호
                      let up_date = this.up_date; // 업데이트 날짜
                      let client_id = this.client_id; // 작성자 아이디
                      let health_comment_contents = this.health_comment_contents;//댓글 내용
                      
                      
                      template(health_no,health_comment_no,parent_health_comment_no,up_date,health_comment_contents,client_id);//댓글 양식에 가져온 값들을 셋팅
                      
            	}); 
         
         });
         
      } 
   
     
    /*********************************************************************
       댓글 틀 및 내용을 집어넣어주는 함수(받아온 값들을 셋팅)
    *******************************************************************/
    function template(health_no,health_comment_no,parent_health_comment_no,up_date,health_comment_contents,client_id){
       
       let $ul = $('#reviewList');
       
       let $element = $('#item-template').clone().removeAttr('id'); //<li>를 id삭제한채로 그대로 복사
       
       let loginName = "${sessionScope.client_info.client_id}";
       
       let text = "\u00a0\u00a0\u00a0\u00a0\u00a0\u00a0";
       
       $element.addClass("reply");
       $element.attr("data-health_comment_no",health_comment_no); //<li>에 속성 추가 1
       $element.attr("data-parent_health_comment_no",parent_health_comment_no); //<li>에 속성 추가 2
       $element.attr("data-health_no",health_no); //<li>에 속성 추가 3
       $element.attr("data-client_id",client_id); //<li>에 속성 추가 4
       
      
       
          if(health_comment_no == parent_health_comment_no){ // 값이 같을 경우 원댓글
             
             $element.find('.client_id').text(client_id);
             $element.find('.health_comment_contents').text(health_comment_contents);
             $element.find('.up_date').text(up_date);
             
          }else{ // 값이 다를 경우 답댓글 -> 답댓글은 들여쓰기를 한다.
         	
             $element.find('.client_id').text(text+"ㄴ"+client_id);
             $element.find('.btn-write').detach();
             $element.find('.health_comment_contents').text(text+health_comment_contents);
             $element.find('.up_date').text(text+up_date);
             
          }
       
       	 if(loginName != client_id){
          
           	$element.find('.btn-modify').detach();
           	$element.find('.btn-delete').detach();
           
        }else{
      		 
       		$element.find('#reportIcon').detach();
       	 }
       
       $ul.append($element);
       
    }
    
    /*********************************************************************
        글 삭제를 위한 함수
     *******************************************************************/
   
   function deleteBtn(health_no, health_comment_no) {
         
            $.ajax({
                     type:'DELETE',       // 요청 메서드
                     url: '/hreplies/comments/'+health_comment_no,  // 댓글 번호를 보냄
                     
                     success : function(result){
                        
                        showList(health_no);
                        
                     },
                     error : function(){ alert("댓글을 삭제하는것을 실패하였습니다.") } // 에러가 발생했을 때, 호출될 함수
                 }); // $.ajax()
           
    }
    
</script>
          

</body>
</html>