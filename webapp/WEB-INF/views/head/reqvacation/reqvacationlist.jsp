<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 17      작성자명      최초작성
* 2021. 6. 21      진예은         선택일괄 승인
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

.seconBTN{
	margin-right: 5px;
}

.okModalSpan{
	font-weight: bold;
	font-size: 26px;
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
<input type="hidden" class="okInput" value="${reqvacationOK}">
    	<section class="section">
    		<!-- card 영역 -->
    		<div class="card">
    			<!-- card-header 영역 -->
				<div class="card-header">
					<div class="row">
						<div class="rowLeft">
							<h4>휴가요청관리</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">휴가요청관리</li>
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
								<button type="reset" class="resetBtn icon dripicons-clockwise float-end"></button>
							</div>
							<table class="table table-borderd">
								<tbody class="talbeSearchArea">
									<tr>
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
										<th class="searchTh"  style="width: 10%;">직급</th>
										<td style="width: 23.3%;">
											<select class="form-control formWidth clsfCode" name="emp_clsf_code">
												<option value="">기본직급</option>
												<c:if test="${not empty comcodeECL }">
				                               		<c:forEach items="${comcodeECL }" var="ecl">
				                               			<option value="${ecl.com_code }">${ecl.com_code_nm }</option>
				                               		</c:forEach>
				                                 </c:if>
			                                 </select>
										</td>
									</tr>   
									<tr>
										<th class="searchTh"  style="width: 10%;">휴가구분</th>
										<td style="width: 23.3%;">
											<select class="form-select vacationSelect" name="vcatn_se_code">
												<option value="">휴가구분선택</option>
												<c:if test="${not empty vacationComcode}">
													<c:forEach items="${vacationComcode}" var="vac">
														<option value="${vac.com_code}">${vac.com_code_nm }</option>										
													</c:forEach>
												</c:if>
											</select>
										</td>
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
								<a href="#" class="btn btn-primary float-end pribtn AllOK">선택일괄승인</a>
								<a href="${cPath}/head/reqvacation/reqCalendar" class="btn btn-secondary float-end">휴가내역조회</a>
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
											<th class="center" data-sortable="" style="width: 10%;">
												<input id="checkAll" type="checkbox" class="form-check-input">
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">이름</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">부서</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">직급</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">휴가구분</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">차감일수</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">시작일자</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">종료일자</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">상태</a>
											</th>
										</tr>
									</thead>
									<tbody id="listBody">
									<!-- 
										데이터 넣는 영역 
									 -->
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
  <form id="searchForm" action="${cPath}/head/reqvacation">
   	<input type="hidden" name="selector" value="" />
   	<input type="hidden" name="page" value="${pagingVO.currentPage }">
   	<input type="hidden" name="searchWord" value="">
   	<input type="hidden" name="deptSeq" value="">
   	<input type="hidden" name="clspCode" value="">
   	<input type="hidden" name="vacationSelect" value="">
  </form>
  
  <!-- 일괄승인폼 -->
   <form id="modiForm" name="reqVacationListVO" action="${cPath}/head/reqvacation/vacationAllCheck" method="post">
   
   </form>
  
  
  
   <!---------------------- 수정요청 승인 모달 --------------------------------------------------------------------------------->
    <div class="me-1 mb-1 d-inline-block">
        <!-- Button trigger for default modal -->


        <!--Default size Modal -->
        <div class="modal fade text-left" id="ReqOkModal" tabindex="-1"
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
<img class="swal2-image" style="display: none;"><span class="okModalSpan">휴가요청을 승인하시겠습니까?</span><button type="button" class="swal2-close" aria-label="Close this dialog" style="display: none;">×</button></div>
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
		<button type="button" class="swal2-confirm swal2-styled okReqBTN" aria-label=""
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
  
<!-- ------------- 수정요청 반려 모달 ------------------------------------------------------------------------>
    <div class="me-1 mb-1 d-inline-block">
        <!-- Button trigger for default modal -->


        <!--Default size Modal -->
        <div class="modal fade text-left" id="novacationModal" tabindex="-1"
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
    <span class="okModalSpan">휴가요청을 반려하시겠습니까?</span>
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
		<button type="button" class="swal2-confirm swal2-styled noVacationBTN" aria-label=""
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
 $(function(){
	 if($('.okInput').val() == "OK"){
		 alert("일괄 승인되었습니다.")
	 }
	 
 })
 
 //전부체크 이벤트
 $("#checkAll").on("click", function() {
		console.log($("#listBody input[type='checkbox']"));
		if($(this).is(":checked")){
			$("#listBody input[type='checkbox']").prop("checked", true);
		}else{
			$("#listBody input[type='checkbox']").prop("checked", false);
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
 
 
//페이징
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
				$(resp.dataList).each(function(idx, rest) {
					
					if(rest.vcatn_confm_at == 'Y'){
						dclzCode = '<a href="#" class="btn btn-outline-secondary rounded-pill">승인</a>'
					}else if(rest.vcatn_confm_at == 'N'){
						dclzCode = '<a href="#" class="btn btn-outline-danger rounded-pill">반려</a>'
					}else{
						dclzCode = '<a href="#" class="btn btn-outline-danger rounded-pill">요청중</a>'
					}
					
					let img = "<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>";
					if(rest.employeeList[0].att_fileno != null){
						img = "<img class='myImage' src='data:image/jpeg;base64,"+rest.attachfileList[0].file_img+"'>";
					}
					
					let tr = $("<tr>").append(
							 $('<td class="center">').html('<input id="checkAll" type="checkbox" class="form-check-input">'),
							 $('<td class="center">').html(img + rest.employeeList[0].emp_nm),
							 $('<td class="center">').html(rest.deptList[0].dept_nm),
							 $('<td class="center">').html(rest.employeeList[0].emp_clsf_code),
							 $('<td class="center">').html(rest.vcatn_se_code),
							 $('<td class="center">').html(rest.vcatn_usede+"일"),
							 $('<td class="center">').html(rest.vcatn_startde 
									 + "<input type='hidden' class='hiddenSEQ' value='"+rest.vcreq_seq+"'>"
									 + "<input type='hidden' class='hiddenUseDe' value='"+ rest.vcatn_usede +"'>"
									 + "<input type='hidden' class='hiddenEmpID' value='"+ rest.employeeList[0].emp_id +"'>"),
							 $('<td class="center">').html(rest.vcatn_endde),
							 $('<td class="center">').html('<a href="#" class="btn btn-outline-secondary rounded-pill ChangeOK seconBTN" data-bs-toggle="modal" data-bs-target="#ReqOkModal">승인</a><a href="#" class="btn btn-outline-danger rounded-pill vacationNO" data-bs-toggle="modal" data-bs-target="#novacationModal">반려</a>')
						).data("rest", rest).css("cursor", "pointer");
					trTags.push(tr);
			});
				
			} else {
				trTags.push($('<tr>').html(
						$("<td>").attr("colspan", "6")
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
 
 
 
	 
	 //승인버튼 이벤트
	 $('#listBody').on('click', '.ChangeOK' ,function(){
		 seq = $(this).parents('tr').find('.hiddenSEQ').val();
		 hiddenUseDe = $(this).parents('tr').find('.hiddenUseDe').val();
		 hiddenEmpID = $(this).parents('tr').find('.hiddenEmpID').val();
	 	 
		 //승인버튼 클릭시 이벤트
		 $('.okReqBTN').off().on('click', function(){
			 $.ajax({
				url : "${cPath}/head/reqvacation",
				method : "post",
				data : {
					"seq" : seq,
					"hiddenUseDe" : hiddenUseDe,
					"hiddenEmpID" : hiddenEmpID
				},
				dataType : "json",
				success : function(resp) {
					alert("승인처리 되었습니다.");
					$('#ReqOkModal').modal("hide");
					location.href="${cPath}/head/reqvacation";
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
	 $('#listBody').on('click', '.vacationNO' ,function(){
		 seq = $(this).parents('tr').find('.hiddenSEQ').val();

		 //반려버튼 이벤트
		 $('.noVacationBTN').off().on('click', function(){
				$.ajax({
					url : "${cPath}/head/reqvacation/novacation",
					method : "post",
					data : {
						"seq" : seq
					},
					dataType : "json",
					success : function(resp) {
						alert("반려처리 되었습니다.");
						$('#novacationModal').modal("hide");
						location.href="${cPath}/head/reqvacation";
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
 
	 $("#selector").on("change", function() {
			$("#searchForm input[name='selector']").val($(this).val());
			searchForm.submit();
		});
	 
	 //검색버튼 클릭이벤트
	 $('.searchBTN').on('click', function(){
		 $("#searchForm input[name='deptSeq']").val($('.deptSeq').val());
		 $("#searchForm input[name='searchWord']").val($('.empNM').val());
		 $("#searchForm input[name='clspCode']").val($('.clsfCode').val());
		 $("#searchForm input[name='vacationSelect']").val($('.vacationSelect').val());
		 searchForm.submit();
	 })
	 
	//리셋
	$(".resetBtn").on("click",function(){
		 $('.deptSeq').val("");
   		 $('.empNM').val("");
		 $('.clsfCode').val("");
		 $('.vacationSelect').val("");
		 
		 $("#searchForm input[name='deptSeq']").val("");
		 $("#searchForm input[name='searchWord']").val("");
		 $("#searchForm input[name='clspCode']").val("");
		 $("#searchForm input[name='vacationSelect']").val("");
		 
	 	 searchForm.submit();
     })
     
	//선택일괄승인
     $('.AllOK').on('click', function(){
    	// alert("일괄승인")
     	 var goMod = false;
    	 
    	 $("#listBody input[type='checkbox']").each(function(idx, att) {
    	 
    		 let seq = $(this).parents('tr').find('.hiddenSEQ').val();
			 if($(this).is(":checked")){
				 $('#modiForm').append($("<input>").attr("name", "reqVacationListVO[" + idx + "].vcreq_seq").prop("type", "text").val(seq))
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