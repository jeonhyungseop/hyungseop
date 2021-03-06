<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 6. 15. 이진수          구축
*
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<link rel="stylesheet" href="${cPath}/resourcesassets/css/bootstrap.css">
<style>
	.dataTable-top > div:first-child{
		float : left;
	}
	.modal-header{
		border-bottom: 0px;
	}
	
	.modal-footer{
		border-top: 0px;
	}
	.myImage{
		width: 35px;
	} 
	
	/*레이아웃 css*/
	.card-header .row div, .card-header .row h4,  .card-header .row ol li, .card-header .row ol {
		margin : 0;
		padding : 0;
	}
	.card-header .row{
		display: flex;
		justify-content: space-between;
		margin : 0 10px;
	}
	
	.card-header .rowLeft, .card-header .rowRight  {
		width : 50%;
	}
	.card-header .rowRight ol {
		justify-content: flex-end;
	}
	
	.resetBtn {
		background-color: #f5ebe7;
		border-color: #876767;
		border-radius: 5px;
		color : #876767;
	}
	.pribtn {
		padding : 0.12rem 0.75rem; 
		background-color: #876767;
		border-color: #876767;
	}
	.btnArea {
		height :30px;
		margin-bottom : 7px;
	}
	.dataTable-table {
		border-top : 1px solid #ddd;
		width: 100%;
	}
	.dataTable-table td {
		height: 48px;
	}
	.dataArea {
 	    height: 550px;
 	    overflow-y: scroll;
 	    overflow-x: hidden;
	}
	#pagingArea {
		height: 40px;
		align-items: center;
	}
	.btn-secondary {
		padding : 0.12rem 0.75rem;
		margin-left: 5px;
	}
	.dataTable-screenSize {
		padding : 0.12rem 0.75rem;
		padding-right: 2rem;
	}
	.dataTable-bottom {
		padding :0;
	}
	.card {
		margin : 0;
	}
	::-webkit-scrollbar { width: 5.2px; } /* 스크롤 바 */
	::-webkit-scrollbar-thumb { background: #ddd; border-radius: 10px; } /* 실질적 스크롤 바 */
</style>
<body>
    <section class="section">
        <!-- card 영역 -->
		<div class="card">
			<!-- card-header 영역 -->
            <div class="card-header">
                <div class="row">
					<div class="rowLeft">
						<h4 class="card-title" style="display: inline-block;">상품 조회</h4>
					</div>
					<div class="rowRight">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">상품 조회</li>
							</ol>
						</nav>
					</div>
				</div>
             </div>
             <!-- card-body 영역 -->
             <div class="card-body">
             	<!-- 검색 영역 -->
                 <form>
					<div class="btnArea">
						<button id="search" type="button"class="btn btn-primary float-end pribtn">검색</button>
						<button id="reset" type="reset" class="resetBtn icon dripicons-clockwise float-end"></button>
					</div>
					<table class="table table-borderd">
						<tbody class="talbeSearchArea">
							<tr>
								<th class="searchTh"  style="width: 10%;">상품 명</th>
								<td colspan="3" style="width: 46.6%;">
									<input id="searchWord" class="form-control" placeholder="Search" type="text" name="searchWord" value="${pagingVO.searchMap.searchWord }">
								</td >
								<th class="searchTh" style="width: 10%;">카테고리</th>
								<td colspan="3" style="width: 20%;">
									<select id="searchCategory" class="form-select" name="searchCategory">
										<option value="">전체</option>
										<c:forEach items="${gccCode.comCodeList}" var="gccCode">
											<option value="${gccCode.com_code }">${gccCode. com_code_nm}</option>										
										</c:forEach>
									</select>
								</td>
							</tr>
							
							<tr>
								<th class="searchTh"  style="width: 10%;">상품 공급 가격</th>
								<td style="width: 19.5%;">
									<input id="minSuply" class="form-control" type="number" name="minSuply" value="${pagingVO.searchMap.minSuply }">
								</td>
								<td class="center" style="width: 1%;">-</td>
								<td style="width: 19.5%;">
									<input id="maxSuply" class="form-control" type="number" name="maxSuply" value="${pagingVO.searchMap.maxSuply }">
								</td>
								<th class="searchTh"  style="width: 10%;">상품 기준 가격</th>
								<td style="width: 19.5%;">
									<input id="minBase" class="form-control" type="number" name="minBase" value="${pagingVO.searchMap.minBase }">
								</td>
								<td class="center" style="width: 1%;">-</td>
								<td style="width: 19.5%;">
									<input id="maxBase" class="form-control" type="number" name="maxBase" value="${pagingVO.searchMap.maxBase }">
								</td>
								
							</tr>        
						</tbody>
					</table>
				</form>
				<div class="dataTable-container">
					<div class="btnArea">
						<a href="#" id="delete" class="btn btn-secondary float-end">삭제</a>
						<a href="#" id="modify" class="btn btn-primary float-end pribtn">수정</a>
						<a href="${cPath }/head/goods/form" class="btn btn-primary float-end pribtn">등록</a>
						<div class="dataTable-dropdown float-end">
							<select id="screenSize" class="dataTable-screenSize form-select">
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
									<th data-sortable="" style="width: 2.339%;">
										<a href="#" class=""><input id="checkAll" type="checkbox" class="form-check-input"></a>
									</th>
									<th data-sortable="" style="width: 3.8215%;">
										<a href="#" class="dataTable">이미지</a>
									</th>
									<th data-sortable="" style="width: 20.8215%;">
										<a href="#" class="dataTable">상품명</a>
									</th>
									<th data-sortable="" style="width: 6.737%;">
										<a href="#" class="dataTable">상품분류</a>
									</th>
									<th data-sortable="" style="width: 6.737%;">
										<a href="#" class="dataTable">상품공급가</a>
									</th>
									<th data-sortable="" style="width: 6.4053%;">
										<a href="#" class="dataTable">상품 기준가격</a>
									</th>
									<th data-sortable="" style="width: 6.339%;">
										<a href="#" class="dataTable">상품 등록일자</a>
									</th>
								</tr>
							</thead>
							<tbody id="listBody">
							<c:choose>
								<c:when test="${not empty pagingVO.dataList }">
									<c:forEach items="${pagingVO.dataList }" var="goods">
										<tr>
					
											<td>${goods.goods_nm }</td>
											<td>${goods.goods_cl_code }</td>
											<td>${goods.goods_suply_pc }</td>
											<td>${goods.goods_basepc }</td>
											<td>${goods.goods_upde }</td>
											<td><input type="checkbox"></td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="7">
											조건에 맞는 게시글이 없음.
										</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>					
				</div>
				<div class="dataTable-bottom">
					<div class="dataTable-info">Showing 1 to <span id="totalPage"></span> of <span id="currentPage"></span> entries</div>
					
				</div>
				<div id="pagingArea" class="d-flex justify-content-center">
					${pagingVO.pagingHTMLBS }
					
				</div>
	
				
             </div>
         </div>
     </section>
     
     <!--Modal default md size -->
	<div class="me-1 mb-1 d-inline-block">
		<!-- Button trigger for default modal -->


		<!--Default size Modal -->
		<div class="modal fade text-left" id="defaultSize" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel18" aria-hidden="true">
			<div
				class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
				role="document">
				<div class="modal-content">
					<div class="modal-body">

						<div aria-labelledby="swal2-title"
							aria-describedby="swal2-content"
							class="swal2-popup swal2-modal swal2-icon-error swal2-show"
							tabindex="-1" role="dialog" aria-live="assertive"
							aria-modal="true" style="display: flex;">
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
								<h2 class="swal2-title" id="swal2-title" style="display: flex;">상품을
									삭제하시겠습니까?</h2>
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
								<div class="swal2-validation-message"
									id="swal2-validation-message"></div>
							</div>
							<div class="swal2-actions">
								<div class="swal2-loader"></div>
								<button type="button" class="swal2-confirm swal2-styled delOK"
									aria-label="" style="display: inline-block;">OK</button>
								<button type="button" class="swal2-deny swal2-styled"
									aria-label="" style="display: none;">No</button>
								<button type="button" class="swal2-cancel swal2-styled"
									aria-label="" style="display: none;">Cancel</button>
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
	
     <form id="searchForm" action="${cPath }/head/goods">
		<input type="hidden" name="page" value="${pagingVO.searchMap.page }"/>
		<input type="hidden" name="screenSize" value="${pagingVO.searchMap.screenSize }" />
		<input type="hidden" name="minSuply" value="${pagingVO.searchMap.minSuply }" />
		<input type="hidden" name="maxSuply" value="${pagingVO.searchMap.maxSuply }" />
		<input type="hidden" name="minBase" value="${pagingVO.searchMap.minBase }" />
		<input type="hidden" name="maxBase" value="${pagingVO.searchMap.maxBase }" />
		<input type="hidden" name="searchWord" value="${pagingVO.searchMap.searchWord }"/>
		<input type="hidden" name="searchCategory" value="${pagingVO.searchMap.searchCategory }"/>
	</form>
	<form id="modiForm" action="${cPath }/head/goods/modify" method="post">
		
	</form>
<script type="text/javascript">
let listBody = $("#listBody");
let currentPage = $("#currentPage");
let locale = navigator.language;
let search = $("#searchForm");
let totalPage = $("#totalPage");
let excelDownBtn = $("#excelDownBtn");
let screenSize = $("#screenSize");
let totalRecode = $(".totalRecode");
let reset = $("#reset");
$("#searchCategory").on("change", function() {
	$("#searchForm input[name='searchCategory']").val($(this).val());
});
$("#search").on("click", function() {
	$("#searchForm input[name='searchWord']").val($("#searchWord").val());
	$("#searchForm input[name='minSuply']").val($("#minSuply").val());
	$("#searchForm input[name='maxSuply']").val($("#maxSuply").val());
	$("#searchForm input[name='minBase']").val($("#minBase").val());
	$("#searchForm input[name='maxBase']").val($("#maxBase").val());
	searchForm.submit();
});

$("#screenSize").on("change", function() {
	$("#searchForm input[name='screenSize']").val($(this).val());
	searchForm.submit();
});
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

//리셋
reset.on("click",function(){
	search.clearForm();
	searchForm.submit();
})
//페이지 클릭 이벤트
pagingArea = $("#pagingArea").on("click", "a", function(event){
	event.preventDefault();
	let page = $(this).data("page");
	if(page){
		search.find("[name='page']").val(page);
		searchForm.submit();
	}
	return false;
});

let searchForm = $("#searchForm").ajaxForm({
	dataType:"json"
	, beforeSubmit:function(){
		searchForm.find("[name='page']").val("");	
	}, success:function(resp){
		listBody.empty();
		pagingArea.empty();
		currentPage.empty();
		let trTags = [];
		if(resp.dataList){
			$(resp.dataList).each(function(idx, goods){
				let img = $("<td>").html("<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>");
				if(goods.att_fileno != null){
					img = $("<td>").html("<img class='myImage' src='data:image/jpeg;base64,"+goods.attachfileList[0].file_img+"'>");
				}
				let tr = $("<tr>").append(
							$("<td>").html("<input type='checkbox' class='form-check-input' value="+goods.goods_code+">")
							, img
							, $("<td>").html(goods.goods_nm).attr("id",goods.goods_code).addClass("prodcode")
							, $("<td>").html(goods.com_code_nm).attr("id",goods.goods_code).addClass("prodcode")
							, $("<td>").html(goods.goods_suply_pc.toLocaleString(locale)).attr("id",goods.goods_code).addClass("prodcode")
							, $("<td>").html(goods.goods_basepc.toLocaleString(locale)).attr("id",goods.goods_code).addClass("prodcode")
							, $("<td>").html(goods.goods_upde).attr("id",goods.goods_code).addClass("prodcode")
							
						).data("goods", goods).css("cursor", "pointer").attr("id",goods.goods_code);
				trTags.push(tr);
			});
		}else{
			trTags.push( 
				$("<tr>").html(
					$("<td>").attr("colspan", "8")		
				)
			);
		}
		listBody.html(trTags);
		pagingArea.html(resp.pagingHTMLBS);
		currentPage.html(resp.currentPage);
		totalPage.html(resp.totalPage);
		$("#checkAll").prop("checked", false);
	}, error:function(xhr, resp, error){
		console.log(xhr);
	}
});
searchForm.submit();

$("#listBody").on("click",".prodcode", function() {
	location.href="${cPath}/head/goods/detail?goodsCode="+$(this).attr("id");
});

$("#checkAll").on("click", function() {
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
		}else{
			checked = true;
		}
	});
	if(checked){
		$("#checkAll").prop("checked", false);
	}else{
		$("#checkAll").prop("checked", true);
	}
});

$("#delete").on("click", function() {
	
	event.preventDefault();
//		$(".deleteprod").remove();
	var codes= [];
	$("#listBody input[type='checkbox']").each(function() {
		if($(this).is(":checked")){
			codes.push($(this).val());
		}
	});
	if(codes.length==0){
		alert("선택된 상품이 없습니다.")
		return false;
	}else{
		$("#defaultSize").modal("show")
	}
	
	$('.delOK').on('click', function(){
		$.ajax({
			url : "${cPath}/head/goods/delete",
			method : "post",
			data : {
// 				"_method" : "delete",
				"goods_codes" : codes
//					, "head_code" : "HTC01"
			},
			dataType : "text",
			success : function(resp) {
				if(resp == "OK"){
					alert("성공")
					
				}				
				$("#defaultSize").modal("hide")
				searchForm.submit();
			},
			error : function(xhr, error, msg) {
				console.log(xhr);
				console.log(error);
				console.log(msg);
//					alert("상태 : " + xhr.status);
			}
		});
		
	})
});

$("#modify").on("click",function(event){
	event.preventDefault();
	$(".modifyprod").remove();
	var goMod = false;
	$("#listBody input[type='checkbox']").each(function() {
		if($(this).is(":checked")){
			$("#modiForm").append("<input type='hidden' class='modifyprod' name='goods_code' value='"+$(this).val()+"'/>");
			goMod = true;
		}
	});
	if(goMod){
		$("#modiForm").submit();
	}else{
		alert("수정할 상품을 선택해주세요.")
	}
});


</script>
	<c:if test="${not empty success}">
	 	<script type="text/javascript">
			alert(${success}+" 개의 상품이 수정 되었습니다.");
		</script>
	</c:if>
</body>