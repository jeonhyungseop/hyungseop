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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
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

.card .card-header h4{
	text-align: left;
	margin-left: 5px;
}

.card .card-header{
	padding-bottom: 0px;
	padding-left: 10px;
	padding-top: 40px;
	display: inline-grid;
}

.text-center{
	text-align: left !important;
	margin-left : 6px;
}

ol, ul{
	padding-left: 2.9rem;
}

.hover:hover .child{
	background: #826767;
}

.hover:hover{
	background: #826767;
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

td{
	width: 200px;
	height: 100px;
	border: 1px solid #dee2e6;
	padding-left: 20px;
	padding-right: 20px;
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

</style>    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

                           



<div id="app">
        <div id="sidebar" class="active">
            
        </div>
			<input type="hidden" class="msg">
            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last marginBottom">
                            <h4>시스템 상품결제</h4>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${cPath}/head/main">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">시스템 상품결제</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    		<div>
	                    		<span class="prodFont">상품정보</span>
	                            <div class="form-check form-switch">
	                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" check="">
	                                <label class="form-check-label" for="flexSwitchCheckChecked" >정기결제 여부</label>
	                            </div>
                            </div>
                </div>
                <section class="section">
                            <div class="pricing">
                            
                                   <c:choose>
	                                  	<c:when test="${not empty systemprodList }">
	                                  		<c:forEach items="${systemprodList}" var="systemprod">
			                                   <div class="col-md-3 px-0 cardmargin">
			                                       <div class="card hover">
			                                       <div class="iconArea">
			                                       	   <c:set var="value" value="${systemprod.syspay_nm}"/>
			                                       	   <c:choose>
															<c:when test="${fn:substring(value,0,3) eq 'BAS'}">
																<img alt="BIcon" class="payIcon" src="${cPath}/resources/images/logo/BIcon.png">
															</c:when>
															<c:when test="${fn:substring(value,0,3) eq 'STA'}">
																<img alt="BIcon" class="payIcon" src="${cPath}/resources/images/logo/StandardIcon.png">
															</c:when>
															<c:otherwise>
																<img alt="BIcon" class="payIcon" src="${cPath}/resources/images/logo/Premium.png">
															</c:otherwise>
														</c:choose>
			                                           <div class="card-header text-center child">
			                                               <h4 class="card-title fontcolor syspay_nm">${systemprod.syspay_nm}</h4>
			                                               <p class="text-center fontcolor">A standart features you can get</p>
			                                           </div>
			                                        </div>
			                                           <br>
			                                           <ul>
			                                               <li class="fontcolor pay"><i class="bi bi-check-circle "></i>￦ <span class="paymoney">${systemprod.syspay_pc }</span></li>
			                                               <li class="fontcolor"><i class="bi bi-check-circle "></i>${systemprod.syspay_month }개월 동안 사용가능</li>
			                                               <li class="fontcolor"><i class="bi bi-check-circle "></i>가맹점 ${systemprod.syspay_user_num }개 점포 등록가능
			                                               		<input type="hidden" class="hiddenCode" value="${systemprod.syspay_code }">
			                                               </li>
			                                           </ul>
			                                       </div>
			                                   </div>
	                                  		</c:forEach>
	                                  	</c:when>
                                   </c:choose>
                    </div>
                </section>
            </div>
        </div>
        <footer>
            <div class="footer clearfix mb-0 text-muted">
                <div class="float-start">
                </div>
                <div class="float-end">
                </div>
            </div>
        </footer>
        
    <!-- 모달 -->
    <div class="modal fade text-left" id="default" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
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
							<div class="methodDiv kakao_pay" check=""><h6 class="payfont" >카카오페이</h6></div>
							<div class="methodDiv credit" check=""><h6 class="payfont">카드</h6></div>
							<br>
							<br>
							<br>
							상품은 한가지만 구매가능하며, 결제 후 바로 사용가능합니다. <br>
							<span>! 결제 오류 발생시 홈페이지를 참조, 문의 하십시오.</span>
							
						</td>
						<td rowspan="2" class="payArea">
							<span><h6>총 결제금액</h6></span>
							<h4 id="payprice"></h4>
							<hr>
							상품금액
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
                    
                    <button type="button" id="paymentBtn" class="btn btn-primary ml-1" data-bs-dismiss="modal">
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
        
        
        
<script>
$(function(){
	

	let message = $('.msg').val();
	
	if(message != ""){
		alert(message);
	}
	
	//결제수단 선택
	$('.kakao_pay').on('click', function(){
		$('.methodDiv').css('background-color', 'white')
		$('.payfont').css('color', 'black')
		$('.credit').attr('check', '');
		
		$('.kakao_pay').css('background-color', '#6b5050');
		$('.kakao_pay>.payfont').css('color', 'white')
		$('.kakao_pay').attr('check', 'on');
	})
	
	$('.credit').on('click', function(){
		$('.methodDiv').css('background-color', 'white')
		$('.payfont').css('color', 'black')
		$('.kakao_pay').attr('check', '');
		
		$('.credit').css('background-color', '#6b5050');
		$('.credit>.payfont').css('color', 'white')
		$('.credit').attr('check', 'on');
	})
	
	
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
	 $('#default').on('hidden.bs.modal', function () {
		 $('.methodDiv').css('background-color', 'white');
		 $('.payfont').css('color', 'black');
		 $('.form-check22').each(function(idx, checkbox) {
				$(this).prop("checked", false);
		 })
		 
    });
	
	
	$.ajax({
		url : "${cPath}/head/systemprod/comfirm",
		method : "get",
		dataType : "text",
		success : function(resp) {
			if(resp == 'ok'){
				$('.msg').val('ok');
			}else{
				$('.msg').val('no')
			}
			
		},
		error : function(xhr, error, msg) {
			console.log(xhr);
			console.log(error);
			console.log(msg);
			alert("상태 : " + xhr.status);
		}
	});
	
	
	
})
	
	
	// 카드 클릭시 상품결제
	$('.section').on('click', '.hover', function(){
		
		if($('input:checkbox[id=flexSwitchCheckChecked]:checked').val()=='on'){
			var repay = 'Y';
			
		}else{
			var repay = 'N';
		}

		
		var amount = $(this).parents('.cardmargin').find('.paymoney').html();
		re_amount = parseInt(amount.replace(/\,/gi, ""));
		$('#default').modal("show");
		
		//모달
		let pay_nm = $(this).parents('.cardmargin').find('.syspay_nm').html();
		
		$('.modal-title').text(pay_nm + " 상품결제")
		$('#payprice').text(amount + " 원")
		
		//요금제코드
		let hiddenCode = $('.hiddenCode').val();

		
		//결제하기 버튼 클릭시
		$('.payBtn').on('click', function(){
			
			if($('.kakao_pay').attr('check') == 'on'){
				pay_method = 'A0001';
			
			}else if($('.credit').attr('check') == 'on'){
				pay_method = 'D0001'
			}else{
				alert('결제수단을 선택해주세요!');
			}
			
			count = 0;
			
			 if ($('.checkCom1').is(":checked") == true && $('.checkCom2').is(":checked") == true) {
				 
			 }else{
				 alert("결제 동의를 해주세요!");
			 }
			 
			 if($('.msg').val() == 'ok'){
				 
				 var IMP = window.IMP; // 생략가능
			        IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			        IMP.request_pay({
			            pg : 'inicis', // version 1.1.0부터 지원.
			            pay_method : 'card',
			            merchant_uid : 'merchant_' + new Date().getTime(),
			            name : '예치금 충전',
			            amount : re_amount,
			            buyer_email : 'iamport@siot.do',
			            buyer_name : '구매자이름',
			            buyer_tel : '010-1234-5678',
			            buyer_addr : '서울특별시 강남구 삼성동',
			            buyer_postcode : '123-456',
			            m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			        }, function(rsp) {
			            if ( rsp.success ) {
			                var msg = '결제가 완료되었습니다.';
			                /* msg += '고유ID : ' + rsp.imp_uid;
			                msg += '상점 거래ID : ' + rsp.merchant_uid;
			                msg += '결제 금액 : ' + rsp.paid_amount;
			                msg += '카드 승인번호 : ' + rsp.apply_num;
			                
			                msg += '결제승인/시도된 PG사 : ' + rsp.pg_provider;
			                msg += '결제수단 : ' + rsp.pay_method; */
			                
			                $.ajax({
								url : "${cPath}/head/systemprod",
								method : "post",
								data : {
									"hiddenCode" : hiddenCode,
									"pay_method" : pay_method,
									"repay" : repay
								},
								dataType : "json",
								success : function(resp) {
									alert("성공")
								},
								error : function(xhr, error, msg) {
									console.log(xhr);
									console.log(error);
									console.log(msg);
								}
							});
			                
			                
			            } else {
			                var msg = '결제에 실패하였습니다.';
			                msg += '에러내용 : ' + rsp.error_msg;
			            }
			            alert(msg);
			        });
			
				 
			 }else{
				 alert("이용중인 상품이 있습니다.");
			 }
		})
		
	})



</script>