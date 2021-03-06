<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 6. 19. 진예은          캘린더 조회 수정
*
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">    
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<link href='${cPath}/resources/fullcalendar5.7/lib/main.css' rel='stylesheet' />
<script src='${cPath}/resources/fullcalendar5.7/lib/main.js'></script>
<script src='${cPath}/resources/fullcalendar5.7/lib/locales-all.js'></script> 
<style>
.dataArea {
    height: 550px;
}
#calendar {
   max-width: 950px;
   margin: 0 auto;
}

.leftVacationDIV{
	border: 2px solid #6b5050;
	width: 25%;
	
}

.table .leftVacationDIV{
vertical-align: top;
}


.topVacationDIV{
	height: 80px;
}

.codeBadge{
	height: 35px;
	width: 100%;
	padding-top: 10px;
	margin-bottom: 15px;
}

.calendarTABLE{
	margin-left: 1%;
}

.V0001{
	background: #a07a7a;
}
.V0002{
	background: #F2913D;
}
.V0003{
	background: #F2AB6D;
}
.V0004{
	background: #f7e9e2;
}

.circle{
	width: 22px;
	height: 22px;
	border-radius: 50%;
	display: inline-block;
	vertical-align: middle;
}

.circleFONT{
	display: inline-block;
	vertical-align: middle;
	font-weight: bold;
	font-size: 16px;
	margin-left: 8px;
	color: #6b5050;
}

.codeBadge{
	cursor: pointer;
}

.btnSize{
	width: 100%;
}

</style>
<div id="app">
    	<section class="section">
    		<!-- card 영역 -->
    		<div class="card">
    			<!-- card-header 영역 -->
				<div class="card-header">
					<div class="row">
						<div class="rowLeft">
							<h4>휴가현황조회</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">휴가현황조회</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>	
				<!-- card-header 끝 -->
				<!-- card-body 영역 -->
					<div  class="card-body">
						<div>
							<table class="table calendarTABLE">
								<tr>
									<td class="topVacationDIV center">
										<button class="btn btn-primary btnSize vacationSelect">전체선택</button>
									</td>
									<td rowspan="2"><div id="calendar"></div></td>
								</tr>
								<tr>
									<td class="leftVacationDIV">
										<c:if test="${not empty calendarList}">
										<c:forEach items="${calendarList}" var="vac">
											<span class="badge bg-light-primary ${vac.employeeList[0].emp_id} codeBadge">${vac.employeeList[0].emp_nm }</span>
											<%-- <div>
												<div class="circle ${vac.com_code}"></div><span class="circleFONT">${vac.com_code_nm }</span>
											</div> --%>
											<br>
											<%-- <option value="${vac.com_code}">${vac.com_code_nm }</option>--%>								
										</c:forEach>
									</c:if>
									</td>
								</tr>
							</table>
						</div>
					</div>
					<!-- card-body 끝 -->
                </div>
    		<!-- card 끝 -->
    	</section>
    </div>
    
 <script type="text/javascript">
$(function(){

	var colorARR = ['#a07a7a', '#F2AB6D', '#F2913D', '#bf9f8f'];
	$('.codeBadge').each(function(idx, color){
		//var colorCode = "#" + Math.round( Math.random() * 0xFFFFFF ).toString(16);
		randomColor = colorARR[Math.floor(Math.random()*colorARR.length)]
		$(this).css("background-color", randomColor);
		
		for(i=0; i<colorARR.length; i++){
			if(colorARR[i] == randomColor){
				colorARR.splice(i, 1);
				i--;
			}
		}
	})
})
 
 
 	
	 //전부체크 이벤트
	document.addEventListener('DOMContentLoaded', function() {
	    var calendarEl = document.getElementById('calendar');

	    var calendar = new FullCalendar.Calendar(calendarEl, {
	    	timeZone : 'local',
	        locale: 'ko',
	    headerToolbar: {
	        left: 'prev,next today',
	        center: 'title',
	        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
	      },
	      navLinks: true, // can click day/week names to navigate views
	      businessHours: true, // display business hours
	      editable: true,
	      selectable: true,
	      events: function(info, successCallback, failureCallback){
			var events = [];	 
			$.ajax({
				url : "${cPath}/head/reqvacation/calendarAjax",
				method : "GET",
				type : 'json',
				success : function(resp) {
					if(resp){
						$(resp).each(function(idx, rest){
							
							rest.employeeList[0].emp_id
							background = $('.' + rest.employeeList[0].emp_id + '').css( "background-color" )
							console.log(rest.employeeList[0].emp_id + " : " + background)
							
							colorRest = "#f7e9e2";
							if(rest.vcatn_se_code =="월차"){
								colorRest = '#a07a7a';
							}else if(rest.vcatn_se_code == "오후 반차"){
								colorRest = '#F2AB6D';
							}else if(rest.vcatn_se_code == "오전 반차"){
								colorRest = '#F2913D';
							}else{
								colorRest = '#bf9f8f';
							}
							content = rest.vcatn_se_code + "("+ rest.employeeList[0].emp_nm + rest.employeeList[0].emp_clsf_code  +")"
							
							events.push({id : rest.vcreq_seq, title : content,
									start : rest.vcatn_startde, end : rest.vcatn_endde, color : colorRest
									
							})
						})						
					}
					successCallback(events);
				},
				error : function(xhr, error, msg) {
					console.log(xhr);
					console.log(error);
					console.log(msg);
					alert("상태 : " + xhr.status);
				}
			});
			
	/*     	  [
	        {
	          title : "Conference"
	              , start : "2021-06-15"
	              , end : "2021-06-17"
	              , color: '#257e4a'
	        },
	      ] */
	      
	      
	      
	      }
	    });

	    calendar.render();
	  });


 
 $('#calendar').on('click', '.fc-day-past', function(){
	$('.calendarRegiModal').show();
	
 })
 
 
 
 $('.codeBadge').on('click', function(){
	 name = $(this).text().trim();
	// $('.endTIME').each(function(idx, end)
	 $('.fc-sticky').each(function(idx, end){
		 let vacationText = $(this).text().trim();
		 if(vacationText.indexOf(name) != -1){
		 	$(this).parents('.fc-daygrid-event-harness').show();
		 }else{
			 $(this).parents('.fc-daygrid-event-harness').hide();
		 }
		 
	 })
 })
 
 
  $('.leftVacationDIV').on('click', '.codeBadge', function(){
	 name = $(this).text().trim();
	// $('.endTIME').each(function(idx, end)
	 $('.fc-sticky').each(function(idx, end){
		 let vacationText = $(this).text().trim();
		 if(vacationText.indexOf(name) != -1){
		 	$(this).parents('.fc-daygrid-event-harness').show();
		 }else{
			 $(this).parents('.fc-daygrid-event-harness').hide();
		 }
		 
	 })
 })
 
 
 
 $('#calendar').on("click", '.fc-prev-button', function(){
	 month = $('.fc-toolbar-title').text().trim();
	 month = month.substring(5,9)
	 year =  $('.fc-toolbar-title').text().trim().substring(0,4);
	 
	 month_split = month.split("월")
	 month_re = String(month_split).replace(",", "").trim();
	
	 if(month_re.length == 1){
		 date = year + "0" + month_re + "01";
		 
	 }else{
		 date = year + month_re + "01";
	 }
	
	$.ajax({
		url : "${cPath}/head/reqvacation/changeMonth",
		method : "post",
		data : {
			"date" : date
		},
		dataType : "json",
		success : function(resp) {
			$('.leftVacationDIV').empty();
			var colorARR = ['#a07a7a', '#F2AB6D', '#F2913D', '#bf9f8f'];
			$(resp).each(function(idx, change){
				$('.codeBadge').each(function(idx, color){
					//var colorCode = "#" + Math.round( Math.random() * 0xFFFFFF ).toString(16);
					randomColor = colorARR[idx]
/* 					console.log("random" + randomColor)
					$('.codeBadge:nth-child('+idx+')').css("background-color", randomColor); */
					
			/* 	for(i=0; i<colorARR.length; i++){
						if(colorARR[i] == randomColor){
							colorARR.splice(i, 1);
							i--;
						}
					} */
				})
				$('.leftVacationDIV').append('<span class="badge bg-light-primary '+ change.employeeList[0].emp_id +' codeBadge" style="background-color: '+ randomColor +';">'+ change.employeeList[0].emp_nm +'</span>');
			
			})
			
			
			
		},
		error : function(xhr, error, msg) {
			console.log(xhr);
			console.log(error);
			console.log(msg);
			alert("상태 : " + xhr.status);
		}
	});
	 
	 
 })
 
 $('#calendar').on("click", '.fc-next-button', function(){
	 month = $('.fc-toolbar-title').text().trim();
	 month = month.substring(5,9)
	 year =  $('.fc-toolbar-title').text().trim().substring(0,4);
	 
	 month_split = month.split("월")
	 month_re = String(month_split).replace(",", "").trim();
	
	 if(month_re.length == 1){
		 date = year + "0" + month_re + "01";
		 
	 }else{
		 date = year + month_re + "01";
	 }
	
	$.ajax({
		url : "${cPath}/head/reqvacation/changeMonth",
		method : "post",
		data : {
			"date" : date
		},
		dataType : "json",
		success : function(resp) {
			$('.leftVacationDIV').empty();
			var colorARR = ['#a07a7a', '#F2AB6D', '#F2913D', '#bf9f8f'];
			$(resp).each(function(idx, change){
				randomColor = colorARR[idx]
				
				$('.leftVacationDIV').append('<span class="badge bg-light-primary '+ change.employeeList[0].emp_id +' codeBadge" style="background-color: '+ randomColor +';">'+ change.employeeList[0].emp_nm +'</span>');
			})
			
			
			
		},
		error : function(xhr, error, msg) {
			console.log(xhr);
			console.log(error);
			console.log(msg);
			alert("상태 : " + xhr.status);
		}
	});

 })
 
 
  
 $('.vacationSelect').on('click', function(){
	 $('.fc-sticky').each(function(idx, end){
		$('.fc-daygrid-event-harness').show();
	 })
 })

 </script> 