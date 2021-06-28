    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.06.21   진유리         최초작성
* Copyright (c) ${year} by DDIT All right reserved
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
.btn-restore{background-color: #F2913D;color : #ffffff;}
</style>
<div id="app">
    <section class="section">
    	<!-- card 영역 -->
   		<div class="card">
   			<!-- card-header 영역 -->
			<div class="card-header">
				<div class="row">
					<div class="rowLeft">
						<h4>교육일정 관리</h4>
					</div>
					<div class="rowRight">
						<nav aria-label="breadcrumb" >
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${cPath}/head/main">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">삭제 교육일정 관리</li>
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
<div class="modal fade text-left" id="delEventDetail" tabindex="-1" role="dialog"
    aria-labelledby="myModalLabel4" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-modal">
                <h4 class="modal-title" id="delEventDetailTitle"></h4>
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
                                <label>교육 내용</label>
                            </div>
                            <div class="col-md-9 form-group edu_content"></div>
                            <input type="hidden" id="detail_emp_id" />
                            <input type="hidden" id="login_id" value="${authId}"/>
                            <input type="hidden" id="exist" value="${cnt}"/>
                            <input type="hidden" id="edc_code"/>
                      	 </div>
	                </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-restore">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">복구</span>
                </button>
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
         myCustomButton: {
	       text: '돌아가기',
	       click: function() {
	          location.href="${cPath}/head/education";
	       }
	    }
      },
      headerToolbar: {
        left: 'prev,next myCustomButton',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
      },
      navLinks: true, // can click day/week names to navigate views
      businessHours: true, // display business hours
      events: function(info, successCallback, failureCallback){
    	  var events = [];
    	  $.ajax({
              type:"GET",
              url: "${cPath}/head/education/delcheck" ,
              success : function(resp) {
            	  if (resp) {
     				  $(resp).each(function(idx, edu) {
     					  var colorVar = "#F2AB6D";
     					  if(edu.edc_cl_code == '성교육'){colorVar="#BF755A";}
     					  else if(edu.edc_cl_code == '예절교육'){colorVar="#D96E30";}
     					  else if(edu.edc_cl_code == '런칭메뉴교육'){colorVar="#F2913D";}
     					   events.push({id : edu.edc_code , title : edu.edc_nm, start: edu.edc_start_time
     						   , end : edu.edc_end_time, color : colorVar});
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

   $(".btn-restore").on("click", function(){
	    var id = $("#login_id").val();
		var emp_id = $("#detail_emp_id").val();
		var exist = $("#exist").val();
		var code = $("#edc_code").val();
		if(id == emp_id || exist == 'over'){
			Swal.fire({
			  title: '일정을 복구하시겠습니까??',
			  showCancelButton: true,
			  confirmButtonText: `확인`,
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.isConfirmed) {
				  $.ajax({
		              type:"GET",
		              url: "${cPath}/head/education/restore",
		              data : {"code" : code},
		              success : function(resp) {
		            	  var result = resp.result;
		            	  
		            	  if(result == "OK"){
			            	  Swal.fire('일정 복구 완료!', '', 'success');
			            	  var event = calendar.getEventById(code);
							  event.remove();
		            	  }else{
		            		  Swal.fire('복구에 실패했습니다.', '', 'error'); 
		            	  }
		              }, error : function(xhr, error, msg) {
		          		console.log(xhr);
		          		console.log(error);
		          		console.log(msg);
		          	}
		          });  
			  } 
			});
		}else{
			Swal.fire('복구 권한이 없습니다.', '', 'error');
		}
	});
   
    calendar.render();
  });

function DetailSchedule(info){
	 $.ajax({
         type:"GET",
         url: "${cPath}/head/education/deldetail" ,
         data : {"id" : info.event.id},
         success : function(resp) {
	       	  var employee = resp.employeeList[0];
	       	  var dept = employee.deptList[0];
	       	  var content = '내용이 존재하지 않습니다.';
	       	  if(resp.edc_cn != null){
	       		  content = resp.edc_cn;
	       	  }
	       	  $("#delEventDetailTitle").text(resp.edc_nm);
	       	  $(".edu_cl").text(resp.edc_cl_code);
	       	  $(".edu_content").html(content);
	       	  $(".edu_place").text(resp.edc_place);
	       	  $(".emp_name").text(employee.emp_nm+"("+dept.dept_nm+" "+employee.emp_clsf_code+")");
	       	  $(".emp_email").text(employee.emp_email);
	       	  $(".edu_start").text(resp.edc_start_time);
	       	  $(".edu_end").text(resp.edc_end_time);
	       	  $("#detail_emp_id").val(employee.emp_id);
	       	  $("#edc_code").val(info.event.id);
         }, error : function(xhr, error, msg) {
     		console.log(xhr);
     		console.log(error);
     		console.log(msg);
     	}
     });
	 $("#delEventDetail").modal('show');
}
function AlldateFormat(date) {
    let month = date.getMonth() + 1;
    let day = date.getDate();
    let hour = date.getHours();
    let minute = date.getMinutes();
    let second = date.getSeconds();

    month = month >= 10 ? month : '0' + month;
    day = day >= 10 ? day : '0' + day;
    hour = hour >= 10 ? hour : '0' + hour;
    minute = minute >= 10 ? minute : '0' + minute;
    second = second >= 10 ? second : '0' + second;

    return date.getFullYear() + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' + second;
}
function getFormatDate(date){
    var year = date.getFullYear();
    var month = (1 + date.getMonth());
    month = month >= 10 ? month : '0' + month;
    var day = date.getDate();
    day = day >= 10 ? day : '0' + day;
    return year + '-' + month + '-' + day;
}
</script>