<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 6. 22. 진유리          캘린더 UI,조회
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">    
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<style>
.dataArea {height: 550px;}
#calendar { max-width: 1100px;margin: 0 auto;}
.bg-modal{background-color: #826767!important;}
.modal-title{color : #ffffff;}
.topEducationDIV{height : 5px;}
.overflow-edu::-webkit-scrollbar {
    width: 10px;
    background-color: black;
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
						<h4>교육일정 조회</h4>
					</div>
					<div class="rowRight">
						<nav aria-label="breadcrumb" >
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${cPath}/fran/main">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">교육일정 조회</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>	
			<!-- card-header 끝 -->
			<!-- card-body 영역 -->
			<div class="card-body">
				<div id='calendar'></div>
			</div>
			<!-- card-body 끝 -->
        </div>
   		<!-- card 끝 -->
   	</section>
</div>
<!-- 교육 일정 상세 정보 Modal -->
<div class="modal fade text-left" id="scheduleDetail" tabindex="-1" role="dialog"
    aria-labelledby="myModalLabel4" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-modal">
                <h4 class="modal-title" id="scheduleDetailTitle"></h4>
            </div>
            <div class="modal-body">
                <div id="detailContent">
                	<div class="form-body">
                       <div class="row col-12">
                            <div class="col-md-3">
                                <label>교육 분류</label>
                            </div>
                            <div class="col-md-9 form-group edu_place"></div>
                            <div class="col-md-3">
                                <label>담당 직원명</label>
                            </div>
                            <div class="col-md-9 form-group emp_name"></div>
                            <div class="col-md-3">
                                <label>담당 직원 이메일</label>
                            </div>
                            <div class="col-md-9 form-group emp_email"></div>
                            <div class="col-md-3">
                                <label>교육 시작 일시</label>
                            </div>
                            <div class="col-md-9 form-group edu_start"></div>
                            <div class="col-md-3">
                                <label>교육 종료 일시</label>
                            </div>
                            <div class="col-md-9 form-group edu_cl"></div>
                            <div class="col-md-3">
                                <label>교육 장소</label>
                            </div>
                            <div class="col-md-9 form-group edu_end"></div>
                            <div class="col-md-3">
                                <label>수강여부</label>
                            </div>
                            <div class="col-md-9 form-group edc_cp_at"></div>
                             <div class="col-md-3">
                                <label>교육 내용</label>
                            </div>
                            <div class="col-md-9 form-group edu_content"></div>
                      	 </div>
	                </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">닫기</span>
                </button>
            </div>
        </div>
    </div>
</div>
<!-- 교육 일정 상세 정보 Modal End-->

<link href='${cPath}/resources/fullcalendar5.7/lib/main.css' rel='stylesheet' />
<script src='${cPath}/resources/fullcalendar5.7/lib/main.js'></script>
<script src='${cPath}/resources/fullcalendar5.7/lib/locales-all.js'></script>
<script src='${cPath}/resources/js/ckeditor/ckeditor.js'></script>
<script type="text/javascript" src="${cPath}/resources/js/moment.js"></script>
<script type="text/javascript" src="${cPath}/resources/sweetalert2/sweetalert2.all.min.js"></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    
    var calendar = new FullCalendar.Calendar(calendarEl, {
      timeZone : 'local',
      locale: 'ko',
      customButtons : {
          Customcomplete: {
 	       text: '수료',
 	       click: function() {
	 	    	$('.fc-sticky').each(function(idx, end){
	 	    		 let scheduleText = $(this).parents(".fc-daygrid-event").attr('class').trim();
	 	    		 if(scheduleText.indexOf('Y') != -1){
	 	    		 	$(this).parents('.fc-daygrid-event-harness').show();
	 	    		 }else{
	 	    			 $(this).parents('.fc-daygrid-event-harness').hide();
	 	    		 }
	 	    	})
 	        }
 	      }, 
 	      Customnoncomplete: {
 	 	      text: '미수료',
 	 	      click: function() {
 	 	    	$('.fc-sticky').each(function(idx, end){
	 	    		 let scheduleText = $(this).parents(".fc-daygrid-event").attr('class').trim();
	 	    		 if(scheduleText.indexOf('N') != -1){
	 	    		 	$(this).parents('.fc-daygrid-event-harness').show();
	 	    		 }else{
	 	    			 $(this).parents('.fc-daygrid-event-harness').hide();
	 	    		 }
	 	    	})
 	 	      }
 	 	   },
	 	 	 CustomnAll: {
		 	      text: '전체',
		 	      click: function() {
		 	    	$('.fc-sticky').each(function(idx, end){
		 	    		 	$(this).parents('.fc-daygrid-event-harness').show();
		 	    	})
		 	      }
		 	   }
 	 	   
      },
      headerToolbar: {
        left: 'prev,next Customcomplete Customnoncomplete CustomnAll',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      events: function(info, successCallback, failureCallback){
    	  var events = [];
    	  $.ajax({
              type:"GET",
              url: "${cPath}/fran/education/check",
              success : function(resp) {
            	  if (resp) {
     				  $(resp).each(function(idx, edu) {
     					  var colorVar = "#F2AB6D";
     					  if(edu.edc_cl_code == '성교육'){colorVar="#BF755A";}
     					  else if(edu.edc_cl_code == '예절교육'){colorVar="#D96E30";}
     					  else if(edu.edc_cl_code == '런칭메뉴교육'){colorVar="#F2913D";}
     					   events.push({id : edu.edc_code , title : edu.edc_nm, start: edu.edc_start_time
     						   , end : edu.edc_end_time, color : colorVar, classNames : edu.edc_cp_at});
     				  });
      			   }
            	  successCallback(events);
            	  console.log(events);
              }, error : function(xhr, error, msg) {
          		console.log(xhr);
          		console.log(error);
          		console.log(msg);
          	}
          });
      }, //함수 끝
      eventClick:function(info)  {
    	  DetailSchedule(info);
      },//eventClick클릭
   });//var calendar끝
   
    calendar.render();
  });

function DetailSchedule(info){
	 $.ajax({
         type:"GET",
         url: "${cPath}/fran/education/detail" ,
         data : {"id" : info.event.id},
         success : function(resp) {
	       	  var employee = resp.employeeList[0];
	       	  var dept = employee.deptList[0];
	       	  var content = '내용이 존재하지 않습니다.';
	       	  if(resp.edc_cn != null){
	       		  content = resp.edc_cn;
	       	  }
	       	  var cp_at = '미수료';
	       	  if(resp.edc_cp_at == 'Y'){
	       		  cp_at = '수료';
	       	  }
	       	  $("#scheduleDetailTitle").text(resp.edc_nm);
	       	  $(".edu_cl").text(resp.edc_cl_code);
	       	  $(".edu_content").html(content);
	       	  $(".edu_place").text(resp.edc_place);
	       	  $(".emp_name").text(employee.emp_nm+"("+dept.dept_nm+" "+employee.emp_clsf_code+")");
	       	  $(".emp_email").text(employee.emp_email);
	       	  $(".edu_start").text(resp.edc_start_time);
	       	  $(".edu_end").text(resp.edc_end_time);
	       	  $(".edc_cp_at").text(cp_at);
         }, error : function(xhr, error, msg) {
     		console.log(xhr);
     		console.log(error);
     		console.log(msg);
     	}
     });
	 $("#scheduleDetail").modal('show');
}
</script>  