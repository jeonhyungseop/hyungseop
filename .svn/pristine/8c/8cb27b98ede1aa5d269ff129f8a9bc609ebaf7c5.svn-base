<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021.5 .25    전형섭        페이징처리
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
.date {
	width : 49.7%;
	border : 1px solid #dce7f1;
	border-radius: 0.25rem;
	padding : 0.375rem;
	color : #607080;
}
.seq {display: none;}
</style>
<div id="app">
    	<section class="section">
    		<!-- card 영역 -->
    		<div class="card">
    			<!-- card-header 영역 -->
				<div class="card-header">
					<div class="row">
						<div class="rowLeft">
							<h4>공지사항 조회</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">공지조회</li>
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
						<input
														class="btn btn-primary float-end pribtn" id="searchBtn" type="button"
														value="검색" />
								<button type="reset" class="resetBtn icon dripicons-clockwise float-end"></button>
							</div>
							<div id="searchUI"
													>
							<table class="table table-borderd">
								<tbody class="talbeSearchArea">
									<tr>
										<th class="searchTh"  style="width: 10%;">
											분류
											</th>
											<td style="width: 40%;">
											<select name="searchType" class="form-select">
												<option value>전체</option>
												<option value="title">제목</option>
												<option value="writer">작성자</option>
												<option value="content">내용</option>
											</select>
											</td>
										<th class="searchTh"  style="width: 10%;">검색어</th>
										<td style="width: 40%;">
											<input class="form-control mr-2" type="text" name="searchWord"
											value="${pagingVO.searchMap.searchWord }" /> 
										</td>
									</tr>
										
									<tr>
										<th class="searchTh"  style="width: 10%;">등록일자</th>
										<td colspan="3" style="width: 46.6%;">
											<input class="inputText mr-2 date" type="date" name="minDate"
													value="${pagingVO.searchMap.minDate }" />
											<input class="inputText mr-2 date" type="date" name="maxDate"
													value="${pagingVO.searchMap.maxDate }" />
											
										</td>
										
									</tr>
									       
								</tbody>
							</table>
							</div>
						</form>
						<!-- 조회 영역 -->
						<div class="dataTable-container">
						
							<div class="dataArea">
								<table class="table table-hover dataTable-table" id="table1">
									<thead>
										<tr>
											<th data-sortable="" style="width: 20%;">
												<a href="#" class="dataTable">글번호</a>
											</th>
											<th data-sortable="" style="width: 20%;">
												<a href="#" class="dataTable">제목</a>
											</th>
											<th data-sortable="" style="width: 20%;">
												<a href="#" class="dataTable">작성자</a>
											</th>
											<th data-sortable="" style="width: 20%;">
												<a href="#" class="dataTable">작성날짜</a>
											</th>
											<th data-sortable="" style="width: 20%;">
												<a href="#" class="dataTable">조회수</a>
											</th>
										</tr>
									</thead>
									<tbody id="listBody">
										<c:choose>
												<c:when test="${not empty pagingVO.dataList }">
													<c:forEach items="${pagingVO.dataList }" var="board">
														<tr>
															<td>${board.rnum}</td>
															<td>${board.board_title }</td>
															<td>${board.board_writer }</td>
															<td>${board.board_time }</td>
															<td>${board.board_hit }</td>
														</tr>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="5">조건에 맞는 게시글이 없음.</td>
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
    
    <c:url value="/fran/notice" var="noticeURL"/>			
	<form id="searchForm" action="${noticeURL}">
		<input type="hidden" name="searchType"
			value="${pagingVO.searchMap.searchType }" /> <input
			type="hidden" name="searchWord"
			value="${pagingVO.searchMap.searchWord }" /> <input
			type="hidden" name="minDate"
			value="${pagingVO.searchMap.minDate }" /> <input
			type="hidden" name="maxDate"
			value="${pagingVO.searchMap.maxDate }" /> <input
			type="hidden" name="page" />
	</form>
 <script type="text/javascript">
 let searchUI = $("#searchUI");
	searchUI.find("[name='searchType']").val("${pagingVO.searchMap.searchType }");
	$("#searchBtn").on("click", function(){
		let inputs = searchUI.find(":input[name]");
		$(inputs).each(function(idx, input){
			let name = $(this).attr("name");
			let sameInput = searchForm.find("[name='"+name+"']");
			$(sameInput).val($(this).val());
		});
		searchForm.submit();
	});
 	
 	//페이징
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
				
			
				
					
				
				
				$(resp.dataList).each(function(idx, board){
				
						viewURLPtrn ="${cPath}/fran/notice/boardView.do?what=%d";
					
						
					let viewURL = viewURLPtrn.replace("%d", board.board_seq);
					let aTag = $("<a>").html(board.board_title)
					   .attr("href", viewURL);
					let tr = $("<tr>").append(
								  $("<td>").html(board.rnum)
								,  $("<td class='seq'>").addClass("center").html(board.board_seq)
								, $("<td>").html(aTag)
								, $("<td>").html(board.board_writer)
								, $("<td>").html(board.board_time)
								, $("<td>").html(board.board_hit)
								
							).data("board", board).css("cursor", "pointer");
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
	
	$(function () {
		$("#listBody").on("mouseenter", "a.nonsecret", function(){
			$(this).popover({
				html:true
				, content:function(){
					let url = this.href;
					let retValue = null;
					$.ajax({
						url : url,
						dataType : "text",
						success : function(resp) {
							console.log(1);
							retValue = resp;
						},
						async : false,
						cache : true,
						error : function(xhr, error, msg) {
							console.log(xhr);
							console.log(error);
							console.log(msg);
						}
					});
					console.log(2);
					return retValue;
				}
			}).popover("show")
		}).on("mouseout", "a.nonsecret", function(){
			$(this).popover("hide");
		});
	});
	   $(listBody).on("click",'tr',function(){
       	let board_seq = $(this).find('td:eq(1)').text();
       	location.href ="${cPath }/fran/notice/boardView?what="+ board_seq;       	
       }) 

 </script> 