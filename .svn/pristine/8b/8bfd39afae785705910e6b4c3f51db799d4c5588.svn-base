<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 6. 09. 진유리         가맹비 리스트 조회, UI
*
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
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
	width : 200px;
}
.accept{
	color: blue;
}
.unaccept{
	color : red;
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
						<h4>가맹비수납내역</h4>
					</div>
					<div class="rowRight">
						<nav aria-label="breadcrumb" >
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">가맹비수납내역 조회</li>
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
									<th class="searchTh"  style="width: 6%;">가맹점명</th>
										<td style="width: 15%;">
											<input  class="form-control" placeholder="Search" name="searchNm" id="searchNm" type="text" onKeyup="fn_search(this)">
										</td>
									<th class="searchTh"  style="width: 8%;">수납완료일자</th>
										<td style="width: 23.3%;">
											<input type="date" id="startDate" name="startDate" class="form-control date" value="${pagingVO.searchMap.startDate}" onchange="fn_search(this)"/>
											-
											<input type="date" id="endDate" name="endDate" class="form-control date" value="${pagingVO.searchMap.endDate}" onchange="fn_search(this)"/>
										</td>
									<th class="searchTh"  style="width: 6%;">수납 상태</th>
										<td style="width: 8%;">
											<select class="form-select" id="bscCode" name="bscCode" onchange="fn_search(this)">
												<option value="">전체</option>
		                                        <c:if test="${not empty BscCode}">
		                                        	<c:forEach items="${BscCode.comCodeList}" var="bsc">
		                                        		<option value="${bsc.com_code}">${bsc.com_code_nm}</option>
		                                        	</c:forEach>
		                                        </c:if>
                                        </select>
										</td>
									<th class="searchTh"  style="width: 6%;">결제 수단</th>
										<td style="width: 8%;">
											<select class="form-select" id="pscCode" name="pscCode" onchange="fn_search(this)">
												<option value="">전체</option>
	                                        	<c:if test="${not empty PscCode}">
	                                        		<c:forEach items="${PscCode.comCodeList}" var="psc">
	                                        			<option value="${psc.com_code}">${psc.com_code_nm}</option>
	                                        		</c:forEach>
	                                        	</c:if>
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
										<th data-sortable="" style="width: 12.5%;">
											<a href="#" class="dataTable">번호</a>
										</th>
										<th data-sortable="" style="width: 12.5%;">
											<a href="#" class="dataTable">가맹점명</a>
										</th>
										<th data-sortable="" style="width: 12.5%;">
											<a href="#" class="dataTable">수납예정일자</a>
										</th>
										<th data-sortable="" style="width: 12.5%;">
											<a href="#" class="dataTable">수납완료일자</a>
										</th>
										<th data-sortable="" style="width: 12.5%;">
											<a href="#" class="dataTable">수납상태</a>
										</th>
										<th data-sortable="" style="width: 12.5%;">
											<a href="#" class="dataTable">결제수단</a>
										</th>
										<th data-sortable="" style="width: 12.5%;">
											<a href="#" class="dataTable">내용</a>
										</th>
									</tr>
								</thead>
								<tbody id="listBody">
									<c:choose>
										<c:when test="${not empty pagingVO.dataList }">
											<c:forEach items="${pagingVO.dataList}" var="royal">
												<tr>
													<td class="center">${royal.rnum}</td>
													<td class="left">${royal.fran_comnm}</td>
													<td class="center">
														${fn:substring(royal.bilclct_schde,0,4)}-${fn:substring(royal.bilclct_schde,4,6)}-${fn:substring(royal.bilclct_schde,6,8)}
													</td>
													<td class="center">
														<c:if test="${royal.bilclct_comde ne null}">
															${fn:substring(royal.bilclct_comde,0,4)}-${fn:substring(royal.bilclct_comde,4,6)}-${fn:substring(royal.bilclct_comde,6,8)}
														</c:if>
														<c:if test="${royal.bilclct_comde eq null}">
															미결재
														</c:if>
													</td>
													<td class="center">${royal.bilclct_sttus_code}</td>
													<td class="center">
														<c:if test="${royal.pay_se_code ne null}">
															${royal.pay_se_code}
														</c:if>
														<c:if test="${royal.pay_se_code eq null}">
															미결재
														</c:if>
													</td>
													<td class="center">
														<c:if test="${royal.bilclct_cn ne null}">
															<button type="button" class="btn btn-secondary block" data-bs-toggle="modal" data-bs-target="#contentModal" data-content="${royal.bilclct_cn}">보기</button>
														</c:if>
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="8">조건에 맞는 가맹비 리스트가 없습니다.</td>
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
<!--Basic Modal -->
<div class="modal fade text-left" id="contentModal" tabindex="-1" role="dialog"
    aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel1">가맹비 리스트의 내용</h5>
                <button type="button" class="close rounded-pill" data-bs-dismiss="modal" aria-label="Close">
                    <i data-feather="x"></i>
                </button>
            </div>
            <div class="modal-body">
                <p id="content"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary ml-1" data-bs-dismiss="modal">
                    <i class="bx bx-check d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">닫기</span>
                </button>
            </div>
        </div>
    </div>
</div>
<!--Basic Modal End-->
<form id="searchForm" action="${cPath}/head/bill/BillList">
	<input type="hidden" name="page" /> 
	<input type="hidden" name="selector" value=""/>
	<input type="hidden" name="searchNm" value="${pagingVO.searchMap.searchNm}"/>
	<input type="hidden" name="startDate" value="${pagingVO.searchMap.startDate}"/>
	<input type="hidden" name="endDate" value="${pagingVO.searchMap.endDate}"/>
	<input type="hidden" name="bscCode" value="${pagingVO.searchMap.bscCode}"/>
	<input type="hidden" name="pscCode" value="${pagingVO.searchMap.pscCode}"/>
</form>
	
<script type="text/javascript">
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

let pagingArea = $('#pagingArea').on('click', "a", function(event) {
	event.preventDefault();
	let page = $(this).data("page");
	if (page) {
		searchForm.find("[name='page']").val(page);
		searchForm.submit();
	}
	return false;
});

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
			$(resp.dataList).each(function(idx, royal) {
				var bilclct_comde = "-";
				if(royal.bilclct_comde != null){
					bilclct_comde = royal.bilclct_comde.substring(0,4)+"-"+royal.bilclct_comde.substring(4,6)+"-"+royal.bilclct_comde.substring(6,8);
				}
				var pay_se_code = "-";
				if(royal.pay_se_code != null){
					pay_se_code = royal.pay_se_code;
				}
				var contentbtn = "-";
				if(royal.bilclct_cn != null){
					contentbtn = "<button type='button' class='btn btn-secondary block' data-bs-toggle='modal' data-bs-target='#contentModal' data-content='"+royal.bilclct_cn+"'>보기</button>";
				}
				let tr = $("<tr>").append(
						 $('<td>').attr("class", "center").html(royal.rnum),
						 $('<td>').attr("class", "left").html(royal.fran_comnm),
					  	 $('<td>').attr("class", "center").html(royal.bilclct_schde.substring(0,4)+"-"+royal.bilclct_schde.substring(4,6)+"-"+royal.bilclct_schde.substring(6,8)),
					  	 $('<td>').attr("class", "center").html(bilclct_comde),
					  	 $('<td>').attr("class", "center").html(royal.bilclct_sttus_code),
						 $('<td>').attr("class", "center").html(pay_se_code),
						 $('<td>').attr("class", "center").html(contentbtn)
					).data("royal", royal);
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
	
$(".resetBtn").on("click", function(){
	searchForm.clearForm();
	searchForm.submit();
})

$("#contentModal").on("show.bs.modal", function(event){
	var content = $(event.relatedTarget).data('content');
	$("#content").text(content);
});
</script> 