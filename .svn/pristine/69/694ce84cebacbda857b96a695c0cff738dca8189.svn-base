<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 23      진예은     급여명세서 목록출력
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

.detailTable th{
	height: 60px;
	vertical-align: middle;
	background: #f5ebe7;
}

.NationalSalaryTable{
	margin-top: 40px;
}

.thColor{
	background: #f5ebe7;
}

.sumTable{
	margin-top: 40px;
	vertical-align: middle;
}

.sumTable th{
	background: #d8cdc8;
}

.ModalFONT{
	font-size: 23px;
}

#myModalLabel17{
	margin-left: 32%;
	font-size: 23px;
}

.dateSearch{
	width: 270px;
	display: inline-block;
}

.searchTh{
	width: 5% !important;
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
							<h4>급여명세서 조회</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">급여명세서 조회</li>
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
										<td style="width: 20.3%;">
											<input  class="form-control dateSearch" id="startDate" placeholder="Search..." type="date">
											~
											<input  class="form-control dateSearch" id="endDate" placeholder="Search..." type="date">
										</td>
									</tr>        
								</tbody>
							</table>
						</form>
						<!-- 조회 영역 -->
						<div class="dataTable-container">
							<div class="btnArea">
						<!-- 		<a href="#" id="delete" class="btn btn-secondary float-end" data-bs-toggle="modal" data-bs-target="#defaultSize">삭제</a>
								<a href="#" id="modify" class="btn btn-primary float-end pribtn">수정</a> -->
								<a href="${cPath}/head/mysalary/excelDownload" class="btn btn-primary float-end pribtn">엑셀다운로드</a>
								<div class="dataTable-dropdown float-end">
									<select id="selector" class="dataTable-selector form-select">
										<option value="5">5</option>
										<option value="10" selected="">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option>
									</select>
								</div>
							</div>
							<div class="dataArea">
								<table class="table table-hover dataTable-table" id="table1">
									<thead>
										<tr>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">귀속년월</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">지급일자</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">부서</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">이름</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">급여</a>
											</th>
										</tr>
									</thead>
									<tbody id="listBody">
									<c:choose>
										<c:when test="${not empty pagingVO.dataList }">
											<c:forEach items="${pagingVO.dataList}" var="salary">
												<td class="center">${salary.salary_de}</td>
												<td class="center">${salary.salary_de}</td>
												<td class="center">${salary.deptList[0].dept_nm}</td>
												<td class="center">${salary.employeeList[0].emp_nm}</td>
												<td class="center">${salary.salary_money}</td>
											</c:forEach>
										</c:when>
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
   <form id="searchForm" action="${cPath}/head/mysalary">
	   	<input type="hidden" name="selector" value="" />
	   	<input type="hidden" name="page" value="${pagingVO.currentPage }">
	   	<input type="hidden" name="startDate" value="">
	   	<input type="hidden" name="endDate" value="">
   </form>
   
   
   <!-- ------------------------------급여명세서 모달----------------------------------- -->
   <div class="modal fade text-left" id="salaryModal" tabindex="-1" role="dialog"
       aria-labelledby="myModalLabel17" aria-hidden="true">
       <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
           role="document">
           <div class="modal-content">
               <div class="modal-header">
                   <h4 class="modal-title ModalFONT" id="myModalLabel17"><span class="salaryMonthDay ModalFONT"></span>급여명세서</h4>
                   <button type="button" class="close" data-bs-dismiss="modal"
                       aria-label="Close">
                       <i data-feather="x"></i>
                   </button>
               </div>
               <div class="modal-body">
              		<table class="table table-hover detailTable">
              			<tr>
              				<th class="center">회사</th>
              				<td class="Company center"></td>
              				<th class="center">부서</th>
              				<td class="Dept center"></td>
              				<th class="center">직원아이디</th>
              				<td class="EmpID center"></td>
              			</tr>
              			<tr>
              				<th class="center">직원구분</th>
              				<td class="EmpSE center"></td>
              				<th class="center">직급</th>
              				<td class="EmpClsf center"></td>
              				<th class="center">성명</th>
              				<td class="EmpNameModal center"></td>
              			</tr>	
              		</table>
              		
              		<table class="table table-hover detailTable NationalSalaryTable">
              			<tr>
              				<th rowspan="2" class="center">지급내역</th>
              				<th class="center">기본급</th>
              			</tr>
              			<tr>
              				<td class="Salary right"></td>
              			</tr>
              			<tr>
              				<th class="center thColor" rowspan="2">공제내역</th>
              				<th class="center">국민연금</th>
              				<th class="center">건강보험</th>
              				<th class="center">고용보험</th>
              				<th class="center">장기요양보험료</th>
              				<th class="center">소득세</th>
              				<th class="center">지방소득세</th>
              			</tr>
              			<tr>
              				<td class="NationalPension right"></td>
              				<td class="HealthInsurance right"></td>
              				<td class="EmploymentInsurance right"></td>
              				<td class="Longtermcare right"></td>
              				<td class="Incometax right"></td>
              				<td class="localincometax right"></td>
              			</tr>
              		</table>
              		
              		<table class="table table-hover sumTable">
              			<tr>
              				<th rowspan="2" class="center">합계</th>
              				<th class="center">지급총액</th>
              				<th class="center">세액</th>
              				<th class="center">차감지급액</th>
              			</tr>
              			<tr>
              				<td class="right sumSalary"></td>
              				<td class="right minusSalary"></td>
              				<td class="right resultSalary"></td>
              			</tr>
              		</table>
              		
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-light-secondary"
                       data-bs-dismiss="modal">
                       <i class="bx bx-x d-block d-sm-none"></i>
                       <span class="d-none d-sm-block">Close</span>
                   </button>
               </div>
           </div>
       </div>
   </div>
   <!---------------------------------- 휴가상세보기 모달 끝 ----------------------------------- -->
   
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
				$(resp.dataList).each(function(idx, salary) {

					$(salary.deptList).each(function(idx, dept){
					if(dept.dept_nm != null){
						dept_nm = dept.dept_nm
					}else{
						dept_nm = "-";
					}
					
					let locale = navigator.language; // 지역 가져오기
			        let money = salary.salary_money; // 화폐를 표시할 숫자 
			        let changeMoney = Number(money).toLocaleString(locale); // 지역화폐로 표시 변환
					
					salaryMonth = String(salary.salary_de).substring(0,7);
					
					let tr = $("<tr>").append(
							 //$('<td class="center">').html('<input id="checkAll" type="checkbox" class="form-check-input">'),
							 //$('<td class="center">').html(img),
							 $('<td class="center">').html(salaryMonth),
							 $('<td class="center">').html(salary.salary_de),
						  	 $('<td class="center">').html(dept_nm),
						  	 $('<td class="center EmpName">').html(salary.employeeList[0].emp_nm),
						  	 $('<td class="center SalaryMoney" class="left">').html(changeMoney 
						  		+ "<input type='hidden' class='headNM' value="+ salary.headList[0].head_comnm +">"
						  	  	+ "<input type='hidden' class='deptNM' value="+ salary.deptList[0].dept_nm +">"
						  	  	+ "<input type='hidden' class='empID' value="+ salary.employeeList[0].emp_id +">"
						  	  	+ "<input type='hidden' class='empSeCode' value="+ salary.employeeList[0].emp_se_code +">"
						  	  	+ "<input type='hidden' class='empClsfCode' value="+ salary.employeeList[0].emp_clsf_code +">"
						  	 )
						).data("salary", salary).css("cursor", "pointer");
					trTags.push(tr);
					});
				
				
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
 
	 
		//급여명세서 조회
		$('#listBody').on('click', 'tr' ,function(){
			let salary = $(this).data('salary');
			$('#salaryModal').modal('show');
			
			String(salary.salary_de).substring(0,5)
			
			$('.salaryMonthDay').text(String(salary.salary_de).substring(0,4) + "년 " + String(salary.salary_de).substring(5,7)+"월 ");
			$('.Company').text($('.headNM').val()); //회사이름
			$('.Dept').text($('.deptNM').val()); //부서명
			$('.EmpID').text($('.empID').val()); //직원아이디
			$('.EmpSE').text($('.empSeCode').val()); //직원구분
			$('.EmpClsf').text($('.empClsfCode').val()); //직급
			$('.EmpNameModal').text($(this).find('.EmpName').text()); //직원명
			
			$('.Salary').text($(this).find('.SalaryMoney').text()) //급여
			
			let EMPSalary = String($(this).find('.SalaryMoney').text().trim()).replace(/\,/gi, "");
			let NationalPension = String(parseInt(EMPSalary * 0.045)).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); //국민연금
			let HealthInsurance = String(parseInt(EMPSalary * 0.0343)).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); //건강보험
			let Longtermcare = String(parseInt(parseInt(EMPSalary * 0.0343) * 0.1152)).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); //장기요양
			let EmploymentInsurance = String(parseInt(EMPSalary * 0.008)).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); //고용보험
			
			
			$('.NationalPension').text(NationalPension);
			$('.HealthInsurance').text(HealthInsurance);
			$('.EmploymentInsurance').text(EmploymentInsurance);
			$('.Longtermcare').text(Longtermcare);
			
			$('.sumSalary').text($(this).find('.SalaryMoney').text().trim());
			resultSalary = parseInt(EMPSalary - (EMPSalary * 0.045) - (EMPSalary * 0.0343) - (parseInt(EMPSalary * 0.0343) * 0.1152) - (EMPSalary * 0.008));
			minusSalary = parseInt((EMPSalary * 0.045) + (EMPSalary * 0.0343) + (parseInt(EMPSalary * 0.0343) * 0.1152) + (EMPSalary * 0.008));
			
			$('.minusSalary').text(String(minusSalary).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
			$('.resultSalary').text(String(resultSalary).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
			
			/* <td class="right sumSalary"></td>
				<td class="right minusSalary"></td>
				<td class="right resultSalary"></td> */
			  
		})
		
		 
	 $("#selector").on("change", function() {
			$("#searchForm input[name='selector']").val($(this).val());
			searchForm.submit();
	 });
		
	 $('.searchBTN').on('click', function(){
		 $("#searchForm input[name='startDate']").val($('#startDate').val());
		 $("#searchForm input[name='endDate']").val($('#endDate').val());
		 searchForm.submit();
	 })
	 
	 
   $('.resetBTN').on('click', function(){
		 $("#searchForm input[name='startDate']").val("");
		 $("#searchForm input[name='endDate']").val("");
		 searchForm.submit();
 	})
 
 </script>