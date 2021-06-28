<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 6. 03  진예은          정기결제
*
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
    <style>
    	table{
    		text-align: center;
    	}
    	
    	.usebtn{
    		margin-right: 10px;
    	}
    
    	.nmStyle{
    		display: inline-block;
    		padding-top : 30px;
    		height: 80px;
    	}
    	
    	.regularTitle{
    		margin-top: 30px;
    		margin-bottom: -58px;
    		margin-left: 3px;
    	}
    	
    	.floatStyle{
    		float: right;
    		margin-bottom: 18px;
    		margin-left: 5px;
    	}
    	
    	.nmSize{
    		width: 350px;
    	}
    	
    	.regularListfont{
    		margin-top: 113px;
    		margin-left: 5px;
    	}
    	
    	.btnSize{
    		width: 130px;
    	}
    	
    	.left{
    		text-align: left;
    		width: 191px;
    	}
    	
    	.dataTable-info{
    		float: right;
    		margin-right: 9px;
    	}
    </style>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <div id="app">
        <div id="sidebar" class="active">
            
        </div>

            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>정기결제 조회</h3>
                            <p class="text-subtitle text-muted">The default layout </p>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="${cPath}/head/main">Dashboard</a></li>
                                    <li class="breadcrumb-item active" aria-current="page">정기결제 조회</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title regularTitle">이용중인 정기결제권</h4>
                        </div>
                        <div class="card-body">
                       		<a class="btn btn-primary regularDel floatStyle">해지</a>
                            <button class="btn btn-primary cansle floatStyle" data-bs-toggle="modal" data-bs-target="#default">결제수단 변경</button>
                            <table class="table table-borderd">
                            	<tr>
                            		<th class="tdSize">상품명</th>
                            		<th>구독일</th>
                            		<th>이용중인 정기결제권</th>
                            		<th>다음결제일</th>
                            		<th>결제수단</th>
                            	</tr>
                            	<c:set var="systempaymentList" value="${useRegular.systempaymentList}"/>
                            	<c:choose>
                            		<c:when test="${not empty useRegular }">
                            			<td class="nmSize">
                            				<c:forEach items="${systempaymentList }" var="use">
													<a href="#" class="btn btn-outline-secondary rounded-pill usebtn">이용중</a>
													<h4 class="nmStyle">${use.syspay_nm}</h4>
											</c:forEach>
                            			</td>
                            			<td class="startTime">
                            				${useRegular.syspay_pay_time}
                            			</td>
                            			<td>
                           					<c:forEach items="${systempaymentList }" var="use">
												${use.syspay_month }개월 자동결제
											</c:forEach>
                            			</td>
                            			<td class="endTime">
                            				${useRegular.syspay_end_time }
                            			</td>
                            			<td>
                            				${useRegular.pay_se_code }
                            			</td>
                            		</c:when>
                            		<c:otherwise>
                            			<tr>
                            				<td colspan="5">이용중인 정기결제상품이 없습니다.</td>
                            			</tr>
                            		</c:otherwise>
                            	</c:choose>
                            </table>
                            
                            <h4 class="card-title regularListfont">정기결제내역</h4>
                            <form id="searchForm" action="${cPath}/head/systemprod/regular">
                           		<input type="hidden" name="page" value="${pagingVO.currentPage}"/>
                           		<input type="hidden" name="page" value="${pagingVO.currentPage }"/>
                           </form>
                            <table class="table table-hover"> 
                            <thead>
                            	<tr>
	                            	<th>결제일</th>
                           			<th colspan="2" class="btnSize">상품명</th>
                           			<th>결제수단</th>
                           			<th>가격</th>
                           			<th>상품만료일</th>
	                            </tr>
	                          </thead>
	                          <tbody id="listBody">
	                            <c:choose>
                           			<c:when test="${not empty pagingVO.dataList }">
	                      <%--       <c:choose>
	                            	<c:when test="${not empty regularList }">
	                            		<c:forEach items="${regularList}" var="pay">
                          			<c:set var="systempaymentList" value="${pay.systempaymentList}"/>
	                           		<tr>
	                           			<td>
	                           				<span class="startTIME">${pay.syspay_pay_time}</span></td>
	                           			<td class="btnSize">
	                           				<c:choose>
	                           					<c:when test="${pay.syspay_use_at eq 'N' }">
	                           						<a href="#" class="btn btn-outline-danger rounded-pill">서비스해지</a>
	                           					</c:when>
	                           					<c:otherwise>
	                           							<c:if test="${usePay.syspay_end_time eq pay.syspay_end_time}">
															 <a href="#" class="btn btn-outline-secondary rounded-pill">이용중</a>
														 </c:if>
														 <c:if test="${usePay.syspay_end_time ne pay.syspay_end_time}">
			                           						<a href="#" class="btn btn-outline-secondary rounded-pill">기간만료</a>
														 </c:if>
	                           					</c:otherwise>
	                           				</c:choose>
	                           			</td>
										<td class="leftAlign">
	                           				${pay.syspay_nm }
										</td>
	                           			<td>${pay.com_code_nm }</td>
	                           			<td>
		                           			<c:forEach items="${systempaymentList }" var="use">
												${use.syspay_pc }
											</c:forEach>
	                           			</td>
	                           			<td class="endTIME">${pay.syspay_end_time }</td>
	                           		</tr>
                           		</c:forEach>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<tr>
	                            			<td colspan="5">결제내역이 없습니다.</td>
	                            		</tr>
	                            	</c:otherwise>
	                            </c:choose> --%>
	                            
                                		 </c:when>
	                            </c:choose>
	                           </tbody> 
                            </table>
                          		<div class="dataTable-info">Showing ${pagingVO.startPage } to <span id="totalPage"></span> of <span id="currentPage"></span> entries</div>
						</div>
						<div id="pagingArea" class="d-flex justify-content-center">
							${pagingVO.pagingHTMLBS }</div>
                       
                        </div>
                       
                        </div>
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
                    <h5 class="modal-title" id="myModalLabel1">서비스 해지</h5>
                    <button type="button" class="close rounded-pill" data-bs-dismiss="modal" aria-label="Close">
                        <i data-feather="x"></i>
                    </button>
                </div>
                <div class="modal-body">
                	<h4>
                		<c:forEach items="${systempaymentList }" var="use">
							<span class="prodNM">${use.syspay_nm }</span>
						</c:forEach>
                		상품을 해지신청하셨습니다.
                	</h4>
                	<table class="table table-bordered datecom">
                		<tr>
                			<td class="left fontbold">
                				현재 남은 구독일이 <span class="d_day"></span>일 이고,<br>
                				<span class="customMoney">환불금액은 <span class="payback"></span>원 입니다.</span><br>
                			</td>
                		</tr>
                	</table>
                	
                	  	<table class="table table-bordered">
                		<tr>
                			<td class="left">
                			<br>
                				<ul>
	                				<li>서비스를 해지할 경우 남은 구독일을 계산해 환불처리됩니다.</li>
	                				<li>서비스를 50%이상 사용한 경우 환불처리가 불가합니다.</li>
                				</ul>
                			</td>
                		</tr>
                	</table>
                	<input type="password" class="form-control pwdinput" placeholder="비밀번호를 입력하세요">
                </div>
                <div class="modal-footer">
                    
                    <button type="button" id="paymentBtn" class="btn btn-primary ml-1" data-bs-dismiss="modal">
                        <i class="bx bx-check d-block d-sm-none"></i>
                        <span class="d-none d-sm-block okbtn">확인</span>
                    </button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="bx bx-x d-block d-sm-none"></i>
                        <span class="d-none d-sm-block" id="paycancleBtn">취소</span>
                    </button>
                </div>
            </div>
        </div>
    </div>

<script>

$(function(){
	
	let startTime = $('.startTime').text().trim();
	startTime = String(startTime).substring(0,4) + "." + String(startTime).substring(4,6) + "." + String(startTime).substring(6,8)
	$('.startTime').text(startTime);
	
	let endTime = $('.endTime').text().trim();
	endTime = String(endTime).substring(0,4) + "." + String(endTime).substring(4,6) + "." + String(endTime).substring(6,8)
	$('.endTime').text(endTime);
})

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
let currentPage = $("#currentPage");
let totalPage = $("#totalPage");
let searchForm = $("#searchForm").ajaxForm({
	dataType : 'json',
	 beforeSubmit : function() {
		searchForm.find("[name='page']").val("");
	},success : function(resp) {
		console.log(resp)
		listBody.empty();
		pagingArea.empty();
		currentPage.empty();
		let trTags = [];
		if (resp.dataList) {
	 		$(resp.dataList).each(function(idx, pay) {
				$(pay.systempaymentList).each(function(idx, sys){
					if(pay.syspay_use_at == 'N'){
						code = '<a href="#" class="btn btn-outline-danger rounded-pill">서비스해지</a>';
					}else{
						
						if(${useRegular.syspay_end_time} == pay.syspay_end_time){
							code = '<a href="#" class="btn btn-outline-secondary rounded-pill">이용중</a>';
						}else{
							code = '<a href="#" class="btn btn-outline-secondary rounded-pill">기간만료</a>';
							
						}
					}
					
					
				console.log("pay : " + pay.systempaymentList)
				let tr = $("<tr>").append(
						 $('<td>').html(String(pay.syspay_pay_time).substring(0,4) + "." + String(pay.syspay_pay_time).substring(4,6) + "." + String(pay.syspay_pay_time).substring(6,8)),
						 $('<td class="btnSize">').html(code),
					  	 $('<td class="left">').html(pay.syspay_nm),
					  	 $('<td>').html(pay.com_code_nm),
						 $('<td>').html(
						 	sys.syspay_pc
						 ),
						 $('<td>').html(String(pay.syspay_end_time).substring(0,4) + "." + String(pay.syspay_end_time).substring(4,6) + "." + String(pay.syspay_end_time).substring(6,8))
					).data("pay", pay).css("cursor", "pointer");
				trTags.push(tr);
				 })
			});
			
			
			
			
		} else {
			trTags.push($('<tr>').html(
					$("<td>").attr("colspan", "6").html("결제내역이 없습니다.")
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

//해지버튼 클릭시 이벤트
$('.regularDel').on('click', function(){
/* 	
	IMP.init('imp90445686');
	IMP.request_pay({
		pay_method : 'card', // 'card'만 지원됩니다.
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '최초인증결제',
		amount : 100, // 빌링키 발급과 동시에 1,004원 결제승인을 시도합니다.
		customer_uid : 'your-customer-unique-id', //customer_uid 파라메터가 있어야 빌링키 발급을 시도합니다.
		buyer_email : 'iamport@siot.do',
		buyer_name : '아임포트',
		buyer_tel : '02-1234-1234'
	}, function(rsp) {
		if ( rsp.success ) {
			alert('빌링키 발급 성공');
		} else {
			alert('빌링키 발급 실패');
		}
	});
	 */
})






</script>