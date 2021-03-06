
<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* ${date}      작성자명      최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">
<link rel="stylesheet"
	href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<style>
.dataArea {
	height: 300px;
}

#infoArea, #listArea {
	display: flex;
	justify-content: space-between;
	align-items: center;
}
/* #listArea  { */
/* 	height: 410px; */
/* } */
#selectListArea {
	width: 59%;
}

#chartArea {
	width: 69%;
}

#selectShowArea {
	width: 39%;
}

#statisticsArea {
	width: 30%;
}

.searchInputLeft {
	width: 75%;
	display: flex;
}

.searchInputRight {
	width: 25%;
}

.searchInputArea {
	display: flex;
	align-items: center;
}

.inputStyle {
	width: 100%;
	margin: 0.5rem 0.2rem;
	border: 1px solid #ddd;
	color: #888;
}

#selectShowArea {
	padding: 1.0rem;
}

#showArea {
	background-color: #f5ebe7;
	width: 100%;
	height: 338px;
	color: #876767;
	text-align: center;
	border-radius: 10px;
	padding: 30%;
}

.card-header .row {
	margin: 0;
}

.rowHead {
	display: flex;
	width: 100%;
	align-items: center;
}

.rowLeft {
	width: 100%;
}

.rowLeft h6 {
	margin: 10px;
}

.rowRight {
	width: 50%;
}

#statisticsTable {
	margin-top: -43px;
	border-top: 1px solid #fff;
}

#statisticsTable tr:first-child {
	font-weight: bold;
	font-size: 25px;
	color: #876767;
}

#statisticsTable td {
	height: 35px
}

.card {
	margin-bottom: 10px;
}

#table1 {
	font-size: 14px;
}

.colum {
	margin: 5px;
	width: 25%;
}

.targetInput {
	border: 1px solid #ddd;
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

						<h4 class="card-title">${board.board_title }상세보기</h4>

					</div>
					<%-- 	<div class="rowRight">
							<div class="btnArea ">
								<c:if test="${not empty respValue }">
									<c:forEach items="${respValue.chargeFranCode }" var="list">
										<c:if test="${list eq franCode}"> 
											<button type="button"class="btn btn-primary float-end pribtn block" data-bs-toggle="modal" data-bs-target="#targetMoneyModal">목표매출 등록</button>
										</c:if>
									</c:forEach>
								</c:if>
								<button type="button"class="btn btn-primary float-end pribtn" id="backList">목록으로</button>
								<button type="reset" id="reset" class="resetBtn icon dripicons-clockwise float-end"></button>
							</div>
						</div> --%>
				</div>
					<c:url value="/fran/notice" var="noticeList">
					</c:url>


					<a href="${noticeList}" class="btn btn-primary float-end pribtn">목록</a>
			</div>
			<!-- card-header 끝 -->
			<!-- card-body 영역 -->
			<div class="card-body">

				<!-- 차트 및 통계 데이터 조회내역 -->




				<table class="table table-hover dataTable-table">

					<tbody>

						<tr>
							<th>제목</th>
							<td>${board.board_title}</td>

							<th>조회수</th>
							<td>${board.board_hit }</td>
						</tr>


						<tr>
							<th>작성자</th>
							<td>${board.board_writer}</td>
							<th>첨부파일</th>
							<td><c:if test="${not empty board.attatchList }">
									<c:forEach items="${board.attatchList }" var="attatch">
										<c:choose>

											<c:when test="${adminauth eq 'ok'}">
												<c:url value="/admin/notice/download" var="downloadURL">
													<c:param name="what" value="${attatch.att_fileno }" />
												</c:url>
											</c:when>

											<c:otherwise>
												<c:url value="/head/notice/download" var="downloadURL">
													<c:param name="what" value="${attatch.att_fileno}" />
												</c:url>
											</c:otherwise>

										</c:choose>
										<a href="#" class="download"> <i class="bi bi-download"></i>
											<span data-attno="${attatch.att_fileno }"
											data-attseq="${attatch.att_seq }">${attatch.file_nm}</span>
										</a>

									</c:forEach>
								</c:if></td>
						</tr>
					</tbody>

				</table>

				<div id="chartArea">
					<div id="chart"></div>
				</div>

			</div>
			<!-- card-body 끝 -->
		</div><!-- card 끝 -->
		
		<!-- card 영역 -->
			<div class="card">
			<!-- card-header 영역 -->
		
		
			<!-- card-body 영역 -->
			<div class="card-body"style="height: 500px;">

				<!-- 차트 및 통계 데이터 조회내역 -->




				<table class="table table-hover dataTable-table">

					<tbody>
						
							<h>${board.board_cn}</h>
						
						
					


					
					</tbody>

				</table>

				<div id="chartArea">
					<div id="chart"></div>
				</div>

			</div>
			<!-- card-body 끝 -->
		</div>
		<!-- card 끝 -->
	</section>
</div>




<!-- 모달 -->


<form id="downloadForm" action="${cPath }/fran/notice/download"
	method="post"></form>
<script type="text/javascript">
	let downloadForm = $("#downloadForm");
	$(".download")
			.on(
					"click",
					function(event) {
						event.preventDefault();
						let fileSpan = $(this).find("span:first");
						let attFileNo = fileSpan.data("attno");
						let attSeq = fileSpan.data("attseq");

						console.log(attFileNo);
						console.log(attSeq);

						downloadForm
								.append("<input type='hidden' class='fileDown' name='att_fileno' value='"+attFileNo+"'/>");
						downloadForm
								.append("<input type='hidden' class='fileDown' name='att_seq' value='"+attSeq+"'/>");

						downloadForm.submit();
						$(".fileDown").remove();

					});
	// const uri = $("#imageURI").val();
	// const encoded = encodeURI(uri);
	// $("#image").attr("src","/display?name=" + encoded)
	// console.log(decodeURI(encoded));
</script>

