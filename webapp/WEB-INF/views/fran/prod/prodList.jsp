    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 04. 이진수          최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css">
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
		width: 40px;
	}
	#headPagingArea{
		height: 40px;
    	align-items: center;
	}
	.card-header{
		padding-bottom: 5px;
	}
	.dataArea{
		height: 250px;
	}
	.orderCard{
		margin-bottom: 10px;
	}
	#totalSum{
	    padding: 0.18rem 0.75rem;
	    background-color: #876767;
	    border-color: #876767;
        color: #fff;
        margin-left: 5px;
        border-radius: .25rem;
	}
	#headListBody tr:active {
		background-color: #dacdc6;
		color : #fff;
	}
	
/* 	#orderSheet{ */
/* 		overflow: scroll; */
/* 	} */
</style>
<body>
	<div id="app">
		<div id="sidebar" class="active"></div>
			
			<!-- 발주 목록 -->
			<div class="row">
				<div class="col-12">
					<div class="card orderCard">
						<!-- card-header 영역 -->
						<div class="card-header">
							<div class="row">
								<div class="rowLeft">
									<h4>발주 목록</h4>
								</div>
								<div class="rowRight">
									<nav aria-label="breadcrumb" >
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="${cPath }/fran/main">Dashboard</a></li>
											<li class="breadcrumb-item active" aria-current="page">발주서 등록</li>
										</ol>
									</nav>
								</div>
							</div>
						</div>	
						<!-- card-header 끝 -->
					
					
                         <div class="card-content">
                             <div class="card-body" style="padding-top:0px;">
								<div class="btnArea">
<!-- 									<a href="#" id="delete" class="btn btn-secondary float-end" data-bs-toggle="modal" data-bs-target="#defaultSize">삭제</a> -->
									<button id="insertBtn" class="btn btn-primary float-end pribtn" data-bs-toggle="modal" data-bs-target="#defaultSize">발주</button>
									<div id="totalSum" class="float-end" >합계 : 0</div>
<!-- 									<div class="dataTable-dropdown float-end"> -->
<!-- 										<select id="selector" class="dataTable-selector form-select"> -->
<!-- 											<option value="5">5</option> -->
<!-- 											<option value="10" selected="">10</option> -->
<!-- 											<option value="15">15</option> -->
<!-- 											<option value="20">20</option> -->
<!-- 											<option value="25">25</option> -->
<!-- 										</select> -->
<!-- 									</div> -->
								</div>
                                 
                                 <div class="dataArea">
									
									<table class="table table-hover dataTable-table" >
									<thead>
										<tr>
											<th style="width: 25%;" class="left">
												제품 명
											</th>
											<th style="width: 17%;" class="right">
												최대  주문 수량
											</th>
											<th style="width: 17%;" class="right">
												제품공급가(원)
											</th>
											<th style="width: 17%;" class="right">
												주문 수량
											</th>
											<th style="width: 17%;" class="right">
												합계 공급가(원)
											</th>
											<th style="width: 5%;" class="center">
												삭제
											</th>
										</tr>
									</thead>
									<tbody id="orderBody">
									<!-- 데이터 넣는 영역  -->
									<c:forEach items="${orderListVO.orderListVO }" var="order">
										<tr id="order${order.headInvenVO.prod_code }">
											<input name="prod_code" type="hidden" value="${order.headInvenVO.prod_code }"/>
											<input name="prod_suply_pc" type="hidden" value="${order.headInvenVO.prod_suply_pc }"/>
											<td class="prodcode left">${order.headInvenVO.prod_nm }</td>
											<td class="prodcode right">${order.headInvenVO.head_maxcord_qy }</td>
											<td name="suply" class="prodcode right">${order.headInvenVO.prod_suply_pc }</td>
											<td class="right">
											<input name="order_qy" type="number" class="form-control right order_qy">
											</td>
											<td class="right">
											<span name="sumSuply" class="sumSuply">${order.headInvenVO.prod_suply_pc * order.order_qy}</span>
											</td>
											<td class="center">
											<button class="orderListBtn btn btn-secondary">X</button></td>
										</tr>
									</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- data-Area 끝 -->
                                 
                             </div>
                         </div>
<!--                          <div class="card-footer d-flex justify-content-between"> -->
<!--                              <span>Card Footer</span> -->
<!--                          </div> -->
                     </div>
				</div>
			</div>
			
			
			<div class="row">
<!-- 			가맹본부 제품 -->
				<div class="col-md-6 col-12">
					<section class="section">
						<div class="card">
							<div class="card-header">
								<h4 class="card-title" style="display:inline-block;">가맹본부 제품 조회</h4>
		<!-- 						<a href="#" id="delete" class="btn btn-secondary float-end" data-bs-toggle="modal" data-bs-target="#defaultSize">삭제</a> -->
		<!-- 						<a href="#" id="modify" class="btn btn-primary float-end pribtn">수정</a> -->
		<%-- 						<a href="${cPath }/fran/prod/form" class="btn btn-primary float-end pribtn">등록</a> --%>
<!-- 								<div class="dataTable-dropdown float-end"> -->
<!-- 									<select id="headSelector" class="dataTable-headSelector form-select"> -->
<!-- 										<option value="5">5</option> -->
<!-- 										<option value="10" selected="">10</option> -->
<!-- 										<option value="15">15</option> -->
<!-- 										<option value="20">20</option> -->
<!-- 										<option value="25">25</option> -->
<!-- 									</select> -->
<!-- 								</div> -->
							</div>
							<div class="card-body">
								<div
									class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
									<div class="dataTable-top">
										<table class="table table-borderd" >
										<tbody><tr>
											<th class="searchTh">제품 명</th>
											<td>
												<input id="headSearch" class="form-control" placeholder="Search..."
										type="text" name="searchWord" value="${pagingVO.searchMap.searchWord }">
											</td>
										</tr>        
									</tbody></table>
<!-- 										<div class="dataTable-search"> -->
<%-- 											<input id="headSearch" class="dataTable-input" placeholder="Search..." type="text" name="searchWord" value="${headPagingVO.searchMap.searchWord }"> --%>
<!-- 										</div> -->
									</div>
									<div class="dataTable-container">
										<table class="table table-hover dataTable-table" >
											<thead>
												<tr>
													<th style="width: 15.8215%;">
														이미지
													</th>
													<th style="width: 45.8215%;" class="left">
														제품명
													</th>
													<th style="width: 17.8179%;" class="right">
														최대주문수량
													</th>
													<th style="width: 17.339%;" class="right">
														제품공급가(원)
													</th>
												</tr>
											</thead>
											<tbody id="headListBody">
											<c:choose>
												<c:when test="${not empty headPagingVO.dataList }">
													<c:forEach items="${headPagingVO.dataList }" var="prod">
														<tr>
															<td>${prod.prod_nm }</td>
<%-- 															<td>${prod.head_nowinven }</td> --%>
<%-- 															<td>${prod.head_proinven }</td> --%>
															<td>${prod.head_maxcord_qy }</td>
<%-- 															<td>${prod.prod_puchas_pc }</td> --%>
															<td>${prod.prod_suply_pc }</td>
<!-- 															<td><input type="checkbox"></td> -->
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
									<div class="dataTable-bottom">
										<div class="dataTable-info">Showing ${headPagingVO.startPage } to <span id="headTotalPage"></span> of <span id="headCurrentPage"></span> entries</div>
										
									</div>
									<div id="headPagingArea" class="d-flex justify-content-center">
										${headPagingVO.pagingHTMLBS }
										
									</div>
								</div>
							</div>
						</div>
					</section>
				</div>
				
				
				
<!-- 				 가맹점 재고 -->
				<div class="col-md-6 col-12">
				<section class="section">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title" style="display:inline-block;">현재 재고 조회</h4>
<!--                             <a href="#" id="delete" class="btn btn-secondary float-end" data-bs-toggle="modal" data-bs-target="#defaultSize">삭제</a> -->
<!-- 							<a href="#" id="modify" class="btn btn-primary float-end pribtn">수정</a> -->
<!--                             <div class="dataTable-dropdown float-end"> -->
<!-- 								<select id="selector" class="dataTable-selector form-select"> -->
<!-- 									<option value="5">5</option> -->
<!-- 									<option value="10" selected="">10</option> -->
<!-- 									<option value="15">15</option> -->
<!-- 									<option value="20">20</option> -->
<!-- 									<option value="25">25</option> -->
<!-- 								</select> -->
<!-- 							</div> -->
                        </div>
					<div class="card-body">
						<div
							class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
							<div class="dataTable-top">
	                           		<table class="table table-borderd">
										<tbody><tr>
											<th class="searchTh">제품 명</th>
											<td>
												<input id="searchWord" class="form-control" placeholder="Search..."
										type="text" name="searchWord" value="${pagingVO.searchMap.searchWord }">
											</td>
											<th class="searchTh">재고량</th>
											<td>
												<select id="searchMax" class="form-select" name="searchMax">
													<option value="">전체</option>
													<option value="maxDown">미달</option>
													<option value="maxUp">이상</option>
												</select>
											</td>
										</tr>        
									</tbody></table>
	                           </div>
							<div class="dataTable-container">
								<table class="table table-hover dataTable-table" id="table1">
									<thead>
										<tr>
											<th style="width: 10.8215%;">
												이미지
											</th>
											<th style="width: 30.8215%;">
												제품명
											</th>
											<th style="width: 10.737%;" class="right">
												현재재고
											</th>
											<th style="width: 10.737%;" class="right">
												적정재고
											</th>
											<th style="width: 10.8179%;" class="right">
												제품 단위
											</th>
											
										</tr>
									</thead>
									<tbody id="listBody">
									<c:choose>
										<c:when test="${not empty pagingVO.dataList }">
											<c:forEach items="${pagingVO.dataList }" var="inven">
												<tr>
													<td>${inven.prod_nm }</td>
													<td>${inven.fran_nowinven }</td>
													<td>${inven.fran_proinven }</td>
													<td>${inven.prod_suply_pc }</td>
													<td>${inven.com_code_nm }</td>
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
							<div class="dataTable-bottom">
								<div class="dataTable-info">Showing 1 to <span id="totalPage"></span> of <span id="currentPage"></span> entries</div>
								
							</div>
							<div id="pagingArea" class="d-flex justify-content-center">
								${pagingVO.pagingHTMLBS }
								
							</div>
						</div>
					</div>
                    </div>
                </section>
				</div>
			
			</div>











	<form id="headSearchForm" action="${cPath }/fran/prod">
		<input type="hidden" name="page" value="${headPagingVO.currentPage }"/>
		<input type="hidden" name="headSelector" value="" />
		<input type="hidden" name="searchWord" value="${headPagingVO.searchMap.searchWord }"/>
	</form>
	<form id="searchForm" action="${cPath }/fran/inven">
		<input type="hidden" name="page" value="${pagingVO.currentPage }"/>
		<input type="hidden" name="selector" value="5" />
		<input type="hidden" name="searchMax" value="" />
		<input type="hidden" name="searchWord" value="${pagingVO.searchMap.searchWord }"/>
	</form>
	<form id="orderForm" name="orderListVO" action="${cPath }/fran/prod" method="post">
		
	</form>
<script type="text/javascript">
	


	let locale = navigator.language;
	$("#headSearch").keyup(function() {
		$("#headSearchForm input[name='searchWord']").val($(this).val());
		headSearchForm.submit();
	});
	$("#headSelector").on("change", function() {
		$("#headSearchForm input[name='headSelector']").val($(this).val());
		headSearchForm.submit();
	});
	
	let headPagingArea = $("#headPagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(page){
			headSearchForm.find("[name='page']").val(page);
			headSearchForm.submit();
		}
		return false;
	});
	
	let headListBody = $("#headListBody");
	let headCurrentPage = $("#headCurrentPage");
	let headTotalPage = $("#headTotalPage");
	let headSelector = $("#headSelector").val();
	let headSearchForm = $("#headSearchForm").ajaxForm({
		dataType:"json"
		, beforeSubmit:function(){
			headSearchForm.find("[name='page']").val("");	
		}, success:function(resp){
			headListBody.empty();
			headPagingArea.empty();
			headCurrentPage.empty();
			let trTags = [];
			if(resp.dataList){
// 				<img class="myImage" alt="" src="data:image/jpeg;base64,${attach.file_img }">
				$(resp.dataList).each(function(idx, prod){
					let img = $("<td>").html("<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>").addClass("prodcode");
					if(prod.att_fileno != null){
						img = $("<td>").html("<img class='myImage' src='data:image/jpeg;base64,"+prod.attachfileList[0].file_img+"'>").addClass("prodcode");
					}
					let tr = $("<tr id='"+prod.prod_code+"'>").append(
								img
								, $("<td>").html(prod.prod_nm).addClass("prodcode").addClass("left").attr("name", "prod_nm")
// 								, $("<td>").html(prod.head_nowinven).attr("id",prod.prod_code).addClass("prodcode")
// 								, $("<td>").html(prod.head_proinven).attr("id",prod.prod_code).addClass("prodcode")
								, $("<td>").html(prod.head_maxcord_qy.toLocaleString(locale)).addClass("prodcode").addClass("right").attr("name", "head_maxcord_qy")
// 								, $("<td>").html(prod.prod_puchas_pc).attr("id",prod.prod_code).addClass("prodcode")
								, $("<td>").html(prod.prod_suply_pc.toLocaleString(locale)).addClass("prodcode").addClass("right").attr("name", "prod_suply_pc")
// 								, $("<td>").html(prod.prod_use_at).attr("id",prod.prod_code).addClass("prodcode")
// 								, $("<td>").html("<input type='checkbox' class='form-check-input' value="+prod.prod_code+">")
							).data("prod", prod).css("cursor", "pointer");
					trTags.push(tr);
				});
			}else{
				trTags.push( 
					$("<tr>").html(
						$("<td>").attr("colspan", "8")		
					)
				);
			}
			headListBody.html(trTags);
			headPagingArea.html(resp.pagingHTMLBS);
			headCurrentPage.html(resp.currentPage);
			headTotalPage.html(resp.totalPage);
			$("#headCheckAll").prop("checked", false);
		}, error:function(xhr, resp, error){
			console.log(xhr);
		}
	});
	headSearchForm.submit();
	
	
	$("#headPagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(page){
			
			headSearchForm.find("[name='page']").val(page);
			headSearchForm.submit();
		}
		return false;
	});
	let orderBody = $("#orderBody");
	$("#headListBody").on("click", ".prodcode", function() {
		let prodCode = $(this).parent("tr").attr("id");
		let prodName = $(this).parent("tr").find("[name='prod_nm']").text();
		let maxcord = $(this).parent("tr").find("[name='head_maxcord_qy']").text();
		let suply = $(this).parent("tr").find("[name='prod_suply_pc']").text();
		let searchProdCode = $("#order"+prodCode)
		if(searchProdCode.length > 0){
			let order_qy = $("#order"+prodCode).find("[name='order_qy']").val();
			order_qy = parseInt(order_qy)+1;
			let sum = order_qy * (parseInt(suply.replaceAll(",","")));
			$("#order"+prodCode).find("[name='order_qy']").val(order_qy);
			$("#order"+prodCode).find("[name='sumSuply']").text(sum.toLocaleString(locale));
			totalSum();
			return false;
		}
		
		
		let tr = $("<tr>").append(
				$("<input>").attr("name", "prod_code").prop("type","hidden").val(prodCode)
				, $("<input>").attr("name", "prod_suply_pc").prop("type","hidden").val(suply.replaceAll(",",""))
				, $("<td>").html(prodName).addClass("prodcode").addClass("left")
				, $("<td>").html(maxcord).addClass("prodcode").addClass("right")
				, $("<td>").html(suply).attr("name","suply").addClass("prodcode").addClass("right")
				, $("<td>").html($("<input>").attr("name", "order_qy").prop("type","number").addClass("form-control right order_qy").val(1)).addClass("right")
				, $("<td>").html($("<span>").attr("name","sumSuply").addClass("sumSuply").text(suply)).addClass("right")
				, $("<td>").html($("<button>").addClass("orderListBtn btn btn-secondary").text("X")).addClass("center")
			);
		orderBody.append(tr.attr("id","order"+prodCode));
		totalSum();
	});
	
	$("#orderBody").on("change", ".order_qy", function() {
		let order_qy = $(this).val();
		let suply = $(this).parents("tr").find("[name='suply']").text().replaceAll(",","");
		console.log(order_qy)
		console.log(suply)
		let sum = order_qy * suply
		$(this).parents("tr").find("[name='sumSuply']").text(sum.toLocaleString(locale));
		totalSum();
	})
	
	function totalSum() {
		let totalsum = 0; 
		$("#orderBody tr").each(function(idx, order) {
			totalsum = totalsum + parseInt($(this).find("[name='sumSuply']").text().replaceAll(",",""))
		})
		$("#totalSum").text("합계 : " + totalsum.toLocaleString(locale) + " 원")
	}
	
	$("#orderBody").on("click", ".orderListBtn", function() {
		$(this).parents("tr").remove();
	});
	let orderForm = $("#orderForm");
	$("#insertBtn").on("click", function() {
		if($("#orderBody tr").length == 0 ){
			alert("선택한 상품이 없습니다.")
			return false;
		}
		if (confirm("발주서를 등록 하시겠습니까?") == true){    //확인
			$("#orderBody tr").each(function (idx, order) {
				let prod_code = $(this).find("[name='prod_code']").val();
				let prod_suyly_pc = $(this).find("[name='prod_suply_pc']").val();
		 		let order_qy = $(this).find("[name='order_qy']").val();
		 		$("#orderForm").append($("<input>").attr("name", "orderListVO["+idx+"].prod_code").prop("type","hidden").val(prod_code))
		 		$("#orderForm").append($("<input>").attr("name", "orderListVO["+idx+"].prod_suply_pc").prop("type","hidden").val(prod_suyly_pc))
		 		$("#orderForm").append($("<input>").attr("name", "orderListVO["+idx+"].order_qy").prop("type","hidden").val(order_qy))
			})
		 	$("#orderForm").submit();
		}else{   //취소
		    return false;
		}
	});
// 	$("#headCheckAll").on("click", function() {
// 		console.log($("#headListBody input[type='checkbox']"));
// 		if($(this).is(":checked")){
// 			$("#headListBody input[type='checkbox']").prop("checked", true);
// 		}else{
// 			$("#headListBody input[type='checkbox']").prop("checked", false);
// 		}
// 	});
	
// 	$("#headListBody").on("click", ".form-check-input", function() {
// 		var checked = false;
// 		$("#headListBody input[type='checkbox']").each(function() {
// 			if($(this).is(":checked")){
// 				console.log(checked);
// 			}else{
// 				checked = true;
// 				console.log(checked);
// 			}
// 		});
// 		if(checked){
// 			$("#headCheckAll").prop("checked", false);
// 		}else{
// 			$("#headCheckAll").prop("checked", true);
// 		}
// 	});




// 가맹본부 재고
// let locale = navigator.language;
$("#search").keyup(function() {
	$("#searchForm input[name='searchWord']").val($(this).val());
	searchForm.submit();
});
$("#selector").on("change", function() {
	$("#searchForm input[name='selector']").val($(this).val());
	searchForm.submit();
});
$("#searchMax").on("change", function() {
	$("#searchForm input[name='searchMax']").val($(this).val());
	searchForm.submit();
});
let pagingArea = $("#pagingArea").on("click", "a", function(event){
	event.preventDefault();
	let page = $(this).data("page");
	if(page){
		searchForm.find("[name='page']").val(page);
		searchForm.submit();
	}
	return false;
});

let listBody = $("#listBody");
let currentPage = $("#currentPage");
let totalPage = $("#totalPage");
let selector = $("#selector").val();
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
			$(resp.dataList).each(function(idx, inven){
				let img = $("<td>").html("<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>").addClass("prodcode");
				if(inven.att_fileno != null){
					img = $("<td>").html("<img class='myImage' src='data:image/jpeg;base64,"+inven.attachfileList[0].file_img+"'>").addClass("prodcode");
				}
				let prod_nm = $("<td>").html(inven.prod_nm).addClass("prodcode")
				if(inven.fran_nowinven < inven.fran_proinven){
					prod_nm = $("<td>").html(inven.prod_nm).addClass("prodcode").css({"color": "red", "font-weight": "bold"})
				}
				let tr = $("<tr>").append(
							img
							, prod_nm
							, $("<td>").html(inven.fran_nowinven.toLocaleString(locale)).addClass("prodcode").addClass("right")
							, $("<td>").html(inven.fran_proinven.toLocaleString(locale)).addClass("prodcode").addClass("right")
// 							, $("<td>").html(inven.prod_suply_pc).attr("id",inven.prod_code).addClass("prodcode")
							, $("<td>").html(inven.com_code_nm).addClass("prodcode").addClass("center")
							
						).data("inven", inven);
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

</script>
</body>
