<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 15      작성자명      최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">    
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<style>
.dataArea {
    height: 550px;
}

.vacationDIV{
	background: #826767;
	width: 100%;
	height: 100px;
	border-radius: 10px;
	color: white;
	padding-top: 24px;
}

.vacationTable td{
	width: 400px;
	text-align: center;
	border: 0px  white;
}	

.vacationTable{
	border: 0px solid white;
}

.sumVationday{
	background: #F2AB6D;
}

.useVacation{
	background: #D96E30;
}

.vacationH5{
	color: white;
}

.subVacation{
	background: #BF755A;
}

.vacationDis{
	display: inline-block;
}

.listTable{
	margin-top: 7%;
}

.vacationListDIV{
	height: 570px;
}

.vacBadge{
	background-color: #f7e9e2;
}

.vacationBTN{
	margin-top: 1%;
	margin-bottom: 1%;
}

.markerSpan{
	color: red;
}

.vacationStart, .vacationEnd{
	display: inline-block;
	width: 48%;
}

.vacationDaySelect{
	width: 27%;
	height: 42px;
	border-radius: 5px;
	border : 2px solid #826767;
	display: inline-block;
	text-align: center;
	padding-top: 1.5%;
}

.vacationregiTable{
	border: 1px solid white;
}

.vacationIMG{
	width: 50px;
	border-radius: 10px;
	display: inline-block;
	margin-right: 10px;
}

.vacationH5{
	display: inline-block;
	margin-top: 3px;
}

.vacationDis{
	
}

.Allday, .Halfday{
	cursor: pointer;
}

.Fontsmall{
	font-size: 12px;
}

.checkSpan{
	color: red;
	margin-left: 1px;
}

.daySpan{
	display: block;
}

.detailTable th{
	width: 20%;
	vertical-align: middle;
	height: 60px;
}

.myImage_vacation{
	object-fit: cover;
    object-position: top; /*정사각형이 아니라 직사각형일 경우 원 안에 보여지게 할 중심 이미지의 위치를 지정*/
    border-radius: 50%;/*사각형의 모서리 둥근 정도를 지정하는 속성인데 50%를 지정하면 완전한 원이 됨*/
    width: 45px; 
    height: 45px;
}

.bold{
	font-weight: bold;
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
							<h4>휴가관리</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">휴가관리</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>	
				<!-- card-header 끝 -->
				<!-- card-body 영역 -->
				<div class="card-body">
					<table class="table table-bordered vacationTable">
						<tr>
							<td>
								<div class="vacationDIV sumVationday">
									<img alt="" src="${cPath}/resources/images/logo/vacation01.jpg" class="vacationIMG">
									<h5 class="vacationH5">총 휴가일수</h5>
									<h3 class="vacationH5 vacationDis">${employeeVO.emp_base_vcde}</h3>
									<h5 class="vacationH5 vacationDis">개</h5>
								</div>
							</td>
							<td>
								<div class="vacationDIV useVacation">
									<img alt="" src="${cPath}/resources/images/logo/vacation02.jpg" class="vacationIMG">
									<h5 class="vacationH5">휴가 사용일 수</h5>
									<h3 class="vacationH5 vacationDis">${employeeVO.emp_minus}</h3>
									<h5 class="vacationH5 vacationDis">개</h5>
								</div>
							</td>
							<td>
								<div class="vacationDIV subVacation">
									<img alt="" src="${cPath}/resources/images/logo/vacation03.jpg" class="vacationIMG">
									<h5 class="vacationH5">휴가 잔여일 수</h5>
									<h3 class="vacationH5 vacationDis">${employeeVO.emp_remndr_vcde}</h3>
									<h5 class="vacationH5 vacationDis">개</h5>
								</div>
							</td>
						</tr>
					</table>
					<div class="vacationListDIV">
					<button type="button" class="btn btn-primary float-end pribtn searchBTN vacationBTN" data-bs-toggle="modal" data-bs-target="#vacationModal">휴가신청</button>
					<a href="${cPath}/head/vacation" type="button" id="goMap" class="btn btn-secondary vacationBTN float-end">휴가내역조회</a>

					<table class="table table-hover listTable">
						<thead>
                       		<tr>
                       			<th class="center">휴가항목</th>
                       			<th class="center">휴가구분</th>
                       			<th class="center">시작일자</th>
                       			<th class="center">종료일자</th>
                       			<th class="center">차감일수</th>
                       			<th class="center">상태</th>
                       		</tr>
                       	</thead>	
                       	<tbody id="listBody">
                       	</tbody>
					</table>
					</div>
        			 <div class="dataTable-bottom hideOption">
						<div class="dataTable-info">Showing ${pagingVO.startPage } to <span id="totalPage"></span> of <span id="currentPage"></span> entries</div>
					 </div>
					 <div id="pagingArea" class="d-flex justify-content-center">
						${pagingVO.pagingHTMLBS }
					 </div>
               	 </div>
					<!-- card-body 끝 -->
                </div>
    		<!-- card 끝 -->
    	</section>
    </div>
    
       <!-- 검색폼 -->
   <form id="searchForm" action="${cPath}/head/restList">
	   	<input type="hidden" name="selector" value="" />
	   	<input type="hidden" name="page" value="${pagingVO.currentPage }">
   </form>
   
   
   <!-- 휴가등록 모달 -->
    <!-- Vertically Centered modal Modal -->
    <form id="regiForm" method="post" action="${cPath}/head/restList">
    <div class="modal fade" id="vacationModal" tabindex="-1" role="dialog"
        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
            role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalCenterTitle">
                    	휴가신청
                    </h5>
                    <button type="button" class="close" data-bs-dismiss="modal"
                        aria-label="Close">
                        <i data-feather="x"></i>
                    </button>
                </div>
                <div class="modal-body">
                	<table class="table vacationregiTable">
						<tr>
							<th>휴가종류 <span class="markerSpan">*</span></th>
						</tr>     
						<tr>
							<td>
								<select class="form-select vacationSelect" name="vcatn_se_code">
									<option value="">휴가구분선택</option>
									<c:if test="${not empty vacationComcode}">
										<c:forEach items="${vacationComcode}" var="vac">
											<option class="vacationEach" value="${vac.com_code}">${vac.com_code_nm }</option>										
										</c:forEach>
									</c:if>
								</select>
								<span class="selectSpan checkSpan"></span>
								<br>
							</td>
						</tr>   
						<tr>
							<th>휴가기간 <span class="markerSpan">*</span></th>
						</tr>   
						<tr>
							<td>
								<input name="vcatn_startde" type="date" class="form-control vacationStart">
								~
								<input name="vcatn_endde" type="date" class="form-control vacationEnd">
								<span class="startSpan checkSpan"></span>
								<span class="endSpan checkSpan"></span>
								<br>
								<br>
							</td>
						</tr>
						<tr class="hide">
							<th>차감일수 <span class="markerSpan">*</span>
								<span class="Fontsmall">(휴가일이 하루이면 차감일수를 선택)</span>
							</th>
						</tr>   
						<tr class="hide">
							<td>
								<div class="vacationDaySelect Allday" check="">1일(종일)</div>
								<div class="vacationDaySelect Halfday" check="">0.5일(반일)</div>
								<span class="daySpan checkSpan"></span>
								<input class="usedeHidden" type="hidden" name="vcatn_usede">
								<br>
								<br>
							</td>
						</tr>       	
						<tr>
							<th>신청사유</th>
						</tr>       	
						<tr>
							<td><textarea name="vcatn_prvonsh" class="form-control resonVacation"></textarea></td>
						</tr>       	
                	</table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light-secondary"
                        data-bs-dismiss="modal">
                        <i class="bx bx-x d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">Close</span>
                    </button>
                    <button type="button" class="btn btn-primary ml-1 vacationSaveBTN">
                     	   저장
                    </button>
                </div>
            </div>
        </div>
     </div>
  </form>
   
   
   <!-- ------------------------------휴가상세보기 모달----------------------------------- -->
   <div class="modal fade text-left" id="large" tabindex="-1" role="dialog"
       aria-labelledby="myModalLabel17" aria-hidden="true">
       <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg"
           role="document">
           <div class="modal-content">
               <div class="modal-header">
                   <h4 class="modal-title" id="myModalLabel17">휴가신청서</h4>
                   <button type="button" class="close" data-bs-dismiss="modal"
                       aria-label="Close">
                       <i data-feather="x"></i>
                   </button>
               </div>
               <div class="modal-body">
              		<table class="table table-hover detailTable">
              		<!-- 	<tr>
              				<td colspan="2" class="center">
              					<h5>휴가신청서</h5>
              				</td>
              			</tr> -->
						<tr>
							<th>작성자</th>
							<td>
								<c:choose>
									<c:when test="${empImgVO.att_fileno eq null}">
										<img class="myImage_vacation" src="${cPath}/resources/assets/images/users/profile-pic.jpg">
									</c:when>
									<c:otherwise>
										<c:forEach items="${empImgVO.attachfileList}" var="attach" varStatus="status">
											<c:if test="${status.index eq 0}">
												<img class="myImage_vacation" src="data:image/jpeg;base64,${attach.file_img}" alt="user">
											</c:if>
										</c:forEach>
									</c:otherwise>
								</c:choose>
								<span class="bold">${empImgVO.emp_nm } ${empImgVO.emp_clsf_code}</span>
							</td>
						</tr>              		
						<tr>
							<th>휴가구분</th>
							<td class="vacation_code"></td>
						</tr>              		
						<tr>
							<th>시작일자</th>
							<td class="vacation_startde"></td>
						</tr>              		
						<tr>
							<th>종료일자</th>
							<td class="vacation_endde"></td>
						</tr>              		
						<tr>
							<th>차감일수</th>
							<td class="vacation_usede"></td>
						</tr>              		
						<tr>
							<th>휴가사유</th>
							<td class="vacation_prvonsh"></td>
						</tr>              		
						<tr>
							<th>승인여부</th>
							<td class="vacation_confm"></td>
						</tr>              		
						<tr>
							<th>휴가신청정보</th>
							<td>
								<span class="bold">총 휴가일수 : ${employeeVO.emp_base_vcde}일 | 휴가 사용일 수 : ${employeeVO.emp_minus}일 | 휴가 잔여일 수 : ${employeeVO.emp_remndr_vcde}일</span>
							</td>
						</tr>              		
              		</table>
               </div>
               <div class="modal-footer">
                   <button type="button" class="btn btn-light-secondary"
                       data-bs-dismiss="modal">
                       <i class="bx bx-x d-block d-sm-none"></i>
                       <span class="d-none d-sm-block">Close</span>
                   </button>
               </div>
           </div>
       </div>
   </div>
   <!---------------------------------- 휴가상세보기 모달 끝 ----------------------------------- -->
   
 <script type="text/javascript">
 
 $(function(){
	$('.hide').hide(); 
 })
 
 
 $('.vacationBTN').on('click', function(){

		
		//휴가구분	
		$('.vacationEach').each(function(idx, com){
			
			if($(this).text() == "월차"){
				$(this).prop("selected", true);
				
			}	
		})
		
		$('.vacationStart').val('2021-07-02');
		$('.vacationEnd').val('2021-07-06'); 
		$('.resonVacation').val("월차 신청합니다");
			 
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
 
	let pagingArea = $('#pagingArea').on('click', "a", function(event) {
		event.preventDefault();
		let page = $(this).data("page");
		if (page) {
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
		
	});
 
   //페이징
    let listBody = $('#listBody');
    let totalPage = $("#totalPage");
    let currentPage = $("#currentPage");
    let searchForm = $("#searchForm").ajaxForm({
    	dataType : 'json',
    	 beforeSubmit : function() {
			searchForm.find("[name='page']").val("");
		},
		success : function(resp) {
			console.log(resp)
			listBody.empty();
			currentPage.empty();
			pagingArea.empty();
			let trTags = [];
			if (resp.dataList) {
				$(resp.dataList).each(function(idx, rest) {
					if(rest.vcatn_confm_at == 'Y'){
						dclzCode = '<a href="#" class="btn btn-outline-secondary rounded-pill">승인</a>'
					}else if(rest.vcatn_confm_at == 'N'){
						dclzCode = '<a href="#" class="btn btn-outline-danger rounded-pill">반려</a>'
					}else{
						dclzCode = '<a href="#" class="btn btn-outline-danger rounded-pill">요청중</a>'
					}
					
					let tr = $("<tr>").append(
							 $('<td class="center">').html('<span class="badge vacBadge bg-light-primary">휴가</span>'),
							 $('<td class="center">').html(rest.vcatn_se_code),
							 $('<td class="center">').html(rest.vcatn_startde),
							 $('<td class="center">').html(rest.vcatn_endde),
							 $('<td class="center">').html(rest.vcatn_usede + "일"),
							 $('<td class="center">').html(dclzCode)
						).data("rest", rest).css("cursor", "pointer");
					trTags.push(tr);
					 })
				
			} else {
				trTags.push($('<tr>').html(
						$("<td>").attr("colspan", "6")
						)
					);
				}
			listBody.html(trTags);
			totalPage.html(resp.totalPage);
			currentPage.html(resp.currentPage);
			pagingArea.html(resp.pagingHTMLBS);
		},
		error : function(xhr, resp, msg) {
			console.log(xhr);
			alert("실패");
			alert(msg)
		}
	});
		
    searchForm.submit();

	 $('#pagingArea').on('click', "a", function(event) {
			event.preventDefault();
			let page = $(this).data("page");
			if (page) {
				searchForm.find("[name='page']").val(page);
				searchForm.submit();
			}
			return false;
	});
	 
	 $('.Allday').on('click', function(){
		 $('.Halfday').css('background-color', 'white');
		 $('.Halfday').css('color', '#607080');
		 $('.Halfday').attr('check', '');
		
		 $('.Allday').css('background-color', '#826767');
		 $('.Allday').css('color', 'white');
		 $('.Allday').attr('check', 'on');
	 })

	 $('.Halfday').on('click', function(){
		 $('.Allday').css('background-color', 'white');
		 $('.Allday').css('color', '#607080');
		 $('.Allday').attr('check', '');
		 
		 $('.Halfday').css('background-color', '#826767');
		 $('.Halfday').css('color', 'white');
		 $('.Halfday').attr('check', 'on');
	 })
	 
	 
	 $('.vacationStart').on('change', function(){
		 $('.startSpan').empty();
		 $('.hide').hide();
		 let Startvacation = $('.vacationStart').val();
		 let Endvacation = $('.vacationEnd').val();
		 
		 if(Startvacation == Endvacation ){
			 $('.hide').show();
		 }
	 })
	 
	 
	 $('.vacationEnd').on('change', function(){
		 $('.endSpan').empty();
		 $('.hide').hide();
		 let Startvacation = $('.vacationStart').val();
		 let Endvacation = $('.vacationEnd').val();
		 
		 if(Startvacation == Endvacation ){
			 $('.hide').show();
		 }
		 
	 })
	 
	 $('.vacationSelect').on('change', function(){
		 $('.selectSpan').empty();
	 })
	 

	 $('.Allday').on('click', function(){
		 $('.daySpan').empty();
	 })

	 $('.Halfday').on('click', function(){
		 $('.daySpan').empty();
	 })
	 
	 
	 
	 //저장버튼 눌렀을때
	 $('.vacationSaveBTN').on('click', function(){
		
		 let vacationSelect = $('.vacationSelect').val();
		 if(vacationSelect == ""){
			 $('.selectSpan').text("휴가종류를 선택해주세요");
			 return;
		 }
		 
		 let Startvacation = $('.vacationStart').val();
		 if(Startvacation == ""){
			 $('.startSpan').text("시작일자를 선택해주세요");
			 return;
		 }
		 
		 let Endvacation = $('.vacationEnd').val();
		 if(Endvacation == ""){
			 $('.endSpan').text("종료일자를 선택해주세요");
			 return;
		 }
		 
		 if(Startvacation > Endvacation){
			 $('.endSpan').text("종료일이 시작일보다 빠를수 없습니다.");
			 return;
		 }
		 
		 if($('.vacationStart').val() == $('.vacationEnd').val()){
			 if($('.Allday').attr('check') == "" && $('.Halfday').attr('check') == ""){
				 $('.daySpan').text("차감일수를 선택해주세요.");
				 return;
			 }
			 
			 if($('.Allday').attr('check') == 'on'){
					 usede = '1';
				
			 }else if($('.Halfday').attr('check') == 'on'){
				 	 usede = '0.5';
			 }
			 
			 $('.usedeHidden').val(usede);
		 }
		 
		 $('#regiForm').submit();
		 
	 })
	 
	 
	 //모달 숨겨질때 이벤트
	 $('#vacationModal').on('hidden.bs.modal', function () {
		 
		 $('.vacationSelect').val("");
		 $('.vacationStart').val("");
		 $('.vacationEnd').val("");
		 
		 $('.Halfday').css('background-color', 'white');
		 $('.Halfday').css('color', '#607080');
		 $('.Halfday').attr('check', '');
		 
		 $('.Allday').css('background-color', 'white');
		 $('.Allday').css('color', '#607080');
		 $('.Allday').attr('check', '');
		 
		 $('.resonVacation').val("");
		 $('.hide').hide();
		
		 
    });
	 
	//상세페이지로 이동
	$('#listBody').on('click', 'tr' ,function(){
		let rest = $(this).data('rest');
		$('#large').modal('show');
		
		
		$('.vacation_code').text(rest.vcatn_se_code);
		$('.vacation_startde').text(rest.vcatn_startde);
		$('.vacation_endde').text(rest.vcatn_endde);
		$('.vacation_usede').text(rest.vcatn_usede + "일");
		$('.vacation_prvonsh').text(rest.vcatn_prvonsh);
		
		if(rest.vcatn_confm_at == 'Y'){
			at = '승인';
		}else if(rest.vcatn_confm_at == 'N'){
			at = '반려';
		}else{
			at = '요청중';
		}
		
		$('.vacation_confm').text(at);
		
		
		  
	})
	
	
	
	
		
		
 
 </script> 