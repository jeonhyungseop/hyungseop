<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 23. 진유리          최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">    
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">   
<style>
.dataArea {
   height: 550px;
}
.dataTable-table th{
	text-align: center;
}
.dataTable-table th:nth-child(2){
	text-align: left;
}
.dataTable-table td {
    height: 10px;
}
.date{
	width : 200px;
}
.form-check-input[type=radio] {
    border-radius: 50%;
    margin : 0% 5%;
}
.payIcon{
	width: 60px;
	height: 60px;
	border-radius: 12px;
	margin-top: 10px;
	margin-left: 40px;
	margin-bottom: 5px;
	display: inline;
}
.pricing .card{
	width : 450px;
	height: 290px;
	box-shadow: 0 10px 10px #cdbdbb;
}
.text-center{
	text-align: left !important;
	margin-left : 6px;
}
ol, ul{
	padding-left: 2.9rem;
}
.hover:hover .child{
	background: #162055;
}
.hover:hover{
	background: #162055;
	cursor: pointer;
}
.hover:hover .fontcolor{
	color: white;
}
.cardmargin {
	margin-bottom : 50px;
	float: left;
	margin-left: 30px;
	margin-right: 60px;
}
.card-title{
	margin-left: 30px;
	margin-bottom: 20px;
}
.pmargin{
	margin-bottom: 4.5rem;
}
.payArea{
	background: #dacdc6;
	text-align: left;
	height : 220px;
	width: 250px;
}
.form-select{
	width: 300px;

}
.light_font{
	color: #dee2e6;
}
.okdiv{
	margin-top: 5px;
}
.mintd{
	width: 530px;
	height: 400px;
	vertical-align: text-top;
	padding-top: 30px;
}
.methodDiv{
	width: 150px;
	height: 60px;
	border : 1px solid #dee2e6;
	display: inline-block;
	margin-top : 20px;
	margin-right : 15px;
	text-align: center;
	cursor: pointer;
}
.methodDiv > h6{
	margin-top: 13%;
}
.agreeArea{
	height: 130px;
}
.mintd > span{
	color: blue;
	font-weight: bold;
}
.prodFont{
	font-weight: bold;
	font-size: 23px;
	color: #6b5050;
	display: inline-block;
	margin-left: 2%;
	margin-bottom: 10px;
}
.form-switch{
	display:inline-block;
	float: right;
	margin-right: 8%;
}	
.form-check-input:checked{
	background-color : #6b5050;
	border-color : #6b5050;
}
.form-switch > label{
	color: #6b5050;
}
.bg-light-primary{
	background-color: #f7e9e2;
}
.border > td{
	margin-left: 20px;
}
.marginBottom{
	margin-bottom: 70px;
}
.ulMargin{
	padding-left: 1.9rem;
	margin-top : -16px;
	 list-style:none;
}
.marginTop{
	margin-top: 14px;
}
.remainder{
	background: #f7e9e2;
	height: 50px;
	width: 456px;
	margin-bottom: 11px;
	margin-top: -24px;
	padding-top: 3%;
	padding-left: 3%;
	color: black;
}
</style>
<body>
<div id="app">
    	<section class="section">
    		<!-- card 영역 -->
    		<div class="card">
    			<!-- card-header 영역 -->
				<div class="card-header">
					<div class="row">
						<div class="rowLeft">
							<h4>가맹비 수납</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">가맹비 수납 조회</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>	
				<!-- card-header 끝 -->
				<!-- card-body 영역 -->
					<div class="card-body">
						<!-- 검색 영역 -->
						<form id="Form">
							<div class="btnArea">
								<button type="submit" class="btn btn-primary float-end pribtn searchSubmit">검색</button>
								<button type="reset" class="resetBtn icon dripicons-clockwise float-end"></button>
							</div>
							<table class="table table-borderd">
								<tbody class="talbeSearchArea">
									<tr>
									<th class="searchTh"  style="width: 8%;">수납년월</th>
										<td style="width: 15%;">
											<select class="form-select" id="searchDay" name="searchDay" onchange="fn_search(this)">
												<option value="">전체</option>
	                                        	<c:if test="${not empty pagingVO.dataList}">
	                                        		<c:forEach items="${pagingVO.dataList}" var="paging">
	                                        			<option value="${fn:substring(paging.bilclct_schde,0, 4)}${fn:substring(paging.bilclct_schde,4,6)}">
	                                        				${fn:substring(paging.bilclct_schde,0, 4)}년 ${fn:substring(paging.bilclct_schde,4,6)}월
	                                        			</option>
	                                        		</c:forEach>
	                                        	</c:if>
                                       		 </select>
										</td>
									<th class="searchTh"  style="width: 8%;">수납 상태</th>
										<td style="width: 20%;" class="bscCode">
											<input class="form-check-input" type="radio" name="bscCode" id="bscCodeall" value="" checked/>
						 					<label class="form-check-label" for="bscCodeall">전체 </label>
	                                        <c:if test="${not empty BscCode}">
	                                        	<c:forEach items="${BscCode.comCodeList}" var="bsc" varStatus="status">
	                                        		<input class="form-check-input" type="radio" id="bscCode${status.index}" name="bscCode" value="${bsc.com_code}"/>
				 									<label class="form-check-label" for="bscCode${status.index}">${bsc.com_code_nm}</label>
	                                        	</c:forEach>
	                                        </c:if>
										</td>
									<th class="searchTh"  style="width: 8%;">결제 수단</th>
										<td style="width: 15%;">
											<select class="form-select" id="pscCode" name="pscCode" onchange="fn_search(this)">
												<option value="">전체</option>
	                                        	<c:if test="${not empty PscCode}">
	                                        		<c:forEach items="${PscCode.comCodeList}" var="psc">
	                                        			<option value="${psc.com_code}">${psc.com_code_nm}</option>
	                                        		</c:forEach>
	                                        	</c:if>
                                       		 </select>
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
										<option value="10" selected>10개씩 보기</option>
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
										<th data-sortable="" style="width: 11%;">
											<a href="#" class="dataTable">번호</a>
										</th>
										<th data-sortable="" style="width: 11%;">
											<a href="#" class="dataTable">결제년월</a>
										</th>
										<th data-sortable="" style="width: 11%;">
											<a href="#" class="dataTable">수납예정일자</a>
										</th>
										<th data-sortable="" style="width: 11%;">
											<a href="#" class="dataTable">수납완료일자</a>
										</th>
										<th data-sortable="" style="width: 11%;">
											<a href="#" class="dataTable">수납상태</a>
										</th>
										<th data-sortable="" style="width: 11%;">
											<a href="#" class="dataTable">결제수단</a>
										</th>
										<th data-sortable="" style="width: 11%;">
											<a href="#" class="dataTable">가격</a>
										</th>
										<th data-sortable="" style="width: 11%;">
											<a href="#" class="dataTable">내용</a>
										</th>
										<th data-sortable="" style="width: 11%;">
											<a href="#" class="dataTable">결재</a>
										</th>
										</tr>
									</thead>
									<tbody id="listBody">
										<c:choose>
										<c:when test="${not empty pagingVO.dataList }">
											<c:forEach items="${pagingVO.dataList}" var="bill">
												<tr>
													<td class="center">${bill.rnum}</td>
													<td class="center day">
														${fn:substring(bill.bilclct_schde,0,4)}-${fn:substring(bill.bilclct_schde,4,6)}-${fn:substring(bill.bilclct_schde,6,8)}
													</td>
													<td class="center">
														<c:choose>
															<c:when test="${bill.bilclct_comde ne null}">
																${fn:substring(bill.bilclct_comde,0,4)}-${fn:substring(bill.bilclct_comde,4,6)}-${fn:substring(bill.bilclct_comde,6,8)}
															</c:when>
															<c:otherwise>-</c:otherwise>
														</c:choose>
													</td>
													<td class="center">${bill.bilclct_sttus_code}</td>
													<td class="center">
														<c:choose>
															<c:when test="${bill.pay_se_code ne null}">${bill.pay_se_code}</c:when>
															<c:otherwise>-</c:otherwise>
														</c:choose>
													</td>
													<td class="center royalty">${bill.royalty}</td>
													<td class="center">
														<c:choose>
															<c:when test="${bill.bilclct_cn ne null}" >
																<button type="button" class="btn btn-secondary block" data-bs-toggle="modal" data-bs-target="#contentModal" 
																data-content="${bill.bilclct_cn}">보기</button>
															</c:when>
															<c:otherwise>-</c:otherwise>
														</c:choose>
													</td>
													<td class="center">
														<c:choose>
															<c:when test="${bill.bilclct_comde eq null}" >
																<button type='button' class='btn btn-primary block pay'>결제</button>
															</c:when>
															<c:otherwise>-</c:otherwise>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="10">조건에 맞는 가맹비 리스트가 없습니다.</td>
											</tr>
										</c:otherwise>
									</c:choose>
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
    
    <form id="searchForm" action="${cPath}/fran/bill">
		<input type="hidden" name="page" value="1"/> 
		<input type="hidden" name="selector" value=""/>
		<input type="hidden" name="searchDay" value="${pagingVO.searchMap.searchDay}"/>
		<input type="hidden" name="bscCode" value="${pagingVO.searchMap.bscCode}"/>
		<input type="hidden" name="pscCode" value="${pagingVO.searchMap.pscCode}"/>
	</form>

<!--Basic Modal -->
<div class="modal fade text-left" id="contentModal" tabindex="-1" role="dialog"
    aria-labelledby="myModalLabel1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="myModalLabel1">가맹비  내용</h5>
                <button type="button" class="close rounded-pill" data-bs-dismiss="modal" aria-label="Close">
                    <i data-feather="x"></i>
                </button>
            </div>
            <div class="modal-body">
                <p id="content"></p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary ml-1" data-bs-dismiss="modal">
                    <i class="bx bx-check d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">닫기</span>
                </button>
            </div>
        </div>
    </div>
</div>
<!--Basic Modal End-->

<!-- 결제 모달 -->
    <div class="modal fade text-left" id="payModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable  modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel1">상품 결제</h5>
                    <button type="button" class="close rounded-pill" data-bs-dismiss="modal" aria-label="Close">
                        <i data-feather="x"></i>
                    </button>
                </div>
                <div class="modal-body">
                   <table class="border">
					<tr>
						<td colspan="3" rowspan="3" class="mintd">
							<h6>결제수단 선택</h6>
							<div class="methodDiv point" check=""><h6 class="payfont">예치금</h6></div>
							<div class="methodDiv pay_other" check=""><h6 class="payfont">카카오페이, 카드</h6></div>
							<br>
							<br>
							<br>
							<span class="fransmnInput"></span>
							<ul class="ulMargin">
								<li class="marginTop">예치금으로 결제할 경우 예치금으로만 전액 계산할 수 있습니다.</li>
							</ul>
							<span>! 결제 오류 발생시 홈페이지를 참조, 문의 하십시오.</span>
							 <br>
							
						</td>
						<td rowspan="2" class="payArea">
							<h6>총 결제금액</h6>
							<input type="hidden" class="hiddenFransmn" value="${pagingVO.depositBlce}">
							<h4 id="payprice"></h4>
							<input type="hidden" id="content"/>
							<input type="hidden" id="seq"/>
						</td>
					</tr>
					<tr>
					</tr>
					<tr>
						<td rowspan="2"></td>
					</tr>
					<tr>
						<td colspan="3" class="agreeArea">
							<input type="checkbox" class="form-check-input form-check22 checkAll"> <span class="badge bg-light-primary">전체 동의하기</span><br>
							<div class="okdiv">&nbsp;<span class="light_font">ㄴ</span><input type="checkbox" class="form-check-input form-check22 checkCom1"> 위 상품의 구매조건 확인 및 결제진행 동의</div>
							<div class="okdiv">&nbsp;<span class="light_font">ㄴ</span><input type="checkbox" class="form-check-input form-check22 checkCom2"> 거래정보 제공 동의</div>
						</td>
					</tr>

                   </table>
                </div>
                <div class="modal-footer">
                    
                    <button type="button" id="paymentBtn" class="btn btn-primary ml-1">
                        <i class="bx bx-check d-block d-sm-none"></i>
                        <span class="d-none d-sm-block payBtn">결제하기</span>
                    </button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="bx bx-x d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">취소</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
<!-- 결제 모달 End  --> 
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
function fn_search(obj){
	let name = obj.getAttribute('name');
	searchForm.find("input[name="+name+"]").val(obj.value);
};

$("#listBody").on("click", ".pay" , function(){
	$("#payModal").modal("show");
	
	var pc = $(this).parent().parent().find(".royalty").text();
	$("#content").val($(this).parent().parent().find(".day").text()+" 가맹비 결제");
	$("#seq").val($(this).parent().parent().find(".seq").val());
	
	let pcmoney = parseInt(String(pc).replace(/\,/gi, ""));
	let pc_modi =String(pcmoney).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')
	$('#payprice').text(String(pcmoney).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
	
	//결제수단 선택
	$('.point').on('click', function(){
		$('.methodDiv').css('background-color', 'white');
		$('.payfont').css('color', 'black');
		$('.pay_other').attr('check', '');
		
		$('.point').css('background-color', '#6b5050');
		$('.point>.payfont').css('color', 'white');
		$('.point').attr('check', 'on');
		
		$('.fransmnInput').html('<div class="franhidesmn"><div class="remainder">예치금 잔액<span class="dsmnLeft">${pagingVO.depositBlce}&nbsp;원<span></div><input class="form-control franInput"><button class="btn btn-primary allmoney">전액사용</button></div>');
	})

	$('.pay_other').on('click', function(){
		$('.methodDiv').css('background-color', 'white');
		$('.payfont').css('color', 'black');
		$('.point').attr('check', '');
		$('.franhidesmn').hide();
		
		$('.pay_other').css('background-color', '#6b5050');
		$('.pay_other>.payfont').css('color', 'white')
		$('.pay_other').attr('check', 'on');
	})
	
	//전액결제 버튼 클릭이벤트
	$("#payModal").on('click', '.allmoney', function(){
	 	let balance = $('.hiddenFransmn').val() //예치금 잔액
		let CurrentMoney = $('.franInput').val(pc_modi);
		Price = String(CurrentMoney.val()).replace(/\,/gi, "");
		balance_re = String(balance).replace(/\,/gi, "").trim();
		
		let minus = parseInt(balance_re) - parseInt(Price);
		minus = String(minus).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
		$('.dsmnLeft').text(minus+" 원"); //예치금 잔액 - 전액결제금액
		
		let totalMinus = parseInt(pc_modi.replace(/\,/gi, "")) - parseInt(CurrentMoney.val().replace(/\,/gi, "")) // 상품가격 - 전액결제가격				
		$('#payprice').text(totalMinus);
	})
	//전액결제 input폼에 값이 변하면
	$("#payModal").on('change', '.franInput', function(){
		if(parseInt($('.franInput').val()) <= parseInt(pc.trim().replace(/\,/gi, ""))){
			var hiddenFransmn = String($('.hiddenFransmn').val()).replace(/\,/gi, "").trim();
			var franhidesmn = $('.franInput').val();
			console.log(hiddenFransmn+'/'+franhidesmn);
			
			minus = parseInt(hiddenFransmn) - parseInt(franhidesmn);
			minus = String(minus).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			$('.dsmnLeft').text(minus+" 원");//예치금 잔액
			
			
			totalMinus = String(parseInt(pc.trim().replace(/\,/gi, "")) - parseInt($('.franInput').val())).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
			$('#payprice').text(totalMinus);
			
		}else{
			alert("가맹비 가격을  초과하였습니다.")
		}
		
	})
});



//전체동의 체크박스 클릭할 경우
$('.checkAll').on('click', function() {
	if ($('.checkAll').prop("checked")) {
		$('.form-check22').each(function(idx, checkbox) {
			$(this).prop("checked", true);
		})
	} else {
		$('.form-check22').each(function(idx, checkbox) {
			$(this).prop("checked", false);
		})
	}
})
//체크 하나만 선택했을때 전체동의체크 제거
$('.checkCom1').on('click', function(){
	if($('.checkAll').prop("checked") && $(".checkCom2").prop("checked")){
		$('.checkAll').prop("checked", false);
	}
})
$('.checkCom2').on('click', function(){
	if($('.checkAll').prop("checked") && $(".checkCom1").prop("checked")){
		$('.checkAll').prop("checked", false);
	}
})


//모달 숨겨질때 이벤트
 $('#payModal').on('hidden.bs.modal', function () {
	 $('.methodDiv').css('background-color', 'white');
	 $('.payfont').css('color', 'black');
	 $('.form-check22').each(function(idx, checkbox) {
			$(this).prop("checked", false);
	 })
	 $('.franInput').val("");
	 $('.franhidesmn').hide();
});
$(".payBtn").on("click", function(){
	if($('.point').attr('check') == 'on'){
		if ($('.checkCom1').is(":checked") == true && $('.checkCom2').is(":checked") == true) {
			if($('#payprice').text() == '0'){
				$.ajax({
					url : "${cPath}/fran/bill/pay",
					method : "post",
					data : {
						"seq" : $("#seq").val(),
						"pay_code" : "deposit" ,
						"price" : $('.franInput').val().replace(/\,/gi, ""),
						"content" : $("#content").val()
					},
					dataType : "json",
					success : function(resp) {
						var result = resp.result;
						
						if(result == "OK"){
							alert("결제 완료되었습니다.");
							location.href="${cPath}/fran/bill";
						}else{
							alert("결제에 실패했습니다.");
						}
					},
					error : function(xhr, error, msg) {
						console.log(xhr);
						console.log(error);
						console.log(msg);
					}
				}); 
				
			}else{
				alert("예치금을 전액 사용해주세요.")
			}
		 }else{
			 alert("결제 동의를 해주세요!");
		 }
	}else if($('.pay_other').attr('check') == 'on'){
		if ($('.checkCom1').is(":checked") == true && $('.checkCom2').is(":checked") == true) {
			 console.log($("#payprice").text());
			 var IMP = window.IMP; // 생략가능
			 IMP.init('imp90445686'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			 IMP.request_pay({
			     pg : 'inicis', // version 1.1.0부터 지원.
			     pay_method : 'card',
			     merchant_uid : 'merchant_' + new Date().getTime(),
			     name : $("#content").val(),
			     amount : $("#payprice").text().replace(/\,/gi, ""),
			     buyer_email : 'iamport@siot.do',
			     buyer_name : '구매자이름',
			     buyer_tel : '010-1234-5678',
			     buyer_addr : '서울특별시 강남구 삼성동',
			     buyer_postcode : '12345',
			     m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			 }, function(rsp) {
			 	console.log(rsp);
			     if ( rsp.success ) {
			     	$.ajax({
			 			type : "post",
			 			url : "${cPath}/fran/bill/pay",
			 			data : {
			 				"seq" : $("#seq").val(),
			 				"pay_code" : rsp.pay_method
			 			},
			 			success : function(resp){
			 				var result = resp.result;
							
							if(result == "OK"){
								alert('결제가 완료되었습니다.');
								location.href="${cPath}/fran/bill";
							}else{
								alert('결제에 실패하였습니다.');
							}
			 			},
			 			error : function(xhr){
			 				alert("실패");
			 			}
			 		});
			     } else {
			         var msg = '결제에 실패하였습니다.';
			         msg += '에러내용 : ' + rsp.error_msg;
			         alert(msg);
			     }
			 }); 
		 }else{
			 alert("결제 동의를 해주세요!");
		 }
	}else{
		alert('결제수단을 선택해주세요!');
	}
	 
})

//리셋 폼
$.fn.clearForm = function () {
  return this.each(function () {
    var type = this.type,
      tag = this.tagName.toLowerCase();
    if (tag === 'form') {
      return $(':input', this).clearForm();
    }
    if (
      type === 'text' ||
      type === 'password' ||
      type === 'hidden' ||
      tag === 'textarea'
    ) {
      this.value = '';
    } else if (type === 'checkbox' || type === 'radio') {
      this.checked = false;
    } else if (tag === 'select') {
      this.selectedIndex = -1;
    }
  });
};

$(".bscCode").on("change", function(){
	var bscCode = $("input[name='bscCode']:checked").val();
	searchForm.find("input[name='bscCode']").val(bscCode);
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

$(".searchSubmit").on("click", function(){
	event.preventDefault();
	searchForm.submit();
});

let listBody = $('#listBody')
let currentPage = $("#currentPage");
let totalPage = $("#totalPage");
let selector = $("#selector").val();
let searchForm = $("#searchForm").ajaxForm({
	dataType : "json",
	beforeSubmit : function() {
		searchForm.find("[name='page']").val("");
	},
	success : function(resp) {
		listBody.empty();
		pagingArea.empty();
		currentPage.empty();
		let trTags = [];
		if (resp.dataList) {
			$(resp.dataList).each(function(idx, royal) {
				var bilclct_comde = "-";
				if(royal.bilclct_comde != null){
					bilclct_comde = royal.bilclct_comde.substring(0,4)+"-"+royal.bilclct_comde.substring(4,6)+"-"+royal.bilclct_comde.substring(6,8);
				}
				var paybtn = "-";
				if(royal.bilclct_comde == null){
					paybtn = "<button type='button' class='btn btn-primary block pay' data-bs-toggle='modal' data-bs-target='#payModal'>결제</button>";
				}
				var pay_se_code = "-";
				if(royal.pay_se_code != null){
					pay_se_code = royal.pay_se_code;
				}
				var contentbtn = "-";
				if(royal.bilclct_cn != null){
					contentbtn = "<button type='button' class='btn btn-secondary block' data-bs-toggle='modal' data-bs-target='#contentModal' data-content='"+royal.bilclct_cn+"'>보기</button>";
				}
				
				let tr = $("<tr>").append(
						 $('<td>').attr("class", "center").html(royal.rnum),
						 $('<td>').attr("class", "center day").html(royal.bilclct_schde.substring(0,4)+"년 "+royal.bilclct_schde.substring(4,6)+"월"),
					  	 $('<td>').attr("class", "center").html(royal.bilclct_schde.substring(0,4)+"-"+royal.bilclct_schde.substring(4,6)+"-"+royal.bilclct_schde.substring(6,8)),
					  	 $('<td>').attr("class", "center").html(bilclct_comde),
					  	 $('<td>').attr("class", "center").html(royal.bilclct_sttus_code),
						 $('<td>').attr("class", "center").html(pay_se_code),
						 $('<td>').attr("class", "center royalty").html(royal.royalty.toLocaleString()),
						 $('<td>').attr("class", "center").html(contentbtn),
						 $('<td>').attr("class", "center").html(paybtn),
						 $('<input>').attr("type", "hidden").attr("class", "seq").attr("value", royal.bilclct_seq)
					).data("royal", royal).css("cursor", "pointer");
				trTags.push(tr);
			});
		}else{
			trTags.push( 
					$("<tr>").html(
						$("<td>").attr("colspan", "8")		
					)
				);
			}
		listBody.html(trTags);
		pagingArea.html(resp.pagingHTMLBS);
		currentPage.html(resp.currentPage);
		if(resp.totalPage==0){
			totalPage.html(1);
		}else{
			totalPage.html(resp.totalPage);
		}
	},
	error : function(xhr, resp, error) {
		console.log(xhr);
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

/* 검색 */
$("#selector").on("change", function() {
	$("#searchForm input[name='selector']").val($(this).val());
	searchForm.submit();
});	
	
$(".resetBtn").on("click", function(){
	searchForm.clearForm();
	searchForm.submit();
})

$("#contentModal").on("show.bs.modal", function(event){
	var content = $(event.relatedTarget).data('content');
	$("#content").text(content);
});
</script>         