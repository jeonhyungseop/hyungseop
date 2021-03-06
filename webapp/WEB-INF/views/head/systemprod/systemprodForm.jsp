    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.06.02    진예은         상품변경
* 2021.06.03    진예은         상품변경 (변경된값 insert)
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <style>
 	
 	.checkArea{
 		text-align:center;
 		width: 100px;
 	}
 		
 	.tableAttr{
 		margin-top: 100px;
 		vertical-align: middle;
 		border: 1px solid #e1e3ea;
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

.card .card-header h4{
	text-align: left;
	margin-left: 5px;
}

.card .card-header{
	padding-bottom: 0px;
	padding-left: 10px;
	padding-top: 20px;
	display: inline-grid;
}

.text-center{
	text-align: left !important;
	margin-left : 6px;
}

ol, ul{
	padding-left: 2.9rem;
}

.ulMargin{
	padding-left: 1.9rem;
	margin-top : -16px;
}

.lefttd{
	width: 650px;
}

.hover{
	margin: 30px;
	margin-bottom: 30px;
	margin-left: 75px;
}

.pricing .card{
	margin-bottom: 2.5rem;
}

.useTitle{
	margin-left: 80px;
	margin-top: 40px;
}

.arrowImg{
	width: 100px;
	height: 100px;
	margin-top: 60px;

}

.center{
	text-align: center;
	border: 0px;
}

.marginleft{
	border: 0px;
	padding-left: 100px;
}

.modiBTN{
	text-align: center;
	border: 0px;
}


/* 모달 스타일 */
.payArea{
	background: #dacdc6;
	text-align: left;
	height : 220px;
	width: 250px;
	padding-left: 20px;
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
	padding-left: 20px;
	border: 1px solid #dee2e6;
}

.methodDiv{
	width: 140px;
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
	padding-left: 20px;

}

.mintd > span{
	color: blue;
	font-weight: bold;
	margin-left: 15px;
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
	margin-right: 1%;
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

.headInput{
	width: 355px;
	margin-top: -24px;
	margin-bottom: 16px;
	display: inline-block;
	margin-right: 12px;
	text-align: right;
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

.dsmnLeft{
	float: right;
	margin-right: 20px;
}

.prodFont{
	font-weight: bold;
	font-size: 23px;
	color: #6b5050;
	display: inline-block;
	margin-left: 2%;
	margin-bottom: 10px;
}

.marginTop{
	margin-top: 14px;
}

.row>*{
	width: 50%;
}

.breadcrumb{
	float: right;
}

.iconArea{
	margin-top: 20px;
}

.line{
	line-height: 100px;
}

#main{
	padding-bottom: 0rem;
}

.table-borderd{

	margin-top: -18px;
}
 </style>
 <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <div id="app">
        <div id="sidebar" class="active">
            
        </div>

            <div class="page-heading">
       
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                        	<div class="row">
								<div class="rowLeft">
									<h4>상품변경</h4>
								</div>
								<div class="rowRight">
									<nav aria-label="breadcrumb" >
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
											<li class="breadcrumb-item active" aria-current="page">상품변경</li>
										</ol>
									</nav>
								</div>
							</div>
                        	<div>
	                            <div class="form-check form-switch">
		                                <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" check="">
		                                <label class="form-check-label" for="flexSwitchCheckChecked" >정기결제 여부</label>
	                            </div>
                            </div>
                        </div>
                        <div class="card-body">
                           <table class="table table-hover">
    							<tr>
    								<th class="checkArea"><input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1"></th>
    								<th>상품명</th>
    								<th>개월수</th>
    								<th>사용자제한</th>
    								<th>가격</th>
    							</tr>
    							<c:choose>
    								<c:when test="${not empty prodList}">
    									<c:forEach items="${prodList}" var="prod">
	    									<tr>
			    								<td class="checkArea"><input class="form-check-input inputhide" type="radio" name="flexRadioDefault" id="flexRadioDefault1"></td>
			    								<td class="nm">${prod.syspay_nm }</td>
			    								<td class="month">${prod.syspay_month }</td>
			    								<td class="usernum">${prod.syspay_user_num }</td>
			    								<td class="pc">${prod.syspay_pc }
	    										<input type="hidden" class="syspay_code" value="${prod.syspay_code }">
	    										</td>
	    									</tr>                       
    									</c:forEach>
    								</c:when>
    								<c:otherwise>
    									<tr>
    										<td colspan="6" class="center"> 변경가능한 상품이 없습니다.</td>
    									</tr>
    								</c:otherwise>
    							</c:choose>
	                       </table>
	                       
	                       <table class="table table-borderd">
	                       		<tr>
	                       			<td class="lefttd marginleft">
	                       			 <h4 class="card-title useTitle">이용 상품</h4>
	                       			 <input type="hidden" value="${usePay.pay_seq }" class="use_PaySeq">
	                       			 <div class="pricing">
                                      	   <c:set var="systempaymentList" value="${usePay.systempaymentList}"/>
                                       	   <c:forEach items="${systempaymentList }" var="use">
			                                   <div class="col-md-3 px-0 cardmargin">
			                                       <div class="card hover">
			                                       <div class="iconArea">
				                                       	   <c:choose>
																<c:when test="${fn:substring(use.syspay_nm,0,3) eq 'BAS'}">
																	<img alt="BIcon" class="payIcon" src="${cPath}/resources/images/logo/BIcon.png">
																</c:when>
																<c:when test="${fn:substring(use.syspay_nm,0,3) eq 'STA'}">
																	<img alt="BIcon" class="payIcon" src="${cPath}/resources/images/logo/StandardIcon.png">
																</c:when>
																<c:otherwise>
																	<img alt="BIcon" class="payIcon" src="${cPath}/resources/images/logo/Premium.png">
																</c:otherwise>
															</c:choose>
			                                           <div class="card-header text-center child">
			                                               <h4 class="card-title fontcolor syspay_nm syspay_nm_before">${use.syspay_nm}</h4>
			                                               <p class="text-center fontcolor">A standart features you can get</p>
			                                           </div>
			                                        </div>
			                                           <br>
			                                           <ul>
			                                               <li class="fontcolor pay"><i class="bi bi-check-circle "></i>￦ <span class="paymoney">${use.syspay_pc }</span></li>
			                                               <li class="fontcolor"><i class="bi bi-check-circle "></i>${use.syspay_month }개월 동안 사용가능</li>
			                                               <li class="fontcolor"><i class="bi bi-check-circle "></i>가맹점 ${use.syspay_user_num }개 점포 등록가능
			                                               		<input type="hidden" class="hiddenCode" value="${use.syspay_code }">
			                                               		<input type="hidden" class="hiddenBeforeprice" value="${use.syspay_pc }">
			                                               </li>
			                                           </ul>
			                                       </div>
			                                   </div>
	                                       	   </c:forEach>
	                                       	   </div>
	                       			</td>
									<td class="center line"><img class="arrowImg" src="${cPath}/resources/images/logo/fast_forward2.png">
										<a class="btn btn-primary changeBtn">변경하기</a>
									</td>
									<td class="marginleft lefttd">
									<h4 class="card-title useTitle">변경상품</h4>
											<div class="pricing">
                                      	   <c:set var="systempaymentList" value="${usePay.systempaymentList}"/>
                                       	   <c:forEach items="${systempaymentList }" var="use">
			                                   <div class="col-md-3 px-0 cardmargin">
			                                       <div class="card hover">
			                                       <div class="iconArea">
													<img alt="BIcon" class="payIcon payIcon_after" src="">
			                                           <div class="card-header text-center child">
			                                               <h4 class="card-title fontcolor syspay_nm"><span class="syspay_nm_after"></span></h4>
			                                               <p class="text-center fontcolor">A standart features you can get</p>
			                                           </div>
			                                        </div>
			                                           <br>
			                                           <ul>
			                                               <li class="fontcolor pay"><i class="bi bi-check-circle "></i>￦ <span class="paymoney_after"></span></li>
			                                               <li class="fontcolor"><i class="bi bi-check-circle "></i><span class="month_after"></span>개월 동안 사용가능</li>
			                                               <li class="fontcolor"><i class="bi bi-check-circle "></i>가맹점 <span class="usernum_after"></span>개 점포 등록가능
			                                               		<input type="hidden" class="hiddenCode2" value="${use.syspay_code }">
			                                               </li>
			                                           </ul>
			                                       </div>
			                                   </div>
	                                       	   </c:forEach>
	                                       	   </div>									
									</td>
									<td colspan="3" class="modiBTN">
	                       				<input type="hidden" name="_method" value="put">
	                       				<input type="hidden" name="syspay_code" class="syspay_code_value" value="" >
	                       			</td>

	                       		</tr>
	                       </table>
	                       
	                       
                        </div>
                    </div>
                </section>
            </div>
        </div>
        
        
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
							<div class="methodDiv headsmn" check=""><h6 class="payfont" >예치금</h6></div>
							<div class="methodDiv kakao_pay" check=""><h6 class="payfont" >카카오페이</h6></div>
							<div class="methodDiv credit" check=""><h6 class="payfont">카드</h6></div>
							<br>
							<br>
							<br>
							<span class="headsmnInput"></span>
							<ul class="ulMargin">
								<li class="marginTop">상품은 한가지만 구매가능하며, 결제 후 바로 사용가능합니다.</li>
								<li>예치금으로 결제할 경우 예치금으로만 전액 계산할 수 있습니다.</li>
							</ul>
							<span>! 결제 오류 발생시 홈페이지를 참조, 문의 하십시오.</span>
							 <br>
							
						</td>
						<td rowspan="2" class="payArea">
							<input type="hidden" class="hiddenHeadsmn" value="${headsmnVO.dsmn_blce}">
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
	$('.table-borderd').hide();
	
	//모달 숨겨질때 이벤트
	 $('#default').on('hidden.bs.modal', function () {
		 $('.methodDiv').css('background-color', 'white');
		 $('.payfont').css('color', 'black');
		 $('.form-check22').each(function(idx, checkbox) {
				$(this).prop("checked", false);
		 })
		 $('.headInput').val("");
		 $('.hideHeadsmn').hide();
		 
    });	
	
	
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
		
	
	
	 $('.section').on('click', '.inputhide',function(){

			$('.table-borderd').show();
			
			let nm = $(this).parent().parent().find('.nm').text();
			let month = $(this).parent().parent().find('.month').text()
			let usernum = $(this).parent().parent().find('.usernum').text()
			let pc = $(this).parent().parent().find('.pc').text()
			let syspay_code = $(this).parent().parent().find('.syspay_code').val()
			
			$('.syspay_nm_after').text(nm);
			$('.paymoney_after').text(pc)
			$('.month_after').text(month)
			$('.usernum_after').text(usernum);
			$('.syspay_code_value').val(syspay_code);
			$('.hiddenCode2').val(syspay_code)
			

			if(nm.substring(0,3) == 'PRE'){
				$('.payIcon_after').attr('src', '${cPath}/resources/images/logo/Premium.png');
			}else if(nm.substring(0,3) == 'STA'){
				$('.payIcon_after').attr('src', '${cPath}/resources/images/logo/StandardIcon.png');
			}else{
				$('.payIcon_after').attr('src', '${cPath}/resources/images/logo/BIcon.png');
			}
			
			$('.changeBtn').on('click', function(){
				$('#default').modal("show");
				
				let pcmoney = parseInt(String(pc).replace(/\,/gi, "")) - parseInt($('.hiddenBeforeprice').val());
				let pc_modi =String(pcmoney).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')
				$('#payprice').text(String(pcmoney).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
				
				
				//결제수단 선택
				$('.kakao_pay').on('click', function(){
					$('#payprice').text(pc_modi);
					$('.methodDiv').css('background-color', 'white')
					$('.payfont').css('color', 'black')
					$('.credit').attr('check', '');
					$('.headsmn').attr('check', '');
					$('.hideHeadsmn').hide();
					
					$('.kakao_pay').css('background-color', '#826767');
					$('.kakao_pay>.payfont').css('color', 'white')
					$('.kakao_pay').attr('check', 'on');
				})
				
				$('.credit').on('click', function(){
					$('#payprice').text(pc_modi);
					$('.methodDiv').css('background-color', 'white')
					$('.payfont').css('color', 'black')
					$('.kakao_pay').attr('check', '');
					$('.headsmn').attr('check', '');
					$('.hideHeadsmn').hide();
					
					$('.credit').css('background-color', '#826767');
					$('.credit>.payfont').css('color', 'white')
					$('.credit').attr('check', 'on');
				})
				
				//예치금 버튼 클릭시
				$('.headsmn').on('click', function(){
					$('.methodDiv').css('background-color', 'white')
					$('.payfont').css('color', 'black')
					$('.kakao_pay').attr('check', '');
					$('.credit').attr('check', '');
					
					$('.headsmn').css('background-color', '#826767');
					$('.headsmn>.payfont').css('color', 'white')
					$('.headsmn').attr('check', 'on');
					
					re_headsmnDsmn = String(${headsmnVO.dsmn_blce}).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
					
					//$('.headsmnInput').html('<div class="hideHeadsmn"><div class="remainder">예치금 잔액<span class="dsmnLeft">${headsmnVO.dsmn_blce}&nbsp;원<span></div><input class="form-control headInput"><button class="btn btn-primary allmoney">전액사용</button></div>');
					$('.headsmnInput').html('<div class="hideHeadsmn"><div class="remainder">예치금 잔액<span class="dsmnLeft">'+ re_headsmnDsmn + '&nbsp;원<span></div><input class="form-control headInput"><button class="btn btn-primary allmoney">전액사용</button></div>');
					
					
				//전액결제 버튼 클릭이벤트
				 $('.allmoney').on('click', function(){
					 	let balance = $('.hiddenHeadsmn').val() //예치금 잔액
						let CurrentMoney = $('.headInput').val(pc_modi);
						Price = String(CurrentMoney.val()).replace(/\,/gi, "");
						balance_re = String(balance).replace(/\,/gi, "").trim();
						
						let minus = parseInt(balance_re) - parseInt(Price);
						minus = String(minus).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
						$('.dsmnLeft').text(minus+" 원"); //예치금 잔액 - 전액결제금액
						
						let totalMinus = parseInt(pc_modi.replace(/\,/gi, "")) - parseInt(CurrentMoney.val().replace(/\,/gi, "")) // 상품가격 - 전액결제가격				
						$('#payprice').text(totalMinus);
					
					})
					
					//전액결제 input폼에 값이 변하면
					$('.headInput').on('change', function(){
						
						if(parseInt($('.headInput').val()) <= parseInt(pc.trim().replace(/\,/gi, ""))){
							minus = parseInt(String($('.hiddenHeadsmn').val()).replace(/\,/gi, "").trim()) - parseInt($('.headInput').val());
							minus = String(minus).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
							$('.dsmnLeft').text(minus+" 원");//예치금 잔액
							
							
							totalMinus = String(parseInt(pc.trim().replace(/\,/gi, "")) - parseInt($('.headInput').val())).replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
							$('#payprice').text(totalMinus);
							
						}else{
							alert("상품가격을 초과하였습니다.")
						}
						
					})
					

					
				})
				
			})
			
		})
	
})

					
		//결제버튼 클릭 이벤트
		$('.payBtn').on('click', function(){
			
			if($('input:checkbox[id=flexSwitchCheckChecked]:checked').val()=='on'){
				var repay = 'Y';
				
			}else{
				var repay = 'N';
			}
			
			
			if($('.kakao_pay').attr('check') == 'on'){
				pay_method = 'A0001';
			
			}else if($('.credit').attr('check') == 'on'){
				pay_method = 'D0001'
				
			}else if($('.headsmn').attr('check') == 'on'){
				pay_method = 'Headsmn';
			}else{
				alert('결제수단을 선택해주세요!');
			}
			

			if ($('.checkCom1').is(":checked") == true && $('.checkCom2').is(":checked") == true) {
				 
			 }else{
				 alert("결제 동의를 해주세요!");
			 }
			
			
			if(pay_method == 'Headsmn'){
				if($('#payprice').text() == '0'){
					syspay_code = $(".hiddenCode2").val();
					use_PaySeq = $('.use_PaySeq').val();
					buyProdPrice = String($('.headInput').val()).replace(/\,/gi, "")
					msg = $('.syspay_nm_before').text() + "-" + $('.syspay_nm_after').text() + "상품변경"
					
				 	 $.ajax({
						url : "${cPath}/head/systemprod/modify",
						method : "post",
						data : {
							"_method" : 'PUT',
							"pay_se_code" : "C0001", 
							"syspay_code" : syspay_code,
							"repay" : repay,
							"use_PaySeq" : use_PaySeq, 
							"buyProdPrice" : buyProdPrice,
							"memo" : msg
						},
						dataType : "json",
						success : function(resp) {
							alert("상품이 성공적으로 변경되었습니다.");
							location.href="${cPath}/head/systemprod/info";
						},
						error : function(xhr, error, msg) {
							console.log(xhr);
							console.log(error);
							console.log(msg);
						}
					}); 
					
					
				}else{
					
					alert("결제 금액이 부족합니다.")
				}
			
			}else{
				 var IMP = window.IMP; // 생략가능
			        IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			        IMP.request_pay({
			            pg : 'inicis', // version 1.1.0부터 지원.
			            pay_method : 'card',
			            merchant_uid : 'merchant_' + new Date().getTime(),
			            name : '예치금 충전',
			            amount : $('#payprice').text(),
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
									"hiddenCode" : $('.hiddenCode2').val(),
									"pay_method" : pay_method,
									"repay" : repay,
									"use_PaySeq" : $('.use_PaySeq').val()
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
				
				
				
			}
			
		})



</script>