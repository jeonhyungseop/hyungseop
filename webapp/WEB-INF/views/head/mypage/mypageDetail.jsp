    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* ${date}      작성자명      최초작성
* 2021.06.08   진예은         직원상세조회
* 2021. 6. 9   진예은         직원퇴사, 수정
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
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
	height: 53px;
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
	margin-left: 129px;
}

.bankSelect{
	width: 200px;
	display: inline-block;
}

.banknum{
	width: 65%;
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

.row>*{
	width: 50%;
}

.breadcrumb{
	float: right;
}

.ImageCard{

	width: 100%;
	background: #f3f3f3;
	height: 170px;
	padding-top: 1.5%;
	padding-left: 1%;
	margin-bottom: 40px;
}

.myImage{
	width: 10%;
	margin-top: -73px;
	margin-left: 10px;
}

.empName{
	display: inline-block;
	margin-left: 33px;
}

.nameMargin{
	margin-top: 15px;
	margin-bottom: -6px;
}

.empDetailTitle{
	font-weight: bold;
	font-size: 18px;
	color: #6a5c59;
	margin-left: 1%;
}

.card-header{
	padding-bottom: 0.1rem;
}

.table-hover{
	margin-left: 1%;
}

#main{
	padding-bottom: 0rem;
}

.bold{
	font-weight: bold;
	color: #6a5c59;
}

.myImage{
	object-fit: cover;
    object-position: top; /*정사각형이 아니라 직사각형일 경우 원 안에 보여지게 할 중심 이미지의 위치를 지정*/
    border-radius: 50%;/*사각형의 모서리 둥근 정도를 지정하는 속성인데 50%를 지정하면 완전한 원이 됨*/
    width: 130px; 
    height: 130px;
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
							<h4>직원 마이페이지</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">직원 마이페이지</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>	
				<!-- card-header 끝 -->
				<!-- card-body 영역 -->
					<div class="card-body">
					<div class="ImageCard">
						<c:choose>
							<c:when test="${employeeOne.att_fileno eq null}">
								<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>
							</c:when>
							<c:otherwise>
								<c:forEach items="${employeeOne.attachfileList}" var="attach" varStatus="status">
									<c:if test="${status.index eq 0}">
										<img class="myImage" alt="" src="data:image/jpeg;base64,${attach.file_img}">
									</c:if>
								</c:forEach>
							</c:otherwise>
						</c:choose>
						<div class="empName"> 
							<h4 class="nameMargin">${employeeOne.emp_nm }( ${employeeOne.emp_id} )</h4><br>
							<span class="bold">핸드폰번호 : ${employeeOne.emp_celno }</span><br>
							<span class="bold">이메일주소 : ${employeeOne.emp_email }</span>
						</div>
					</div>
					<span class="empDetailTitle">마이페이지</span>
					<input type="hidden" class="empId" value="${employeeOne.emp_id}">
					<table class="table table-hover">
					<%-- 	<tr>
							<th><span class="nones">*</span>직급</th>				
							<td>${employeeOne.emp_clsf_code }</td>				
						</tr> --%>
						<c:choose>
							<c:when test="${not empty employeeOne.deptList }">
								<c:forEach items="${employeeOne.deptList}" var="dept">
									<tr>
										<th><span class="nones">*</span>부서</th>				
										<td>${dept.dept_nm }</td>					
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
						<tr>
							<th><span class="nes"></span>직원구분</th>				
							<td>${employeeOne.emp_se_code }</td>						
						</tr>
						<tr>
							<th><span class="nes"></span> 주소</th>				
							<td>(${employeeOne.emp_zipno }) ${employeeOne.emp_baadd } ${employeeOne.emp_deadd }</td>					
						</tr>
						<tr>
							<th><span class="nones"></span>생년월일</th>				
							<td>${employeeOne.emp_birtday}</td>				
						</tr>
						<tr>
							<th><span class="nones"></span>전화번호</th>			
							<td>${employeeOne.emp_telno }</td>
						</tr>	
							<tr>
							<th><span class="nones"></span>은행</th>			
							<td>${employeeOne.emp_bnm}</td>
						</tr>
					
						<tr>
							<th><span class="nes"></span>계좌번호</th>				
							<td>${employeeOne.emp_bacc }</td>					
						</tr>
				</table>
				<a class="btn btn-primary floatRight register" type="submit" href="${cPath}/head/mypage/modify?what=${employeeOne.emp_id}">수정</a>
				<a href="#" id="delete" class="btn btn-secondary float-end"  data-bs-toggle="modal" data-bs-target="#defaultSize">퇴사</a>
				<a href="${cPath}/head/employee" class="btn btn-secondary floatRight" ><i class="bi bi-arrow-clockwise"></i>돌아가기</a>
					<!-- card-body 끝 -->
                </div>
    		<!-- card 끝 -->
    		</div>
    	</section>
    </div>
    
    
    
    
    <!--Modal default md size -->
    <div class="me-1 mb-1 d-inline-block">
        <!-- Button trigger for default modal -->


        <!--Default size Modal -->
        <div class="modal fade text-left" id="defaultSize" tabindex="-1"
            role="dialog" aria-labelledby="myModalLabel18" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable"
                role="document">
                <div class="modal-content">
                    <div class="modal-body">
                       
                       <div aria-labelledby="swal2-title" aria-describedby="swal2-content"
	class="swal2-popup swal2-modal swal2-icon-error swal2-show"
	tabindex="-1" role="dialog" aria-live="assertive" aria-modal="true"
	style="display: flex;">
	<div class="swal2-header">
		<ul class="swal2-progress-steps" style="display: none;"></ul>
		<div class="swal2-icon swal2-error swal2-icon-show"
			style="display: flex;">
			<span class="swal2-x-mark"> <span
				class="swal2-x-mark-line-left"></span> <span
				class="swal2-x-mark-line-right"></span>
			</span>
		</div>
		<div class="swal2-icon swal2-question" style="display: none;"></div>
		<div class="swal2-icon swal2-warning" style="display: none;"></div>
		<div class="swal2-icon swal2-info" style="display: none;"></div>
		<div class="swal2-icon swal2-success" style="display: none;"></div>
		<img class="swal2-image" style="display: none;">
		<h2 class="swal2-title" id="swal2-title" style="display: flex;">
			퇴사처리 하시겠습니까?
		</h2>
		<span>서류작업으로 퇴사처리가 완료된 이후 <br>&nbsp;프로그램에서 퇴사처리됩니다.</span>
		<button type="button" class="swal2-close"
			aria-label="Close this dialog" style="display: none;">×</button>
	</div>
	<div class="swal2-content">
		<div id="swal2-content" class="swal2-html-container"
			style="display: none;"></div>
		<input class="swal2-input" style="display: none;"><input
			type="file" class="swal2-file" style="display: none;">
		<div class="swal2-range" style="display: none;">
			<input type="range">
			<output></output>
		</div>
		<select class="swal2-select" style="display: none;"></select>
		<div class="swal2-radio" style="display: none;"></div>
		<label for="swal2-checkbox" class="swal2-checkbox"
			style="display: none;"><input type="checkbox"><span
			class="swal2-label"></span></label>
		<textarea class="swal2-textarea" style="display: none;"></textarea>
		<div class="swal2-validation-message" id="swal2-validation-message"></div>
	</div>
	<div class="swal2-actions">
		<div class="swal2-loader"></div>
		<button type="button" class="swal2-confirm swal2-styled delOK" aria-label=""
			style="display: inline-block;" >OK</button>
		<button type="button" class="swal2-deny swal2-styled" aria-label=""
			style="display: none;">No</button>
		<button type="button" class="swal2-cancel swal2-styled" aria-label=""
			style="display: none;">Cancel</button>
	</div>
	<div class="swal2-footer" style="display: none;"></div>
	<div class="swal2-timer-progress-bar-container">
		<div class="swal2-timer-progress-bar" style="display: none;"></div>
	</div>
</div>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
 <script>
 $('.delOK').on('click', function(){
	let empId = $('.empId').val();
	 
	$.ajax({
		url : "${cPath}/head/employee/delete",
		method : "post",
		data : {
			"_method" : "DELETE",
			"empId" : empId
		},
		dataType : "json",
		success : function(resp) {
			
			alert("성공")
			$('#defaultSize').modal("hide");
			
		},
		error : function(xhr, error, msg) {
			console.log(xhr);
			console.log(error);
			console.log(msg);
			alert("상태 : " + xhr.status);
		}
	});
	 
	 
 })
 </script>