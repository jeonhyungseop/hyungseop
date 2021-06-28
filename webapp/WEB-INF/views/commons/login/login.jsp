<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.05.31   진유리      최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CFMS : Login</title>
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${cPath}/resources/images/favicon/favicon.ico"/>
<link rel="stylesheet" href="${cPath }/resources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${cPath }/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${cPath }/resources/assets/css/app.css">
<link rel="stylesheet" href="${cPath }/resources/assets/css/pages/auth.css">
<script type="text/javascript" src="./resources/js/jquery-3.6.0.min.js"></script>
<style type="text/css">
	.logbtn{
		width : 160px;
	}
	.forgot{
		display : inline-flex;
	}
	.group{
		margin : 5% 0%;
	}
	.group input[name='group']{
		margin : 0% 2%;
	}
	.error{
		color : red;
		font-size: medium;
	}

</style>
</head>
<body>
    <div id="auth">

        <div class="row h-100">
            <div class="col-lg-5 col-12">
                <div id="auth-left">
                    <div class="auth-logo">
                        <a href="${cPath}/login"><img src="${cPath}/resources/images/logo/cfmslogo_width.png" alt="Logo"></a>
                    </div>
                    <h1 class="auth-title">Log in.</h1>
                    <p class="auth-subtitle mb-5">Log in with your data that you entered during registration.</p>
					
                    <c:set var="check" value="${cookie.idCookie.value}" />
                    <form action="${cPath}/loginCheck" method="post" id="loginForm" >
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" class="form-control form-control-xl" name="id" placeholder="Id" value="${check}">
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="password" class="form-control form-control-xl" name="pass" placeholder="Password"/>
                            <div class="form-control-icon">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                        </div>
                        <div class="form-check form-check-lg d-flex align-items-end">
	                        <c:choose>
	                        	<c:when test="${not empty check}">
	                        		<input class="form-check-input me-2" type="checkbox"  id="rememberId" name="remember-id"
	                            		value="remember-id" checked/>
	                        	</c:when>
	                            <c:otherwise>
	                            	<input class="form-check-input me-2" type="checkbox"  id="rememberId" name="remember-id"
	                            		value="remember-id"/>
	                            </c:otherwise>
	                        </c:choose>
                            <label class="form-check-label text-gray-600" for="remember-id">
                                Remember Id
                            </label>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <input type="submit" class="btn btn-primary btn-block btn-lg shadow-lg mt-5 loginbtn" value="Log In"/>
                    </form>
                    <div class="text-center mt-5 text-lg fs-4">
                         <c:if test="${not empty errorMessage}"><p class="error">${errorMessage}</p></c:if>
                         <c:remove var="errorMessage" scope="session"/>
                    </div> 
                    <div class="text-center mt-5 text-lg fs-4">
                        <p class="text-gray-600">Don't have an account? 
                        	<a href="${cPath }/sign/stipulation" class="font-bold">Signup</a>.
                        </p>
                        <div class="forgot">
	                        <p><a class="font-bold" href="${cPath}/search/id">Find Id</a></p>
	                        <p>&nbsp;&nbsp;/&nbsp;&nbsp;</p>
	                        <p><a class="font-bold" href="${cPath}/search/pw">Find Password</a></p>
						</div>
						<div>
							<button id="admin" class="btn btn-primary">관리자</button>
							<button id="head" class="btn btn-primary">가맹본부</button>
							<button id="fran" class="btn btn-primary">가맹점</button>
							<button id="emp" class="btn btn-primary">직원</button>
							<button id="emp_Personnel" class="btn btn-primary">인사팀</button>
						</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 d-none d-lg-block">
                <div id="auth-right">

                </div>
            </div>
        </div>
    </div>
<script type="text/javascript">
	$(".loginbtn").on("click", function(){
		$("#loginForm").submit();
	});
	
	let loginForm = $("#loginForm");
	$("#admin").on("click", function () {
		loginForm.find("input[name='id']").val("ADMIN");
		loginForm.find("input[name='pass']").val("java");
		loginForm.submit();
	})
	$("#head").on("click", function () {
		loginForm.find("input[name='id']").val("HEAD1");
		loginForm.find("input[name='pass']").val("java");
		loginForm.submit();
	})
	$("#fran").on("click", function () {
		loginForm.find("input[name='id']").val("HTC0100001");
		loginForm.find("input[name='pass']").val("java");
		loginForm.submit();
	})
	
	$('#emp').on('click', function(){
		loginForm.find("input[name='id']").val("HTC01E1");
		loginForm.find("input[name='pass']").val("java");
		loginForm.submit();
	})

	$('#emp_Personnel').on('click', function(){
		loginForm.find("input[name='id']").val("HTC01E4");
		loginForm.find("input[name='pass']").val("java");
		loginForm.submit();
	})
</script>
</body>
</html>