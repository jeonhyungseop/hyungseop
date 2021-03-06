
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
			<form id="answer" action="${cPath }/head/question/insert">
				<input type="hidden" name="ques_cl_code"
					value="${questionVO.ques_cl_code}" /> <input type="hidden"
					name="ques_title" value="${questionVO.ques_title}" /> <input
					type="hidden" name="ques_cn" value="${questionVO.ques_cn}" /> <input
					type="hidden" name="ques_dt" value="${questionVO.ques_dt}" />
			</form>
			<!-- card-header 영역 -->
			<div class="card-header">
				<div class="row">
					<div class="rowLeft">

						<h4 class="card-title">${questionVO.ques_title }상세보기</h4>

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
				<c:choose>
					<c:when test="${questionVO.ques_sttus_code eq '답변준비중'}">
						<c:url value="/head/question/delete" var="deleteList">
							<c:param name="what" value="${questionVO.ques_seq }" />

						</c:url>

						<c:url value="/head/question/update" var="updateList">
							<c:param name="what" value="${questionVO.ques_seq }" />
						</c:url>
						<c:url value="/head/question" var="questionList">

						</c:url>
						<c:url value="/head/question/insert" var="questioninsert">
							<c:param name="what" value="${questionVO.ques_seq }" />
						</c:url>

						<a href="${questionList}" class="btn btn-primary float-end pribtn">목록</a>
						<a href="${questioninsert}"
							class="btn btn-primary float-end pribtn">답변</a>
					</c:when>
					<c:when test="${questionVO.ques_sttus_code eq '답변완료'}">
						<c:url value="/head/question" var="questionList">

						</c:url>
						<a href="${questionList}" class="btn btn-primary float-end pribtn">목록</a>
					</c:when>

				</c:choose>
			</div>
			<!-- card-header 끝 -->
			<!-- card-body 영역 -->
			<div class="card-body">

				<!-- 차트 및 통계 데이터 조회내역 -->




				<table class="table table-hover dataTable-table">

					<tbody>

						<tr>
							<th>제목</th>
							<td>${questionVO.ques_title}</td>


							<th>작성날짜</th>
							<td>${questionVO.ques_dt}</td>
						</tr>


						<tr>
							<th>작성자</th>
							<td>${questionVO.ques_writer}</td>
							
							<th>카테고리</th>
							<td>${questionVO.ques_cl_code}</td>
						</tr>
					</tbody>

				</table>

				<div id="chartArea">
					<div id="chart"></div>
				</div>

			</div>
			<!-- card-body 끝 -->
		</div>
		<!-- card 끝 -->

		<!-- card 영역 -->
		<div class="card">
			<!-- card-header 영역 -->


			<!-- card-body 영역 -->
			<div class="card-body" style="height: 500px;">

				<!-- 차트 및 통계 데이터 조회내역 -->




				<table class="table table-hover dataTable-table">

					<tbody>

						<h>${questionVO.ques_cn}</h>






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


<form id="downloadForm" action="${cPath }/head/notice/download"
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

