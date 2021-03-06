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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<%-- <link rel="stylesheet" href="${cPath}/resources/assets/css/bootstrap.css"> --%>
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
	.myModalImage{
		width: 150px;
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
 	    height: 620px;
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
	.line{
		background-color : #ddd;
		border : 1px solid #ddd;
	}
	.card-body{
		height: 750px;
	}
	tr{
		cursor: pointer;
	}
	#detailBody{
		border: 1px solid #ddd;
	}
	#detailTbody th{
		width: 30%
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
						<h4 class="card-title" style="display: inline-block;">POS메뉴관리</h4>
					</div>
					<div class="rowRight">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${cPath }/fran/main">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">POS메뉴관리</li>
							</ol>
						</nav>
					</div>
				</div>
             </div>
             <!-- card-body 영역 -->
             <div class="card-body">
				<div class="dataTable-container">
					<div style="display: inline-block; width: 49%;">
					<div class="btnArea">
						<h6 style="display: inline-block;">본부 상품</h6>
						<button id="insertBtn" class="btn btn-primary float-end pribtn">선택 추가</button>
					</div>
						<div class="dataArea">
						<table class="table table-hover dataTable-table" id="table1">
							<thead>
								<tr>
									<th data-sortable="" style="width: 2.339%;">
										<input id="headCheckAll" type="checkbox" class="form-check-input">
									</th>
									<th data-sortable="" style="width: 5.8215%;">
										이미지
									</th>
									<th data-sortable="" style="width: 17.8215%;">
										상품명
									</th>
									<th data-sortable="" style="width: 6.737%;">
										분류
									</th>
									<th class="right" data-sortable="" style="width: 6.737%;">
										공급가
									</th>
									<th class="right" data-sortable="" style="width: 6.4053%;">
										기준가
									</th>
									<th class="center" data-sortable="" style="width: 6.339%;">
										추가
									</th>
								</tr>
							</thead>
							<tbody id="headGoodsListBody">
							<c:choose>
								<c:when test="${not empty headGoodsList }">
									<c:forEach items="${headGoodsList }" var="headGoods">
										<tr id="${headGoods.goods_code }">
											<td>
												<input type="checkbox" class="form-check-input">
											</td>
											<c:choose>
												<c:when test="${headGoods.att_fileno eq null }">
													<td class="detailClick"><img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'></td>
												</c:when>
												<c:otherwise>
													<td class="detailClick"><img class='myImage' src='data:image/jpeg;base64,${headGoods.attachfileList[0].file_img }'></td>
												</c:otherwise>
											</c:choose>
											<td class="detailClick">${headGoods.goods_nm }</td>
											<td class="detailClick">${headGoods.com_code_nm }</td>
											<td class="right detailClick"><fmt:formatNumber value="${headGoods.goods_suply_pc }" pattern="#,###"/></td>
											<td class="right detailClick"><fmt:formatNumber value="${headGoods.goods_basepc }" pattern="#,###"/></td>
											<td class="center"><button class="btn btn-primary pribtn center inBtn">추가</button> </td>
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
				
				
				<div class="line" style="display: inline-block; width: 1%;">
					
				</div>
				
				
				<div style="display: inline-block; width: 49%;">
					<div class="btnArea">
						<h6 style="display: inline-block;">가맹점 상품</h6>
						<button id="deleteBtn" class="btn btn-primary float-end pribtn">선택 제외</button>
					</div>
						<div class="dataArea">
						<table class="table table-hover dataTable-table" id="table1">
							<thead>
								<tr>
									<th data-sortable="" style="width: 2.339%;">
										<input id="franCheckAll" type="checkbox" class="form-check-input">
									</th>
									<th data-sortable="" style="width: 5.8215%;">
										이미지
									</th>
									<th data-sortable="" style="width: 17.8215%;">
										상품명
									</th>
									<th data-sortable="" style="width: 6.737%;">
										분류
									</th>
									<th class="right" data-sortable="" style="width: 6.737%;">
										공급가
									</th>
									<th class="right" data-sortable="" style="width: 6.4053%;">
										기준가
									</th>
									<th class="center" data-sortable="" style="width: 6.339%;">
										제외
									</th>
								</tr>
							</thead>
							<tbody id="franGoodsListBody">
							<c:choose>
								<c:when test="${not empty franGoodsList }">
									<c:forEach items="${franGoodsList }" var="franGoods">
										<tr id="${franGoods.goods_code }">
											<td>
												<input type="checkbox" class="form-check-input">
											</td>
											<c:choose>
												<c:when test="${franGoods.att_fileno eq null }">
													<td class="detailClick"><img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'></td>
												</c:when>
												<c:otherwise>
													<td class="detailClick"><img class='myImage' src='data:image/jpeg;base64,${franGoods.attachfileList[0].file_img }'></td>
												</c:otherwise>
											</c:choose>
											<td class="detailClick">${franGoods.goods_nm }</td>
											<td class="detailClick">${franGoods.com_code_nm }</td>
											<td class="right detailClick"><fmt:formatNumber value="${franGoods.goods_suply_pc }" pattern="#,###"/></td>
											<td class="right detailClick"><fmt:formatNumber value="${franGoods.goods_basepc }" pattern="#,###"/></td>
											<td class="center"><button class="btn btn-primary pribtn center delBtn">제외</button> </td>
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
				
				
				
				
				</div>
             </div>
         </div>
     </section>
     
     
     
<!--Modal default md size -->
	<div class="me-1 mb-1 d-inline-block">
		<!-- Button trigger for default modal -->
		<!--Default size Modal -->
		<div class="modal fade text-left" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel18" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
				<div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLongTitle"></h5>
	                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
	                        <i data-feather="x"></i>
	                    </button>
	                </div>
	                <div class="modal-body">
		                <div class="dataArea">
							<table id="detailBody" class="table table-hover dataTable-table" >
		                		<tbody id="detailTbody">
		                		
		                		</tbody>
		                	</table>
		                </div>	
	                </div>
	                <div class="modal-footer">
	                    
	
	                </div>
	                
	            </div>
			</div>
		</div>
	</div>
<script type="text/javascript">
$("#headCheckAll").on("click", function() {
	console.log($("#listBody input[type='checkbox']"));
	if($(this).is(":checked")){
		$("#headGoodsListBody input[type='checkbox']").prop("checked", true);
	}else{
		$("#headGoodsListBody input[type='checkbox']").prop("checked", false);
	}
});
$("#headGoodsListBody").on("click", ".form-check-input", function() {
	var checked = false;
	$("#headGoodsListBody input[type='checkbox']").each(function() {
		if($(this).is(":checked")){
			console.log(checked);
		}else{
			checked = true;
		}
	});
	if(checked){
		$("#headCheckAll").prop("checked", false);
	}else{
		$("#headCheckAll").prop("checked", true);
	}
});

$("#franCheckAll").on("click", function() {
	console.log($("#listBody input[type='checkbox']"));
	if($(this).is(":checked")){
		$("#franGoodsListBody input[type='checkbox']").prop("checked", true);
	}else{
		$("#franGoodsListBody input[type='checkbox']").prop("checked", false);
	}
});
$("#franGoodsListBody").on("click", ".form-check-input", function() {
	var checked = false;
	$("#franGoodsListBody input[type='checkbox']").each(function() {
		if($(this).is(":checked")){
			console.log(checked);
		}else{
			checked = true;
		}
	});
	if(checked){
		$("#franCheckAll").prop("checked", false);
	}else{
		$("#franCheckAll").prop("checked", true);
	}
});

// 추가
$(".inBtn").on("click", function() {
	let goodsCode = [];
	goodsCode.push($(this).parents("tr").attr("id"));
	insertGoods(goodsCode)
});
$("#insertBtn").on("click", function() {
	let goodsCode = [];
	$("#headGoodsListBody input[type='checkbox']").each(function() {
		if($(this).is(":checked")){
			goodsCode.push($(this).parents("tr").attr("id"));
		}
	});
	insertGoods(goodsCode)
});
$(".modal-footer").on("click", "#modalInsertBtn", function() {
	let goodsCode = [];
	goodsCode.push($(this).val());
	insertGoods(goodsCode);
})	
function insertGoods(goodsCode) {
	$.ajax({
		url : "${cPath}/fran/posmenu",
		method : "post",
		data : {
			"goods_code" : goodsCode
		},
		dataType : "json",
		success : function(resp) {
			alert(resp+"개가 추가되었습니다.")
			location.href = "${cPath}/fran/posmenu"
		},
		error : function(xhr, error, msg) {
			console.log(xhr);
			console.log(error);
			console.log(msg);
		}
	});
}


// 삭제
$(".delBtn").on("click", function() {
	let goodsCode = [];
	goodsCode.push($(this).parents("tr").attr("id"));
	deleteGoods(goodsCode)
});
$("#deleteBtn").on("click", function() {
	let goodsCode = [];
	$("#franGoodsListBody input[type='checkbox']").each(function() {
		if($(this).is(":checked")){
			goodsCode.push($(this).parents("tr").attr("id"));
		}
	});
	deleteGoods(goodsCode)
});
$(".modal-footer").on("click", "#modalDeleteBtn", function() {
	let goodsCode = [];
	goodsCode.push($(this).val());
	deleteGoods(goodsCode);
})	
function deleteGoods(goodsCode) {
	$.ajax({
		url : "${cPath}/fran/posmenu",
		method : "post",
		data : {
			"_method" : "delete",
			"goods_code" : goodsCode
		},
		dataType : "json",
		success : function(resp) {
			alert(resp+"개가 제외되었습니다.")
			location.href = "${cPath}/fran/posmenu"
		},
		error : function(xhr, error, msg) {
			console.log(xhr);
			console.log(error);
			console.log(msg);
		}
	});
}
$(".detailClick").on("click", function() {
	let goods_code = $(this).parents("tr").attr("id");
	let createBtn = $(this).parents("tbody").attr("id")
	console.log(goods_code);
	$("#detailTbody").remove();
	$(".modalBtn").remove();
	$("#closeBtn").remove();
	$.ajax({
		url : "${cPath}/fran/posmenu/detail",
		data : {
			"goods_code" : goods_code
		},
		dataType : "json",
		success : function(goods) {
			let img = $("<td>").html("<img class='myModalImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>");
			if(goods.att_fileno != null){
				img = $("<td>").html("<img class='myModalImage' src='data:image/jpeg;base64,"+goods.attachfileList[0].file_img+"'>");
			}
			$("#exampleModalLongTitle").text(goods.goods_nm)
			let tbody = $("<tbody>").append(
					$("<tr>").append(
						$("<th>").html("이미지")
						, img		
					)
					, $("<tr>").append(
						$("<th>").html("상품 기준 가격")
						, $("<td>").html(goods.goods_basepc)
					)
					, $("<tr>").append(
						$("<th>").html("레시피")
						, $("<td>").html(goods.goods_reci)
					)
					, $("<tr>").append(
						$("<th>").html("분류")
						, $("<td>").html(goods.com_code_nm)
					)
					, $("<tr>").append(
						$("<th>").html("상품 공급가")
						, $("<td>").html(goods.goods_suply_pc)
					)
					, $("<tr>").append(
						$("<th>").html("상품 설명")
						, $("<td>").html(goods.goods_dc)
					)
					, $("<tr>").append(
						$("<th>").html("상품 등록일자")
						, $("<td>").html(goods.goods_upde)
					)
					, $("<tr>").append(
						$("<th>").html("상품 특가여부")
						, $("<td>").html(goods.special_at)
					)
				).attr("id","detailTbody");
		$("#detailBody").html(tbody);
		let modalBtn = '<button id="modalInsertBtn" value="'+goods_code+'" type="button" class="btn btn-primary ml-1 modalBtn" data-bs-dismiss="modal"><i class="bx bx-check d-block d-sm-none"></i><span class="d-none d-sm-block">추가</span></button><button id="closeBtn" type="button" class="btn btn-light-secondary" data-bs-dismiss="modal"><i class="bx bx-x d-block d-sm-none"></i><span class="d-none d-sm-block">닫기</span></button>' 
		if(createBtn == "franGoodsListBody"){
			modalBtn = '<button id="modalDeleteBtn" value="'+goods_code+'" type="button" class="btn btn-primary ml-1 modalBtn" data-bs-dismiss="modal"><i class="bx bx-check d-block d-sm-none"></i><span class="d-none d-sm-block">제외</span></button><button id="closeBtn" type="button" class="btn btn-light-secondary" data-bs-dismiss="modal"><i class="bx bx-x d-block d-sm-none"></i><span class="d-none d-sm-block">닫기</span></button>'
		}
		$(".modal-footer").append(modalBtn);
		$("#myModal").modal("show")
		},
		error : function(xhr, error, msg) {
			console.log(xhr);
			console.log(error);
			console.log(msg);
		}
	});
});
</script>
</body>