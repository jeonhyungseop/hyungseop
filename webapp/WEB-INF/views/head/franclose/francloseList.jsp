<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 6. 08. 진유리		  폐가맹점 조회, 검색, UI
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">    
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<style>
.dataArea {
    height: 550px;
}
.dataTable-table th{
	text-align: center;
}
.dataTable-table th:nth-child(2){
	text-align: left;
}
.dataTable-table td {
    height: 10px;
}
.date{
	width : 160px;
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
							<h4>폐가맹점 조회</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath}/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">폐가맹점 조회</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>	
				<!-- card-header 끝 -->
				<!-- card-body 영역 -->
				<div class="card-body">
					<!-- 검색 영역 -->
					<form id="Form">
						<div class="btnArea">
							<button type="submit"class="btn btn-primary float-end pribtn searchSubmit">검색</button>
							<button type="reset" class="resetBtn icon dripicons-clockwise float-end"></button>
						</div>
						<table class="table table-borderd">
							<tbody class="talbeSearchArea">
								<tr>
									<th class="searchTh"  style="width: 10%;">가맹점상호명</th>
									<td style="width: 15%;">
										<input class="form-control" placeholder="Search" type="text" id="searchComnm" name="searchComnm" value="${pagingVO.searchMap.searchComnm}" onKeyup="fn_search(this)"/>
									</td>
									<th class="searchTh"  style="width: 10%;">폐업일자</th>
									<td style="width: 23.3%;">
											<input type="date" id="startDate" name="startDate" class="form-control date" value="${pagingVO.searchMap.startDate}" onchange="fn_search(this)"/>
											-
											<input type="date" id="endDate" name="endDate" class="form-control date" value="${pagingVO.searchMap.endDate}" onchange="fn_search(this)"/>
										</td>
									<th class="searchTh"  style="width: 10%;">지역</th>
									<td style="width: 15%;">
											<select name="searchArea" id="searchArea" class="form-select" onchange="fn_search(this)">								
												<option value="" <c:if test="${pagingVO.searchMap.searchArea eq ''}">selected</c:if>>선택</option>
												<c:forEach items="${FranArea}" var="area">
													<option value="${area.value}" <c:if test="${pagingVO.searchMap.searchArea eq area.key}">selected</c:if>>${area.key}</option>
												</c:forEach>
											</select>
										</td>
								</tr>        
							</tbody>
						</table>
					</form>
					<!-- 조회 영역 -->
					<div class="dataTable-container">
						<div class="btnArea">
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
										<th data-sortable="" style="width: 20%;">
											<a href="#" class="dataTable">번호</a>
										</th>
										<th data-sortable="" style="width: 20%;">
											<a href="#" class="dataTable">가맹점 상호명</a>
										</th>
										<th data-sortable="" style="width: 20%;">
											<a href="#" class="dataTable">지역</a>
										</th>
										<th data-sortable="" style="width: 20%;">
											<a href="#" class="dataTable">주소</a>
										</th>
										<th data-sortable="" style="width: 20%;">
											<a href="#" class="dataTable">폐점일자</a>
										</th>
									</tr>
								</thead>
								<tbody id="listBody">
									<c:choose>
											<c:when test="${not empty pagingVO.dataList }">
												<c:forEach items="${pagingVO.dataList}" var="fran">
													<tr>
														<td class="center">${fran.rnum}</td>
														<td class="left">${fran.fran_comnm}</td>
														<td class="center">${fran.fran_area}</td>
														<td class="left">${fran.fran_baadd} ${fran.fran_deadd}</td>
														<td class="center">
															${fn:substring(fran.fran_clsbizde,0,4)}-${fn:substring(fran.fran_clsbizde,4,6)}-${fn:substring(fran.fran_clsbizde,6,8)}
														</td>
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="7">조건에 맞는 가맹점이 없습니다.</td>
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
    
    <form id="searchForm" action="${cPath}/head/franclose" method="post">
		<input type="hidden" name="page" /> 
		<input type="hidden" name="selector" value=""/>
		<input type="hidden" name="searchComnm" value="${pagingVO.searchMap.searchComnm}"/>
		<input type="hidden" name="startDate" value="${pagingVO.searchMap.startDate}"/>
		<input type="hidden" name="endDate" value="${pagingVO.searchMap.endDate}"/>
		<input type="hidden" name="searchArea" value="${pagingVO.searchMap.searchArea}"/>
	</form>
 <script type="text/javascript">
	 let pagingArea = $('#pagingArea').on('click', "a", function(event) {
			event.preventDefault();
			let page = $(this).data("page");
			if (page) {
				searchForm.find("[name='page']").val(page);
				searchForm.submit();
			}
			return false;
		});
	
	//검색
		function fn_search(obj){
			let name = obj.getAttribute('name');
			searchForm.find("input[name="+name+"]").val(obj.value);
		};
		
		//리셋 폼
	    $.fn.clearForm = function () {
		  return this.each(function () {
		    var type = this.type,
		      tag = this.tagName.toLowerCase();
		    if (tag === 'form') {
		      return $(':input', this).clearForm();
		    }
		    if (
		      type === 'text' ||
		      type === 'password' ||
		      type === 'hidden' ||
		      tag === 'textarea'
		    ) {
		      this.value = '';
		    } else if (type === 'checkbox' || type === 'radio') {
		      this.checked = false;
		    } else if (tag === 'select') {
		      this.selectedIndex = -1;
		    }
		  });
		};
		
		$(".searchSubmit").on("click", function(){
			event.preventDefault();
			searchForm.submit();
		});
		
	 let listBody = $('#listBody')
	 let currentPage = $("#currentPage");
	 let totalPage = $("#totalPage");
	 let selector = $("#selector").val();
	 let searchForm = $("#searchForm").ajaxForm({
				dataType : "json",
				beforeSubmit : function() {
					searchForm.find("[name='page']").val("");
				},
				success : function(resp) {
					listBody.empty();
					pagingArea.empty();
					currentPage.empty();
					let trTags = [];
					if (resp.dataList) {
						$(resp.dataList).each(function(idx, fran) {
							let tr = $("<tr>").append(
									 $('<td>').attr("class", "center").html(fran.rnum),
									 $('<td>').attr("class", "left").html(fran.fran_comnm),
									 $('<td>').attr("class", "center").html(fran.fran_area),
									 $('<td>').attr("class", "left").html(fran.fran_baadd + " " +fran.fran_deadd),
									 $('<td>').attr("class", "center").html(fran.fran_clsbizde.substring(0,4)+"-"+fran.fran_clsbizde.substring(4,6)+"-"+fran.fran_clsbizde.substring(6,8))
								).data("fran", fran).css("cursor", "pointer");
							trTags.push(tr);
						});
					}else{
						trTags.push( 
								$("<tr>").html(
									$("<td>").attr("colspan", "7")		
								)
							);
						}
					listBody.html(trTags);
					pagingArea.html(resp.pagingHTMLBS);
					currentPage.html(resp.currentPage);
					if(resp.totalPage==0){
						totalPage.html(1);
					}else{
						totalPage.html(resp.totalPage);
					}
				},
				error : function(xhr, resp, error) {
					console.log(xhr);
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

		
		 /* 검색 */
		$("#selector").on("change", function() {
			$("#searchForm input[name='selector']").val($(this).val());
			searchForm.submit();
		});
		
		//상세페이지로 이동
		$('#listBody').on('click', 'tr' ,function(){
			let manage = $(this).data('fran');
			location.href = "${cPath}/head/franmanage/detail?what="+manage.fran_code;
		});
		
		$(".resetBtn").on("click", function(){
			searchForm.clearForm();
			searchForm.submit();
		})
 </script> 