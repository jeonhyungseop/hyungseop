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
<style>
.dataArea {
    height: 550px;
}

.btn-outline-secondary{
	margin-right: 5px;
}

.blue{
	color: #BF755A;
	font-weight: bold;
}

.bi-arrow-right{
	margin-left: 3px;
	margin-right: 3px;
}

.okModalBody{
	width: 100%;
	height: 100px;
	background: #f5ebe7;
}

.okModalSpan{
	font-weight: bold;
	font-size: 26px;
}

.bi-arrow-right::before{
	margin-top: 2px;
}

.dateSearch{
	width: 240px;
	display: inline-block;
}

.myImage{
	object-fit: cover;
    object-position: top; /*정사각형이 아니라 직사각형일 경우 원 안에 보여지게 할 중심 이미지의 위치를 지정*/
    border-radius: 50%;/*사각형의 모서리 둥근 정도를 지정하는 속성인데 50%를 지정하면 완전한 원이 됨*/
    width: 32px; 
    height: 32px;
    margin-right: 8px;
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
							<h4>수정요청 관리</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">수정요청 관리</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>	
				<!-- card-header 끝 -->
				<!-- card-body 영역 -->
					<div class="card-body">
						<!-- 검색 영역 -->
						<form>
							<div class="btnArea">
								<button type="button"class="btn btn-primary float-end pribtn searchBTN">검색</button>
								<button type="reset" class="resetBtn icon dripicons-clockwise float-end resetBTN"></button>
							</div>
							<table class="table table-borderd">
								<tbody class="talbeSearchArea">
									<tr>
										<th class="searchTh"  style="width: 10%;">기간</th>
										<td style="width: 23.3%;">
											<input  class="form-control dateSearch" id="startDate" placeholder="Search..." type="date">
											~
											<input  class="form-control dateSearch" id="endDate" placeholder="Search..." type="date">
										</td>
										<th class="searchTh"  style="width: 10%;">부서</th>
										<td style="width: 23.3%;">
											<select class="form-control formWidth deptSeq" >
												<option value="">부서선택</option>
												<c:if test="${not empty deptList }">
				                               		<c:forEach items="${deptList }" var="dept">
				                               			<option value="${dept.dept_seq }">${dept.dept_nm}</option>
				                               		</c:forEach>
				                                 </c:if>
			                                 </select>
										</td>
									</tr> 
									<tr>
										<th class="searchTh"  style="width: 10%;">이름</th>
										<td style="width: 23.3%;">
											<input  class="form-control empNM" name="searchWord" placeholder="Search..." type="text">
										</td>
									</tr>       
								</tbody>
							</table>
						</form>
						<!-- 조회 영역 -->
						<div class="dataTable-container">
							<div class="btnArea">
							<a class="btn btn-primary float-end pribtn selectAllOK">선택 일괄 승인</a>
								<div class="dataTable-dropdown float-end">
									<select id="selector" class="dataTable-selector form-select">
										<option value="5">5개씩 보기</option>
										<option value="10" selected="">10개씩 보기</option>
										<option value="15">15개씩 보기</option>
										<option value="20">20개씩 보기</option>
										<option value="25">25개씩 보기</option>
									</select>
								</div>
							</div>
							<div class="dataArea">
								<table class="table table-hover dataTable-table" id="table1">
									<thead>
										<tr>
											<th class="center" data-sortable="" style="width: 3%;">
												<a href="#" class=""><input id="checkAll" type="checkbox" class="form-check-input"></a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">근무일</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">신청자</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">부서</a>
											</th>
											<th class="left" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">출근시간</a>
											</th>
											<th class="left" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">퇴근시간</a>
											</th>
											<th class="center" data-sortable="" style="width: 20%;">
												<a href="#" class="dataTable">사유</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable"></a>
											</th>
										</tr>
									</thead>
									<tbody id="listBody">
									<!-- 
										데이터 넣는 영역 
									 -->
										 <c:choose>
											<c:when test="${not empty pagingVO.dataList }">
											
											</c:when>
											<c:otherwise>
												<tr>
													<td class="center" colspan="8">
														수정요청이 없습니다.
													</td>
												</tr>
											</c:otherwise>
										 </c:choose>
									</tbody>
								</table>
							</div>
						</div>
						<!-- data-Area 끝 -->
						<!-- 페이징 및 푸터 영역 -->
						<div class="dataTable-bottom">
							<div class="dataTable-info">Showing ${pagingVO.startPage } to <span id="totalPage"></span> of <span id="currentPage"></span> entries</div>
						</div>
						<div id="pagingArea" class="d-flex justify-content-center">
							${pagingVO.pagingHTMLBS }
						</div>
					</div>
					<!-- card-body 끝 -->
                </div>
    		<!-- card 끝 -->
    	</section>
    </div>
    
    
   <!-- 검색폼 -->
   <form id="searchForm" action="${cPath}/head/changeatt">
	   	<input type="hidden" name="selector" value="" />
	   	<input type="hidden" name="page" value="${pagingVO.currentPage }">
	   	<input type="hidden" name="deptSeq" value="">
	   	<input type="hidden" name="startDate" value="">
	   	<input type="hidden" name="endDate" value="">
	   	<input type="hidden" name="searchWord" value="">
   </form>
   <form id="modiForm" name="changeAttendanceListVO" action="${cPath}/head/changeatt/allCheck" method="post">
   
   </form>
  
 <!--수정요청 승인 모달 -->
    <div class="me-1 mb-1 d-inline-block">
        <!-- Button trigger for default modal -->


        <!--Default size Modal -->
        <div class="modal fade text-left" id="okModal" tabindex="-1"
            role="dialog" aria-labelledby="myModalLabel18" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                role="document">
                <div class="modal-content">
                    <div class="modal-body">
                       
                       <div aria-labelledby="swal2-title" aria-describedby="swal2-content" class="swal2-popup swal2-modal swal2-icon-error swal2-show"
	tabindex="-1" role="dialog" aria-live="assertive" aria-modal="true"
	style="display: flex;">
<div class="swal2-header"><ul class="swal2-progress-steps" style="display: none;">
</ul><div class="swal2-icon swal2-error" style="display: none;"></div>
<div class="swal2-icon swal2-question" style="display: none;"></div>
<div class="swal2-icon swal2-warning" style="display: none;"></div>
<div class="swal2-icon swal2-info swal2-icon-show" style="display: flex;">
<div class="swal2-icon-content">i</div>
</div><div class="swal2-icon swal2-success" style="display: none;"></div>
<img class="swal2-image" style="display: none;"><span class="okModalSpan">수정요청을 승인하시겠습니까?</span><button type="button" class="swal2-close" aria-label="Close this dialog" style="display: none;">×</button></div>
	<div class="swal2-content">
		<div id="swal2-content" class="swal2-html-container"
			style="display: none;"></div>
		<input class="swal2-input" style="display: none;"><input
			type="file" class="swal2-file" style="display: none;">
		<div class="swal2-range" style="display: none;">
			<input type="range">
			<output></output>
		</div>
		<select class="swal2-select" style="display: none;"></select>
		<div class="swal2-radio" style="display: none;"></div>
		<label for="swal2-checkbox" class="swal2-checkbox"
			style="display: none;"><input type="checkbox"><span
			class="swal2-label"></span></label>
		<textarea class="swal2-textarea" style="display: none;"></textarea>
		<div class="swal2-validation-message" id="swal2-validation-message"></div>
	</div>
	<div class="swal2-actions">
		<div class="swal2-loader"></div>
		<button type="button" class="swal2-confirm swal2-styled okDclzBTN" aria-label=""
			style="display: inline-block;" >OK</button>
		<button type="button" class="swal2-deny swal2-styled" aria-label=""
			style="display: none;">No</button>
		<button type="button" class="swal2-cancel swal2-styled" aria-label=""
			style="display: none;">Cancel</button>
	</div>
	<div class="swal2-footer" style="display: none;"></div>
	<div class="swal2-timer-progress-bar-container">
		<div class="swal2-timer-progress-bar" style="display: none;"></div>
	</div>
</div>

<input type="hidden" class="okModalSEQ">
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-----------------  수정요청 승인 모달 끝 --------------------------------------------------------------->
  

<!-- -------------수정요청 반려 모달 ------------------------------------------------------------------------>
    <div class="me-1 mb-1 d-inline-block">
        <!-- Button trigger for default modal -->


        <!--Default size Modal -->
        <div class="modal fade text-left" id="noModal" tabindex="-1"
            role="dialog" aria-labelledby="myModalLabel18" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                role="document">
                <div class="modal-content">
                    <div class="modal-body">
                       
                       <div aria-labelledby="swal2-title" aria-describedby="swal2-content" class="swal2-popup swal2-modal swal2-icon-error swal2-show"
	tabindex="-1" role="dialog" aria-live="assertive" aria-modal="true"
	style="display: flex;">
<div class="swal2-header"><ul class="swal2-progress-steps" style="display: none;"></ul><div class="swal2-icon swal2-error swal2-icon-show" style="display: flex;"><span class="swal2-x-mark">
        <span class="swal2-x-mark-line-left"></span>
        <span class="swal2-x-mark-line-right"></span>
      </span>
    </div><div class="swal2-icon swal2-question" style="display: none;"></div><div class="swal2-icon swal2-warning" style="display: none;"></div><div class="swal2-icon swal2-info" style="display: none;"></div><div class="swal2-icon swal2-success" style="display: none;"></div><img class="swal2-image" style="display: none;">
    <span class="okModalSpan">수정요청을 반려하시겠습니까?</span>
    <button type="button" class="swal2-close" aria-label="Close this dialog" style="display: none;">×</button></div>
	<div class="swal2-content">
		<div id="swal2-content" class="swal2-html-container"
			style="display: none;"></div>
		<input class="swal2-input" style="display: none;"><input
			type="file" class="swal2-file" style="display: none;">
		<div class="swal2-range" style="display: none;">
			<input type="range">
			<output></output>
		</div>
		<select class="swal2-select" style="display: none;"></select>
		<div class="swal2-radio" style="display: none;"></div>
		<label for="swal2-checkbox" class="swal2-checkbox"
			style="display: none;"><input type="checkbox"><span
			class="swal2-label"></span></label>
		<textarea class="swal2-textarea" style="display: none;"></textarea>
		<div class="swal2-validation-message" id="swal2-validation-message"></div>
	</div>
	<div class="swal2-actions">
		<div class="swal2-loader"></div>
		<button type="button" class="swal2-confirm swal2-styled noDclzBTN" aria-label=""
			style="display: inline-block;" >OK</button>
		<button type="button" class="swal2-deny swal2-styled" aria-label=""
			style="display: none;">No</button>
		<button type="button" class="swal2-cancel swal2-styled" aria-label=""
			style="display: none;">Cancel</button>
	</div>
	<div class="swal2-footer" style="display: none;"></div>
	<div class="swal2-timer-progress-bar-container">
		<div class="swal2-timer-progress-bar" style="display: none;"></div>
	</div>
</div>

<input type="hidden" class="okModalSEQ">
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<!-------------- 수정요청 반려 모달 끝 ------------------------------------------------------------------->  

  
   
   
   
 <script type="text/javascript">
 
 	//전부체크 이벤트
	$("#checkAll").on("click", function() {
		console.log($("#listBody input[type='checkbox']"));
		if($(this).is(":checked")){
			$("#listBody input[type='checkbox']").prop("checked", true);
		}else{
			$("#listBody input[type='checkbox']").prop("checked", false);
		}
	});
	
	$("#listBody").on("click", ".form-check-input", function() {
		var checked = false;
		$("#listBody input[type='checkbox']").each(function() {
			if($(this).is(":checked")){
				console.log(checked);
			}else{
				checked = true;
				console.log(checked);
			}
		});
		if(checked){
			$("#checkAll").prop("checked", false);
		}else{
			$("#checkAll").prop("checked", true);
		}
	});	
	
	
 //페이지 클릭 이벤트
 pagingArea = $("#pagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(page){
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	});
 
 let listBody = $('#listBody');
 let totalPage = $("#totalPage");
 let currentPage = $("#currentPage");
 let searchForm = $("#searchForm").ajaxForm({
	 	dataType : 'json',
	 	beforeSubmit : function() {
		searchForm.find("[name='page']").val("");
 },
 
	success : function(resp) {
		console.log(resp)
		listBody.empty();
		currentPage.empty();
		pagingArea.empty();
		let trTags = [];
		if (resp.dataList) {
			$(resp.dataList).each(function(idxz, dclz) {
			
				if(dclz.dclz_se_code == "정상출근"){
					dclzCode = '<a href="#" class="btn btn-outline-secondary rounded-pill">'+dclz.dclz_se_code+'</a>'
				}else{
					dclzCode = '<a href="#" class="btn btn-outline-danger rounded-pill">'+dclz.dclz_se_code+'</a>'
				}
				
				if(dclz.worktime_sm == null){
					worktime = "-";
				}else{
					worktime = dclz.worktime_sm + "시간";
				}
				
				if(dclz.lvffc_time == null){
					lvffc = "-";
				}else{
					lvffc = dclz.lvffc_time;
				}
				
				
				reason = dclz.dclz_change_prvonsh;
				reason = String(reason).trim();
				if(reason.substring(5, 8).trim() != "00"){
					 attend_hour = reason.substring(5, 8).trim(); //출근시간(hour)
					 attend_min = reason.substring(10, 13).trim(); //출근 시간(min)
					 attend_change = attend_hour + ":" + attend_min;
					 //alert(attend_change)
					 attend_time = dclz.attend_time + "<i class='bi bi-arrow-right'></i>" + "<span class='blue'>" + attend_change + "</span>"
					 				+ "<input class='attChange' type='hidden' value='"+ attend_change +"'>"
				 }else{
					 
					 attend_time = dclz.attend_time
				 }
				
				
				 
				 if(reason.substring(21, 23).trim() != "00"){
					lvffc_hour = reason.substring(21, 23).trim(); //퇴근시간(hour)
				 	lvffc_min = reason.substring(26, 28).trim(); //퇴근시간 (min)
				 	lvffc_change = lvffc_hour + ":" + lvffc_min;
				 	lvffc_time = lvffc + "<i class='bi bi-arrow-right'></i>" + "<span class='blue'>" + lvffc_change + "</span>"
				 				+ "<input class='lvfChange' type='hidden' value='"+ lvffc_change +"'>"
				 }else{
					 lvffc_time = lvffc
				 }
				 
				 let img = "<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>";
					if(dclz.employeeList[0].att_fileno != null){
						img = "<img class='myImage' src='data:image/jpeg;base64,"+dclz.attachfileList[0].file_img+"'>";
					}
				 
				let tr = $("<tr>").append(
						 $('<td class="center">').html('<input id="checkAll" type="checkbox" class="form-check-input"><input class="hiddenEmpID" type="hidden" value="' + dclz.employeeList[0].emp_id + '">'),
						 $('<td class="center cellSum">').html(dclz.dclz_stdrde).addClass(dclz.dclz_stdrde) ,
						 $('<td class="center">').html(img + dclz.employeeList[0].emp_nm),
						 $('<td class="center">').html(dclz.deptList[0].dept_nm),
						 $('<td class="left currentAttendTime">').html(attend_time ),
						 $('<td class="left currentLvffcTime">').html(lvffc_time + "<input type='hidden' class='hiddenSEQ' value='"+dclz.dclz_seq+"'>"),
						 $('<td class="left reson">').html("<input type='hidden' class='hiddenReason' value='"+dclz.dclz_change_prvonsh+"'>"+(dclz.dclz_change_prvonsh).substring(34, dclz.dclz_change_prvonsh.length).trim()),
						 $('<td class="center">').html('<a href="#" class="btn btn-outline-secondary rounded-pill ChangeOK" data-bs-toggle="modal" data-bs-target="#okModal">승인</a><a href="#" class="btn btn-outline-danger rounded-pill ChangeNO" data-bs-toggle="modal" data-bs-target="#noModal">반려</a>')
					).data("dclz", dclz).css("cursor", "pointer");
				trTags.push(tr);
			
			
		});
			
		} else {
			trTags.push($('<tr>').html(
					$("<td>").attr("colspan", "6").html("asdjfkl;")
					)
				);
			}
		listBody.html(trTags);
		totalPage.html(resp.totalPage);
		currentPage.html(resp.currentPage);
		pagingArea.html(resp.pagingHTMLBS);
	},
	error : function(xhr, resp, msg) {
		console.log(xhr);
		alert("실패");
		alert(msg)
	}
});
 
 searchForm.submit();

 $('#pagingArea').on('click', "a", function(event) {
		event.preventDefault();
		let page = $(this).data("page");
		if (page) {
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	}); 
 
 $("#selector").on("change", function() {
		$("#searchForm input[name='selector']").val($(this).val());
		searchForm.submit();
	});
 
 //승인버튼 이벤트
$('#listBody').on('click', '.ChangeOK' ,function(){
	 seq = $(this).parents('tr').find('.hiddenSEQ').val();
	 stdrde = $(this).parents('tr').find('.cellSum').text().trim();
	 
	 
	 let attChange = $(this).parents('tr').find('.attChange').val();
	 let lvfChange = $(this).parents('tr').find('.lvfChange').val();
	 
	 let currentAttendTime = $(this).parents('tr').find('.currentAttendTime').text().trim();
	 let currentLvffcTime = $(this).parents('tr').find('.currentLvffcTime').text().trim();
	 let empID = $(this).parents('tr').find('.hiddenEmpID').val();
	 
	 
	//승인 확인버튼 클릭시 이벤트
	 $('.okDclzBTN').off().on('click', function(){
	 	 
		 if(attChange == null){
			 attChange = currentAttendTime;
		 }
		 
		 if(lvfChange == null){
			 lvfChange = currentLvffcTime;			 
		 }
		 
		 
		 $.ajax({
			url : "${cPath}/head/changeatt",
			method : "post",
			data : {
				"seq" : seq,
				"attChange" : attChange,
				"lvfChange" : lvfChange,
				"stdrde" : stdrde,
				"empID" : empID
			},
			dataType : "json",
			success : function(resp) {
				alert("요청을 승인했습니다.");
				location.href="${cPath}/head/changeatt";
				
			},
			error : function(xhr, error, msg) {
				console.log(xhr);
				console.log(error);
				console.log(msg);
				alert("상태 : " + xhr.status);
			}
		});
	 	
	 })
 })
 
 
 
 
 //반려버튼 이벤트
$('#listBody').on('click', '.ChangeNO' ,function(){
	seq = $(this).parents('tr').find('.hiddenSEQ').val();
 
	$('.noDclzBTN').off().on('click', function(){
		
		$.ajax({
			url : "${cPath}/head/changeatt/noUpdate",
			method : "post",
			data : {
				"seq" : seq
			},
			dataType : "json",
			success : function(resp) {
				alert("요청을 반려했습니다.");
				location.href="${cPath}/head/changeatt";
			},
			error : function(xhr, error, msg) {
				console.log(xhr);
				console.log(error);
				console.log(msg);
				alert("상태 : " + xhr.status);
			}
		});
	})
 })
 
  $('.searchBTN').on('click', function(){
	 
	 $("#searchForm input[name='deptSeq']").val($('.deptSeq').val());
	 $("#searchForm input[name='startDate']").val($('#startDate').val());
	 $("#searchForm input[name='endDate']").val($('#endDate').val());
	 $("#searchForm input[name='searchWord']").val($('.empNM').val());
	 
	 
	searchForm.submit();
	 
 })
 
 $('.resetBTN').on('click', function(){
	 $("#searchForm input[name='deptSeq']").val("");
	 $("#searchForm input[name='startDate']").val("");
	 $("#searchForm input[name='endDate']").val("");
	 $("#searchForm input[name='searchWord']").val("");
	 
	 searchForm.submit();
 })
 
$('.selectAllOK').on('click', function(){
	//alert("일괄승인") 
	var goMod = false;
	$("#listBody input[type='checkbox']").each(function(idx, att) {
		let seq = $(this).parents('tr').find('.hiddenSEQ').val();
		let stdrde =  $(this).parents('tr').find('.cellSum').text().trim();
		
		let attChange = $(this).parents('tr').find('.attChange').val();
		let lvfChange = $(this).parents('tr').find('.lvfChange').val();
		 
		let currentAttendTime = $(this).parents('tr').find('.currentAttendTime').text().trim();
		let currentLvffcTime = $(this).parents('tr').find('.currentLvffcTime').text().trim();
		
		if(attChange == null){
			 attChange = currentAttendTime;
		 }
		 
		 if(lvfChange == null){
			 lvfChange = currentLvffcTime;			 
		 }
		 
		if($(this).is(":checked")){
			$("#modiForm").append($("<input>").attr("name", "changeAttendanceListVO["+idx+"].dclz_seq").prop("type", "text").val(seq))
			$("#modiForm").append($("<input>").attr("name", "changeAttendanceListVO["+idx+"].dclz_stdrde").prop("type", "text").val(stdrde))
			$("#modiForm").append($("<input>").attr("name", "changeAttendanceListVO["+idx+"].attend_time").prop("type", "text").val(attChange))
			$("#modiForm").append($("<input>").attr("name", "changeAttendanceListVO["+idx+"].lvffc_time").prop("type", "text").val(lvfChange))
			goMod = true;
		}
	});
	
	if(goMod){
		$("#modiForm").submit();
	}else{
		alert("승인할 수정요청을 선택해주세요.");
	}
	
 })
 
 
 

 </script>