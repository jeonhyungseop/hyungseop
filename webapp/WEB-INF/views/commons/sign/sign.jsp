<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.05.25   진유리      최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login - Mazer Admin Dashboard</title>
<link rel="stylesheet" href="${cPath}/resources/css/join/join.css">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${cPath}/resources/images/favicon/favicon.ico"/>
<link rel="stylesheet" href="${cPath}/resources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${cPath}/resources/assets/css/app.css">
<script type="text/javascript" src="${cPath}/resources/js/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<title>CFMS : 회원가입</title>
<style type="text/css">
label {
	color: #384a8a;
}
.row { 
	--bs-gutter-x: 2.5rem; 
	--bs-gutter-y: 1.5rem;
	display: flex;
	flex-wrap: wrap;
	margin-top: calc(var(- -bs-gutter-y)*-1);
	margin-right: calc(var(- -bs-gutter-x)/-2);
	margin-left: calc(var(- -bs-gutter-x)/-2);
}
.btn_type {
	width: 100%;
	font-size: 30px;
}
.error_next_box {
	display: block;
    margin: 8px auto -2px;
    font-size: 12px;
    line-height: 15px;
    color: red;
}
.btn{
	width : 15%;
}
.form-body {
	background-color: #fff;
	padding: 30px;
	padding-top: 30px;
	border-radius: 20px;
	box-shadow: 0px 0px 30px 5px #bdbdbd;
}
.btn-primary.disabled, .btn-primary:disabled {
    color: #fff;
    background-color: #826767;
    border-color: #826767;
}
.important{
	color : red;
}
.explain{
	text-align: right;
}
</style>
</head>
<body>
	<div id="header" role="banner">
		<a href="${cPath}/login"><img class="h_logo" src="${cPath}/resources/images/logo/cfmslogo_width.png" alt="Logo"></a>
	</div>
	<!-- container -->
	<div id="container" role="main">
		<!-- content -->
		<div id="content">
			<form:form modelAttribute="head" id="joinForm" class="form form-horizontal" method="post" action="${cPath}/sign" 
			onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt();}" enctype="multipart/form-data">
				<input type="hidden" name="head_email" value="${head.head_email}">
				<input type="hidden" name="head_bizrno" value="${head.head_bizrno}">
				<input type="hidden" name="head_telno" value="${head.head_telno}">
				<div class="form-body">
					<div class="row">
						<div class="col-md-12 explain"><b class="important">*</b>는 필수 항목입니다.</div>
						<div class="col-md-2 join_title">
							<label>아이디<b class="important">*</b></label>
						</div>
						<div class="col-md-10 form-group">
							<input type="text" id="id" class="int normal" name="head_id" placeholder="아이디를 입력하세요."
							 maxlength="20" value="${head.head_id}"/> 
							<span class="error_next_box" id="idMsg" style="display: none" aria-live="assertive"></span>
						</div>

						<div class="col-md-2 join_title">
							<label>비밀번호<b class="important">*</b></label>
						</div>
						<div class="col-md-10 form-group">
							<input type="password" id="pswd1" name="head_pass" class="int normal" maxlength="16" value="${head.head_pass}"/> 
							<span class="error_next_box" id="pswd1Msg" style="display: none" aria-live="assertive"></span>
						</div>

						<div class="col-md-2 join_title">
							<label>비밀번호확인<b class="important">*</b></label>
						</div>
						<div class="col-md-10 form-group">
							<input type="password" id="pswd2" class="int normal" maxlength="16" />
							<span class="error_next_box" id="pswd2Msg" style="display: none" aria-live="assertive"></span>
						</div>

						<div class="col-md-2 join_title">
							<label>이메일<b class="important">*</b></label>
						</div>
						<div class="col-md-10 form-group email">
							<input type="text" class="int normal" id="email1"/> <span class="at">@</span>
							<input type="text" class="int normal" id="email2" readonly /> 
							<select class="form-select" id="emailselect">
								<option value="" selected>선택하세요</option>
								<option value="naver.com">네이버</option>
								<option value="gmail.com">지메일</option>
								<option value="nate.com">네이트</option>
								<option value="daum.net">다음</option>
								<option value="hanmail.com">한메일</option>
								<option value="9">직접입력</option>
							</select>
							<button id="sendemail" type="button" class="btn btn-primary btn-sm" disabled>이메일 인증</button>
						</div>
						
						<div class="col-md-2 join_title"></div>
						<div class="col-md-10 form-group auth">
							<input type="text" id="authNumber" class="int normal" placeholder="인증번호를 입력하세요." readonly />
							<button id="authEmail" type="button" class="btn btn-primary btn-sm" disabled>확인</button>
							<span class="error_next_box" id="authMsg" style="display: none" aria-live="assertive"></span>
						</div>

						<div class="col-md-2 join_title">
							<label>상호명(한글)<b class="important">*</b></label>
						</div>
						<div class="col-md-10 form-group">
							<input type="text" id="head_comnm" class="int normal" name="head_comnm" placeholder="스타벅스"
							 maxlength="30" value="${head.head_comnm}"/> 
							<span class="error_next_box" id="ComnmMsg" style="display: none" aria-live="assertive"></span>
						</div>

						<div class="col-md-2 join_title">
							<label>상호명(영문)<b class="important">*</b></label>
						</div>
						<div class="col-md-10 form-group">
							<input type="text" id="head_comnm_em" class="int normal" name="head_comnm_em" 
							placeholder="STARBUCKS" maxlength="50" value="${head.head_comnm_em}"/> 
							<span class="error_next_box" id="ComnmEmMsg" style="display: none" aria-live="assertive"></span>
						</div>

						<div class="col-md-2 join_title">
							<label>대표자명<b class="important">*</b></label>
						</div>
						<div class="col-md-10 form-group">
							<input type="text" id="head_nm" class="int normal" name="head_nm" placeholder="홍길동" value="${head.head_nm}"/>
						    <span class="error_next_box" id="NmMsg" style="display: none" aria-live="assertive"></span>
						</div>
						
						<div class="col-md-2 join_title">
							<label>휴대폰 번호<b class="important">*</b></label>
						</div>
						<div class="col-md-10 form-group phone">
							<select class="form-select" id="phone1">
								<option value="010" selected>010</option>
								<option value="011">011</option>
								<option value="016">016</option>
								<option value="017">017</option>
								<option value="018">018</option>
								<option value="019">019</option>
							</select>
							<span class="at">-</span>
							<input type="text" id="phone2" class="int normal" maxlength="4"/> 
							<span class="at">-</span>
							<input type="text" id="phone3" class="int normal" maxlength="4"/> 
							<span class="error_next_box" id="PhoneMsg" style="display: none" aria-live="assertive"></span>
						</div>
						
						<div class="col-md-2 join_title">
							<label>우편번호<b class="important">*</b></label>
						</div>
						<div class="col-md-10 form-group zip">
							<input type="text" id="head_zipno" class="int normal" name="head_zipno" value="${head.head_zipno}" readonly/>
							<input type="button" id="find_zipno" class="btn btn-primary btn-sm" value="우편번호 찾기"
							onclick="DaumPostcode();"/>
						</div>

						<div class="col-md-2 join_title">
							<label>주소<b class="important">*</b></label>
						</div>
						<div class="col-md-10 form-group address">
							<input type="text" id="head_baadd" class="int normal" name="head_baadd" placeholder="기본주소" value="${head.head_baadd}"
							 readonly/>
							<input type="text" id="head_deadd" class="int normal" name="head_deadd" placeholder="상세주소" value="${head.head_deadd}"/>
							<span class="error_next_box" id="adMsg" style="display: none" aria-live="assertive"></span>
						</div>

						<div class="col-md-2 join_title">
							<label>사업자 번호<b class="important">*</b></label>
						</div>
						<div class="col-md-10 form-group bizrno">
							<input type="text" id="head_bizrno1" class="int normal" maxlength="3"/> 
							<span class="at">-</span>
							<input type="text" id="head_bizrno2" class="int normal" maxlength="2"/> 
							<span class="at">-</span>
							<input type="text" id="head_bizrno3" class="int normal" maxlength="5"/> 
							<span class="error_next_box" id="BizrnoMsg" style="display: none" aria-live="assertive"></span>
						</div>

						<div class="col-md-3 join_title">
							<label>사업자 번호 파일<b class="important">*</b></label>
						</div>
						<div class="col-md-9 form-group">
							<input name="head_files" id="bizrnoFile" type="file" value="${head.head_files}"/>
							<span class="error_next_box" id="BizrnoFileMsg" style="display: none" aria-live="assertive"></span>
						</div>

						<div class="col-md-2 join_title">
							<label>업종코드<b class="important">*</b></label>
						</div>
						<div class="col-md-10 form-group induty_code">
							<select name="induty_code" class="form-select">
							    <c:if test="${not empty IdcCode }">
                            		<c:forEach items="${IdcCode.comCodeList }" var="idc">
                             			<option value="${idc.com_code }">${idc.com_code_nm }</option>
                             		</c:forEach>
                             	</c:if>
							</select>
						</div>
						
						<div class="btn_area double col-sm-12 d-flex justify-content-end">
							<button id="btnJoin" type="submit" class="btn_type btn_primary">Join</button>
						</div>
					</div>
				</div>
			</form:form>
		</div>
		<!-- content end-->
	</div>
	<!-- container end-->
<script type="text/javascript" src="${cPath}/resources/js/join/sign.js"></script>
</body>
</html>