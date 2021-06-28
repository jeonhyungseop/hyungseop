<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.06.01   진유리      최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="shortcut icon" type="image/x-icon" href="${cPath}/resources/images/favicon/favicon.ico"/>
<link rel="stylesheet" href="${cPath }/resources/assets/css/bootstrap.css">
<link rel="stylesheet" href="${cPath }/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${cPath }/resources/assets/css/app.css">
<link rel="stylesheet" href="${cPath }/resources/assets/css/pages/auth.css">
<script type="text/javascript" src="${cPath }/resources/js/jquery-3.6.0.min.js"></script>
<title>CFMS : 비밀번호찾기</title>
<style type="text/css">
	.form-check {
	    display: inline-flex;
	    min-height: 1.5rem;
	    padding-left: 1.7em;
	    margin-bottom: 1.125rem;
	    margin-right: 3%;
	}
	.mt-5 {
    	margin-top: 1.5rem!important;
	}
	.pwresult{
		color : black;
	}
	.fail{
		color : #58442a;
		font-weight: 700;
	    font-size: 1.3rem;
	}
	.tracking-in-expand {
		animation: tracking-in-expand 800ms cubic-bezier(0.215, 0.610, 0.355, 1.000) 100ms both;
		margin: 10% 0%;
   		font-size: 95%;
	}
	@keyframes tracking-in-expand {
	  0% {
	    letter-spacing: -0.5em;
	    opacity: 0;
	  }
	  40% {
	    opacity: 0.6;
	  }
	  100% {
	    opacity: 1;
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
                    <h1 class="auth-title">Find Password</h1>
                    <p class="auth-subtitle mb-3">Input your information and we will send password through email</p>
                    <form method="post" onkeypress="if(event.keyCode=='13'){event.preventDefault(); searchEvt();}"
                    id="pwForm">
                    	<div class="form-check">
						  <input class="form-check-input" type="radio" name="group" id="head" value="head" checked>
						  <label class="form-check-label" for="head"> 가맹본부 </label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="group" id="head_emp" value="head_emp">
						  <label class="form-check-label" for="head_emp">가맹본부 직원</label>
						</div>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="group" id="fran" value="fran">
						  <label class="form-check-label" for="fran">가맹점</label>
						</div>
                    	<div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" class="form-control form-control-xl" name="id" id="id" placeholder="아이디"/>
                            <div class="form-control-icon">
                               <i class="bi bi-emoji-smile"></i>
                            </div>
                        </div>
                    	<div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" class="form-control form-control-xl" name="name" id="name" placeholder="이름" maxlength="5"/>
                            <div class="form-control-icon">
                                <i class="bi bi-person"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" class="form-control form-control-xl" name="email" id="email" placeholder="이메일(@ 포함)"/>
                            <div class="form-control-icon">
                                <i class="bi bi-envelope"></i>
                            </div>
                        </div>
                        <div class="form-group position-relative has-icon-left mb-4">
                            <input type="text" class="form-control form-control-xl" name="phone" id="phone" placeholder="휴대전화번호 숫자 입력"/>
                            <div class="form-control-icon">
                                <i class="bi bi-phone"></i>
                            </div>
                        </div>
                        <button class="btn btn-primary btn-block btn-lg shadow-lg mt-5 sendBtn">Send</button>
                    </form>
                    <div class="text-center mt-5 text-lg fs-4">
                        <p class='pwresult'></p>
                    </div>
                    <div class="text-center mt-5 text-lg fs-4">
                        <p class='text-gray-600'>Remember your account? <a href="${cPath}/login" class="font-bold">Log in</a>.
                        </p>
                    </div>
                    <div class="text-center mt-5 text-lg fs-4">
                        <p class='text-gray-600'>Find Id? <a href="${cPath}/search/id" class="font-bold">Find Id</a>.
                        </p>
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
	    var group = $("input[name='group']:checked").val();
		
    	$(".sendBtn").on("click", function(event){
    		event.preventDefault();
    		
    		var group = $("input[name='group']:checked").val();
    		
    		if(group != "" && checkEmail() 
    			&& checkNm() && checkPhone()&&checkId()){
    			var params = $("#pwForm").serialize();
    			$.ajax({
       		        type:"POST",
       		        url: "${cPath}/search/pw" ,
       		        data : params,
       		        success : function(data) {
       		        	var result = data.result;
       		        	
       		            if (result == "NOTEXIST" || result == "FAIL") {
       		            	$(".pwresult").text("등록된 회원이 없습니다.");
       		            	$(".pwresult").attr("class", "pwresult fail");
       		            }else if (result == "SERVER") {
       		            	$(".pwresult").text("서버의 문제로 인해 다시 한번 시도해주세요.");
       		            	$(".pwresult").attr("class", "pwresult fail");
       		            }else if(result == "OK"){
       		            	$("#pwForm").remove();
       		            	$(".pwresult").attr("class", "pwresult tracking-in-expand");
       		            	$(".pwresult").text("메일을 통해 비밀번호를 확인해주세요.");
       		            }
       		        }
       		    }); 
    		}
    		
    	});  
    	
    	function checkId() {
    	    var id = $("#id").val();
    	    var oInput = $("#id");

    	    if (id == "") {
    	        setFocusToInputObject(oInput);
    	        return false;
    	    }

    	    var isID = /^[a-zA-Z0-9]{5,20}$/g;
    	    if (!isID.test(id)) {
    	        setFocusToInputObject(oInput);
    	        return false;
    	    }

    	    return true;
    	}
    	
    	function checkEmail(){
    		var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
    		var email = $("#email").val();
    		var oInput = $("#email");
    		
    		if(email == ""){
    			setFocusToInputObject(oInput);
	            return false;
    		}
    		if(email != "" && !regEmail.test(email)){
    			alert("이메일을 한번 더 확인해주세요.");
    			setFocusToInputObject(oInput);
	            return false;
    		}
    		
    		return true;
    	};
    	
    	function checkNm() {
	        var nonchar = /^[가-힣]{1,5}$/;
	        var name = $("#name").val();
	        var oInput = $("#name");
	        
	        if (name == "") {
	            setFocusToInputObject(oInput);
	            return false;
	        }
	        if (name != "" && !nonchar.test(name)) {
	            setFocusToInputObject(oInput);
	            return false;
	        }
	    	
	        return true;
	    }
    	
    	function checkPhone(){
    		var phone = $("#phone").val();
			var regPhone =  /^(01[016789]{1})([0-9]{3,4})([0-9]{4})$/;;
			var oInput = $("#phone");
			
		 	if (phone == "") {
	            setFocusToInputObject(oInput);
	            return false;
	        }
			if(phone != "" && !regPhone.test(phone)){
				alert("숫자만 입력가능합니다. -는 입력 불가능합니다.")
				setFocusToInputObject(oInput);
				return false;
			}
			
			return true;
    	}
    	
    	function setFocusToInputObject(obj) {    
    	    obj.focus();
    	}
    </script>
</body>
</html>


