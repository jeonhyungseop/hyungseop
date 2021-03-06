<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 6. 07. 진예은          직원목록 조회
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

th{
	text-align: center;
}

.myImage{
	object-fit: cover;
    object-position: top; /*정사각형이 아니라 직사각형일 경우 원 안에 보여지게 할 중심 이미지의 위치를 지정*/
    border-radius: 50%;/*사각형의 모서리 둥근 정도를 지정하는 속성인데 50%를 지정하면 완전한 원이 됨*/
    width: 32px; 
    height: 32px;
}

.dataTable-table td{
	height: 32px;
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
							<h4>직원목록 조회</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">직원목록 조회</li>
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
								<button type="button" class="resetBtn icon dripicons-clockwise float-end"></button>
							</div>
							<table class="table table-borderd">
								<tbody class="talbeSearchArea">
									<tr>
										<th class="searchTh"  style="width: 10%;">직원명</th>
										<td style="width: 23.3%;">
											<input  class="form-control empNM" name="searchWord" placeholder="Search..." type="text">
										</td>
										<th>퇴사여부</th>
										<td>
											<select class="form-select leave">
												<option value="">퇴사여부선택</option>
												<option value="Y">퇴사</option>
												<option value="N">재직</option>
											</select>
										</td>
										
									</tr>    
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
								</tbody>
							</table>
						</form>
						<!-- 조회 영역 -->
						<div class="dataTable-container">
							<div class="btnArea">
								<a href="${cPath}/head/employee/form" class="btn btn-primary float-end pribtn newEmp">등록</a>
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
											<!-- <th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class=""><input id="checkAll" type="checkbox" class="form-check-input"></a>
											</th> -->
											<th class="right" data-sortable="" style="width: 8%;">
												<a href="#" class="dataTable"></a>
											</th>
											<th class="left" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">이름</a>
											</th>
											<th class="left" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">이메일 주소</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">전화번호</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">부서</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">직급</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">입사일</a>
											</th>
										</tr>
									</thead>
									<tbody id="listBody">
										<c:choose>
											<c:when test="${not empty pagingVO.dataList}">
												<c:forEach items="${pagingVO.dataList }" var="datalist">
													<tr>
														<td></td>
													</tr>
												</c:forEach>
											</c:when>
										</c:choose>
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
   <form id="searchForm" action="${cPath}/head/employee">
	   	<input type="hidden" name="selector" value="" />
	   	<input type="hidden" name="page" value="${pagingVO.currentPage }">
	   	<input type="hidden" name="deptSeq" value="">
	   	<input type="hidden" name="clspCode" value="">
	   	<input type="hidden" name="searchWord" value="">
	   	<input type="hidden" name="leaveUseAT" value="">
   </form>
    
    
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
 
//체크박스를 제외한 td클릭시 상세보기 이동
	$('#listBody').on('click', 'td:not(:nth-child(1))', function() {
		let emp = $(this).parent().data('emp');
		location.href = $.getContextPath() + "/head/employee/detail?what="
						+ emp.emp_id;
})

 
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
				$(resp.dataList).each(function(idx, emp) {
					console.log(emp.deptList)
					//$(emp.attachfileList).each(function(idx, att){
					let img = "<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>";
					if(emp.att_fileno != null){
						img = "<img class='myImage' src='data:image/jpeg;base64,"+emp.attachfileList[0].file_img+"'>";
					}
					
						
					//});
					$(emp.deptList).each(function(idx, dept){
					if(dept.dept_nm != null){
						dept_nm = dept.dept_nm
					}else{
						dept_nm = "-";
					}
					let tr = $("<tr>").append(
							 //$('<td class="center">').html('<input id="checkAll" type="checkbox" class="form-check-input">'),
							 //$('<td class="center">').html(img),
							 $('<td class="right">').html(img),
							 $('<td class="left">').html(emp.emp_nm),
							 $('<td class="left">').html(emp.emp_email),
						  	 $('<td class="center" class="left">').html(emp.emp_celno),
						  	 $('<td class="center">').html(dept_nm),
							 $('<td class="center">').html(emp.emp_clsf_code),
							 $('<td class="center">').html(emp.emp_encpn )
						).data("emp", emp).css("cursor", "pointer");
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
	 
	 $('.searchBTN').on('click', function(){
		 
		 $("#searchForm input[name='deptSeq']").val($('.deptSeq').val());
		 $("#searchForm input[name='searchWord']").val($('.empNM').val());
		 $("#searchForm input[name='clspCode']").val($('.clsfCode').val());
		 $("#searchForm input[name='leaveUseAT']").val($('.leave').val());
		 
		 searchForm.submit();
	 })
 
	 
	 $("#selector").on("change", function() {
			$("#searchForm input[name='selector']").val($(this).val());
			searchForm.submit();
		});
	 
	/*  $('.deptSeq').on('change', function(){
		 $("#searchForm input[name='deptSeq']").val($(this).val());
		 searchForm.submit();
	 })
	 
	 $('.empNM').on('keyup', function(){
		 $("#searchForm input[name='searchWord']").val($(this).val());
		 searchForm.submit();
	 })
	 
	 $('.clsfCode').on('change', function(){
		 $("#searchForm input[name='clspCode']").val($(this).val());
		 searchForm.submit();
	 })
	 
	 
	 $('.leave').on("change", function(){
		 $("#searchForm input[name='leaveUseAT']").val($(this).val());
		 searchForm.submit();
	 }) */
	 
	 
	 
	 let reset = $(".resetBtn");
	//리셋 폼
     //리셋
	$(".resetBtn").on("click",function(){
		 $('.deptSeq').val("");
   		 $('.empNM').val("");
		 $('.clsfCode').val("");
		 $('.leave').val("");
		 
		 $("#searchForm input[name='deptSeq']").val("");
		 $("#searchForm input[name='searchWord']").val("");
		 $("#searchForm input[name='clspCode']").val("");
		 $("#searchForm input[name='leaveUseAT']").val("");
		 
	 	 searchForm.submit();
     })
	
	 
 
 </script>