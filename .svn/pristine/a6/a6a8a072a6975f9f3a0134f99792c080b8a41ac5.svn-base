<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">
<link rel="stylesheet"
	href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
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
						<h4>비밀번호 인증</h4>
					</div>
					<div class="rowRight">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">비밀번호 인증
									</li>
							</ol>
						</nav>

					</div>
					
				</div>
			</div>
			<!-- card-header 끝 -->
			<!-- card-body 영역 -->
			<div class="card-body">
				<!-- 검색 영역 -->
				
				<form method="post" class="empForm" >
				<button class="btn btn-primary float-end pribtn" type="submit">인증</button>
					<table class="table table-hover">

						<tr>
							<th style="text-align: center; width: 10%;"><span
								class="nes"></span> 비밀번호 입력</th>
							<td><input class="form-control formWidth pwdCheck"
								type="password" name="mem_pass" style="width: 30%;"> <span
								class="pwdspan checkspan"></span></td>
						</tr>


						</tr>

					</table>
				</form>




			</div>
			<!-- card-body 끝 -->
		</div>
		<!-- card 끝 -->
	</section>
</div>
<script type="text/javascript">
	$(function() {
		$('.register').on('click', function() {
			event.preventDefault();
			if ($('.pwdCheck').val() == "") {
				$('.pwdspan').text("비밀번호를 입력해주세요");

				return;
			}
			$('.empForm').submit();
		})
	})
</script>
