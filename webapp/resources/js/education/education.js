/**
 * 
 */
 CKEDITOR.replace('edc_cn');
CKEDITOR.replace('modify_edc_cn');

document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    /*var containerEl = document.getElementById('external-events');
    var Draggable = FullCalendar.Draggable;
    
    new Draggable(containerEl, {
      itemSelector: '.fc-event',
      eventData: function(eventEl) {
        return {
          title: eventEl.innerText
        };
      }
    });*/

    var calendar = new FullCalendar.Calendar(calendarEl, {
      timeZone : 'local',
      locale: 'ko',
      customButtons : {
         myCustomButton: {
	       text: '삭제내역',
	       click: function() {
	          location.href="education/deleteList";
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
      editable: true,
      selectable: true,
      events: function(info, successCallback, failureCallback){
    	  var events = [];
    	  $.ajax({
              type:"GET",
              url: "education/check" ,
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
      select : function(info){
    	  console.log("selected " + info.startStr + " to " + info.endStr + " on resource " + info.start + info.end + " view " + info.view.type);
    	  var start_date = $("#start_date");
    	  var end_date = $("#end_date");
    	  var edc_start_time = $("#edc_start_time");
    	  var edc_end_time = $("#edc_end_time");
    	  var viewType = info.view.type;
    	  var startStr = info.startStr;
    	  var endStr = info.endStr;
    	  
    	  if(viewType == "dayGridMonth"){
    		  var now = new Date(endStr);
        	  var yesterday = new Date(now.setDate(now.getDate() - 1));
        	  start_date.val(startStr+"T00:00:00");
        	  end_date.val(getFormatDate(yesterday)+"T00:00:00");
        	  edc_start_time.val(startStr + " 00:00");
        	  edc_end_time.val(getFormatDate(yesterday)+" 00:00");
    	  }else if(viewType == "timeGridWeek" || viewType == "timeGridDay"){
    		  var num_start = startStr.indexOf("+");
    		  var num_end = startStr.indexOf("+");
    		  start_date.val(startStr.substr(0, num_start));
    		  end_date.val(endStr.substr(0, num_end));
    		  edc_start_time.val(startStr.substr(0, num_start));
    		  edc_end_time.val(endStr.substr(0, num_end));
    	  }
    	  
    	  $("#RegisterModal").modal('show');	
    	  
    	  $(".registerBtn").on("click", function(){
    			if (checkUnrealInput()) {
    				$.ajax({
    					type : "POST",
    					url : "education",
    					data : {
    						"edc_nm" : $("#edc_nm").val()
    						, "edc_start_time" : $("#edc_start_time").val()
    						, "edc_end_time" : $("#edc_end_time").val()
    						, "edc_cl_code" : $("#edc_cl_code").val()
    						, "emp_id" : $("#emp_id").val()
    						, "edc_place" : $("#edc_place").val()
    						, "edc_cn" : CKEDITOR.instances.edc_cn.getData()
    						// , "franList" : fran
    					},
    					success : function(resp) {
    						var result = resp.result;
							var edu = resp.edu;
							
    						if (result == "OK") {
    							alert("일정등록에 성공했습니다.");
    							$(".CloseBtn").trigger('click');
    							
    							 var colorVar = "#F2AB6D";
    	     					 if(edu.edc_cl_code == '성교육'){colorVar="#BF755A";}
    	     					 else if(edu.edc_cl_code == '예절교육'){colorVar="#D96E30";}
    	     					 else if(edu.edc_cl_code == '런칭메뉴교육'){colorVar="#F2913D";}
    	     					 
    							calendar.addEvent( 
    								{
    								id : edu.edc_code 
    								, title : edu.edc_nm
    								, start: edu.edc_start_time
    		     					, end : edu.edc_end_time
    		     					, color : colorVar
									, editable:true
    								}
    							)
    						} else {
    							alert("등록에 실패했습니다.");
    						}
    					}
    				});
    			} else {
    				if (!checkUnrealInput()) {
    					alert("빠진 정보가 있거나 잘못된 정보를 입력했는지 확인하세요.");
    				};
    			}
    		});
      },//select 끝
      eventDrop : function(info){
    	  ModifyDay(info)
      },//evnetDrop 끝
      eventResize: function(info) {
    	  ModifyDay(info)
      }//eventResize 끝
   });//var calendar끝
   
   $(".btn-delete").on("click", function(){
	    var id = $("#login_id").val();
		var emp_id = $("#detail_emp_id").val();
		var exist = $("#exist").val();
		var code = $("#modify_code").val();
		if(id == emp_id || exist == ''){
			Swal.fire({
			  title: '정말로 삭제하시겠습니까??',
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
			}).then((result) => {
				  if (result.isConfirmed) {
					  	$.ajax({
							type : "POST",
							url : "education",
							data : {
								"_method" : "delete"
								, "code" : code
							},
							success : function(resp) {
								var result = resp.result;
								
								if (result == "OK") {
									Swal.fire('삭제가 완료되었습니다.!', '', 'success');
									var event = calendar.getEventById(code);
									console.log(event);
									event.remove();
									$("#eventDetail").modal('hide');
								} else {
									Swal.fire('삭제가 실패했습니다.', '', 'error');
								}
							}
						});
				  }
			})
		}else{
			Swal.fire('삭제 권한이 없습니다.', '', 'error');
		}
	});
	
	$(".ModifyBtn").on("click", function(){
	    var code = $("#modify_code").val();
	    var start = $("#modify_edc_start_time").val();
	    var end = $("#modify_edc_end_time").val();
		if (checkModifyUnrealInput()) {
			$.ajax({
				type : "POST",
				url : "education",
				data : {
					"_method" : "put"
					, "edc_nm" : $("#modify_edc_nm").val()
					, "edc_start_time" : start
					, "edc_end_time" : end
					, "edc_cl_code" : $("#modify_edc_cl_code").val()
					, "emp_id" : $("#modify_emp_id").val()
					, "edc_place" : $("#modify_edc_place").val()
					, "edc_cn" : CKEDITOR.instances.modify_edc_cn.getData()
					, "edc_code" : code
				},
				success : function(resp) {
					var result = resp.result;
					
					if (result == "OK") {
						Swal.fire('일정수정이 완료되었습니다.!', '', 'success');
						$(".ModifyCloseBtn").trigger('click');
						$("#ModifyModal").modal('hide');
						$("#eventDetail").modal('hide');
						calendar.getEventById(code).setDates(start, end);
						calendar.getEventById(code).setProp("title", $("#modify_edc_nm").val());
					} else {
						Swal.fire('일정수정이 실패했습니다.', '', 'error');
					}
				}
			});
		} else {
			if (!checkModifyUnrealInput()) {
				alert("빠진 정보가 있거나 잘못된 정보를 입력했는지 확인하세요.");
			};
		}
	});

    calendar.render();
  });
  
/*let fran = [];
$(".fran").on("change", function(){
    var select = $(".fran option:selected").val();
    if(fran.length == 0){
    	
    }else{
    	for(var i=0; i<fran.length; i++){
			if(fran[i] == select){
				return false;
			}
		}
    }
    fran.push(select);
	$(".franList").append($("<span>").attr("class", "fran_content").text($(".fran option:selected").text()));
    console.log(fran);
});*/
$(".btn-modify").on("click", function(){
    var id = $("#login_id").val();
	var emp_id = $("#detail_emp_id").val();
	var exist = $("#exist").val();
	if(id == emp_id){
		$("#ModifyModal").modal('show');
	}else if(exist == ''){
		$("#ModifyModal").modal('show');
	}else{
		Swal.fire('수정 권한이 없습니다.', '', 'error');
	}
});

function DetailSchedule(info){
	 $.ajax({
         type:"GET",
         url: "education/detail" ,
         data : {"id" : info.event.id},
         success : function(resp) {
	       	  var employee = resp.employeeList[0];
	       	  var dept = employee.deptList[0];
	       	  var content = '내용이 존재하지 않습니다.';
	       	  if(resp.edc_cn != null){
	       		  content = resp.edc_cn;
	       	  }
	       	  $("#eventDetailTitle").text(resp.edc_nm);
	       	  $(".edu_cl").text(resp.edc_cl_code);
	       	  $(".edu_content").html(content);
	       	  $(".edu_place").text(resp.edc_place);
	       	  $(".emp_name").text(employee.emp_nm+"("+dept.dept_nm+" "+employee.emp_clsf_code+")");
	       	  $(".emp_email").text(employee.emp_email);
	       	  $(".edu_start").text(resp.edc_start_time);
	       	  $(".edu_end").text(resp.edc_end_time);
	       	  $("#detail_emp_id").val(employee.emp_id);
	       	  $("#edc_code").val(info.event.id);
	       	  $("#modify_edc_nm").val(resp.edc_nm);
	       	  $("#modify_edc_cl_code").val(resp.edc_cl_code_val);
	       	  $("#modify_start_date").val(resp.edc_start);
	       	  $("#modify_edc_start_time").val(resp.edc_start_time);
	       	  $("#modify_end_date").val(resp.edc_end);
	       	  $("#modify_edc_end_time").val(resp.edc_end_time);
	       	  $("#modify_emp_id").val(resp.emp_id);
	       	  $("#modify_edc_place").val(resp.edc_place);
	       	  $("#modify_code").val(info.event.id);
	       	  CKEDITOR.instances.modify_edc_cn.setData(resp.edc_cn);
         }, error : function(xhr, error, msg) {
     		console.log(xhr);
     		console.log(error);
     		console.log(msg);
     	}
     });
	 $("#eventDetail").modal('show');
}
function ModifyDay(info){
	var id = $("#login_id").val();
	var emp_id = $("#detail_emp_id").val();
	var exist = $("#exist").val();
	if(id == emp_id || exist == ''){
		Swal.fire({
	 		  title: '일정을 수정하시겠습니까?',
	 		  showCancelButton: true,
	 		  confirmButtonText: `확인`,
	 		  cancelButtonText: '취소'
	 		}).then((result) => {
	 		  if (result.isConfirmed) {
	 			var start_date = AlldateFormat(info.event.start);
	  			var end_date = AlldateFormat(info.event.end);
	  			$.ajax({
						type : "POST",
						url : "education/modify",
						data : {
							"edc_code" : info.event.id
							, "edc_start_time" : start_date
							, "edc_end_time" : end_date
						},
						success : function(resp) {
							var result = resp.result;
							
							if (result == "OK") {
								Swal.fire('수정완료!', '', 'success');
							} else {
								Swal.fire('수정에 실패했습니다.', '', 'info');
							}
						}
					});//ajax끝
	 		  }else{
	 			  info.revert();
	 		  }
	 	  })
	}else{
		Swal.fire('수정 권한이 없습니다.', '', 'error');
		info.revert();
	}
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
$(".CloseBtn").on("click", function(){
	$("#registerForm").clearForm();
	hideMsg($("#edc_nm"));
	hideMsg($("#start_date"));
	hideMsg($("#end_date"));
	hideSelectMsg($("#edc_cl_code"));
	hideSelectMsg($("#emp_id"));
	hideMsg($("#edc_place"));
	$(".franList").empty();
	//fran = [];
});
$(".ModifyCloseBtn").on("click", function(){
	hideMsg($("#modify_edc_nm"));
	hideMsg($("#modify_start_date"));
	hideMsg($("#modify_end_date"));
	hideSelectMsg($("#modify_edc_cl_code"));
	hideSelectMsg($("#modify_emp_id"));
	hideMsg($("#modify_edc_place"));
});
$.fn.clearForm = function() {
	return this.each(function() {
		var type = this.type, tag = this.tagName.toLowerCase();
		if (tag === 'form') {
			return $(':input', this).clearForm();
		}
		if (type === 'text' || type === 'password' || type === 'hidden'
				|| tag === 'textarea') {
			this.value = '';
		} else if (type === 'checkbox' || type === 'radio') {
			this.checked = false;
		} else if (tag === 'select') {
			this.selectedIndex = -1;
		}
	});
};
$("#edc_nm").on("change", function(){
	checkName();
});
$("#start_date").on("change", function(){
	checkStartDate();
});
$("#end_date").on("change", function(){
	checkEndDate();
});
$("#edc_cl_code").on("change", function(){
	checkClCode();
});
$("#emp_id").on("change", function(){
	checkEmpId();
});
$("#edc_place").on("change", function(){
	checkPlace();
});
function checkName() {
	var name = $("#edc_nm").val();
	var oInput = $("#edc_nm");

	hideMsg(oInput);

	if (name != "") {
		showSuccessMsg(oInput);
		return true;
	} else if (name == "") {
		showErrorMsg(oInput);
		return false;
	}

	return true;
};
function checkStartDate() {
	var startdate = $("#start_date").val();
	var oInput = $("#start_date");
	var num = startdate.indexOf("T");
	var date = startdate.substr(0, num);
	var time = startdate.substr(num+1);
	
	hideMsg(oInput);
	let today = moment();
	let now = today.format('YYYY-MM-DD');
	
	if (date != '' && date >= now) {
		showSuccessMsg(oInput);
		$("#edc_start_time").val(date+" "+time);
		return true;
	} else if (date != '' && date < now) {
		showErrorMsg(oInput);
		return false;
	} else if (date == '') {
		showErrorMsg(oInput);
		return false;
	}

	return true;
};
function checkEndDate() {
	var enddate = $("#end_date").val();
	var oInput = $("#end_date");
	var num = enddate.indexOf("T");
	var date = enddate.substr(0, num);
	var time = enddate.substr(num+1);
	var startdate = $("#start_date").val();
	var startnum = startdate.indexOf("T");
	var start_date = startdate.substr(0, startnum);
	
	hideMsg(oInput);
	
	var today = moment();
	var now = today.format('YYYY-MM-DD');
	
	if (date != '' &&  date >= start_date &&  date >= now) {
		showSuccessMsg(oInput);
		$("#edc_end_time").val(date+" "+time);
		return true;
	} else if (date != '' && date < start_date && date >= now) {
		showErrorMsg(oInput);
		return false;
	} else if (date != '' && date >= start_date && date < now) {
			showErrorMsg(oInput);
			return false;
	} else if (date != '' && date < start_date && date < now) {
		showErrorMsg(oInput);
		return false;
	}else if (date == '') {
		showErrorMsg(oInput);
		return false;
	}

	return true;
};
function checkClCode() {
	var clCode = $("#edc_cl_code").val();
	var oInput = $("#edc_cl_code");

	hideSelectMsg(oInput);

	if(!clCode) {
		showSelectErrorMsg(oInput);
		return false;
	} else {
		showSelectSuccessMsg(oInput);
		return true;
	}

	return true;
};
function checkEmpId() {
	var empId = $("#emp_id").val();
	var oInput = $("#emp_id");

	hideSelectMsg(oInput);

	if (!empId) {
		showSelectErrorMsg(oInput);
		return false;
	} else {
		showSelectSuccessMsg(oInput);
		return true;
	}

	return true;
};
function checkPlace() {
	var place = $("#edc_place").val();
	var oInput = $("#edc_place");

	hideMsg(oInput);

	if (place != "") {
		showSuccessMsg(oInput);
		return true;
	} else if (place == "") {
		showErrorMsg(oInput);
		return false;
	}

	return true;
};
function checkUnrealInput() {
	if (checkName() 
		& checkStartDate()
		& checkEndDate()
		& checkClCode()
		& checkEmpId()
		& checkPlace()
	) {
		return true;
	} else {
		return false;
	}
}
$("#modify_edc_nm").on("change", function(){
	checkModifyName();
});
$("#modify_start_date").on("change", function(){
	var startdate = $(this).val();
	var num = startdate.indexOf("T");
	var date = startdate.substr(0, num);
	var time = startdate.substr(num+1);
	$("#modify_edc_start_time").val(date+" "+time);
});
$("#modify_end_date").on("change", function(){
	checkModifyEndDate();
});
$("#modify_edc_cl_code").on("change", function(){
	checkModifyClCode();
});
$("#modify_emp_id").on("change", function(){
	checkModifyEmpId();
});
$("#modify_edc_place").on("change", function(){
	checkModifyPlace();
});
function checkModifyName() {
	var name = $("#modify_edc_nm").val();
	var oInput = $("#modify_edc_nm");

	hideMsg(oInput);

	if (name != "") {
		showSuccessMsg(oInput);
		return true;
	} else if (name == "") {
		showErrorMsg(oInput);
		return false;
	}

	return true;
};
function checkModifyClCode() {
	var clCode = $("#modify_edc_cl_code").val();
	var oInput = $("#modify_edc_cl_code");

	hideSelectMsg(oInput);

	if(!clCode) {
		showSelectErrorMsg(oInput);
		return false;
	} else {
		showSelectSuccessMsg(oInput);
		return true;
	}

	return true;
};
function checkModifyEmpId() {
	var empId = $("#modify_emp_id").val();
	var oInput = $("#modify_emp_id");

	hideSelectMsg(oInput);

	if (!empId) {
		showSelectErrorMsg(oInput);
		return false;
	} else {
		showSelectSuccessMsg(oInput);
		return true;
	}

	return true;
};
function checkModifyPlace() {
	var place = $("#modify_edc_place").val();
	var oInput = $("#modify_edc_place");

	hideMsg(oInput);

	if (place != "") {
		showSuccessMsg(oInput);
		return true;
	} else if (place == "") {
		showErrorMsg(oInput);
		return false;
	}

	return true;
};
function checkModifyEndDate() {
	var enddate = $("#modify_end_date").val();
	var oInput = $("#modify_end_date");
	var num = enddate.indexOf("T");
	var date = enddate.substr(0, num);
	var time = enddate.substr(num+1);
	var startdate = $("#modify_start_date").val();
	var startnum = startdate.indexOf("T");
	var start_date = startdate.substr(0, startnum);
	var start_time = startdate.substr(startnum+1);
	
	hideMsg(oInput);
	
	if (date != '' &&  date >= start_date && time >= start_time) {
		showSuccessMsg(oInput);
		$("#modify_edc_end_time").val(date+" "+time);
		return true;
	} else if (date != '' && date < start_date && time < start_time) {
		showErrorMsg(oInput);
		return false;
	}else if (date != '' && date >= start_date && time < start_time) {
		showErrorMsg(oInput);
		return false;
	}else if (date != '' && date < start_date && time >= start_time) {
		showErrorMsg(oInput);
		return false;
	}else if (date == '') {
		showErrorMsg(oInput);
		return false;
	}
	
	return true;
	
	/*var today = moment();
	var now = today.format('YYYY-MM-DD');
	
	if (date != '' &&  date >= start_date &&  date >= now) {
		showSuccessMsg(oInput);
		$("#modify_edc_end_time").val(date+" "+time);
		return true;
	} else if (date != '' && date < start_date && date >= now) {
		showErrorMsg(oInput);
		return false;
	} else if (date != '' && date >= start_date && date < now) {
			showErrorMsg(oInput);
			return false;
	} else if (date != '' && date < start_date && date < now) {
		showErrorMsg(oInput);
		return false;
	}else if (date == '') {
		showErrorMsg(oInput);
		return false;
	}*/
};
function checkModifyUnrealInput() {
	if (checkModifyName() 
		& checkModifyClCode()
		& checkModifyEmpId()
		& checkModifyPlace()
		& checkModifyEndDate()
	) {
		return true;
	} else {
		return false;
	}
}
function setFocusToInputObject(obj) {
	obj.focus();
}
function hideMsg(obj) {
	obj.attr("class", "form-control");
	obj.show();
}
function hideSelectMsg(obj) {
	obj.attr("class", "choices form-select choices__input");
	obj.show();
}
function showErrorMsg(obj) {
	obj.attr("class", "form-control is-invalid");
	obj.show();
}
function showSuccessMsg(obj) {
	obj.attr("class", "form-control is-valid");
	obj.show();
}
function showSelectErrorMsg(obj) {
	obj.attr("class", "choices form-select choices__input is-invalid");
	obj.show();
}
function showSelectSuccessMsg(obj) {
	obj.attr("class", "choices form-select choices__input is-valid");
	obj.show();
}
/*function checkModifyStartDate() {
	var startdate = $("#modify_start_date").val();
	var oInput = $("#modify_start_date");
	var num = startdate.indexOf("T");
	var date = startdate.substr(0, num);
	var time = startdate.substr(num+1);
	
	hideMsg(oInput);
	let today = moment();
	let now = today.format('YYYY-MM-DD');
	
	if (date != '' && date >= now) {
		showSuccessMsg(oInput);
		$("#modify_edc_start_time").val(date+" "+time);
		return true;
	} else if (date != '' && date < now) {
		showErrorMsg(oInput);
		return false;
	} else if (date == '') {
		showErrorMsg(oInput);
		return false;
	}

	return true;
};*/