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
 
.ResultTable tr{
	background: #f5ebe7;
	height: 53px;
	vertical-align: middle;
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
							<h4>급여조회</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">급여조회</li>
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
										<th class="searchTh"  style="width: 10%;">지급년월</th>
										<td style="width: 23.3%;">
											<input  class="form-control monthInput currentDate" placeholder="Search..." type="month">
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
								<!-- <a href="#" id="delete" class="btn btn-secondary float-end" data-bs-toggle="modal" data-bs-target="#defaultSize">삭제</a>
								<a href="#" id="modify" class="btn btn-primary float-end pribtn">수정</a> -->
								<a href="${cPath}/head/salary/excelDownload" class="btn btn-primary float-end pribtn">엑셀다운로드</a>
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
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">지급일자</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">이름</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">직급</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">부서</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">지급총액</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">공제총액</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">실지급액</a>
											</th>
										</tr>
									</thead>
									<tbody id="listBody">
										<c:choose>
											<c:when test="${not empty pagingVO.dataList }">
												<c:forEach items="${pagingVO.dataList}" var="salary">
													<td>${salary.salary_de}</td>
													<td>${salary.employeeList[0].emp_nm}</td>
													<td>${salary.employeeList[0].emp_clsf_code}</td>
													<td>${salary.deptList[0].dept_nm}</td>
													<td>${salary.salary_money}</td>
												</c:forEach>										
											</c:when>
										</c:choose>
									</tbody>
								</table>
							</div>
						</div>
						<!-- data-Area 끝 -->
						<!-- 페이징 및 푸터 영역 -->
						<table class="table table-hover ResultTable">
									<tr>
										<th class="center" data-sortable="" style="width: 10%;">총계</th>
										<th class="center" data-sortable="" style="width: 10%;"></th>
										<th class="center cnt" data-sortable="" style="width: 10%;">몇 건</th>
										<th class="center" data-sortable="" style="width: 10%;"></th>
										<th class="right MoneySum" data-sortable="" style="width: 10%;"></th>
										<th class="right ResultInsurance" data-sortable="" style="width: 10%;" >123</th>
										<th class="right ResultRealMoney" data-sortable="" style="width: 10%;">123</th>
									</tr>
								</table>
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
   <form id="searchForm" action="${cPath}/head/salary">
	   	<input type="hidden" name="selector" value="" />
	   	<input type="hidden" name="page" value="${pagingVO.currentPage }">
	   	<input type="hidden" name="searchWord" value="">
	   	<input type="hidden" name="deptSeq" value="">
	   	<input type="hidden" name="currentDate" value="">
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
              			</tr>
              			<tr>
              				<td class="NationalPension right"></td>
              				<td class="HealthInsurance right"></td>
              				<td class="EmploymentInsurance right"></td>
              				<td class="Longtermcare right"></td>
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
 
 $(function(){
	 
	 var now = new Date();	// 현재 날짜 및 시간
	 var year = now.getFullYear();	// 연도
	 var month = now.getMonth()+1;
	 
	 if(String(month).length == 1){
		 $('.monthInput').val(year+"-0"+month);
	 }else{
		 $('.monthInput').val(year+"-"+month);
	 }
	
	 $("#searchForm input[name='currentDate']").val($('.currentDate').val());
	 
	 searchForm.submit();
	 
 })
 
 
 	//급여명세서 조회
	$('#listBody').on('click', 'tr' ,function(){
		
		
		let salary = $(this).data('salary');
		String(salary.salary_de).substring(0,5)
		$('.salaryMonthDay').text(String(salary.salary_de).substring(0,4) + "년 " + String(salary.salary_de).substring(5,7)+"월 ");
		$('#salaryModal').modal('show');
		$('.Dept').text($(this).find('.deptNM').text()); //부서명
		$('.EmpNameModal').text($(this).find('.EmpName').text()); //직원명
		$('.EmpID').text($(this).find('.empID').val()); //직원아이디
		$('.EmpClsf').text($(this).find('.empClsfCode').val()); //직급
		$('.EmpSE').text($(this).find('.empSeCode').val()); //직원구분
		$('.Company').text($(this).find('.headNM').val()); //회사명
		
		
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
		        let MoneySum = 0;
		        let cnt = 0;
		        let ResultInsurance = 0;
		        let ResultRealMoney = 0;
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
					MoneySum = parseInt(MoneySum) + parseInt(salary.salary_money) //지급총액 +
					cnt = cnt+1;//총 몇건
					
					let NationalPension = parseInt(money*0.045)//국민연금
					let HealthInsurance = parseInt(money*0.0343)//건강보험
					let Longtermcare = parseInt(parseInt(money*0.0343)*0.1152) //장기요양
					let EmploymentInsurance = parseInt(money*0.008)//고용보험
					
					InsuranceSum = NationalPension + HealthInsurance + Longtermcare + EmploymentInsurance; //공제총액
					ResultInsurance = parseInt(ResultInsurance) + parseInt(InsuranceSum);
					
					//실지급액
					RealMoney = parseInt(money) - parseInt(InsuranceSum);
					ResultRealMoney = parseInt(ResultRealMoney) + parseInt(RealMoney);
					
					let img = "<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>";
					if(salary.employeeList[0].att_fileno != null){
						img = "<img class='myImage' src='data:image/jpeg;base64,"+salary.attachfileList[0].file_img+"'>";
					}
					
					
					let tr = $("<tr>").append(
							 //$('<td class="center">').html('<input id="checkAll" type="checkbox" class="form-check-input">'),
							 //$('<td class="center">').html(img),
							 $('<td class="center">').html(salary.salary_de),
						  	 $('<td class="center EmpName">').html(salary.employeeList[0].emp_nm),
						  	 $('<td class="center">').html(salary.employeeList[0].emp_clsf_code),
						  	 $('<td class="center deptNM">').html(dept_nm),
						  	 $('<td class="right SalaryMoney">').html(changeMoney 
						  		+ "<input type='hidden' class='hiddenMoney' value="+ salary.salary_money +">"
						  		+ "<input type='hidden' class='headNM' value="+ salary.headList[0].head_comnm +">"
						  	  	+ "<input type='hidden' class='empID' value="+ salary.employeeList[0].emp_id +">"
						  	  	+ "<input type='hidden' class='empSeCode' value="+ salary.employeeList[0].emp_se_code +">"
						  	  	+ "<input type='hidden' class='empClsfCode' value="+ salary.employeeList[0].emp_clsf_code +">"
						  	 ),
							 $('<td class="right">').html(String(InsuranceSum).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')),
							 $('<td class="right">').html(String(RealMoney).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'))
						).data("salary", salary).css("cursor", "pointer");
					trTags.push(tr);
					});
			});
				
				$('.MoneySum').text(String(MoneySum).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')  + " 원");//지급총액 합계
				$('.cnt').text("총 " + cnt + "건");
				$('.ResultInsurance').text(String(ResultInsurance).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + " 원"); //공제총액 합계
				$('.ResultRealMoney').text(String(ResultRealMoney).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,') + " 원"); //공제총액 합계
				
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
	 
	 
	 $("#selector").on("change", function() {
			$("#searchForm input[name='selector']").val($(this).val());
			searchForm.submit();
	 });
	 
	 
	 $('.searchBTN').on('click', function(){
		 
		 $("#searchForm input[name='deptSeq']").val($('.deptSeq').val());
		 $("#searchForm input[name='searchWord']").val($('.empNM').val());
		 $("#searchForm input[name='currentDate']").val($('.currentDate').val());
		 searchForm.submit();
	 })
 
	   $('.resetBTN').on('click', function(){
		   $("#searchForm input[name='deptSeq']").val("");
		   $("#searchForm input[name='searchWord']").val("");
		   $("#searchForm input[name='currentDate']").val($('.currentDate').val());
		   searchForm.submit();
 		}) 
	 
 </script>