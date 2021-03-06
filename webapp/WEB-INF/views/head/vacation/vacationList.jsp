<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
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
	cursor: pointer;
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

.vacationSelect{
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
										<button class="btn btn-primary vacationSelect">전체선택</button>
									</td>
									<td rowspan="2"><div id="calendar"></div></td>
								</tr>
								<tr>
									<td class="leftVacationDIV">
										<c:if test="${not empty vacationComcode}">
										<c:forEach items="${vacationComcode}" var="vac">
											<span class="badge bg-light-primary ${vac.com_code} codeBadge">${vac.com_code_nm }</span>
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
    <script src='${cPath}/resources/fullcalendar5.7/lib/locales-all.js'></script>
 <script type="text/javascript">
$(function(){

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
				url : "${cPath}/head/vacation/calendar",
				method : "GET",
				type : 'json',
				success : function(resp) {
					if(resp){
						$(resp).each(function(idx, rest){
							
							if(rest.vcatn_confm_at == "Y"){
							
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
							
							events.push({id : rest.vcreq_seq, title : rest.vcatn_se_code,
									start : rest.vcatn_startde, end : rest.vcatn_endde, color : colorRest
									
							})
							
							}
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
 
 
 $('.vacationSelect').on('click', function(){
	 $('.fc-sticky').each(function(idx, end){
		$('.fc-daygrid-event-harness').show();
	 })
 })

 </script> 