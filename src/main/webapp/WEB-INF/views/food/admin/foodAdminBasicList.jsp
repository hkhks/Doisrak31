<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/views/common/common.jspf" %> 
 
   <style type="text/css">
  /*tab 만드는 css*/
	ul.tabs{
		margin: 0px;
		padding: 0px;
		list-style: none;
	}
	ul.tabs li{
		background: none;
		color: #222;
		display: inline-block;
		padding: 10px 15px;
		cursor: pointer;
		font-weight:bold;
	}
	
	ul.tabs li.current{
		background:ghostwhite;
		
		color: #222;
		font-weight:bold;
		
	}
	 
	input[type="submit"], #comments input[type="reset"] {
    color: inherit;
    background-color: ghostwhite;
}
tr:nth-child(even), #comments li:nth-child(even) {
    color: inherit;
    background-color: ghostwhite;
}
	/*탭 안 내용*/
	.tab-content{
		display: none;
		background:ghostwhite; /*변경*/
		background-repeat:no-repeat;
		padding: 50px;
		text-align:center;
		width:800px;
		height:400px;
		overflow:auto;
	}
	
	.tab-content.current{
		display: inherit;
		padding: 50px;
		text-align:center;
		width:800px;
	}
	td{color:black;}
	#comments div {
    color: black;
}
	/*탭 안 음식관련 ul 가로 정렬 */
	.clear{clear:none;}
	.clear, ul.nospace.clear.fd::after, .group {clear:none;}/*여긴보류*/
	#comments ul{margin:0px;}
	.white{color:black; font-size:20px;}/*변경*/
	.wd{width:300px; height:230px; box-shadow:0 4px 8px 0 rgba(0,0,0,0.3), 0 6px 20px 0 rgba(0,0,0,0.15);}
	/*이미지 정렬 및 탭안 li 가로정렬*/
	.img-thumbnail{width:200px; height:150px;}
	#comments li{margin:10px 10px;}
	.li_control{width:190px; height:330px; background-color:ghostwhite;/*변경*/
	 box-shadow:0 4px 8px 0 rgba(0,0,0,0.3), 0 6px 20px 0 rgba(0,0,0,0.15);}
	.one_half, .one_third, .two_third, .one_quarter, .two_quarter, .three_quarter{float:left;}
	#foodMenu{display:none;}
	/*폰트색*/
	#tab-1{color:black;}
	#total_price{color:orage; font-weight:bold;}
	#sallad{width:300px; height:200px;}
   
   /*식품추가테이블 설정*/
   .bt,.bt2{display:inline; }
   #comments input[type='radio']{width:7%;}
   #add{display:none;}
   #update{display:none;}
   div.panel{width:750px;}
   table.table{width:750px;}
  
   </style>
   <script type="text/javascript">
   <!--===================도시락 메뉴 탭 기능 =========================== -->
      $(document).ready(function(){
         
         $(".tabs li").click(function(){
            let tab_id = $(this).attr("data-tab");
   
            $(".tabs li").removeClass("current");
            $(".tab-content").removeClass("current");
   
            $(this).addClass("current");
            $("#"+tab_id).addClass("current");
         });
   
      });
      <!--===================도시락 메뉴 탭 기능 끝=========================== -->
      <!--===================기초대사량 계산 시작 =========================== -->
      $(function(){

         
         <!--=========메뉴카테고리 탭 선택시 그에 맞는 메뉴 출력====================-->
         for(let i=1; i<=5; i++){
            $("#menu"+i).click(function(){
               $(".fd").detach();
               let food_category=$(this).attr("data-value");
               let url="/food/all/"+food_category;
               /*ajax불러오기*/
               $.getJSON(url,function(data){
                  $(data).each(function(){
                     let food_no=this.food_no;
                     let food_name=this.food_name;
                     let food_img=this.food_img;
                     let food_price=this.food_price;
                     let food_kcal=this.food_kcal;
                     let food_volume=this.food_volume;
                     /*ajax불러온것 화면 구성*/
                     let $div=$("#tab-"+(i+1));
                     let $ul =$("#foodMenu").clone().removeAttr("id");
                     $ul.find(".foodUpdateBtn").attr("data-num",food_no);
                     $ul.find(".foodUpdateBtn").attr("data-img",food_img)
                     $ul.find(".foodDeleteBtn").attr("data-num",food_no);
                     $ul.find(".foodDeleteBtn").attr("data-img",food_img);
                     $ul.addClass("fd");
                     $ul.find(".img-thumbnail").attr("src","/dosirak31img/food/"+food_img);
                     $ul.find(".menuList").html(food_name+food_volume+"g<br/>"+food_kcal+"kcal<br/>"+food_price+"원");
                     $div.append($ul);
                     
                  })
               }).fail(function(){
                  alert("음식목록을 불러오는데 실패하였습니다. 잠시후에 다시 시도해주세요.");
               })
            })
            
            
         }
         <!--=========메뉴카테고리 탭 선택시 그에 맞는 메뉴 출력 끝====================-->
         <!--=====식품 추가양식 버튼 눌렀을 때============================-->
         $("#foodAddBtn").click(function(){
            $("#update").css("display","none");
            $("#add").show();
         })
         <!--=====식품 추가양식 버튼 눌렀을 때 끝============================-->
          //========식품 추가를 위한 버튼 실행=========//
         $("#foodAdd").click(function(){         
               
             if($("input[name='food_category']:radio:checked").length<1){
                 alert("음식 카테고리를 선택하세요");
                 return;
              }else if(!chkData("#food_name","음식 이름을")) return;
              else if(!chkData("#food_volume","음식 중량을")) return;
              else if(!chkData("#food_kcal","열량을")) return;
              else if(!chkData("#food_calb","탄수화물을")) return;
              else if(!chkData("#food_protein","단백질을")) return;
              else if(!chkData("#food_fat","지방을")) return;
              else if(!chkData("#food_price","가격을")) return;
              else if($("#food_file").val()==""){
                 alert("음식 이미지를 첨부해주세요");
                 return;
              }else if(!chkFile($("#food_file"))){
                 $("#food_file").val("");
                 return;
              }else{
                 alert("식품을 새로 추가하시겠습니까?");
                 $("#foodAddForm").attr({
                    "method":"post",
                    "enctype":"multipart/form-data",
                    "action":"/food/foodBasicInsert"
                 });
                 $("#foodAddForm").submit();
                 
                 
              }
   
            
         })   
         
         /*숫자만 입력되도록하는 함수*/
         $('input[onlyNumber]').on('keyup',function(){
            $(this).val($(this).val().replace(/[^.0-9]/g,""));
         });
          
          //식품 수정 양식 버튼
          $(document).on("click",".foodUpdateBtn",function(){
            $("#add").css("display","none");
            
            /*
            $("#food_nowhat").val($(this).attr("data-num"));
            let goUrl="/food/foodAdminBasicListNo";
            $("#selectForm").attr("action",goUrl);
            $("#selectForm").submit();
            */
            
            let food_no=$(this).attr("data-num");
            console.log(food_no);
            let url="/food/all2/"+food_no;
            //ajax불러오기
            $.getJSON(url,function(data){
               $(data).each(function(){
                  let food_no=this.food_no;
                  let food_category=this.food_category;
                  let food_name=this.food_name;
                  let food_volume=this.food_volume;
                  let food_price=this.food_price;
                  let food_calb=this.food_calb;
                  let food_protein=this.food_protein;
                  let food_fat=this.food_fat;
                  let food_kcal=this.food_kcal;
                  let food_img=this.food_img;
                  
                  $(".bt2").each(function(){
                     if($(this).val()==food_category){
                        $(this).attr("checked",true);
                     }
                  })
                  $("#food_nowhat").val(food_no);
                  $("#food_imgwhat").val(food_img);   
                  $("#food_name2").val(food_name);
                  $("#food_volume2").val(food_volume);
                  $("#food_kcal2").val(food_kcal);
                  $("#food_calb2").val(food_calb);
                  $("#food_protein2").val(food_protein);
                  $("#food_fat2").val(food_fat);
                  $("#food_price2").val(food_price);
                  $("#update").show();
                  
                  
            })
         })
      })
      
      //식품수정하기버튼
      $("#foodUpdate").click(function(){         
         
       if($("input[name='food_category']:radio:checked").length<1){
               alert("음식 카테고리를 선택하세요");
               return;
            }else if(!chkData("#food_name2","음식 이름을")) return;
            else if(!chkData("#food_volume2","음식 중량을")) return;
            else if(!chkData("#food_kcal2","열량을")) return;
            else if(!chkData("#food_calb2","탄수화물을")) return;
            else if(!chkData("#food_protein2","단백질을")) return;
            else if(!chkData("#food_fat2","지방을")) return;
            else if(!chkData("#food_price2","가격을")) return;
            else if($("#food_file2").val()==""){
               alert("음식 이미지를 첨부해주세요");
               return;
            }else if(!chkFile($("#food_file2"))){
               $("#food_file2").val("");
               return;
            }else{
               alert("식품을 수정하시겠습니까?");
               $("#foodUpdateForm").attr({
                  "method":"post",
                  "enctype":"multipart/form-data",
                  "action":"/food/foodAdminBasicUpdate"
               });
               $("#foodUpdateForm").submit();
            }

      
   })   
      
      //식품삭제버튼
      $(document).on("click",".foodDeleteBtn",function(){
         if(confirm("정말 삭제하시겠습니까?")){
            $("#food_nowhat2").val($(this).attr("data-num"));
            $("#food_imgwhat2").val($(this).attr("data-img"));
            let goUrl="/food/foodAdminBasicDelete";
            $("#selectForm").attr("action",goUrl);
            $("#selectForm").submit();
         }
      })
      
      
      
      
   });//function마지막
      
      
      
   </script>

</head>
   
<div class="wrapper row3 ">
    <form id="selectForm">
       <input type="hidden" name="food_no" id="food_nowhat2" />
        <input type="hidden" name="food_img" id="food_imgwhat2"/>
    </form>
   
   
   <div id="comments">   
      <!--===================도시락 메뉴 리스트=========================== -->
     <article>
         <h3><label for="comment">식품 관리 메뉴</label></h3>
         <ul class="tabs">
            <li class="tab-link current" data-tab="tab-1" >메뉴<br/></li>
            <li class="tab-link " data-tab="tab-2" data-value="야채" id="menu1">야채<br/></li>
            <li class="tab-link" data-tab="tab-3" data-value="토핑" id="menu2">토핑<br/></li>
            <li class="tab-link" data-tab="tab-4" data-value="사이드" id="menu3">사이드<br/></li>
            <li class="tab-link " data-tab="tab-5" data-value="과일" id="menu4">과일<br/></li>
         </ul>
         
         <div id="tab-1" class="tab-content current">
            식품 관리 품목을 메뉴별로 확인하세요
         </div>
         <div id="tab-2" class="tab-content" >
               <ul id="foodMenu"class="nospace clear">
                     <li class="one_quarter text-center li_control">
                     <!-- <img src="/dosirak31img/food/이미지이름"/> --> 
                    <img alt="식품이미지" class="img-thumbnail">
                    <div class="menuList"></div>
                    <button type="button" class="dosirakBtn1 foodUpdateBtn" >식품 수정</button>
                    <button type="button" class="dosirakBtn1 foodDeleteBtn" >식품 삭제</button>
                    </li>
                 </ul>            
         </div>
         <div id="tab-3" class="tab-content" ></div>
         <div id="tab-4" class="tab-content"></div>
         <div id="tab-5" class="tab-content "></div>
         <div id="tab-6" class="tab-content "></div>
            
         </article>   
        <!--===================도시락 메뉴 끝=========================== -->
        
      <div class="scrollable">
         
         <div >
         <button type="button" class="dosirakBtn1" id="foodAddBtn">식품 추가 양식</button>
      </div>
      <%--==============식품 추가 화면 =========================--%>
         <div id="add">
         <form id="foodAddForm" name="foodAddForm">
            <div class="panel panel-default">
               <table class="table">
                  <tbody>
                     <tr>
                        <td class="com-md-1">음식 카테고리</td>
                        <td class="com-md-3 text-left">
                           <div class="form-group">
                              <input type="radio" name="food_category" class="form-control bt" value="야채"/>야채
                              <input type="radio" name="food_category" class="form-control bt" value="토핑"/>토핑
                              <input type="radio" name="food_category" class="form-control bt" value="사이드"/>사이드
                              <input type="radio" name="food_category" class="form-control bt" value="과일"/>과일
                              
                           </div>
                        </td>
                        <td class="com-md-1">음식이름</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_name" id="food_name" maxlength="20" class="form-control" />
                        </td>
 
                     </tr>
                     <tr>
                        <td class="com-md-1">음식중량(g)</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_volume" id="food_volume" class="form-control" placeholder="숫자만 입력" onlyNumber/>
                        </td>
                        <td class="com-md-1">열량(kcal)</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_kcal" id="food_kcal" class="form-control" placeholder="숫자만 입력" onlyNumber/>
                        </td>
                     </tr>   
                     <tr>
                        <td class="com-md-1">탄수화물(g)</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_calb" id="food_calb" class="form-control" placeholder="숫자만 입력" onlyNumber/>
                        </td>
                     
                        <td class="com-md-1">단백질(g)</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_protein" id="food_protein" class="form-control" placeholder="숫자만 입력" onlyNumber/>
                        </td>
                     </tr>
                     <tr>   
                        <td class="com-md-1">지방(g)</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_fat" id="food_fat" class="form-control" placeholder="숫자만 입력" onlyNumber/>
                        </td>
                        <td class="com-md-1">가격(원)</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_price" id="food_price" class="form-control"  placeholder="숫자만 입력" onlyNumber/>
                        </td>
                     </tr>
                      <tr>
                        <td>이미지 파일 첨부</td>
                        <td colspan="2" class="text-left"><input type="file" name="food_file" id="food_file" /></td>
                             <td><button type="button" class="dosirakBtn1" id="foodAdd">새로운 식품 추가</button></td>               
                     </tr>   
                  </tbody>
               </table>
            </div>
         
         
         </form>
         </div>
         <%--식품 추가 화면 끝 --%>
         <%--식품 수정 화면 --%>
          <div id="update">
         <form id="foodUpdateForm" name="foodUpdateForm">
            <input type="hidden" name="food_no" id="food_nowhat" />
           <input type="hidden" name="food_img" id="food_imgwhat"/>
            <div class="panel panel-default">
               <table class="table">
                  <tbody>
                     <tr>
                        <td class="com-md-1">음식 카테고리</td>
                        <td class="com-md-3 text-left">
                           <div class="form-group">
 							<input type="radio" name="food_category" class="form-control bt2" value="야채"/>야채
                              <input type="radio" name="food_category" class="form-control bt2" value="토핑"/>토핑
                              <input type="radio" name="food_category" class="form-control bt2" value="사이드"/>사이드
                              <input type="radio" name="food_category" class="form-control bt2" value="과일"/>과일
                           </div>
                        </td>
                        <td class="com-md-1">음식이름</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_name" id="food_name2" maxlength="20" class="form-control" />
                        </td>
 
                     </tr>
                     <tr>
                        <td class="com-md-1">음식중량(g)</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_volume" id="food_volume2" class="form-control" onlyNumber/>
                        </td>
                        <td class="com-md-1">열량(kcal)</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_kcal" id="food_kcal2" class="form-control" onlyNumber/>
                        </td>
                     </tr>   
                     <tr>
                        <td class="com-md-1">탄수화물(g)</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_calb" id="food_calb2" class="form-control" onlyNumber/>
                        </td>
                     
                        <td class="com-md-1">단백질(g)</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_protein" id="food_protein2" class="form-control" onlyNumber />
                        </td>
                     </tr>
                     <tr>   
                        <td class="com-md-1">지방(g)</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_fat" id="food_fat2" class="form-control" onlyNumber/>
                        </td>
                        <td class="com-md-1">가격(원)</td>
                        <td class="com-md-3 text-left">
                           <input type="text" name="food_price" id="food_price2" class="form-control" onlyNumber/>
                        </td>
                     </tr>
                      <tr>
                        <td>이미지 파일 첨부</td>
                         <td colspan="2" class="text-left"><input type="file" name="food_file" id="food_file2" /></td>
                        <td><button type="button" class="dosirakBtn1" id="foodUpdate">수정하기</button></td>
                     </tr>   
                  </tbody>
               </table>
            </div>
         
         
         </form>
         </div>
      <%--식품 수정 화면 끝 --%>
      
       </div>
       
      </div>
  <!-- ################################################################################################ --> 
    <!-- / main body -->
    <div class="clear"></div>
</div>


</body>
</html>