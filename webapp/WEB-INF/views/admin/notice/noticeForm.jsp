
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
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!-- <link href="https://unpkg.com/filepond/dist/filepond.css" -->
<!-- 	rel="stylesheet"> -->
<!-- <link -->
<!-- 	href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css" -->
<!-- 	rel="stylesheet"> -->
<script type="text/javascript" src="${cPath }/resources/js/ckeditor/ckeditor.js">
</script>

<style>
.mybiplusbtn {
	float: right;
	width: 2.5rem;
	height: 2.5rem;
	margin-right: 10px;
}

.mybiminusbtn {
	float: right;
	width: 2.5rem;
	height: 2.5rem;
	margin-right: 10px;
}
</style>
<body>
	
	<section id="multiple-column-form">
		<div class="row match-height">
			<div class="col-12">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">공지 등록</h4>
					</div>
					
					<form:form modelAttribute="board" id="boardForm" method="post"
						enctype="multipart/form-data">
						<div class="card-body">
							<div class="card-content">
								<div class="row">
									<div class="col-md-6 col-12 d-flex justify-content-first">
									<c:choose>
									<c:when test="${adminauth eq 'ok'}">
										<c:url value="/admin/notice" var="noticeList">									
										</c:url>
											<a href="${noticeList }"
											class="btn btn-primary me-1 mb-1 pribtn">목록으로</a>
									</c:when>
									<c:when test="${authok eq 'OK'}">
										<c:url value="/head/notice" var="noticeList">									
										</c:url>
											<a href="${noticeList }"
											class="btn btn-primary me-1 mb-1 pribtn">목록으로</a>
									</c:when>
									</c:choose>
									
									</div>
									<div class="col-md-6 col-12 d-flex justify-content-end">

										<button id="insert" class="btn btn-primary me-1 mb-1 pribtn"
											type="submit">저장</button>
									<c:url value="/admin/notice" var="noticeList">									
									</c:url>
									<a href="${noticeList}" class="btn btn-primary me-1 mb-1 pribtn">취소</a>
										
									</div>
								</div>
								<hr>

								<input type="hidden" name="board_seq" value="${board.board_seq }" />
								<input type="hidden" name="board_se_code"value="${board.board_tycode }">
								<input type="hidden" name="board_writer"value="${board.board_writer }">
								<c:if test="${update eq 'update' }">
									<input type="hidden" name="att_fileno"
										value="${board.att_fileno }">
								</c:if>
								<table class="table table-bordered">
									<tr>
										<th>제목</th>
										<td>
											<div class="input-group">
												<input class="form-control col-9 mr-3" type="text"
													name="board_title" value="${board.board_title }" />

												<form:errors path="board_title" element="span"
													cssClass="error" />
											</div>
										</td>
									</tr>
									<c:if test="${board.board_se_code eq 'A0001' }">
							
									</c:if>
										<tr>
											<th>작성자</th>
											<td>
												${board.board_writer}</td>
										</tr>
									<tr>
										<th>내용</th>
										<td><textarea class="form-control" rows="5" cols="100"
												name="board_cn" id="board_cn">${board.board_cn }<span>안녕하세요.가맹점 통합 관리시스템 CFMS 입니다.</span></textarea>
											<form:errors path="board_cn" element="span" cssClass="error" />
										</td>
									</tr>

								</table>
								</div>
							</div>
					</form:form>
				</div>
			</div>
		</div>

	</section>
	<script type="text/javascript">
		CKEDITOR.replace(
				"board_cn",
				{
					filebrowserImageUploadUrl : '${cPath}/head/notice/boardImage?type=Images'
				});

		 $(".fileArea").on("click", ".plusBtn" ,function(){
		 let source = $(this).parents("p:first");
		 let clone = source.clone();
		 clone.find("input").val("");
		 $(this).parents(".fileArea:first").append(clone);
		 }); 
		 
		let boardForm = $("#boardForm");	
		$(".delBtn2").on("click", function(){
			let fileSpan = $(this).parents("span:first");
			let delAttNo = fileSpan.data("attno");
			let newInput = $("<input>").attr({
				"type" : "text",
				"name" : "delAttNos"
			}).val(delAttNo);

			boardForm.append(newInput);
			fileSpan.hide();
		});
		
		$(".delBtn").on("click", function() {
			let fileSpan = $(this).parents("span:first");
			let delAttNo = fileSpan.data("attno");
			let newInput = $("<input>").attr({
				"type" : "text",
				"name" : "delAttNos"
			}).val(delAttNo);

			boardForm.append(newInput);
			fileSpan.hide();
		});

		$(".goBtn").on("click", function() {
			let url = $(this).data("gopage");
			if (url)
				location.href = url;
		});
	</script>