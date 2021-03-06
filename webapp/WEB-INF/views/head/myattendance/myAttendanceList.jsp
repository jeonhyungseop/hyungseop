<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
*
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

.rounded-pill{
	padding-bottom: 3.2px;
	padding-top: 3.2px;
}

.dateSearch{
	width: 230px;
	display: inline-block;
}

.form-check-input[type=checkbox]{
	margin-left: 12px;
	margin-right: 4px;
}

.xICON{
	cursor: pointer;
}

.myattendHR{
	margin-top: 4%;
}

.myattendH5{
	margin-top: -10px;
}

.myattendanceTable{
	margin-top: 5%;
}

.attendanceTR{
	height: 60px;
}

.attendanceBody{
	height: 469px;
}

.attenTIME{
	width: 100px;
	display: inline-block;
	margin-right: 10px;
}

.attendINPUT{
	width: 100px;
	display: inline-block;
	margin-right: 10px;
	margin-left: 20px;
}

.myattendanceTable{
	border: 0px solid white;
}

.myattendanceTable tr{
	vertical-align: middle;
}

.changeAttendSave{
	float: right;
}

.modiPrimaryBtn{
	padding-top: 0.3rem !important;
	width: 40px;
	padding: 0rem;
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
							<h4>나의 근태관리</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">나의 근태관리</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>	
				<!-- card-header 끝 -->
				<!-- card-body 영역 -->
					<div class="card-body">
						<!-- 검색 영역 -->
						<form>
							<div class="btnArea">
								<button type="button"class="btn btn-primary float-end pribtn searchBTN">검색</button>
								<button type="reset" class="resetBtn icon dripicons-clockwise float-end resetBTN"></button>
							</div>
							<table class="table table-borderd">
								<tbody class="talbeSearchArea">
									<tr>
										<th class="searchTh"  style="width: 10%;">기간</th>
										<td style="width: 23.3%;">
											<input  class="form-control dateSearch" id="startDate" placeholder="Search..." type="date">
											~
											<input  class="form-control dateSearch" id="endDate" placeholder="Search..." type="date">
										</td>
										<th class="searchTh"  style="width: 10%;">근태현황</th>
										<td style="width: 23.3%;">
											<input type="checkbox" id="DC001" class="form-check-input" value="DC001">정상출근
											<input type="checkbox" id="DC002" class="form-check-input" value="DC002">휴가
											<input type="checkbox" id="DC004" class="form-check-input" value="DC004">지각
										</td>
									</tr>        
								</tbody>
							</table>
						</form>
						<!-- 조회 영역 -->
						<div class="dataTable-container">
							<div class="btnArea">
								<div class="dataTable-dropdown float-end">
									<select id="selector" class="dataTable-selector form-select">
										<option value="5">5개씩 보기</option>
										<option value="10" selected="">10개씩 보기</option>
										<option value="15">15개씩 보기</option>
										<option value="20">20개씩 보기</option>
										<option value="25">25개씩 보기</option>
									</select>
								</div>
							</div>
							<div class="dataArea">
								<table class="table table-hover dataTable-table" id="table1">
									<thead>
										<tr>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">근무일</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">출근시간</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">퇴근시간</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">츨근현황</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">총근무시간</a>
											</th>
											<th class="center" data-sortable="" style="width: 15%;">
												<a href="#" class="dataTable">근무기록수정</a>
											</th>
										</tr>
									</thead>
									<tbody id="listBody">
									<!-- 
										데이터 넣는 영역 
									 -->
									 
									</tbody>
								</table>
							</div>
						</div>
						<!-- data-Area 끝 -->
						<!-- 페이징 및 푸터 영역 -->
						<div class="dataTable-bottom">
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
   <form id="searchForm" action="${cPath}/head/myattendance">
	   	<input type="hidden" name="selector" value="" />
	   	<input type="hidden" name="page" value="${pagingVO.currentPage }">
   		<input type="hidden" name="startDate" value="">
	   	<input type="hidden" name="endDate" value="">
	   	<input type="hidden" name="dclzCode_01" value="">
	   	<input type="hidden" name="dclzCode_02" value="">
	   	<input type="hidden" name="dclzCode_04" value="">
   </form>




   
   
    
    
<!-- 출근모달 -->
<div class="modal fade" id="example" tabindex="-1" role="dialog"
    aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
        role="document">
        <div class="modal-content">
            <div class="modal-body attendanceBody">
             <i class="bi bi-x xICON"></i>
             <br>
             <h5 class="myattendH5">근무기록 수정/누락</h5>
             <hr class="myattendHR">
             <table class="table myattendanceTable">
				<tr class="attendanceTR">
					<th>근무일</th>
					<td>
						<input type="date" class="form-control attendDate">
						<input type="hidden" class="seqClass">
					</td>
				</tr>
				<tr class="attendanceTR">
					<th>출근시간</th>
					<td><select class="form-control attenTIME attendSelect">
						<option class="atteach" value="00">00</option><option class="atteach" value="01">01</option><option class="atteach" value="02">02</option>
						<option value="03">03</option><option value="04">04</option><option value="05">05</option>
						<option value="06">06</option><option value="07">07</option><option value="08">08</option>
						<option class="atteach" value="09">09</option><option value="10">10</option><option value="11">11</option>
						<option value="12">12</option><option value="13">13</option><option value="14">14</option>
						<option value="15">15</option><option value="16">16</option><option value="17">17</option>
						<option value="18">18</option><option value="19">19</option><option value="20">20</option>
						<option value="21">21</option><option value="22">22</option><option value="23">23</option>
						<option value="24">24</option>
					</select>
					시
					<input type="text" class="form-control attendINPUT attendinput" placeholder="입력" value="00">분
					</td>
				</tr>
				<tr class="attendanceTR">
					<th>퇴근시간</th>
					<td>
						<select class="form-control attenTIME lvffcSelect">
							<option value="00">00</option><option value="01">01</option><option value="02">02</option>
							<option value="03">03</option><option value="04">04</option><option value="05">05</option>
							<option value="06">06</option><option value="07">07</option><option value="08">08</option>
							<option value="09">09</option><option value="10">10</option><option value="11">11</option>
							<option value="12">12</option><option value="13">13</option><option value="14">14</option>
							<option value="15">15</option><option value="16">16</option><option value="17">17</option>
							<option value="18">18</option><option value="19">19</option><option value="20">20</option>
							<option value="21">21</option><option value="22">22</option><option value="23">23</option>
							<option value="24">24</option>
						</select>
					시
					<input type="text" class="form-control attendINPUT lvffcinput" value="00">분
					</td>
				</tr>
				<tr class="attendanceTR">
					<th>사유</th>
					<td><textarea class="form-control textArea" id="exampleFormControlTextarea1" rows="3"  placeholder="내용을 입력해주세요"></textarea></td>
				</tr>
             </table>
 				<button class="btn btn-primary changeAttendSave">저장</button>
            </div>
        </div>
    </div>
   </div>    
    
    
    
    
    
 <script type="text/javascript">

 
 $('#listBody').on('click', '.bi-pencil-square',function(){
	 
	 $('.textArea').val("근무시간이 누락되었습니다.");
	 
		//출근시간
		$('.atteach').each(function(idx, dept){
			
			if($(this).text() == "09"){
				$(this).prop("selected", true);
				
			}	
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
 
 
 //페이지 클릭 이벤트
 pagingArea = $("#pagingArea").on("click", "a", function(event){
		event.preventDefault();
		let page = $(this).data("page");
		if(page){
			searchForm.find("[name='page']").val(page);
			searchForm.submit();
		}
		return false;
	});
 
 
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
			$(resp.dataList).each(function(idxz, dclz) {
			
				if(dclz.dclz_se_code == "정상출근"){
					dclzCode = '<a href="#" class="btn btn-outline-secondary rounded-pill">'+dclz.dclz_se_code+'</a>'
				}else{
					dclzCode = '<a href="#" class="btn btn-outline-danger rounded-pill">'+dclz.dclz_se_code+'</a>'
				}
				
				if(dclz.worktime_sm == null){
					worktime = "-";
				}else{
					worktime = dclz.worktime_sm + "시간";
				}
				
				if(dclz.lvffc_time == null){
					lvffc = "-";
				}else{
					lvffc = dclz.lvffc_time;
				}
				
				let tr = $("<tr>").append(
						 $('<td class="center cellSum">').html(dclz.dclz_stdrde).addClass(dclz.dclz_stdrde) ,
						 $('<td class="center">').html('<input type="hidden" class="dclzSEQ" value="'+dclz.dclz_seq+'">'+ dclz.attend_time ),
						 $('<td class="center">').html(lvffc),
					  	 $('<td class="center">').html(dclzCode),
						 $('<td class="center">').html(worktime),
						 $('<td class="center">').html('<button class="btn btn-primary modiPrimaryBtn"><i class="bi bi-pencil-square" data-bs-toggle="modal" data-bs-target="#example"></i></button>')
					).data("dclz", dclz).css("cursor", "pointer");
				trTags.push(tr);
			
			
		});
			
		} else {
			trTags.push($('<tr>').html(
					$("<td>").attr("colspan", "6").html("근태내역이 없습니다.")
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
 
 
 $("#selector").on("change", function() {
		$("#searchForm input[name='selector']").val($(this).val());
		searchForm.submit();
	});
 
 
 
 $('.searchBTN').on('click', function(){
	 
	 $("#searchForm input[name='startDate']").val($('#startDate').val());
	 $("#searchForm input[name='endDate']").val($('#endDate').val());
	 
	 if($('#DC001').prop("checked")){
		 $("#searchForm input[name='dclzCode_01']").val($('#DC001').val());
	 }else{
		 $("#searchForm input[name='dclzCode_01']").val("");
	 }

	 if($('#DC002').prop("checked")){
		 $("#searchForm input[name='dclzCode_02']").val($('#DC002').val());
	 }else{
		 $("#searchForm input[name='dclzCode_02']").val("");
	 }

	 if($('#DC004').prop("checked")){
		 $("#searchForm input[name='dclzCode_04']").val($('#DC004').val());
	 }else{
		 $("#searchForm input[name='dclzCode_04']").val("");
	 }
	 
	searchForm.submit();
	 
 })
 
 $('.resetBTN').on('click', function(){
	 $("#searchForm input[name='startDate']").val("");
	 $("#searchForm input[name='endDate']").val("");
	 
	 $("#searchForm input[name='dclzCode_01']").val("");
	 $("#searchForm input[name='dclzCode_02']").val("");
	 $("#searchForm input[name='dclzCode_04']").val("");
	 
	 searchForm.submit();
 })
 
 
  //수정 아이콘 클릭이벤트
 $('#listBody').on('click', '.bi-pencil-square', function(){
     let dclz_seq = $(this).parents('tr').find('.dclzSEQ').val();
     $('.seqClass').val(dclz_seq);
     
     let dclz_stdrde = $(this).parents('tr').find('.cellSum').text().trim();
     $('.attendDate').val(dclz_stdrde).attr("disabled", "disabled");
     
     
   
 })
 
$('.xICON').on('click', function(){
	
	$('#example').modal("hide");
	$('.attendDate').val("00");
	$('.attenTIME').val("00");
	$('.attendinput').val("00");
	$('.lvffcinput').val("00");
	$('#exampleFormControlTextarea1').val("");
	
	
})

//출근시간
$('.attendinput').on('change', function(){
	 if(parseInt($(this).val()) > 59){
		 alert("정확한 시간을 입력해주세요")
		 $(this).val("");
	 } 
})

//퇴근시간
$('.lvffcinput').on('change', function(){
	 if(parseInt($(this).val()) > 59){
		 alert("정확한 시간을 입력해주세요")
		 $(this).val("");
	 } 
})
  

$('.changeAttendSave').on('click', function(){
	
	 $.ajax({
		url : "${cPath}/head/myattendance",
		method : "post",
		data : {
			"dclz_seq" : $('.seqClass').val(),
			"attend_time" : $('.attendSelect').val() + " 시  " +  $('.attendinput').val() + " 분",
			"lvffc_time" : $('.lvffcSelect').val() + " 시 " + $('.lvffcinput').val() + " 분",
			"dclz_change_prvonsh" : $('#exampleFormControlTextarea1').val()
		},
		dataType : "json",
		success : function(resp) {
			$('#example').modal("hide");
			$('.attendDate').val("00");
			$('.attenTIME').val("00");
			$('.attendinput').val("00");
			$('.lvffcinput').val("00");
			$('#exampleFormControlTextarea1').val("");
			
			alert("근무기록 수정요청을 완료했습니다.");
			
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