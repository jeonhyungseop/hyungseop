<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 6. 11. 진예은          날짜형태 변경
* 2021. 6. 13. 진예은          날짜형태 오류 수정
*
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<style>
		.svgicon_pay{
			color: #6a5c59;
			margin-right: 15px;
		}

		.payListfont{
			margin-top: 10px;
			margin-bottom: 20px;
		}
		
		.card-title{
			margin-bottom: 20px;
		}
		
		th{
			text-align: center;
		}
		
		table{
			text-align: center;
			vertical-align: middle;
		}
		
		.left{
			text-align: left;
		}
		
		.sizeup{
			width: 400px;
		}
		
		.usePaynm{
			display: inline-block;
		}
		
		.modal-body h4{
			margin-top: 10px;
			margin-bottom: 20px;
		}
		
		.datecom{
			background: #f3ecec;
		}
		
		.d_day{
			font-weight: bold;
			color: red;
		}
		
		.fontbold{
			font-weight: bold;
			height: 100px;
			font-size: 20px;
		}
		
		.rounded-pill{
			margin-right: 5px;
		}
		
		
		.btnSize{
			width: 180px;
		}
		
		.btnTitle{
			display: inline-block;
		}
		
		.modiProd{
			float: right;
			margin-bottom: 20px;
		}
		
		.cansle{
			float: right;
			margin-left: 5px;
		}
		
		.payback{
			color: red;
		}
		
		.right{
			text-align: right;
		}
		
		.row>*{
			width : 50%;
		}
		
		.breadcrumb{
			float: right;
		}
		
		.hideOption{
			margin-top: -21px;
		}
		
		#pagingArea{
			margin-top: -41px;
			margin-left: 161px;
		}
		
		.systemprodDIV{
			height: 400px;
		}
	</style>
    <div id="app">
        <div id="sidebar" class="active">
            
        </div>

            <div class="page-heading">
                     
                <section class="section">
                    <div class="card">
                        <div class="card-header">
                        	<div class="row">
								<div class="rowLeft">
									<h4>시스템 상품정보 조회</h4>
								</div>
								<div class="rowRight">
									<nav aria-label="breadcrumb" >
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
											<li class="breadcrumb-item active" aria-current="page">시스템 상품정보 조회</li>
										</ol>
									</nav>
								</div>
							</div>
                        </div>
                        <div class="card-body">
                        <h4 class="card-title btnTitle">${authId}<span>님의 이용상품</span></h4>
                        <button class="btn btn-primary cansle" data-bs-toggle="modal" data-bs-target="#default">서비스 해지</button>
                        <a class="btn btn-primary modiProd" href="${cPath}/head/systemprod/modify">상품변경</a>
                           <table class="table table-borderd">
								<tr>
									 <th>상품명</th>                       
									 <th>제공 서비스</th>                       
									 <th>이용 만료일</th>                       
								</tr>
								
								<c:choose>
									<c:when test="${not empty usePay}">
									<c:set var="systempaymentList" value="${usePay.systempaymentList}"/>
										<tr>
											<td rowspan="3" class="sizeup" >
												<c:set var="systempaymentList" value="${usePay.systempaymentList}"/>
												<a href="#" class="btn btn-outline-secondary rounded-pill">이용중</a>
												<c:forEach items="${systempaymentList }" var="use">
													<h4 class="usePaynm">${use.syspay_nm}</h4>
												</c:forEach>  
												<input type="hidden" value="${usePay.pay_seq}" class="seq">
											</td>
											<td class="left">
												<svg class="svg-inline--fa fa-calendar fa-w-14 fa-fw select-all svgicon svgicon_pay" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="calendar" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M12 192h424c6.6 0 12 5.4 12 12v260c0 26.5-21.5 48-48 48H48c-26.5 0-48-21.5-48-48V204c0-6.6 5.4-12 12-12zm436-44v-36c0-26.5-21.5-48-48-48h-48V12c0-6.6-5.4-12-12-12h-40c-6.6 0-12 5.4-12 12v52H160V12c0-6.6-5.4-12-12-12h-40c-6.6 0-12 5.4-12 12v52H48C21.5 64 0 85.5 0 112v36c0 6.6 5.4 12 12 12h424c6.6 0 12-5.4 12-12z"></path></svg>
												<c:forEach items="${systempaymentList }" var="use">
													요금제 사용기간 : ${use.syspay_month }개월
												</c:forEach>
											</td>
											<td rowspan="3" class="sizeup"><span class="endDate">${usePay.syspay_end_time}</span></td>
										</tr>                
										<tr>
											<td class="left">
												<svg class="svg-inline--fa fa-user fa-w-14 fa-fw select-all svgicon svgicon_pay" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="user" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg=""><path fill="currentColor" d="M224 256c70.7 0 128-57.3 128-128S294.7 0 224 0 96 57.3 96 128s57.3 128 128 128zm89.6 32h-16.7c-22.2 10.2-46.9 16-72.9 16s-50.6-5.8-72.9-16h-16.7C60.2 288 0 348.2 0 422.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-41.6c0-74.2-60.2-134.4-134.4-134.4z"></path></svg>
												<c:forEach items="${systempaymentList }" var="use">
													가맹점 등록개수 : ${use.syspay_user_num }개 점포
												</c:forEach>
											</td>
										</tr>                
										<tr>
											<td class="left">
												<svg class="svg-inline--fa fa-coins fa-w-16 fa-fw select-all svgicon svgicon_pay" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="coins" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M0 405.3V448c0 35.3 86 64 192 64s192-28.7 192-64v-42.7C342.7 434.4 267.2 448 192 448S41.3 434.4 0 405.3zM320 128c106 0 192-28.7 192-64S426 0 320 0 128 28.7 128 64s86 64 192 64zM0 300.4V352c0 35.3 86 64 192 64s192-28.7 192-64v-51.6c-41.3 34-116.9 51.6-192 51.6S41.3 334.4 0 300.4zm416 11c57.3-11.1 96-31.7 96-55.4v-42.7c-23.2 16.4-57.3 27.6-96 34.5v63.6zM192 160C86 160 0 195.8 0 240s86 80 192 80 192-35.8 192-80-86-80-192-80zm219.3 56.3c60-10.8 100.7-32 100.7-56.3v-42.7c-35.5 25.1-96.5 38.6-160.7 41.8 29.5 14.3 51.2 33.5 60 57.2z"></path></svg>
													요금제 가격 : <span class="paymoney">${usePay.systempaymentList[0].syspay_pc }</span>원
											</td>
										</tr> 
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">이용중인 상품이 없습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>
                           </table> 
                           
                           <br>
                           <h4 class="card-title payListfont">${authId}<span>님의 결제내역</span></h4>
                           
                           <form id="searchForm" action="${cPath}/head/systemprod/info">
                           		<input type="hidden" name="page" value="${pagingVO.currentPage}"/>
                           
                           </form>
                           <div class="systemprodDIV">
                           <table class="table table-hover">
                           <thead>
                           		<tr>
                           			<th>결제일</th>
                           			<th colspan="2">상품명</th>
                           			<th>결제수단</th>
                           			<th>가격</th>
                           			<th>상품만료일</th>
                           			<th>정기결제여부</th>
                           		</tr>
                           	</thead>
                           	<tbody id="listBody">
                           	
                           	<c:choose>
                           		<c:when test="${not empty pagingVO.dataList }">
                           		
                           		
                           		
                           		<%-- 
                           		  		<c:forEach items="${pagingVO.dataList}" var="pay">
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
										<td class="left">
	                           				${pay.syspay_nm }
										</td>
	                           			<td>${pay.com_code_nm }</td>
	                           			<td>
		                           			<c:forEach items="${systempaymentList }" var="use">
												${use.syspay_pc }
											</c:forEach>
	                           			</td>
	                           			<td class="endTIME">${pay.syspay_end_time }</td>
	                           			<td>
	                           				<c:choose>
	                           					<c:when test="${pay.syspay_repay_at eq 'N' }">
	                           						-
	                           					</c:when>
	                           					<c:otherwise>
	                           						사용
	                           					</c:otherwise>
	                           				</c:choose>
	                           				
	                           			</td>
	                           		</tr>
                           		</c:forEach>
                           		
                           		 --%>
                           
                           		</c:when>
                           	</c:choose>
                           	
                        
                           		</tbody>
                           </table>
                           </div>
                           <div class="dataTable-bottom hideOption">
							<div class="dataTable-info">Showing ${pagingVO.startPage } to <span id="totalPage"></span> of <span id="currentPage"></span> entries</div>
						</div>
						<div id="pagingArea" class="d-flex justify-content-center">
							${pagingVO.pagingHTMLBS }</div>
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
					$(resp.dataList).each(function(idx, pay) {
						$(pay.systempaymentList).each(function(idx, sys){
							if(pay.syspay_repay_at == 'Y'){
								pay.syspay_repay_at = '사용';
							}else{
								pay.syspay_repay_at = '-';
							}
							
							if(pay.syspay_use_at == 'N'){
								code = '<a href="#" class="btn btn-outline-danger rounded-pill">서비스해지</a>';
							}else{
								usePayEndTime = ${usePay.syspay_end_time};
								String(pay.syspay_end_time).replace(/\-/gi, "")
								
								if(usePayEndTime != null){
									if(usePayEndTime == String(pay.syspay_end_time).replace(/\-/gi, "")){
										code = '<a href="#" class="btn btn-outline-secondary rounded-pill">이용중</a>';
									}else{
										code = '<a href="#" class="btn btn-outline-secondary rounded-pill">기간만료</a>';
										
									}
								}
							}
							
							
						console.log("pay : " + pay.systempaymentList)
						let tr = $("<tr>").append(
								 $('<td>').html(pay.syspay_pay_time),
								 $('<td class="btnSize">').html(code),
							  	 $('<td class="left">').html(pay.syspay_nm),
							  	 $('<td>').html(pay.com_code_nm),
								 $('<td class="right">').html(
								 	sys.syspay_pc
								 ),
								 $('<td>').html(pay.syspay_end_time),
								 $('<td>').html(pay.syspay_repay_at)
							).data("pay", pay).css("cursor", "pointer");
						trTags.push(tr);
						 })
					});
					
					
					
					
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






     
     $(function(){
    	 
		//남은 구독일 계산
   		let startDate = ${usePay.syspay_pay_time}
   		let endDate = ${usePay.syspay_end_time}
   		
   		String(startDate).substring(0,1)
   		
   		var date_start = new Date(String(startDate).substring(0,4), String(parseInt((String(startDate).substring(4,6))-1)), String(startDate).substring(6,8))
   		var date_end = new Date(String(endDate).substring(0,4), String(parseInt((String(endDate).substring(4,6))-1)), String(endDate).substring(6,8))
   		var today = new Date();
   		
   		minus = date_end - date_start;
   		minus_current = date_end - today//오늘날짜를 구해서 남은 구독일 구하기
   		
   		day = 24*60*60*1000;
   		Month = day*30;
   		Year = Month*12;
   		
   		year = parseInt(minus/Year);
   		month = parseInt(minus/Month);
   		d_day = parseInt(minus/day); //전체 남은일
   		
   		
   		d_day_current = parseInt(minus_current/day);
   		
   		$('.d_day').text(d_day_current);
   		
   		//이용 만료일
   		let commaEnd = String(endDate).substring(0,4) + "-" + String(endDate).substring(4,6) + "-" + String(endDate).substring(6,8)
   		$('.endDate').text(commaEnd);
   		
   		//결제내역 결제일
   		$('.startTIME').each(function(idx, start) {
				text = $(this).text();
				startTIME = String(text).substring(0,4) + "." + String(text).substring(4,6) + "." + String(text).substring(6,8)
				$(this).text(startTIME);
			})
   		
   		
   		//결제내역 이용만료일
   		$('.endTIME').each(function(idx, end) {
				text = $(this).text();
				endTEXT = String(text).substring(0,4) + "." + String(text).substring(4,6) + "." + String(text).substring(6,8)
				$(this).text(endTEXT);
			})
   		
   		let locale = navigator.language;
   		let paymoney_change = ${usePay.systempaymentList[0].syspay_pc }
    	paymoney_change = Number(paymoney_change).toLocaleString(locale);
    	$('.paymoney').text(paymoney_change);
    	//.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')
   		
    	
    	
   		//환불금액 계산
    	if((d_day/2) < d_day_current){
	   		let money = $('.paymoney').text().replace(/\,/gi, "");
	    	let payback = (parseInt(money/d_day) * parseInt(d_day_current));
	    	payback = Number(payback).toLocaleString(locale);
	    	payback = payback.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
	    	$('.payback').text(payback);
	    	
    	
    	}else{
    		$('.customMoney').empty();
    		$('.customMoney').text("서비스를 50%이상 사용하여 환불이 불가합니다.").css('color', 'red');
    		
    	}
    	 
   		let Memo = $('.prodNM').text() + " 환불";
   		
    	$('.okbtn').on('click', function(){
       		
       		if($('input[type=password]').val() == ""){
       			alert("비밀번호를 입력해주세요")
       		}else{
       			
       			let pwd = $('input[type=password]').val();
       	   		let seq =  $('.seq').val();
       	   		
       	   		if($('.payback').text() != null){
       	   				pay_price = $('.payback').text().replace(/\,/gi, "");
       	   			
       	   		}else{
       	   				pay_price = "no";
       	   			
       	   		}
       	   		
       	   		$.ajax({
       				url : "${cPath}/head/systemprod/delete",
       				method : "post",
       				data : {
       					"pwd" : pwd,
       					"seq" : seq,
       					"pay_price" : pay_price,
       					"Memo" : Memo
       				},
       				dataType : 'text',
       				success : function(resp) {
       					//alert(resp)
        			 	if(resp == "pass"){
    	   					alert("비번 오류");
       						location.href="${cPath}/head/systemprod/info";
       					}else{
       						location.href="${cPath}/head/systemprod";
       						alert("서비스가 해지되었습니다.");
       					}
       				},
       				error : function(xhr, error, msg) {
       					console.log(xhr);
       					console.log(error);
       					console.log(msg);
       					alert(msg)
       				}
       			});
       			
       		}
       	})
   		
   		
   		
   		
   		
   		
   	//모달 숨겨질때 이벤트
   	 $('#default').on('hidden.bs.modal', function () {
		$('.pwdinput').val("");
     });
   		
   		
   	})
   	
		
</script>   
   