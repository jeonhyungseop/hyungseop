
    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* ${date}      작성자명      최초작성
*  2021.6.7    진예은         직원등록
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">    
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<style>
.dataArea {
    height: 550px;
}

.profileArea{
	width : 300px;
	text-align: center;
	
}

.img{
	width: 150px;
	height: 150px;
	border-radius: 28px;
	background: #dad4d4;
	margin-left: 35%;
}

.userAdd{
	width: 100px;
	height: 100px;
	margin: 19px;
}

.h4text{
	font-weight: bold;
	font-size: 18px;
	color: #6b5050;
}

th{
	width: 150px;
	text-align: left;
	vertical-align: middle;
}

td{

	width: 300px;
}
.postnum{
	width: 200px;
	display: inline-block;
}

#address{
	width: 73%;
	display: inline-block;
}

#detailAddress{
	width: 26%;
	display: inline-block;
}

.nes{
	color: #f3955e;
}

.floatRight{
	float: right;
	padding-top: 6px;
}

.photo{
	margin-top: 12px;
	width: 50%;
	margin-left: 165px;
}

.bankSelect{
	width: 200px;
	display: inline-block;
}

.banknum{
	width: 61%;
	display: inline-block;
}

.nones{
	color: white;
}

.btn-secondary{
	height: 38px;
	margin-right: 5px;
}

.bi-arrow-clockwise::before{
	padding-top : 3px;
}

.formWidth{
	width: 100%;
}

.checkspan{
	color: red;
	margin-top: 2px;
}

#preview-image{
	border: 1px solid #826767;
	object-fit: cover;
    object-position: top; /*정사각형이 아니라 직사각형일 경우 원 안에 보여지게 할 중심 이미지의 위치를 지정*/
	margin-top: 3%;
	width: 30px;
	height: 300px;
}
.table-hover>tbody>.profileTR:hover{
--bs-table-accent-bg : rgb(255 255 255 / 0%);

}

</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div id="app">
    	<section class="section">
    		<!-- card 영역 -->
    		<div class="card">
    			<!-- card-header 영역 -->
				<div class="card-header">
					<div class="row">
						<div class="rowLeft">
							<h4>직원수정</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">직원수정</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>	
				<!-- card-header 끝 -->
				<!-- card-body 영역 -->
					<div class="card-body">
					<form:form  method="post" enctype="multipart/form-data" class="empForm" action="${cPath}/head/mypage/modify">
					<input class="form-control formWidth" type="hidden" name="emp_se_code" value="${employeeOne.emp_se_code}" >
					<table class="table table-hover">
						<tr class="profileTR">
							<td rowspan="14" class="profileArea">
							<div class="image-container ">
						 		<c:choose>
									<c:when test="${employeeOne.att_fileno eq null}">
									<%-- 	<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'> --%>
									<img style="width: 350px;" id="preview-image" src="${cPath}/resources/images/logo/profileIMG.jpg">
									</c:when>
									<c:otherwise>
										<c:forEach items="${employeeOne.attachfileList}" var="attach" varStatus="status">
											<c:if test="${status.index eq 0}">
												<img style="width: 250px;" id="preview-image" class="myImage" alt="" src="data:image/jpeg;base64,${attach.file_img}">
											</c:if>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								
								
								 <input class="form-control photo" name="emp_files" style="display: block;" type="file" id="input-image">
							</div>
								
								<!-- <input class="form-control photo" type="file" name="emp_files"> -->
								<input type=hidden name="att_fileno" value="${employeeOne.att_fileno }">
								
								
							</td>
						</tr>
						<tr>
							<th><span class="nes"></span> 이름</th>				
							<td><input class="form-control formWidth nameCheck" type="text" name="emp_nm" value="${employeeOne.emp_nm }">
								<span class="namespan checkspan"></span>
								<input type="hidden" name="emp_id" value="${employeeOne.emp_id}">
							</td>				
						</tr>
				 
						<tr>
							<th><span class="nones"></span>생년월일</th>				
							<td><input class="form-control formWidth birthCheck" type="date" name="emp_birtday" value="${employeeOne.emp_birtday }">
								<span class="checkspan birthspan"></span>
							</td>				
						</tr>
						<tr>
							<th><span class="nes"></span> 우편번호</th>				
							<td>
								<input type="text" class="form-control postnum" id="postcode"placeholder="우편번호" name="emp_zipno" value="${employeeOne.emp_zipno}"/>
								<input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="btn btn-primary"/>
								<span class="postspan checkspan"></span>
							</td>				
						</tr>
						<tr>
							<th><span class="nes"></span> 주소</th>				
							<td>
								<input type="text" class="form-control" id="address" placeholder="주소" name="emp_baadd" value="${employeeOne.emp_baadd}"/>
								<input type="text" class="form-control" id="detailAddress" placeholder="상세주소" name="emp_deadd" value="${employeeOne.emp_deadd}"/>
								<span class="addressspan checkspan"></span>
							</td>				
						</tr>
						<tr>
							<th><span class="nes"></span>이메일</th>				 
							<td><input class="form-control emailCheck formWidth" type="text" name="emp_email" value="${employeeOne.emp_email }">
								<span class="emailspan checkspan"></span>
							</td>				
						</tr>
						<tr>
							<th><span class="nones"></span>전화번호</th>			
							<td><input class="form-control telCheck formWidth" type="text" name="emp_telno" placeholder="- 제외하고 입력" value="${employeeOne.emp_telno }">
								<span class="telspan checkspan"></span>
							</td>
						</tr>	
						<tr>
							<th><span class="nes"></span>핸드폰 번호</th>				
							<td><input class="form-control celCheck formWidth" type="text" name="emp_celno" placeholder="- 제외하고 입력" value="${employeeOne.emp_celno }">
								<span class="celspan checkspan"></span>
							</td>	
						</tr>
					<%-- 	<tr>
							<th><span class="nes">*</span>입사일자</th>				
							<td><input class="form-control formWidth hiredateCheck" type="date" name="emp_encpn" value="${employeeOne.emp_encpn}" disabled="disabled">
								<span class="checkspan hiredatespan"></span>
							</td>				
						</tr> --%>
						
						<tr>
							<th><span class="nes"></span>계좌번호</th>				
							<td>
								<select class="form-control bankSelect" name="emp_bnm">
									<option value="${employeeOne.emp_bnm}">${employeeOne.emp_bnm}</option>
									<option value="KB국민은행">KB국민은행</option>
									<option value="KEB하나은행">KEB하나은행</option>
									<option value="신한은행">신한은행</option>
									<option value="우리은행">우리은행</option>
									<option value="NH농협">NH농협</option>
									<option value="IBK기업은행">IBK기업은행</option>
									<option value="KDB산업은행">KDB산업은행</option>
									<option value="한국씨티은행">한국씨티은행</option>
								</select>
								<input class="form-control banknum" type="text" name="emp_bacc" placeholder="계좌번호 -제외하고 입력" value="${employeeOne.emp_bacc}">
								<span class="banknumspan checkspan"></span>
							</td>				
						</tr>
				</table>
				<button class="btn btn-primary floatRight register" type="submit">저장</button>
				<a href="${cPath}/head/mypage" class="btn btn-secondary floatRight" ><i class="bi bi-arrow-clockwise"></i>돌아가기</a>
				</form:form>
					<!-- card-body 끝 -->
                </div>
    		<!-- card 끝 -->
    		</div>
    	</section>
    </div>
   
 <script type="text/javascript">
 
 function readImage(input) {
	    // 인풋 태그에 파일이 있는 경우
	    if(input.files && input.files[0]) {
	        // 이미지 파일인지 검사 (생략)
	        // FileReader 인스턴스 생성
	        const reader = new FileReader()
	        // 이미지가 로드가 된 경우
	        reader.onload = e => {
	            const previewImage = document.getElementById("preview-image")
	            previewImage.src = e.target.result
	        }
	        // reader가 이미지 읽도록 하기
	        reader.readAsDataURL(input.files[0])
	    }
	}
	// input file에 change 이벤트 부여
	const inputImage = document.getElementById("input-image")
	inputImage.addEventListener("change", e => {
	    readImage(e.target)
	})
 
 $(function(){
	//검증
	
	//이름 체크
	 $('.nameCheck').on('keyup', function(){
		 
		 let nameCheck = $('.nameCheck').val();
		 if(nameCheck.length < 3 || 5 < nameCheck.length){
			 $('.namespan').text('3~5자리로 입력해주세요');
			 return;
		 
		 }else{
			 $('.namespan').empty();
			 
		 }
 		 
		 regname = /^[가-힣]{2,5}$/
		 
		 if(regname.test(nameCheck)){

		 }else{
			$('.namespan').text("올바른 형식이 아닙니다!");
		} 
		 
	 })
	 
	 //비밀번호 체크
	 $('.pwdCheck').on('keyup', function(){
		 
		 let pwdCheck = $('.pwdCheck').val();
		 if(pwdCheck.length < 8 || 12 < pwdCheck.length){
			$('.pwdspan').text("8~12자리로 입력해주세요!!");
			return;
		}else{
			$('.pwdspan').empty();
		}
		 
		//형식 : 영문 대소문자 숫자 특수문자가 반드시 하나씩 8~12입력
		passreg = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[~!@#$%^&*()]).{8,12}$/;
		
		if(passreg.test(pwdCheck)){

		}else{
			$('.pwdspan').text("올바른 형식이 아닙니다!");
		}
		 
		 
		 
	 })
	 
	 //생년월일 체크
	 $('.birthCheck').on('change', function(){
		
		let birthCheck = $('.birthCheck').val();
		birth = new Date(birthCheck);
		today = new Date();
		 
		toyear = today.getFullYear(); //2021
		biryear = birth.getFullYear();
		 
		year = toyear - biryear
		if(year < 20){
			$('.birthspan').text("20세 이상만 가능합니다.");
			
		}else{
			$('.birthspan').empty();
		}
		 
	 })
	 
	 //이메일체크
	 $(".emailCheck").on('keyup', function(){
		 
		let emailCheck = $('.emailCheck').val();
		 
		//형식 : 이메일 형식에 맞게 입력
		regmail = /^[a-zA-Z]+@[a-zA-Z0-9]+(\.[a-zA-Z0-9]+){1,2}$/;
		if(regmail.test(emailCheck)){
			$('.emailspan').empty();
		}else{
			$('.emailspan').text("올바른 형식이 아닙니다!");
		}
	 })
	 
	 
	 //전화번호체크
	 $('.telCheck').on('keyup', function(){
		 
		 let telCheck = $('.telCheck').val();
		 
		 //형식 : 휴대폰 형식과 맞게 입력
		 reghp = /^\d{3}\d{3}\d{4}$/
		 
		if(reghp.test(telCheck)){
			$('.telspan').empty();
		}else{
			$('.telspan').text("올바른 형식이 아닙니다!");
		}
	 
	 })
	 
	 
	 
	 //핸드폰번호체크
	 $('.celCheck').on('keyup', function(){
		
		 let celCheck = $('.celCheck').val();
		 
		 //형식 : 휴대폰 형식과 맞게 입력
		 reghp = /^\d{3}\d{4}\d{4}$/
		 
		 if(reghp.test(celCheck)){
			$('.celspan').empty();
		}else{
			$('.celspan').text("올바른 형식이 아닙니다!");
		}
		 
		 
	 })
	 
	 
	 $('.hiredateCheck').on('change', function(){
		 $('.hiredatespan').empty();
	 })
	 
	 $('.empSeCheck').on('change', function(){
		 $('.empSespan').empty();
	 })
	 
	 $('.banknum').on('change', function(){
		 $('.banknumspan').empty();
	 })
	 
	 $('#postcode').on('propertychange change keyup paste input', function(){
		 $('.postspan').empty();
	 })
	 
	 
	 
	 
	 
	 
	 
	 $('.register').on('click', function(){
		 
		 event.preventDefault();
		 
		 if($('.nameCheck').val() == ""){
			 $('.namespan').text('이름을 입력해주세요');
			 
			 return;
		 }
		
		 if($('.pwdCheck').val() == ""){
			 $('.pwdspan').text("비밀번호를 입력해주세요");
			 
			 return;
		 }
		 
		 if($('#postcode').val() == ""){
			 $('.postspan').text("우편번호를 입력해주세요")
			 
			 return;
			 
		 }
		 
		 if($('#address').val() == ""){
			 $('.addressspan').text("주소를 입력해주세요")
			 
			 return;
		 }
		 
		 if($('.emailCheck').val() == ""){
			 $('.emailspan').text("이메일을 입력해주세요")
			 
			 return;
		 }

		 if($('.celCheck').val() == ""){
			 $('.celspan').text("핸드폰번호를 입력해주세요")
			 
			 return;
		 }

		 if($('.hiredateCheck').val() == ""){
			 $('.hiredatespan').text("입사일자를 입력해주세요")
			 
			 return;
		 }

		 if($('.empSeCheck').val() == ""){
			 $('.empSespan').text("직원구분을 선택해주세요")
			 
			 return;
		 }

		 if($('.banknum').val() == ""){
			 $('.banknumspan').text("계좌번호를 입력해주세요")
			 
			 return;
		 }
		 
		 $('.empForm').submit();
	 })
	 
	 
 })
 
 
 
 //전부체크 이벤트
 $("#checkAll").on("click", function() {
		console.log($("#listBody input[type='checkbox']"));
		if($(this).is(":checked")){
			$("#listBody input[type='checkbox']").prop("checked", true);
		}else{
			$("#listBody input[type='checkbox']").prop("checked", false);
		}
	});
 
 
 function DaumPostcode() {
		var width = 500;
		var height = 600;  
	    new daum.Postcode({
	    	width : width,
	    	height : height,
	    	submitMode : false,
	    	animation : true,
	    	theme: {
		            searchBgColor: "#6B5050", 
		            queryTextColor: "#FFFFFF" 
		        },
	        oncomplete: function(data) {
	            var addr = ''; 
	            var extraAddr = ''; 

	            if (data.userSelectedType === 'R') { 
	                addr = data.roadAddress;
	            } else {
	                addr = data.jibunAddress;
	            }

	            if(data.userSelectedType === 'R'){
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraAddr += data.bname;
	                }
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                if(extraAddr !== ''){
	                    extraAddr = ' (' + extraAddr + ')';
	                }
	               	
	                addr = addr + extraAddr ;
	            }else {
	            	addr = addr + '';
	            }
	            $('.postspan').empty();
	            $('.addressspan').empty();
	            document.getElementById('postcode').value = data.zonecode;
	            document.getElementById("address").value = addr;
	            document.getElementById("detailAddress").focus();
				
	        }
	    }).open({
	    	 popupName : 'postcodePopup',
	    	 left: (window.screen.width / 2) - (width / 2),
	    	 top: (window.screen.height / 2) - (height / 2)
	    });
	}
 
 
 

 </script>