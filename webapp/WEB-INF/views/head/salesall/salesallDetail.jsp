    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 이진수          최초작성
* 2021. 6. 12. 이진수          판매출고 상세 구축
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
	.myImage{
		width: 100%;
	}
	.dataTable-container {
	    overflow-x: clip;
	    width: 100%;
	}
	.dataArea{
		height: 400px;
	}
 	#barchart{ 
 		width: 40%; 
 	}
	.chartAll{
    	position: relative;
		display: flex;
	}
	.dataArea{
		margin-left: 5px;
	}
</style>
<body>
	<div class="page-title"></div>
	<section class="section">
		<div class="card">
			<div class="card-header">
				<div class="row">
					<div class="rowLeft">
						<h4 class="card-title" style="display: inline-block;">${headInvenVO.prod_nm } 판매 출고 상세조회</h4>
					</div>
					<div class="rowRight">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">${headInvenVO.prod_nm } 판매 출고 상세 조회</li>
							</ol>
						</nav>
					</div>
				</div>
				<div class="row">
					<div class="rowLeft">
					</div>
					<div class="rowRight">
						<a href="${cPath }/head/salesall" class="btn btn-primary float-end pribtn">목록으로</a>
					</div>
				</div>
			</div>
			<div class="card-body">
				<!-- 차트 -->
				<div class="chartAll">
				<div id="barchart"></div>
				
				<div class="dataTable-container">
								
				<div class="dataTable-container chartInfo">
					<table class="table dataTable-table" id="table1">
<!-- 							<tr> -->
<!-- 								<th data-sortable="" style="width: 3.8215%;">이미지</th> -->
<!-- 								<th data-sortable="" style="width: 20.8215%;">제품명</th> -->
<!-- 								<th data-sortable="" style="width: 6.737%;" class="right">판매량</th> -->
<!-- 								<th data-sortable="" style="width: 6.4053%;" class="right">제품매입가</th> -->
<!-- 								<th data-sortable="" style="width: 6.339%;" class="right">제품공급가</th> -->
<!-- 								<th data-sortable="" style="width: 6.339%;" class="right">판매 합계액</th> -->
<!-- 								<th data-sortable="" style="width: 5.339%;" class="center">사용 여부</th> -->
<!-- 							</tr> -->
						<tbody id="infoBody">
							<c:choose>
								<c:when test="${not empty headInvenVO }">
										<tr>
											<td rowspan="5" style="width:30%;">
												<c:choose>
		                                   			<c:when test="${headInvenVO.att_fileno eq null}">
		                                   				<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>
		                                   			</c:when>
		                                   			<c:otherwise>
		                                   				<c:forEach items="${headInvenVO.attachfileList }" var="attach" begin="0" end="0">
					                                           <img class="myImage" alt="" src="data:image/jpeg;base64,${attach.file_img }">
				                                       </c:forEach>
		                                   			</c:otherwise>
		                                   		</c:choose>
											</td>
											<td>분류</td>
											<td>${headInvenVO.prod_cl_nm }</td>
										</tr>
										<tr>
											<td>단위</td>
											<td>${headInvenVO.prod_unit_qy} ${headInvenVO.prod_unit_nm}</td>
										</tr>
										<tr>
											<td>현재 매입가</td>
											<td>${headInvenVO.prod_puchas_pc}원</td>
										</tr>
										<tr>
											<td>현재 공급가</td>
											<td>${headInvenVO.prod_suply_pc}원</td>
										</tr>
										<tr>
											<td>누적 판매량</td>
											<td>${headInvenVO.in_qy}개</td>
										</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td rowspan="5" style="width:30%;">이미지</td>
										<td>분류</td>
										<td>조건에 맞는 게시글이 없음.</td>
									</tr>
									<tr>
										<td>단위</td>
										<td>조건에 맞는 게시글이 없음.</td>
									</tr>
									<tr>
										<td>현재 매입가</td>
										<td>조건에 맞는 게시글이 없음.</td>
									</tr>
									<tr>
										<td>현재 공급가</td>
										<td>조건에 맞는 게시글이 없음.</td>
									</tr>
									<tr>
										<td>누적 판매량</td>
										<td>조건에 맞는 게시글이 없음.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
				<div class="dataArea">
						<table class="table table-hover dataTable-table" id="table1">
							<thead>
								<tr>
									<th data-sortable="" style="width: 3.8215%;">순번</th>
									<th data-sortable="" style="width: 20.8215%;">가맹점명</th>
<!-- 									<th data-sortable="" style="width: 5.339%;" class="left">사용 여부</th> -->
									<th data-sortable="" style="width: 6.4053%;" class="center">판매 일자</th>
									<th data-sortable="" style="width: 6.737%;" class="right">판매량</th>
									<th data-sortable="" style="width: 6.339%;" class="right">제품공급가</th>
									<th data-sortable="" style="width: 6.339%;" class="right">판매 합계액</th>
								</tr>
							</thead>
							<tbody id="listBody">
								<tr>
									<td colspan="7">조건에 맞는 게시글이 없음.</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="dataTable-bottom">
						<div class="dataTable-info">
							Showing 1 to <span id="totalPage"></span> of <span
								id="currentPage"></span> entries
						</div>
					<div id="pagingArea" class="d-flex justify-content-center">
						${pagingVO.pagingHTMLBS }
					</div>
					</div>
				</div>
					
				</div>
			</div>
		</div>
	</section>
	<form id="searchForm" action="${cPath }/head/salesall/detail">
		<input type="hidden" name="page" value="${pagingVO.currentPage }"/>
		<input type="hidden" name="prodCode" value="${headInvenVO.prod_code }">
	</form>
	<form id="chartForm" action="${cPath }/head/salesall/chart">
		<input type="hidden" name="prod_code" value="${headInvenVO.prod_code }">
	</form>
	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script type="text/javascript">
	
	let chartForm = $("#chartForm").ajaxForm({
		dataType:"json"
		, beforeSubmit:function(){
			chartForm.find("[name='page']").val("");	
		}, success:function(resp){
			let in_cmpt_time = [];
			let in_qy = [];
			console.log("성공?")
			$(resp).each(function(idx, sales){
				in_cmpt_time.push(sales.in_cmpt_time);
				in_qy.push(sales.in_qy);
			});
			var baroptions = {
				series: [{
			          data: in_qy
			        },
			        ],
			          chart: {
			          type: 'bar',
			          height: 730,
			          events: {
			        	  click: function(event, chartContext, config) {
			        	       console.log(config.dataPointIndex)
			        	       console.log(event)
			        	       console.log(chartContext)
		        	       }
			          }
			        },
			        plotOptions: {
			          bar: {	
			            horizontal: true,
			            dataLabels: {
			              position: 'top',
			            },
			          }
			        },
			        dataLabels: {
			          enabled: true,
			          offsetX: -6,
			          style: {
			            fontSize: '12px',
			            colors: ['#fff']
			          }
			        },
			        stroke: {
			          show: true,
			          width: 1,
			          colors: ['#fff']
			        },
			        tooltip: {
			          shared: true,
			          intersect: false
			        },
			        xaxis: {
			          categories: in_cmpt_time
			        },
			        colors: ['#F2913D']
				};
				$("#barchart").empty();
				var chart = new ApexCharts(document.querySelector("#barchart"), baroptions);
				chart.render();
		}, error:function(xhr, resp, error){
			console.log(xhr);
		}
	});
	chartForm.submit();	
	
	let locale = navigator.language;
	
	
		
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
					$(resp.dataList).each(function(idx, sales){
						let tr = $("<tr>").append(
									$("<td>").html(sales.rnum)
									, $("<td>").html(sales.fran_comnm)
									, $("<td>").html(sales.in_cmpt_time).addClass("center")
									, $("<td>").html(sales.in_qy.toLocaleString(locale)).addClass("right")
									, $("<td>").html(sales.prod_suply_pc.toLocaleString(locale)+"원").addClass("right")
									, $("<td>").html((sales.in_qy * sales.prod_suply_pc).toLocaleString(locale)+"원").addClass("right")
								).data("sales", sales);
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
			}, error:function(xhr, resp, error){
				console.log(xhr);
			}
		});
		searchForm.submit();
		
		$("#pagingArea").on("click", "a", function(event){
			event.preventDefault();
			let page = $(this).data("page");
			if(page){
				
				searchForm.find("[name='page']").val(page);
				searchForm.submit();
			}
			return false;
		});
		
	</script>
</body>