<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 5. 27. 진예은          가맹본부 조회, 가맹본부 상세조회
* 2021. 6. 03. 진예은          totalPage 오류수정
* 2021. 6. 8   진예은          UI수정
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
</style>
<div id="app">
    	<section class="section">
    		<!-- card 영역 -->
    		<div class="card">
    			<!-- card-header 영역 -->
				<div class="card-header">
					<div class="row">
						<div class="rowLeft">
							<h4>가맹본부 조회</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">가맹본부조회</li>
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
								<button type="reset" class="resetBtn icon dripicons-clockwise float-end resetBtn" ></button>
							</div>
							<table class="table table-borderd">
								<tbody class="talbeSearchArea">
									<tr>
										<th class="searchTh"  style="width: 10%;">가맹본부명</th>
										<td style="width: 10%;">
											<input type="text" name="searchWord" id="searchWord" class="form-control inputText">
										</td>
										<th class="searchTh"  style="width: 10%;">가입일자</th>
										<td style="width: 25%;">
										<input type="date" id="startDate" name="startDate" class="form-control date">
										-
										<input type="date" id="endDate" name="endDate" class="form-control date">
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
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">가맹본부명</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">대표자명</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">전화번호</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">주소</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">이메일</a>
											</th>
											<th class="center" data-sortable="" style="width: 10%;">
												<a href="#" class="dataTable">가입일자</a>
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
    
    	<form id="searchForm" action="${cPath}/admin/headmanage">
			<input type="hidden" name="page" value="${pagingVO.currentPage }"/>
			<input type="hidden" name="selector" value="" />
			<input type="hidden" name="searchWord">
			<input type="hidden" name="startDate">
			<input type="hidden" name="endDate">
			<%-- <input class="dataTable-input" name="searchWord"
				placeholder="Search..." type="text"
				value="${pagingVO.searchMap.searchWord }"> --%>
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

	 let listBody = $('#listBody')
	 let totalPage = $("#totalPage");
	 let currentPage = $("#currentPage");
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
						$(resp.dataList).each(function(idx, head) {
							let tr = $("<tr>").append(
									 $('<td class="left">').html(head.head_comnm),
								  	 $('<td class="center">').html(head.head_nm),
								  	 $('<td class="center">').html(head.head_telno),
									 $('<td>').html(head.head_baadd),
									 $('<td class="left">').html(head.head_email),
									 $('<td class="center">').html(head.head_srbde)
								).data("head", head).css("cursor", "pointer");
							trTags.push(tr);
						});
					} else {
						trTags.push($('<tr>').html(
								$("<td>").attr("colspan", "5")
								)
							);
						}
					listBody.html(trTags);
					totalPage.html(resp.totalPage);
					currentPage.html(resp.currentPage);
					pagingArea.html(resp.pagingHTMLBS);
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

		
		 
		 $('.searchBTN').on('click', function(){
			 $("#searchForm input[name='selector']").val($('#selector').val());	
			 $("#searchForm input[name='searchWord']").val($('#searchWord').val());
			 $("#searchForm input[name='startDate']").val($('#startDate').val());
			 $("#searchForm input[name='endDate']").val($('#endDate').val());
			 searchForm.submit();
		 }) 
		 
		 
		 $("#selector").on("change", function() {
			$("#searchForm input[name='selector']").val($(this).val());
			searchForm.submit();
		});
		
		//상세페이지로 이동
		$('#listBody').on('click', 'tr' ,function(){
			let manage = $(this).data('head');
			location.href = $.getContextPath() + "/admin/headmanage/detail?what="+manage.head_code;
		})
		
	$(".resetBtn").on("click",function(){
		 $('#selector').val("");
   		 $('#searchWord').val("");
		 $('#startDate').val("");
		 $('#endDate').val("");
		 
		 $("#searchForm input[name='selector']").val("");	
		 $("#searchForm input[name='searchWord']").val("");
		 $("#searchForm input[name='startDate']").val("");
		 $("#searchForm input[name='endDate']").val("");
		 
	 	 searchForm.submit();
     })
	
 </script> 