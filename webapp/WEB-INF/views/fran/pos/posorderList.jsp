    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6.  17. 이진수          화면 구축
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<style>
.card{
	margin-bottom: 10px;
	height: 100px;
}
.mycard{ 
	width: 49.5%; 
	height: 650px;
}
.line{
	background-color : #c1a89c;
	height: 815px;
}
.category{
	height: auto;
/*  	cursor: pointer; */
}
.category table{
	border: 1px solid #ddd;
	border-collapse: collapse;
}
.category table tr th{
	border: 1px solid #bf9292;
	border-collapse: collapse;
	width: 20%;
	background-color: #876767;
    color: #fff;
}
.categoryThTrue:hover {
    --bs-table-hover-color: #fff;
    --bs-table-hover-bg: #f2913d;
    --bs-table-accent-bg: var(--bs-table-hover-bg);
    color: var(--bs-table-hover-color);
}

}
.menuList{
	height: 560px;
}
.categoryThTrue{
	width: 20%;
	cursor: pointer;
}

.thTrue:hover{
	border: 1px solid #876767;
}
.menuList table tbody tr th{
	width: 20%;
}
.thTrue{
	cursor: pointer;
}
.myMenuImage{
	width: 80%;
}
.imageDiv{
	padding: 10px;
}
.categoryAction{
	background-color: #f2913d !important;
}
.imageOrder{
	width: 80px;
}
.orderDataArea{
	height: 640px;
}
#myOrderSum{
	margin-top: 10px;
}
#myOrderSum td{
	padding: 0px 10px;
}
.selectOrderMenu{
	background-color: #ddd;
}
.pay{
    border-radius: 0.7em;
}
.paytable{
	border-top-width: 0px;
    margin: 0px;
}
.paytable td{
    height: 95px;
    font-size: 25px;
    width: 33%; cursor: pointer;
}
.paytable tr td{
	border: 1px solid #bf9292;
	border-collapse: collapse;
	width: 20%;
	background-color: #876767;
    color: #fff;
}

.paytable tr td:hover{
 	--bs-table-hover-color: #fff;
    --bs-table-hover-bg: #f2913d;
    --bs-table-accent-bg: var(--bs-table-hover-bg);
    color: var(--bs-table-hover-color);
}

#takeout, #payment, #cardTakeOut, #deli{
	background-color: #876767;
	color: #ffffff;
}
#shop, #cardpayment, #cardShop{
	background-color: #f2913d;
	color: #ffffff;
}
.orderList:hover{
	--bs-table-hover-color: #607080;
    --bs-table-hover-bg: rgba(0,0,0,0.075);
    --bs-table-accent-bg: var(--bs-table-hover-bg);
    color: var(--bs-table-hover-color);
}
</style>
<body>
   	<section class="section">
   		<!-- card 영역 -->
   		<!-- 주문내역 -->
   		<div class="card mycard" style="width: 34.5%; height: 806px; float: left;">
   			<!-- card-header 영역 -->
            <div class="card-header">
                <div class="row">
					<div class="rowLeft">
						<h4 class="card-title" style="display: inline-block;">주문내역</h4>
					</div>
				</div>
             </div>
			<!-- card-body 영역 -->
			<div class="card-body">
				<!-- 조회 영역 -->
				<div class="dataTable-container">
					<div class="dataArea orderDataArea">
						<table class="table dataTable-table" id="table1">
							<thead>
								<tr>
									<th class="center" id="" style="width: 5%;">
										<input type='checkbox' id="checkAll" class='form-check-input'/>
									</th>
									<th class="center" id="" style="width: 17%;">이미지</th>
									<th class="" id="" style="width: 32%;">상품명</th>
									<th class="right" id="" style="width: 15%;">개수</th>
									<th class="right" id="" style="width: 16%;">가격</th>
									<th class="center" id="" style="width: 14%;">삭제</th>
								</tr>
							</thead>
							<tbody id="orderListBody">
							
							</tbody>
						</table>
					</div>
				</div>
				<!-- data-Area 끝 -->
				<div>
					<table id="myOrderSum" class="" style="width: 100%;">
						<tbody>
							<tr>
								<td class="center" rowspan="3" style="width: 10%;">
									<button class='orderListMinusBtn btn btn-secondary' style="height: 38px;">-</button>
								</td>
								<td class="center" rowspan="3" style="width: 10%;">
									<button class='orderListPlusBtn btn btn-primary'>+</button>
								</td>
								<td class="right">주문수량</td>
								<td>판매금액</td>
								<td id="priceMoney" class="right">0</td>
							</tr>
							
							<tr>
								<td rowspan="2" id="total_qy" class="right">0</td>
								<td>부가세</td>
								<td id="surtax" class="right">0</td>
							</tr>
							
							<tr>
								<td>총합계</td>
								<td id="cord_total" class="right">0</td>
							</tr>
							
							
						</tbody>
					</table>
				</div>
			</div>
			<!-- card-body 끝 -->
			
			
   		</div>
   		<!-- card 끝 -->
   		
   		<div class="card line" style="display: inline-block; width: 1%; float: left;"></div>
   		
   		<!-- 메뉴내역 -->
   		<div class="card mycard" style="width: 64.5%; height: 696px; ">
			<!-- card-body 영역 -->
			<div class="card-body">
				<!-- 분류 조회-->
				<div class="dataTable-container">
					<div class="dataArea category">
						<table class="table dataTable-table" id="table1" style="margin: 0px;">
							<c:forEach begin="0" end="9" step="1" varStatus="idx">
								<c:if test="${idx.index % 5 == 0}">
									<tr>
								</c:if>
								<c:choose>
									<c:when test="${not empty comCodeList[idx.index] }">
										<th class="center categoryThTrue ${idx.index == 0 ? 'categoryAction' : ''}" id="${comCodeList[idx.index].com_code }">${comCodeList[idx.index].com_code_nm }  </th>
									</c:when>
									<c:otherwise>
										<th class="center categoryThFalse" id="${comCodeList[idx.index].com_code }">${comCodeList[idx.index].com_code_nm }  </th>
									</c:otherwise>
								</c:choose>
								
								<c:if test="${idx.index % 5 == 4}">
									</tr>
								</c:if>
								
							</c:forEach>
						</table>
					</div>
				</div>
				<!-- 조회 영역 -->
				<div class="dataTable-container">
					<div class="dataArea menuList">
						<table class="table dataTable-table menutable" id="table1">
							<tbody id="menuListBody">
							</tbody>
						</table>
					</div>
				</div>
				<!-- data-Area 끝 -->
			</div>
			<!-- card-body 끝 -->
			
			
   		</div>
   		<!-- card 끝 -->
   		
   		
   		
   		<!-- 결제 -->
   		<div class="card">
			<!-- card-body 영역 -->
			<div class="card-body" style="padding: 0px">
<!-- 			<div style="width: 33%; cursor: pointer; display: inline-block;" class="center">현금</div> -->
<!-- 	 		<div style="width: 33%; cursor: pointer; display: inline-block;" class="center">카드</div> -->
<!-- 	 		<div style="width: 33%; cursor: pointer; display: inline-block;" class="center">분할결제</div> -->
				<!-- 조회 영역 -->
				<div class="dataTable-container pay">
					<table class="table dataTable-table paytable" style="height: 100px;">
					 <tbody>
					 	<tr>
					 		<td id="moneyPay" class="center">현금</td>
					 		<td id="cardPay" class="center">카드 및 페이</td>
					 		<td id="delivery" class="center">배달</td>
					 		<td id="sucOrderList" class="center">주문내역</td>
					 	</tr>
					 </tbody>
					</table>
				</div>
				<!-- data-Area 끝 -->
			</div>
			<!-- card-body 끝 -->
			
			
   		</div>
   		<!-- card 끝 -->
   	</section>
   	<form id="searchForm" action="${cPath }/fran/posorder">
		<input type="hidden" name="searchCatecory" value=""/>
	</form>
	
	
	
<!--Modal default md size -->
	<div class="me-1 mb-1 d-inline-block">
		<!-- Button trigger for default modal -->
		<!--Default size Modal -->
		<div class="modal fade text-left" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel18" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
				<div class="modal-content">
	                <div class="modal-header">
	                    <h5 class="modal-title" id="exampleModalLongTitle"></h5>
<!-- 	                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close"></button> -->
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body">
		                <div class="dataArea">
							<table id="detailBody" class="table dataTable-table" >
								<thead id="detailThead">
								</thead>
		                		<tbody id="detailTbody">
		                		</tbody>
		                	</table>
		                	<table id="orderStyleBody" class="table dataTable-table" >
		                		<tbody id="detailorderStyleBody">
		                			<tr></tr>
		                		</tbody>
		                	</table>
		                </div>	
	                </div>
	                <div class="modal-footer myModal-footer">
	                    <button type="button" class="btn btn-secondary footerCloseBtn" data-bs-dismiss="modal">닫기</button>
	                </div>
	                
	            </div>
			</div>
		</div>
	</div>	
	
	
	<input type="hidden" id="cord_code" name="cord_code" value="">
	<form id="moneyPayForm" action="${cPath }/fran/posorder/moneypay">
	</form>
	<form id="cardPayForm" action="${cPath }/fran/posorder/cardpay">
	</form>
	
	
<script type="text/javascript">
	let locale = navigator.language;
	let menuListBody = $("#menuListBody");
	$(".categoryThTrue").on("click", function() {
		$(".categoryThTrue").removeClass("categoryAction");
		$(this).addClass("categoryAction");
		searchForm.find("[name='searchCatecory']").val($(this).attr("id"));
		searchForm.submit();
	});
	
	let searchForm = $("#searchForm").ajaxForm({
		dataType:"json"
		, beforeSubmit:function(){
		}, success:function(resp){
			menuListBody.empty();
			let trTags = [];
			let thTags = [];
			if(resp){
				let checklen = resp.length/5
				let len = 0;
				$(resp).each(function(idx, goods){
					let img = $("<div>").html("<img class='myMenuImage menuClick' style='width: 80%;' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>").addClass("imageDiv").css("padding", "10px");
					if(goods.att_fileno != null){
						img = $("<div>").html("<img class='myMenuImage menuClick' style='width: 80%;' src='data:image/jpeg;base64,"+goods.attachfileList[0].file_img+"'>").addClass("imageDiv").css("padding", "10px");
					}
					let th = $("<th>").append(
							img
							, $("<div>").html(goods.goods_nm)
							).addClass("center thTrue").attr("id",goods.goods_code)
					thTags.push(th)
					if(idx%5 == 4 && idx>0){
						len = parseInt(len) + 1;
						let tr = $("<tr>").append(thTags);
						trTags.push(tr);
						thTags = [];
					}else if(resp.length < 5 && resp.length-1 == idx){
						if(5-resp.length > 0){
							for(var i = 0; i < 5-resp.length; i++){
								let th = $("<th>").addClass("center")
								thTags.push(th)
							}
								
						}
						let tr = $("<tr>").append(thTags);
						trTags.push(tr);
						thTags = [];
					}else if(resp.length == parseInt(idx)+1 && len == parseInt(checklen)){
						let tr = $("<tr>").append(thTags);
						trTags.push(tr);
						thTags = [];
					}
					
				});
			}else{
				trTags.push( 
					$("<tr>").html(
						$("<td>").attr("colspan", "5")		
					)
				);
			}
			menuListBody.html(trTags);
		}, error:function(xhr, resp, error){
			console.log(xhr);
		}
	});
	searchForm.submit();
	
	
	
	orderListBody = $("#orderListBody");
	
	$("#menuListBody").on("click", ".thTrue", function() {
		let goods_code = $(this).attr("id");
		$.ajax({
			 url :"${cPath}/fran/posorder/goodsSearch",
			 data :{
				 "goods_code" : goods_code
			 },
			 dataType: "json",
			 success : function(goods) {
			 	let img = $("<div>").html("<img class='' style='width: 80%;' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>").addClass("imageOrder center").css("padding", "10px");
				if(goods.att_fileno != null){
					img = $("<div>").html("<img class='' style='width: 80%;' src='data:image/jpeg;base64,"+goods.attachfileList[0].file_img+"'>").addClass("imageOrder center").css("padding", "10px");
				}
				let check = false;
				$("#orderListBody tr").each(function(idx, code) {
					let saveCode = "order";
					saveCode = $(this).attr("id");
					saveCode = saveCode.replace("order","");
					if(saveCode == goods_code){
						let goods_qy = $(this).find(".goods_qy").text();
						goods_qy = parseInt(goods_qy.replace(",","")) + 1;
						$(this).find(".goods_qy").text(goods_qy.toLocaleString(locale));
						
						totalQY()
						
						check = true;
					}
				})
				if(check){
					return false;
				}
				let tr = $("<tr>").append(
						$("<td>").html("<input type='checkbox' class='form-check-input' value="+goods.goods_code+">").addClass("center")
						, img.addClass("center")
						, $("<td>").html(goods.goods_nm)
						, $("<td>").html(1).addClass("goods_qy").addClass("right")
						, $("<td>").html(goods.goods_basepc.toLocaleString(locale)).addClass("right goods_basepc")
						, $("<td>").html("<button class='orderListDeleteBtn btn btn-secondary'>X</button>")
				).attr("id","order"+goods.goods_code);
				orderListBody.append(tr);
				
				$("#checkAll").prop("checked", false);
				
				totalQY()
				
			}, error:function(xhr, resp, error){
				console.log(xhr);
			}
		});				
	});
	
	$(".orderDataArea").on("click", ".orderListDeleteBtn", function() {
		$(this).parents("tr").remove();
		totalQY();
	});
	
	$("#orderListBody").on("click", "tr", function() {
		$("#orderListBody tr").removeClass("selectOrderMenu");
		$(this).addClass("selectOrderMenu");
	});
	
	$("#orderListBody").on("click", ".selectOrderMenu", function() {
		$(this).removeClass("selectOrderMenu");
	});
	
	$(".orderListPlusBtn").on("click", function() {
		let goods_qy = $(".selectOrderMenu").find(".goods_qy").text();
		goods_qy = parseInt(goods_qy.replace(",","")) + 1;
		$(".selectOrderMenu").find(".goods_qy").text(goods_qy.toLocaleString(locale));
		totalQY();
	});
	
	$(".orderListMinusBtn").on("click", function() {
		let goods_qy = $(".selectOrderMenu").find(".goods_qy").text();
		goods_qy = parseInt(goods_qy.replace(",","")) - 1;
		if(goods_qy < 1){
			goods_qy = 1;
		}
		$(".selectOrderMenu").find(".goods_qy").text(goods_qy.toLocaleString(locale));
		totalQY();
	});
	
	function totalQY() {
		let total_qy = 0;
		let cord_total = 0
		
		$("#orderListBody tr").each(function(idx, code) {
			total_qy = total_qy + parseInt($(this).find(".goods_qy").text().replace(",",""));
			cord_total = cord_total + (parseInt($(this).find(".goods_qy").text().replace(",","")) * parseInt($(this).find(".goods_basepc").text().replace(",","")));
		})
		$("#total_qy").text(total_qy.toLocaleString(locale));
		$("#priceMoney").text((cord_total*0.9).toLocaleString(locale));
		$("#surtax").text((cord_total*0.1).toLocaleString(locale));
		$("#cord_total").text(cord_total.toLocaleString(locale));
	}
	
	$("#checkAll").on("click", function() {
		if($(this).is(":checked")){
			checkcehck();
		}else{
			$("#orderListBody input[type='checkbox']").prop("checked", false);
		}
	});
	
	function checkcehck() {
		$("#orderListBody input[type='checkbox']").prop("checked", true);
	}
	
	$("#orderListBody").on("click", ".form-check-input", function() {
		var checked = false;
		$("#orderListBody input[type='checkbox']").each(function() {
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
	
	var orderCode = [];
	let moneyPayForm = $("#moneyPayForm").ajaxForm({
		dataType:"json"
		, beforSubmut: function() {
			
		}, success:function(resp){
			$(resp).each(function(idx,code) {
				$("#"+code).remove();
				$("#cord_code").val("");
				if(code.substr(0,8) == "cordCode"){
					if($("#orderListBody tr").length > 0){
						$("#cord_code").val(code.replace("cordCode",""));
					}
				}
			})
			totalQY();
		}, error:function(xhr, resp, error){
			console.log(xhr);
		}
	});
	
	let detailorderStyleBody = $("#detailorderStyleBody");
	$("#moneyPay").on("click", function() {
		ordercheck();
		$("#detailThead tr").remove();
		$("#detailTbody tr").remove();
		$(".footerBack").remove();
		$(".payCancle").remove();
		$(".payRefund").remove();
		let tbodytr = '<tr><td>받을 금액</td><td id="modalTotalPrice" class="right">0</td><tr><td>받은 금액</td><td class="right"><input id="received" type="text" class="form-control right" value="0"/></td></tr><tr><td>거스름 금액</td><td id="changeMoney" class="right">0</td></tr>'
		$("#detailTbody").append(tbodytr);
		detailorderStyleBody.find("tr").remove();
		$("#moneyPayForm").find("input").remove();
		let totalSum = 0;
		let index = 0;	
		$("#orderListBody input[type='checkbox']").each(function(idx,code) {
			if($(this).is(":checked")){
				let goods_qy = $(this).parents("tr").find(".goods_qy").text().replace(",","");
				let goods_pc = $(this).parents("tr").find(".goods_basepc").text().replace(",","")
				totalSum = totalSum + (goods_pc * goods_qy)
				
				$("#moneyPayForm").append('<input type="hidden" name="cOrderListVO['+index+'].goods_code" value="'+$(this).val()+'">')
				$("#moneyPayForm").append('<input type="hidden" name="cOrderListVO['+index+'].goods_qy" value="'+goods_qy+'">')
				$("#moneyPayForm").append('<input type="hidden" name="cOrderListVO['+index+'].goods_pc" value="'+goods_pc+'">')
				index = parseInt(index) + parseInt(1);
			}
		});
		$("#moneyPayForm").find("input[name='pay_se_code']").remove();
		$("#moneyPayForm").append('<input type="hidden" name="pay_se_code" value="E0001">')
		$("#moneyPayForm").append('<input type="hidden" name="cord_total" value="'+totalSum+'">')
		$("#exampleModalLongTitle").text("현금 계산");
		let tr = $("<tr>").append(
			$("<td>").html("매장").attr("id","shop").addClass("center").css("cursor","pointer")
			, $("<td>").html("포장").attr("id","takeout").addClass("center").css("cursor","pointer")
		);
		$("#modalTotalPrice").text(totalSum.toLocaleString(locale));
		detailorderStyleBody.append(tr);
		$("#myModal").modal("show");
		
	});
	
	
	$("#detailorderStyleBody").on("click", "#shop", function() {
		let changeMoney = $("#changeMoney").text().replace(",","");
		let received = $("#received").val();
		if(changeMoney < 0 || received == 0){
			alert("받은 금액이 적습니다 손해보고싶냐")
			return false;
		}else{
			$("#moneyPayForm").find("input[name='cord_cl_code']").remove();
			$("#moneyPayForm").append('<input type="hidden" name="cord_cl_code" value="A0001">')
			if($("#cord_code").val() != ""){
				$("#moneyPayForm").append('<input type="hidden" name="cord_code" value="'+$("#cord_code").val()+'">')
			}
			moneyPayForm.submit();
			$("#myModal").modal("hide");
			alert("주문이 완료되었습니다.");
			$("#received").val(0);
			$("#changeMoney").text(0);
		}
	});
	
	$("#detailorderStyleBody").on("click", "#takeout", function() {
		let changeMoney = $("#changeMoney").text().replace(",","");
		let received = $("#received").val();
		if(changeMoney < 0 || received == 0){
			alert("받은 금액이 적습니다 손해보고싶냐")
			return false;
		}else{
			$("#moneyPayForm").find("input[name='cord_cl_code']").remove();
			$("#moneyPayForm").append('<input type="hidden" name="cord_cl_code" value="B0001">')
			if($("#cord_code").val() != ""){
				$("#moneyPayForm").append('<input type="hidden" name="cord_code" value="'+$("#cord_code").val()+'">')
			}
			moneyPayForm.submit();
			$("#myModal").modal("hide");
			alert("주문이 완료되었습니다.");
			$("#received").val(0);
			$("#changeMoney").text(0);
		}
	});
	
	$("#cardPay").on("click", function() {
		ordercheck();
		$("#detailThead tr").remove();
		$("#detailTbody tr").remove();
		$(".footerBack").remove();
		$(".payCancle").remove();
		$(".payRefund").remove();
		let tbodytr = '<tr><td>받을 금액</td><td id="modalTotalPrice" class="right">0</td></tr>'
		$("#detailTbody").append(tbodytr);
		
		detailorderStyleBody.find("tr").remove();
		$("#moneyPayForm").find("input").remove();
		let totalSum = 0;
		let index = 0;
		$("#orderListBody input[type='checkbox']").each(function(idx,code) {
			if($(this).is(":checked")){
				let goods_qy = $(this).parents("tr").find(".goods_qy").text().replace(",","");
				let goods_pc = $(this).parents("tr").find(".goods_basepc").text().replace(",","")
				totalSum = totalSum + (goods_pc * goods_qy)
				
				$("#moneyPayForm").append('<input type="hidden" name="cOrderListVO['+idx+'].goods_code" value="'+$(this).val()+'">')
				$("#moneyPayForm").append('<input type="hidden" name="cOrderListVO['+idx+'].goods_qy" value="'+goods_qy+'">')
				$("#moneyPayForm").append('<input type="hidden" name="cOrderListVO['+idx+'].goods_pc" value="'+goods_pc+'">')
				index = parseInt(index) + parseInt(1);
			}
		});
		$("#moneyPayForm").append('<input type="hidden" name="cord_total" value="'+totalSum+'">')
		$("#exampleModalLongTitle").text("카드 계산");
		let tr = $("<tr>").append(
			$("<td>").html("매장").attr("id","cardShop").addClass("center").css("cursor","pointer")
			, $("<td>").html("포장").attr("id","cardTakeOut").addClass("center").css("cursor","pointer")
		);
		
		$("#modalTotalPrice").text(totalSum.toLocaleString(locale));
		detailorderStyleBody.append(tr);
		$("#myModal").modal("show");
	});
	$("#detailorderStyleBody").on("click", "#cardShop", function() {
		$("#moneyPayForm").find("input[name='cord_cl_code']").remove();
		$("#moneyPayForm").append('<input type="hidden" name="cord_cl_code" value="A0001">')
		cardBody();
	});
	$("#detailorderStyleBody").on("click", "#cardTakeOut", function() {
		$("#moneyPayForm").find("input[name='cord_cl_code']").remove();
		$("#moneyPayForm").append('<input type="hidden" name="cord_cl_code" value="B0001">')
		cardBody();
	});
	function cardBody() {
		$("#detailorderStyleBody tr").remove();
		let tr = $("<tr>").append(
 			$("<td>").html("결제").attr("id","payment").addClass("center").css("cursor","pointer")
 		);
		detailorderStyleBody.append(tr);
	}
	$("#detailorderStyleBody").on("click", "#payment", function() {
		$("#moneyPayForm").find("input[name='pay_se_code']").remove();
		$("#moneyPayForm").append('<input type="hidden" name="pay_se_code" value="D0001">')
		var IMP = window.IMP; // 생략가능
		IMP.init('imp90445686'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
		
		IMP.request_pay({
		    pg : 'samsung', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '결제',
		    amount : $("#modalTotalPrice").text().replace(",",""),
		    buyer_email : 'iamport@siot.do',
		    buyer_name : '구매자이름',
		    buyer_tel : '010-1234-5678',
		    buyer_addr : '서울특별시 강남구 삼성동',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
		    if ( rsp.success ) {
		        var msg = '결제가 완료되었습니다.';
				if($("#cord_code").val() != ""){
					$("#moneyPayForm").append('<input type="hidden" name="cord_code" value="'+$("#cord_code").val()+'">')
				}
				moneyPayForm.submit();
				$("#myModal").modal("hide");
				alert("주문이 완료되었습니다.");
				$("#received").val(0);
				$("#changeMoney").text(0);
		    } else {
		        var msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
// 		    alert(msg);
		});
	});
	
	$("#delivery").on("click", function() {
		ordercheck();
		$("#detailThead tr").remove();
		$("#detailTbody tr").remove();
		$(".footerBack").remove();
		$(".payCancle").remove();
		$(".payRefund").remove();
		let tbodytr = '<tr><td>받을 금액</td><td id="modalTotalPrice" class="right">0</td></tr><tr><td>주소입력</td><td class="right"><input id="addr" type="text" class="form-control" value=""/></td></tr>'
		$("#detailTbody").append(tbodytr);
		
		detailorderStyleBody.find("tr").remove();
		$("#moneyPayForm").find("input").remove();
		let totalSum = 0;
		let index = 0;
		$("#moneyPayForm").find("input[name='pay_se_code']").remove();
		$("#moneyPayForm").append('<input type="hidden" name="pay_se_code" value="F0001">')
		
		$("#orderListBody input[type='checkbox']").each(function(idx,code) {
			if($(this).is(":checked")){
				let goods_qy = $(this).parents("tr").find(".goods_qy").text().replace(",","");
				let goods_pc = $(this).parents("tr").find(".goods_basepc").text().replace(",","")
				totalSum = totalSum + (goods_pc * goods_qy)
				
				$("#moneyPayForm").append('<input type="hidden" name="cOrderListVO['+idx+'].goods_code" value="'+$(this).val()+'">')
				$("#moneyPayForm").append('<input type="hidden" name="cOrderListVO['+idx+'].goods_qy" value="'+goods_qy+'">')
				$("#moneyPayForm").append('<input type="hidden" name="cOrderListVO['+idx+'].goods_pc" value="'+goods_pc+'">')
				index = parseInt(index) + parseInt(1);
			}
		});
		$("#moneyPayForm").append('<input type="hidden" name="cord_total" value="'+totalSum+'">')
		$("#exampleModalLongTitle").text("배달");
		let tr = $("<tr>").append(
			$("<td>").html("배달").attr("id","deli").addClass("center").css("cursor","pointer")
		);
		
		$("#modalTotalPrice").text(totalSum.toLocaleString(locale));
		detailorderStyleBody.append(tr);
		$("#myModal").modal("show");
	});
	
	$("#detailorderStyleBody").on("click", "#deli", function() {
		$("#moneyPayForm").find("input[name='cord_cl_code']").remove();
		$("#moneyPayForm").append('<input type="hidden" name="cord_cl_code" value="C0001">')
		if($("#cord_code").val() != ""){
			$("#moneyPayForm").append('<input type="hidden" name="cord_code" value="'+$("#cord_code").val()+'">')
		}
		moneyPayForm.submit();
		$("#myModal").modal("hide");
		alert("주문이 완료되었습니다.");
		$("#received").val(0);
		$("#changeMoney").text(0);
	});
	
	function ordercheck() {
		let check = true;
		$("#orderListBody input[type='checkbox']").each(function() {
			if($(this).is(":checked")){
				check = false;
			}
		});
		if(check){
			checkcehck();
		}
	}
	$("#detailTbody").on("change", "#received", function() {
		let modalTotalPrice = $("#modalTotalPrice").text().replace(",","");
		let received = $("#received").val();
		let changeMoney = received - modalTotalPrice;
// 		console.log(modalTotalPrice)
// 		console.log(received)
// 		console.log(changeMoney)
		$("#changeMoney").text(changeMoney.toLocaleString(locale));
	});
	
	$("#sucOrderList").on("click", function() {
		orderList();
	});
	
	function orderList() {
		$("#exampleModalLongTitle").text("주문 내역");
		$("#detailThead tr").remove();
		$("#detailTbody tr").remove();
		$("#detailorderStyleBody tr").remove();
		$(".footerBack").remove();
		$(".payCancle").remove();
		$(".payRefund").remove();
		let theadtr = $("<tr>").append(
				$("<td>").html("결제시간").css("width", "25%")
				, $("<td>").html("주문금액")
				, $("<td>").html("주문구분")
				, $("<td>").html("결제상태")
				, $("<td>").html("결제수단")
			)
		$("#detailThead").append(theadtr);
		
		let trTags = [];
		$.ajax({
			url : "${cPath}/fran/posorder/orderlist",
			dataType : "json",
			success : function(resp) {
				$(resp).each(function(idx,sale) {
					let tbodytr = $("<tr>").append(
							$("<td>").html(sale.cord_time)
							, $("<td>").html(sale.ordpay_money.toLocaleString(locale)).addClass("right")
							, $("<td>").html(sale.cord_cl_nm)
							, $("<td>").html(sale.pay_sttus_nm)
							, $("<td>").html(sale.pay_se_nm)
						).data("sale", sale).css("cursor", "pointer").addClass("orderList").attr("id",sale.ordpay_no);
					trTags.push(tbodytr);
				});
				$("#detailTbody").html(trTags);
			},error : function(xhr, error, msg) {
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}
		});
		
		$("#myModal").modal("show");
	}
	
	$("#detailTbody").on("click", ".orderList", function() {
		let ordpay_no = $(this).attr("id");
		$("#detailThead tr").remove();
		$("#detailTbody tr").remove();
		$("#detailorderStyleBody tr").remove();
		$(".footerBack").remove();
		$(".payCancle").remove();
		$(".payRefund").remove();
		let theadtr = $("<tr>").append(
				$("<td>").html("상품명").css("width", "35%")
				, $("<td>").html("주문수량").addClass("right")
				, $("<td>").html("주문 단가").addClass("right")
				, $("<td>").html("총 합계").addClass("right")
			)
		$("#detailThead").append(theadtr);
		
		let trTags = [];
		$.ajax({
			url : "${cPath}/fran/posorder/detail",
			data : {
				"ordpay_no" : ordpay_no
			},
			dataType : "json",
			success : function(resp) {
				let totalSum = 0;
				let totalQy = 0;
				let pay_sttus;
				$(resp).each(function(idx, cord) {
					let sum = cord.goods_qy*cord.goods_pc;
					totalQy = parseInt(totalQy)+parseInt(cord.goods_qy);
					totalSum = parseInt(totalSum)+parseInt(sum);
					pay_sttus = cord.pay_sttus_code;
					let tbodytr = $("<tr>").append(
							$("<td>").html(cord.goods_nm)
							, $("<td>").html(cord.goods_qy.toLocaleString(locale)).addClass("right")
							, $("<td>").html(cord.goods_pc.toLocaleString(locale)).addClass("right")
							, $("<td>").html(sum.toLocaleString(locale)).addClass("right")
						).data("cord", cord);
					trTags.push(tbodytr);
				});
				let tbodytr = $("<tr>").append(
						$("<td>").html("")
						, $("<td>").html("총 주문수량").addClass("right")
						, $("<td>").html("").addClass("right")
						, $("<td>").html("총 합계금액").addClass("right")
					);
				trTags.push(tbodytr)
				tbodytr = $("<tr>").append(
						$("<td>").html("")
						, $("<td>").html(totalQy.toLocaleString(locale)).addClass("right")
						, $("<td>").html("")
						, $("<td>").html(totalSum.toLocaleString(locale)).addClass("right")
					);
				trTags.push(tbodytr)
				$("#detailTbody").html(trTags);
				console.log(pay_sttus);
				if(pay_sttus == "A0001"){
					$(".footerCloseBtn").before('<button type="button" class="btn btn-secondary payCancle" value="'+ordpay_no+'">결제취소</button>');
					$(".footerCloseBtn").before('<button type="button" class="btn btn-secondary payRefund" value="'+ordpay_no+'">환불</button>');
				}
				$(".footerCloseBtn").before('<button type="button" class="btn btn-secondary footerBack">돌아가기</button>');
			},error : function(xhr, error, msg) {
				console.log(xhr);
				console.log(error);
				console.log(msg);
			}
		});
	});
	
	$(".myModal-footer").on("click", ".footerBack", function() {
		orderList();
	});
	
	$(".myModal-footer").on("click", ".payCancle", function() {
		if (confirm("결제 취소를 하시겠습니까?") == true){
			let ordpay_no = $(this).val();
			$.ajax({
				url : "${cPath}/fran/posorder/cancleRefund",
				data : {
					"ordpay_no" : ordpay_no,
					"pay_sttus_code" : "B0001"
				},
				dataType : "text",
				success : function(resp) {
					if(resp == "ok"){
						orderList();
						alert("결제 취소 성공");
					}else{
						alert("결제 취소 실패");
					}
				},error : function(xhr, error, msg) {
					console.log(xhr);
					console.log(error);
					console.log(msg);
				}
			});
		}else{   //취소
		    return false;
		}
	});
	$(".myModal-footer").on("click", ".payRefund", function() {
		if (confirm("환불을 하시겠습니까?") == true){
			let ordpay_no = $(this).val();
			$.ajax({
				url : "${cPath}/fran/posorder/cancleRefund",
				data : {
					"ordpay_no" : ordpay_no,
					"pay_sttus_code" : "C0001"
				},
				dataType : "text",
				success : function(resp) {
					if(resp == "ok"){
						orderList();
						alert("환불 성공");
					}else{
						alert("환불 실패");
					}
				},error : function(xhr, error, msg) {
					console.log(xhr);
					console.log(error);
					console.log(msg);
				}
			});
		}else{   //취소
		    return false;
		}
	});
	
	</script>
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</body>
