
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

						<h4 class="card-title">${questionVO.ques_title } 상세보기</h4>
	
					</div>
				
				</div>
					<c:url value="/fran/question" var="questionList">

							</c:url>
							<a href="${questionList}"
								class="btn btn-primary float-end pribtn">목록</a>
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
				<div class="card-body" style="height: 200px;">
					<table class="">
						<tbody>
							<h>${questionVO.ques_cn}</h>
						</tbody>
					</table>


				</div>
			</div>
			<!-- card-body 끝 -->
		</div>
		<!-- card 끝 -->

		<!-- card 영역 -->
		<div class="card">
			<!-- card-header 영역 -->


			<!-- card-body 영역 -->

			<div class="card-body" style="height: 430px;">
			
			
					
					<!-- 차트 및 통계 데이터 조회내역 -->



					<h4 class="card-title">${questionVO.ques_title } 답변내용</h4>



					<table class="table table-hover dataTable-table">

					<tbody>

						<tr>
							<th>제목</th>
							<td>${answerVO.answer_title }</td>


							<th>작성날짜</th>
							<td>${answerVO.answer_dt}</td>
						</tr>


						<tr>
							<th>작성자</th>
							<td>${answerVO.answer_writer_id}</td>

							<th>카테고리</th>
							<td>${questionVO.ques_cl_code}</td>
						</tr>
					</tbody>

					</table>
					
						<div class="card-body" style="height: 200px;">
					<table class="">
						<tbody>
							<h>${answerVO.answer_cn}</h>
						</tbody>
					</table>


				</div>

				
			</div>
			<!-- card-body 끝 -->
		</div>
		<!-- card 끝 -->
	</section>
</div>




<!-- 모달 -->



