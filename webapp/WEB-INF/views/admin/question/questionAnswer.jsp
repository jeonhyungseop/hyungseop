
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
					<c:url value="/admin/question" var="questionList">

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



				<h4 class="card-title">${questionVO.ques_title } 답변 글쓰기</h4>
			<form action="${cPath }/admin/question/insert" id="boardForm"
					method="post">
						<button id="insert" class="btn btn-primary float-end pribtn"
						type="submit">저장</button>
							<input type="hidden" name="admin_email"
							value="wjsgudtjq3743@gmail.com" />
								<input type="hidden" name="ques_email"
							value="${questionVO.ques_email}" />


						<table class="table table-hover dataTable-table">
				<input type="hidden" name="ques_seq"
							value="${questionVO.ques_seq}" />
						<input type="hidden" name="answer_writer_id"
							value="${headanswervo.answer_writer_id}" />
					<tbody>

						<tr>
							<th>제목</th>
							<td><div class="input-group">
									<input class="form-control col-9 mr-3" type="text"
										name="answer_title" value="${headanswervo.answer_title }" />

									<form:errors path="answer_title" element="span"
										cssClass="error" />
								</div></td>


							<th>문의한 고객 이메일</th>
							<td>${questionVO.ques_email}</td>
						</tr>


						<tr>	
							<th>작성자</th>
							<td>${headanswervo.answer_writer_id }</td>

							<th>카테고리</th>
							<td>${questionVO.ques_cl_code}</td>
						</tr>
					</tbody>

					</table>
					
						<div class="card-body" style="height: 200px;">
					<table class="">
						<tbody>
							
							<textarea class="form-control" rows="5" cols="100"
									name="answer_cn" id="answer_cn">${headanswervo.answer_cn }안녕하세요.가맹점 통합 관리시스템 CFMS 입니다.</textarea>
								<form:errors path="answer_cn" element="span" cssClass="error" />
							
						</tbody>
					</table>


				</div>
				</form>

				
			</div>
			<!-- card-body 끝 -->
		</div>
		<!-- card 끝 -->
	</section>
</div>




<!-- 모달 -->



