<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.5.17.  진예은            최초작성
* 2021.5.24.  진예은            drag and drop
* 2021.6.19.  진예은            출/퇴근 체크 수정
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

    <style>
    .fa-minus{
    	float: right;
    }
    
    .smallIcon{
    	width: 20px;
    	height: 20px;
    	color : white;
    }
    
    .fontSet{
    	font-size: 20px;
    	font-weight: bold;
    	color: #6b5050;
    }
    
    .stats-icon{
    	float: left;
    	margin-left : 10px;
    }
    
    .card .card-header{
    	border-radius: 20px;
    }

    .attDIV{
    	width: 91%;
    	height: 79px;
    	background-color: #f1efef;
    	border-radius: 50px;
    	margin-left: 15px;
    	margin-bottom: 15px;
    	display: inline-block;
    	padding-top: 19px;
    	padding-left: 19px;
    }
    
    .spanSize{
    	font-weight: bold;
    	font-size: 18px;
    }
    
    .clockNumSize{
    	font-weight: bold;
    	font-size: 20px;
    }
    
    .commuteTABLE{
    	margin-left: 18px;
  		width: 87%;
    	height: 50px;
    	vertical-align: middle;
    }
    
    .commuteBTN{
    	width: 100%;
    }
    
    .commuteTABLE th{
    	height: 50px;
    }
    
    .commuteFONT{
    	font-size: 19px;
    	font-weight: bold;
    }
    
    #clockCommute{
    
    }
	 .ui-state-highlight {
		height: 27.5em; 
		line-height: 1.2em;
		width: 500px;
		border: 2px dashed #826767 !important;
		background: #dacdc6 !important;
	}
	
	.iconArea{
		min-height: 70px;
		max-height: 70px;
		padding: 0.7rem !important;
	}
	
	.dashRightArea{
		min-height: 70px;
		max-height: 70px;
		padding : 0.6rem !important;
		padding-left: 25px !important;
	}
	
	.Area3{
/* 		min-height: 45%; */
/* 		max-height: 45%;  */
	}
	
	.marginTOP{
		margin-top: 2.2rem;
	}
	/*  card 옵션 css  */
	
	.card-header  {
		display :flex;
		justify-content: space-between;
		padding: 1.0rem 1.5rem;
	}
	
	.card .card-header .card-header-right i {
	margin: 0 7px;
	cursor: pointer;
	font-size: 12px;
	color: #8c8c8c;
	line-height: 2;
	}
	
	.card .card-header .card-header-right .card-option {
		width: 35px;
		height: 20px;
		overflow: hidden;
		-webkit-transition: 0.3s ease-in-out;
		transition: 0.3s ease-in-out;
	}
	
	.card .card-header .card-header-right .card-option li {
		display: inline-block;
		
	}
	.card.full-card {
		position: fixed;
		top: calc(56px + 15px);
		z-index: 99999;
		-webkit-box-shadow: 0 0 35px 0px rgba(0, 0, 0, 0.44);
		box-shadow: 0 0 35px 0px rgba(0, 0, 0, 0.44);
		left: 15px;
		border-radius: 5px;
		width: calc(100vw - 50px);
		height: calc(100vh - 86px);
		-webkit-transition: all 5s ease-in-out;
		transition: all 5s ease-in-out;
	}
	
	.card.full-card.card-load {
		position: fixed;
	}	
	
	.card.full-card.card-load {
		position: fixed;
	}
	
	.card.card-load {
		position: relative;
		overflow: hidden;
	}
	
	.card.card-load .card-loader {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		display: -webkit-box;
		display: -ms-flexbox;
		display: flex;
		-webkit-box-align: center;
		-ms-flex-align: center;
		align-items: center;
		background-color: rgba(255, 255, 255, 0.7);
		z-index: 999;
	}
	
	.card.card-load .card-loader i {
		margin: 0 auto;
		color: #448aff;
		font-size: 20px;
	}
	.rotate-refresh {
		-webkit-animation: mymove 0.8s infinite linear;
		animation: mymove 0.8s infinite linear;
		display: inline-block;
	}
	.totalFranCnt{
		text-align: center;
	}
	.totalFranCnt span {
		margin-top :11px;
	}
	@-webkit-keyframes mymove {
		0% {
			-webkit-transform: rotate(0deg);
			transform: rotate(0deg);
		}
		100% {
			-webkit-transform: rotate(360deg);
			transform: rotate(360deg);
		}
	}
	
	@keyframes mymove {
		0% {
			-webkit-transform: rotate(0deg);
			transform: rotate(0deg);
		}
		100% {
			-webkit-transform: rotate(360deg);
			transform: rotate(360deg);
		}
	}
    </style>
  
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<!-- 아이콘 css --> 
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assets2/icon/themify-icons/themify-icons.css">
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assets2/css/font-awesome-n.min.css">
    <link rel="stylesheet" type="text/css" href="${cPath}/resources/assets2/css/font-awesome.min.css">
    <!-- //아이콘 css 끝 -->
    <script src="${cPath}/resources/assets/vendors/apexcharts/apexcharts.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <div id="app">
    ${cordlists }
        <div id="sidebar" class="active">
            
        </div>
            <div class="page-content">
                    <div class="row">
                        <div class="col-12 col-lg-9 dropfalse ">
                            <div class="card marginTOP">
                                <div class="card-body px-3 py-4-5 column iconArea">
                                        <div class="col-md-4">
                                        </div>
                             </div>
                      		  </div>
                    	</div>
                  	<c:choose>
					   <c:when test="${not empty empImgVO}">
                       <div class="col-6 col-lg-3 col-md-12">
                           <div class="card marginTOP">
                               <div class="card-body px-3 py-4-5 dashRightArea">
                                   <div class="row">
	                                   	  <table class="table commuteTABLE">
			                            	<tr>
			                            		<th>출근</th>
			                            		<td class="commuteFONT">
			                            			<c:choose>
			                            				<c:when test="${not empty dclzVO.attend_time}">
			                            					${dclzVO.attend_time}
			                            				</c:when>
			                            				<c:otherwise>
			                            					00:00
			                            				</c:otherwise>
			                            			</c:choose>
			                            		</td>
			                            		<th>퇴근</th>
			                            		<td class="commuteFONT">
			                            			<c:choose>
			                            				<c:when test="${not empty dclzVO.lvffc_time}">
			                            					${dclzVO.lvffc_time}
			                            				</c:when>
			                            				<c:otherwise>
			                            					00:00
			                            				</c:otherwise>
			                            			</c:choose>
			                            		</td>
			                            		<td colspan="4" class="hideWorkTd">
						                            <a href="#" class="btn btn-outline-secondary rounded-pill commuteBTN GoWork" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">출근</a>
						                            <a href="#" class="btn btn-outline-secondary rounded-pill commuteBTN GoLiv" data-bs-toggle="modal" data-bs-target="#livModal">퇴근</a>
			                            		</td>
			                            	</tr>
			                            </table>
                              	   </div>
                          		</div>
                     	  </div>
                       </div>
                       </c:when>
                       <c:otherwise>
	                       	<div class="col-6 col-lg-3 col-md-12">
	                           <div class="card marginTOP">
	                               <div class="card-body px-3 py-4-5 dashRightArea">
	                                   <div class="row totalFranCnt">
	                                       	<span class="fontSet">가맹점 총
		                                       	<c:if test="${not empty totalFranchiseCnt }">
		                                       		${totalFranchiseCnt }개 점포
		                                       	</c:if>
	                                       	</span>
	                              		 </div>
	                          		</div>
	                     	  </div>
	                       </div>
                       </c:otherwise>
                   </c:choose>
               </div>
               
               
                <div class="row">
                    <div class="col-12 col-lg-9 dropfalse">
                        <div class="row column">
                            <div class="col-12">
                            
              <!------------------------------ AREA0 ----------------------------------------->	
                  
               <c:forEach items="${dashList}" var="dash">
               		<c:if test="${dash.dash_ord eq '3' }">
	               		<c:import url="/head/main/${dash.dash_id }"/>
               		</c:if>
               </c:forEach>
                  
                  
                  
             <!------------------------------ AREA0  끝----------------------------------------->	                   
                                
                            </div>
                        </div>
                        <div class="row  column">
             <!------------------------------ AREA1 ----------------------------------------->	
                            
               <c:forEach items="${dashList}" var="dash">
               		<c:if test="${dash.dash_ord eq '4' }">
	               		<c:import url="/head/main/${dash.dash_id }"/>
               		</c:if>
               </c:forEach>            
                            
             <!------------------------------ AREA1  끝----------------------------------------->	 
                       


             <!------------------------------ AREA2 ----------------------------------------->	 
                        
                <c:forEach items="${dashList}" var="dash">
               		<c:if test="${dash.dash_ord eq '5' }">
	               		<c:import url="/head/main/${dash.dash_id }"/>
               		</c:if>
               </c:forEach>              
                        
                           
             <!------------------------------ AREA2 끝 ----------------------------------------->
                    <!-- 검색 폼  -->
				  	<form id="searchNoticeForm" action="${cPath}/head/main/B0005">
						<input type="hidden" name="page" />
					</form>
                        </div>
                    </div>
                    <div class="col-12 col-lg-3 column">
              <!------------------------------ AREA3----------------------------------------->
                       		
                       		
              <c:forEach items="${dashList}" var="dash">
               		<c:if test="${dash.dash_ord eq '6' }">
	               		<c:import url="/head/main/${dash.dash_id }"/>
               		</c:if>
               </c:forEach>         		
                       		
                       		
                       		
                       		
			 <!------------------------------ AREA3 끝----------------------------------------->

			<!------------------------------ AREA4----------------------------------------->
                   
                 <c:forEach items="${dashList}" var="dash">
               		<c:if test="${dash.dash_ord eq '7' }">
	               		<c:import url="/head/main/${dash.dash_id }"/>
               		</c:if>
               </c:forEach>    
                   
                        
            <!------------------------------ AREA4 끝----------------------------------------->
                    </div>
                    
                </div>
            </div>
        </div>
        
        <form id="dashForm" name="dashListVO" enctype="multipart/form-data" action="${cPath}/head/main/changeDash" method="post">
        	
        </form>
        
        <script src="${cPath}/resources/assets/js/pages/dashboard.js"></script>
        <script>
        $(function() {
        	
        	$(".column").sortable({
	        	// 드래그 앤 드롭 단위 css 선택자
	        	connectWith: ".column",
	        	placeholder: "ui-state-highlight",
	        	update: function(event, ui) {    
	        			//alert("수정")
	        			$('.B0005').index();
	        			
	        			//index가져오기
	        			var arr = []
	        			$('.Area').each(function(idx, area){
	        				$(this).attr("index");
	        				console.log("idx("+ idx +"), id("+ $(this).attr("id") +") : " + $(this).attr("index"));
	        				$('#dashForm').append($("<input>").attr("name", "dashListVO[" + idx + "].dash_id").prop("type", "hidden").val($(this).attr("id")))
	        			
	        			})
	        			
	        			
	        			$.ajax({
							url : "${cPath}/head/main/changeDash",
							method : "post",
							data : $('#dashForm').serialize(),
							success : function(resp) {

							},
							error : function(xhr, error, msg) {
								console.log(xhr);
								console.log(error);
								console.log(msg);
								alert("상태 : " + xhr.status);
							}
						});
	        	}
        	
        	});
  		    $( ".column" ).disableSelection();
  		  	$( "#map" ).disableSelection();
  		    
  		    
  		    
        	$('.Min0').on('click', function(){
        		/* profile visit영역 */
        		$('.Area0').hide();
        	    $('.iconArea').append(
        				'<div class="stats-icon black"><svg class="svg-inline--fa fa-chart-bar fa-w-16 fa-fw select-all smallIcon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chart-bar" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M332.8 320h38.4c6.4 0 12.8-6.4 12.8-12.8V172.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v134.4c0 6.4 6.4 12.8 12.8 12.8zm96 0h38.4c6.4 0 12.8-6.4 12.8-12.8V76.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v230.4c0 6.4 6.4 12.8 12.8 12.8zm-288 0h38.4c6.4 0 12.8-6.4 12.8-12.8v-70.4c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v70.4c0 6.4 6.4 12.8 12.8 12.8zm96 0h38.4c6.4 0 12.8-6.4 12.8-12.8V108.8c0-6.4-6.4-12.8-12.8-12.8h-38.4c-6.4 0-12.8 6.4-12.8 12.8v198.4c0 6.4 6.4 12.8 12.8 12.8zM496 384H64V80c0-8.84-7.16-16-16-16H16C7.16 64 0 71.16 0 80v336c0 17.67 14.33 32 32 32h464c8.84 0 16-7.16 16-16v-32c0-8.84-7.16-16-16-16z"></path></svg></div>');
	        		
        		$('.black').on('click', function(){
        			$('.black').remove();
        			$('.Area0').show();
	        		
        		})
      		 })

      		 $('.Min1').on('click', function(){
        		/* profile visit영역 */
        		$('.Area1').hide();
        		$('.iconArea').append(
        				'<div class="stats-icon blue"><svg class="svg-inline--fa fa-chart-line fa-w-16 fa-fw select-all smallIcon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="chart-line" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M496 384H64V80c0-8.84-7.16-16-16-16H16C7.16 64 0 71.16 0 80v336c0 17.67 14.33 32 32 32h464c8.84 0 16-7.16 16-16v-32c0-8.84-7.16-16-16-16zM464 96H345.94c-21.38 0-32.09 25.85-16.97 40.97l32.4 32.4L288 242.75l-73.37-73.37c-12.5-12.5-32.76-12.5-45.25 0l-68.69 68.69c-6.25 6.25-6.25 16.38 0 22.63l22.62 22.62c6.25 6.25 16.38 6.25 22.63 0L192 237.25l73.37 73.37c12.5 12.5 32.76 12.5 45.25 0l96-96 32.4 32.4c15.12 15.12 40.97 4.41 40.97-16.97V112c.01-8.84-7.15-16-15.99-16z"></path></svg></div>');
        		$('.Area2').attr('class', 'col-12 col-xl-12 Area2');
	        		
        		$('.blue').on('click', function(){
        			$('.blue').remove();
        			$('.Area2').attr('class', 'col-12 col-xl-6 Area2');
        			$('.Area1').show();
	        		
        		})
      		 })
        		
        	/* Latest Comment 영역 */
       		$('.Min2').on('click', function(){
        		
        		/* profile visit영역 */
        		$('.Area2').hide();
        		$('.iconArea').append(
        				'<div class="stats-icon green"><svg class="svg-inline--fa fa-question-circle fa-w-16 fa-fw select-all smallIcon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="question-circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M504 256c0 136.997-111.043 248-248 248S8 392.997 8 256C8 119.083 119.043 8 256 8s248 111.083 248 248zM262.655 90c-54.497 0-89.255 22.957-116.549 63.758-3.536 5.286-2.353 12.415 2.715 16.258l34.699 26.31c5.205 3.947 12.621 3.008 16.665-2.122 17.864-22.658 30.113-35.797 57.303-35.797 20.429 0 45.698 13.148 45.698 32.958 0 14.976-12.363 22.667-32.534 33.976C247.128 238.528 216 254.941 216 296v4c0 6.627 5.373 12 12 12h56c6.627 0 12-5.373 12-12v-1.333c0-28.462 83.186-29.647 83.186-106.667 0-58.002-60.165-102-116.531-102zM256 338c-25.365 0-46 20.635-46 46 0 25.364 20.635 46 46 46s46-20.636 46-46c0-25.365-20.635-46-46-46z"></path></svg></div>');
        		$('.Area1').attr('class', 'col-12 col-xl-12 Area1');
        		
        		$('.green').on('click', function(){
        			$('.green').remove();
        			$('.Area1').attr('class', 'col-12 col-xl-6 Area1');
        			$('.Area2').show();
        		
        		})
        		
        	  })
        	  
       		$('.Min3').on('click', function(){
        		
        		/* profile visit영역 */
        		$('.Area3').hide();
        		$('.iconArea').append(
        				'<div class="stats-icon red"><svg class="svg-inline--fa fa-store fa-w-20 fa-fw select-all smallIcon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="store" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 616 512" data-fa-i2svg=""><path fill="currentColor" d="M602 118.6L537.1 15C531.3 5.7 521 0 510 0H106C95 0 84.7 5.7 78.9 15L14 118.6c-33.5 53.5-3.8 127.9 58.8 136.4 4.5.6 9.1.9 13.7.9 29.6 0 55.8-13 73.8-33.1 18 20.1 44.3 33.1 73.8 33.1 29.6 0 55.8-13 73.8-33.1 18 20.1 44.3 33.1 73.8 33.1 29.6 0 55.8-13 73.8-33.1 18.1 20.1 44.3 33.1 73.8 33.1 4.7 0 9.2-.3 13.7-.9 62.8-8.4 92.6-82.8 59-136.4zM529.5 288c-10 0-19.9-1.5-29.5-3.8V384H116v-99.8c-9.6 2.2-19.5 3.8-29.5 3.8-6 0-12.1-.4-18-1.2-5.6-.8-11.1-2.1-16.4-3.6V480c0 17.7 14.3 32 32 32h448c17.7 0 32-14.3 32-32V283.2c-5.4 1.6-10.8 2.9-16.4 3.6-6.1.8-12.1 1.2-18.2 1.2z"></path></svg></div>');
        		/* $('.Area4').attr('class', 'col-12 col-xl-12 Area4'); */
        		
        		$('.red').on('click', function(){
        			$('.red').remove();
        			/* $('.Area4').attr('class', 'col-12 col-xl-6 Area4'); */
        			$('.Area3').show();
        		
        		})
        		
        	  })
        	  
        	$('.Min4').on('click', function(){
        		
        		/* profile visit영역 */
        		$('.Area4').hide();
        		$('.iconArea').append(
        				'<div class="stats-icon purple"><svg class="svg-inline--fa fa-map-marked-alt fa-w-18 fa-fw select-all smallIcon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="map-marked-alt" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M288 0c-69.59 0-126 56.41-126 126 0 56.26 82.35 158.8 113.9 196.02 6.39 7.54 17.82 7.54 24.2 0C331.65 284.8 414 182.26 414 126 414 56.41 357.59 0 288 0zm0 168c-23.2 0-42-18.8-42-42s18.8-42 42-42 42 18.8 42 42-18.8 42-42 42zM20.12 215.95A32.006 32.006 0 0 0 0 245.66v250.32c0 11.32 11.43 19.06 21.94 14.86L160 448V214.92c-8.84-15.98-16.07-31.54-21.25-46.42L20.12 215.95zM288 359.67c-14.07 0-27.38-6.18-36.51-16.96-19.66-23.2-40.57-49.62-59.49-76.72v182l192 64V266c-18.92 27.09-39.82 53.52-59.49 76.72-9.13 10.77-22.44 16.95-36.51 16.95zm266.06-198.51L416 224v288l139.88-55.95A31.996 31.996 0 0 0 576 426.34V176.02c0-11.32-11.43-19.06-21.94-14.86z"></path></svg></div>');
        		
        		$('.purple').on('click', function(){
        			$('.purple').remove();
        			$('.Area4').show();
        		
        		})
        		
        	  })
        });

      	//B0005
      	//날짜 포멧팅
	$("#listNoticBody tr").each(function(){
		console.log($(this).find("td").eq(3).text());
		
		let day = $(this).find("td").eq(3).text();
		day = day.substring(0,4) + "년" + day.substring(5,7) + "월" + day.substring(8,10) + "일" ;
		$(this).find("td").eq(3).text(day);
	});
	
	let listNoticBody = $("#listNoticBody");
	
	//form ajax
	let searchNoticeForm = $("#searchNoticeForm").ajaxForm({
		dataType:"json"
		, beforeSubmit:function(){
			searchNoticeForm.find("[name='page']").val("");	
		}, success:function(resp){
			listNoticBody.empty();
			pagingNoticeArea.empty();
			let trTags = [];
			if(resp.dataList){	
				$(resp.dataList).each(function(idx, board){
					if(board.board_writer=="ADMIN"){
						viewURLPtrn ="${cPath}/admin/notice/boardView.do?what=%d";
					}else{
						viewURLPtrn ="${cPath}/head/notice/boardView.do?what=%d";
					}
					let day = board.board_time;
					day = day.substring(0,4) + "년" + day.substring(5,7) + "월" + day.substring(8,10) + "일" ;
					let viewURL = viewURLPtrn.replace("%d", board.board_seq);
					let aTag = $("<a>").html(board.board_title)
					   .attr("href", viewURL);
					let tr = $("<tr>").append(
								 $("<td class='seq'>").addClass("center").html(board.rnum),
								 $("<td>").html(aTag)
								, $("<td>").html(board.board_writer)
								, $("<td>").html(day)
								, $("<td>").html(board.board_hit)
								
							).data("board", board).css("cursor", "pointer");
					trTags.push(tr);
				});
			}else{
				trTags.push( 
					$("<tr>").html(
						$("<td>").attr("colspan", "8")		
					)
				);
			}
			listNoticBody.html(trTags);
			pagingNoticeArea.html(resp.pagingHTMLBS);
			
		}, error:function(xhr, resp, error){
			console.log(xhr);
		}
	});
	
	searchNoticeForm.submit();
	
	//페이지 버튼 클릭 이벤트
	let pagingNoticeArea = $("#pagingNoticeArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(page){
			searchNoticeForm.find("[name='page']").val(page);
			searchNoticeForm.submit();
		}
		return false;
	});


        </script>
         <script type="text/javascript" src="${cPath}/resources/assets2/js/script.js "></script>