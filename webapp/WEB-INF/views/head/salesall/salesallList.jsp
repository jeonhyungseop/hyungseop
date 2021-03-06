<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 6. 11. 이진수          판매출고조회 구축
*
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<style>
/*레이아웃 css*/
.card-header .row div, .card-header .row h4, .card-header .row ol li,
	.card-header .row ol {
	margin: 0;
	padding: 0;
}

.card-header .row {
	display: flex;
	justify-content: space-between;
	margin: 0 10px;
}

.card-header .rowLeft, .card-header .rowRight {
	width: 50%;
}

.card-header .rowRight ol {
	justify-content: flex-end;
}

.myImage {
	width: 40px;
}

.dataTable-container {
	overflow-x: clip;
}

.dataArea {
	height: 290px;
}
</style>
<body>
	<div class="page-title"></div>
	<section class="section">
		<div class="card">
			<div class="card-header">
				<div class="row">
					<div class="rowLeft">
						<h4 class="card-title" style="display: inline-block;">판매 출고
							조회</h4>
					</div>
					<div class="rowRight">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">판매
									출고 조회</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>
			<div class="card-body">
				<!-- 차트 -->
				<div id="chart"></div>

				<div class="dataTable-container">
					<div class="dataArea">
						<table class="table table-hover dataTable-table" id="table1">
							<thead>
								<tr>
									<th data-sortable="" style="width: 3.8215%;">이미지</th>
									<th data-sortable="" style="width: 20.8215%;">제품명</th>
									<th data-sortable="" style="width: 6.737%;" class="right">판매량</th>
									<th data-sortable="" style="width: 6.4053%;" class="right">제품매입가</th>
									<th data-sortable="" style="width: 6.339%;" class="right">제품공급가</th>
									<th data-sortable="" style="width: 6.339%;" class="right">판매 합계액</th>
									<th data-sortable="" style="width: 5.339%;" class="center">사용 여부</th>
								</tr>
							</thead>
							<tbody id="listBody">
								<c:choose>
									<c:when test="${not empty pagingVO.dataList }">
										<c:forEach items="${pagingVO.dataList }" var="sales">
											<tr>
												<td>${sales.prod_nm }</td>
												<td>${sales.in_qy }</td>
												<td>${sales.prod_puchas_pc }</td>
												<td>${sales.prod_suply_pc }</td>
												<td>${sales.prod_use_at }</td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="7">조건에 맞는 게시글이 없음.</td>
										</tr>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					<div class="dataTable-bottom">
						<div class="dataTable-info">
							Showing 1 to <span id="totalPage"></span> of <span
								id="currentPage"></span> entries
						</div>
					</div>
					<div id="pagingArea" class="d-flex justify-content-center">
						${pagingVO.pagingHTMLBS }</div>
				</div>
			</div>
		</div>
	</section>
	<form id="searchForm" action="${cPath }/head/salesall">
		<input type="hidden" name="page" value="${pagingVO.currentPage }" />
	</form>
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script type="text/javascript">
		let locale = navigator.language;
		let pagingArea = $("#pagingArea").on("click", "a", function(event) {
			event.preventDefault();
			let page = $(this).data("page");
			if (page) {
				searchForm.find("[name='page']").val(page);
				searchForm.submit();
			}
			return false;
		});
		
		var prod_code = [];
			
		let listBody = $("#listBody");
		let currentPage = $("#currentPage");
		let totalPage = $("#totalPage");
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
				let prodName = [];
				let in_qy = [];
				if (resp.dataList) {
					$(resp.dataList).each(function(idx, sales) {
						let img = $("<td>").html("<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>").addClass("prodcode");
						if (sales.att_fileno != null) {
							img = $("<td>").html("<img class='myImage' src='data:image/jpeg;base64,"+sales.attachfileList[0].file_img+"'>").addClass("prodcode");
						}
						prod_code.push(sales.prod_code);
					let tr = $("<tr>").append(
						img,
						$("<td>").html(sales.prod_nm).addClass("prodcode"),
						$("<td>").html(sales.in_qy.toLocaleString(locale)).addClass("prodcode").addClass("right"),
						$("<td>").html(sales.prod_puchas_pc.toLocaleString(locale)).addClass("prodcode").addClass("right"),
						$("<td>").html(sales.prod_suply_pc.toLocaleString(locale)).addClass("prodcode").addClass("right"),
						$("<td>").html((sales.prod_suply_pc * sales.in_qy).toLocaleString(locale)).addClass("prodcode").addClass("right"),
						$("<td>").html(sales.prod_use_at).addClass("prodcode").addClass("center"))
					.data("sales",sales).css("cursor","pointer").attr("id",sales.prod_code);
						trTags.push(tr);
						prodName.push(sales.prod_nm);
						in_qy.push(sales.in_qy)
					});
				} else {
					trTags.push($("<tr>").html(
							$("<td>").attr("colspan", "8")));
				}
				listBody.html(trTags);
				pagingArea.html(resp.pagingHTMLBS);
				currentPage.html(resp.currentPage);
				totalPage.html(resp.totalPage);
				var options = {
					series : [ {
						name : '판매수량',
						data : in_qy
					} ],
					chart : {
						type : 'bar',
						height : 350,
						 events: {
				        	  click: function(event, chartContext, config) {
				        	       console.log(config.dataPointIndex)
				        	       if(config.dataPointIndex > -1){
				        	    	   let code = prod_code[config.dataPointIndex];
				        	    	   location.href = "${cPath}/head/salesall/detail?what="+code;
				        	       }
			        	       }
				          }
					},
					plotOptions : {
						bar : {
							horizontal : false,
							columnWidth : '55%',
							endingShape : 'rounded',
							dataLabels : {
								position : 'top', // top, center, bottom
							},
						},
					},
					dataLabels : {
						enabled : true,
						formatter : function(val) {
							return val + "";
						},
						offsetY : -20,
						style : {
							fontSize : '12px',
							colors : [ "#304758" ]
						}
					},
					stroke : {
						show : true,
						width : 2,
						colors : [ 'transparent' ]
					},
					xaxis : {
						categories : prodName
					},
					yaxis : {
						title : {
							text : 'Sales Count '
						}
					},
					fill : {
						opacity : 1
					},
					tooltip : {
						y : {
							formatter : function(val) {
								return +val + " 개"
							}
						}
					},
					colors : [ "#F2913D" ]
				};
				$("#chart").empty();
				var chart = new ApexCharts(document.querySelector("#chart"), options);
				chart.render();
			},
			error : function(xhr, resp, error) {
				console.log(xhr);
			}
		});
		searchForm.submit();

		$(listBody).on("click", 'tr', function() {
			let prodCode = $(this).attr("id");
			location.href = "${cPath }/head/salesall/detail?what=" + prodCode;
		})

		// var chart = new ApexCharts(document.querySelector("#chart"), options);
		// chart.render();
	</script>
</body>