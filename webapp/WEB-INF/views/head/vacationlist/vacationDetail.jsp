<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 17     진예은      휴가상세조회
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
							<h4>휴가신청 상세조회</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">휴가신청 상세조회</li>
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
								<button type="submit"class="btn btn-primary float-end pribtn">검색</button>
								<button type="reset" class="resetBtn icon dripicons-clockwise float-end"></button>
							</div>
							<table class="table table-borderd">
								<tbody class="talbeSearchArea">
									<tr>
										<th class="searchTh"  style="width: 10%;">table1</th>
										<td style="width: 23.3%;">
											<input  class="form-control" placeholder="Search..." type="text">
										</td>
										<th class="searchTh"  style="width: 10%;">table1</th>
										<td style="width: 23.3%;">
											<input  class="form-control" placeholder="Search..." type="text">
										</td>
										<th class="searchTh"  style="width: 10%;">table1</th>
										<td style="width: 23.3%;">
											<input  class="form-control" placeholder="Search..." type="text">
										</td>
									</tr>        
								</tbody>
							</table>
						</form>
						<!-- 조회 영역 -->
						<div class="dataTable-container">
							<div class="btnArea">
								<a href="#" id="delete" class="btn btn-secondary float-end" data-bs-toggle="modal" data-bs-target="#defaultSize">삭제</a>
								<a href="#" id="modify" class="btn btn-primary float-end pribtn">수정</a>
								<a href="#" class="btn btn-primary float-end pribtn">등록</a>
								<div class="dataTable-dropdown float-end">
									<select id="selector" class="dataTable-selector form-select">
										<option value="5">5</option>
										<option value="10" selected="">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option>
									</select>
								</div>
							</div>
							<div class="dataArea">
								<table class="table table-hover dataTable-table" id="table1">
									<thead>
										<tr>
											<th data-sortable="" style="width: 25%;">
												<a href="#" class=""><input id="checkAll" type="checkbox" class="form-check-input"></a>
											</th>
											<th data-sortable="" style="width: 25%;">
												<a href="#" class="dataTable">title1</a>
											</th>
											<th data-sortable="" style="width: 25%;">
												<a href="#" class="dataTable">title2</a>
											</th>
											<th data-sortable="" style="width: 25%;">
												<a href="#" class="dataTable">title3</a>
											</th>
											<th data-sortable="" style="width: 25%;">
												<a href="#" class="dataTable">title4</a>
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
 </script> 