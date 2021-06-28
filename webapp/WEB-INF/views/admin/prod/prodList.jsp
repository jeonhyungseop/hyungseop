<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 5. 25. 진예은          상품 조회
* 2021. 5. 26. 진예은          상품 삭제
* 2021. 6. 03. 진예은          total page 오류수정
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
							<h4>상품조회</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">상품조회</li>
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
								<button type="reset" class="resetBtn icon dripicons-clockwise float-end resetBtn"></button>
							</div>
							<table class="table table-borderd">
								<tbody class="talbeSearchArea">
									<tr>
										<th class="searchTh"  style="width: 10%;">상품명</th>
										<td style="width: 23.3%;">
											<input  class="form-control searchWord" placeholder="Search..." type="text">
										</td>
									</tr>        
								</tbody>
							</table>
						</form>
						<!-- 조회 영역 -->
						<div class="dataTable-container">
							<div class="btnArea">
								<a href="${cPath}/admin/prod/form" id="delete" class="btn btn-secondary float-end delbtn" data-bs-toggle="modal" data-bs-target="#defaultSize">삭제</a>
								<a href="${cPath}/admin/prod/form" class="btn btn-primary float-end pribtn regibtn">등록</a>
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
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class=""><input id="checkAll" type="checkbox" class="form-check-input"></a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">상품명</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">개월 수</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">사용자 제한</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">가격</a>
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
    
    <form id="searchForm" action="${cPath}/admin/prod">
		<input type="hidden" name="page" value="${pagingVO.currentPage }"/>
		<input class="dataTable-input" name="searchWord" placeholder="Search..." type="hidden" value="${pagingVO.searchMap.searchWord }">
		<input type="hidden" name="selector" value="" />
	</form>
    
    
    
    <!--Modal default md size -->
    <div class="me-1 mb-1 d-inline-block">
        <!-- Button trigger for default modal -->


        <!--Default size Modal -->
        <div class="modal fade text-left" id="defaultSize" tabindex="-1"
            role="dialog" aria-labelledby="myModalLabel18" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                role="document">
                <div class="modal-content">
                    <div class="modal-body">
                       
                       <div aria-labelledby="swal2-title" aria-describedby="swal2-content"
	class="swal2-popup swal2-modal swal2-icon-error swal2-show"
	tabindex="-1" role="dialog" aria-live="assertive" aria-modal="true"
	style="display: flex;">
	<div class="swal2-header">
		<ul class="swal2-progress-steps" style="display: none;"></ul>
		<div class="swal2-icon swal2-error swal2-icon-show"
			style="display: flex;">
			<span class="swal2-x-mark"> <span
				class="swal2-x-mark-line-left"></span> <span
				class="swal2-x-mark-line-right"></span>
			</span>
		</div>
		<div class="swal2-icon swal2-question" style="display: none;"></div>
		<div class="swal2-icon swal2-warning" style="display: none;"></div>
		<div class="swal2-icon swal2-info" style="display: none;"></div>
		<div class="swal2-icon swal2-success" style="display: none;"></div>
		<img class="swal2-image" style="display: none;">
		<h2 class="swal2-title" id="swal2-title" style="display: flex;">상품을 삭제하시겠습니까?</h2>
		<button type="button" class="swal2-close"
			aria-label="Close this dialog" style="display: none;">×</button>
	</div>
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
		<button type="button" class="swal2-confirm swal2-styled delOK" aria-label=""
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
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
<script>
	$(function() {
		$('.cardHidden').hide();
		
		 
		
	})

	$('.fa-th-large').on('click', function() {
		$('.hideOption').hide();
		$('.cardHidden').show();

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
	

	//체크박스를 제외한 td클릭시 상세보기 이동
	$('#listBody').on(
			'click',
			'td:not(:nth-child(1))',
			function() {

				let prod = $(this).parent().data('prod');
				location.href = $.getContextPath() + "/admin/prod/detail?what="
						+ prod.syspay_code;
			})

	//삭제버튼 클릭할 경우
	$('.delbtn').on('click', function() {
		event.preventDefault();
		var Codes = [];

		$("input[class=form-check-input]:checked").each(function() {
			let prod = $(this).parents('tr').find('.hiddenCode').val();
			Codes.push(prod);

		})
		
		console.log(Codes);
		console.log(Codes.length)
		
		$('.delOK').on('click', function(){
			
			$.ajax({
				url : "${cPath}/admin/prod/delete",
				method : "post",
				data : {
					"_method" : "DELETE",
					"sysCodes" : Codes
				},
				dataType : "json",
				success : function(resp) {
					alert("성공")
					location.href="${cPath}/admin/prod";
				},
				error : function(xhr, error, msg) {
					console.log(xhr);
					console.log(error);
					console.log(msg);
				}
			});
			
		})

	})

/* 	페이징처리, 검색 */
	let locale = navigator.language;
	 let money = $('.money').text().trim();
	 let changeMoney = Number(money).toLocaleString(locale);
	
	 $(".money").text(changeMoney);
	
	let currentPage = $("#currentPage");
	let totalPage = $("#totalPage");
	let pagingArea = $('#pagingArea').on('click', "a", function(event) {
		event.preventDefault();
		let page = $(this).data("page");
		if (page) {
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	});
	

	let listBody = $('#listBody');

	let searchForm = $('#searchForm')
			.on('keyup', ":input[name]", function() {
				searchForm.submit();
			})
			.ajaxForm(
					{
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
								$(resp.dataList)
										.each(
												function(idx, prod) {
													let tr = $("<tr>")
															.append(
																	$(
																			'<td class="tdalign center">')
																			.html(
																					'<input type="checkbox" class="form-check-input"><input class="hiddenCode" type="hidden" value="'+prod.syspay_code+'">'),
																	$(
																			'<td class="clicktd center">')
																			.html(
																					prod.syspay_nm),
																	$(
																			'<td class="clicktd right">')
																			.html(
																					prod.syspay_month),
																	$(
																			'<td class="clicktd right">')
																			.html(
																					prod.syspay_user_num),
																	$(
																			'<td class="clicktd right money">')
																			.html(
																					Number(prod.syspay_pc).toLocaleString(locale)	
																			))
															.data("prod", prod)
															.css("cursor",
																	"pointer");
													trTags.push(tr);
												});
							} else {
								trTags.push($('<tr>').html(
										$("<td>").attr("colspan", "4")));
							}
							listBody.html(trTags);
							pagingArea.html(resp.pagingHTMLBS);
							currentPage.html(resp.currentPage);
							totalPage.html(resp.totalPage);

						},
						error : function(xhr, resp, error) {
							console.log(xhr);
						}
					});

	searchForm.submit();

	$('.fa-th-list').on('click', function() {
		$('.cardHidden').hide();
		$('.hideOption').show();

	})
	
	$("#selector").on("change", function() {
		$("#searchForm input[name='selector']").val($(this).val());
		searchForm.submit();
	});
	
	 $('.searchBTN').on('click', function(){
		 $("#searchForm input[name='selector']").val($('#selector').val());	
		 $("#searchForm input[name='searchWord']").val($('.searchWord').val());
		 searchForm.submit();
	 }) 
	
 	$(".resetBtn").on("click",function(){
		 $('#selector').val("");
   		 $('.searchWord').val("");
		 
		 $("#searchForm input[name='selector']").val("");	
		 $("#searchForm input[name='searchWord']").val("");
		 
	 	 searchForm.submit();
     })
	
	
	
	
	
	
	

	$('#pagingArea').on('click', "a", function(event) {
		event.preventDefault();
		let page = $(this).data("page");
		if (page) {
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	});
</script>