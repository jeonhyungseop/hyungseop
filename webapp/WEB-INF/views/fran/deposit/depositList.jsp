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
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<style>
    #div-blce {
        text-align: right;
        width: 100%;
        background-color: #f3f3f3;
        height: 50px;
        padding: 10px;
        margin: 8px 0px;
    }

    #div-blce p {
        line-height: 250%;
        font-size: 12px;
    }

    #div-blce span {
        font-size: 20px;

    }

    #cardbody-wrap {
        clear: both;
    }

    .dataTable-top>div:first-child {
        float: left;
    }
    .dataTable-top {
    	padding :8px 0px;
    }
    #dsmn-notice {
    	border: 1px solid #ddd;
    	padding : 8px;
    }
    #dsmn-notice ul {
    	padding : 0px;
    	margin : 0px 0px 0px 30px;
    	
    }
    #dsmn-table {
    	margin: 10px 0px;
    	width : 100%;
    	border: 1px solid #ddd;
    }
    #dsmn-table td {
    	padding: 10px;
    }
    #dsmn-table td:first-child {
    	background-color: #f3f3f3;
    }
    #searchUI {
    	width : 100%;
    	display : flex;
    	justify-content: space-between;
    	align-items: center;;
    }
    #searchUI input, #searchUI select {
    	display: inline;
    	width: 25%;
    }
    .searchTh{
	width: 250px;
	}
	.table-borderd  th{
		background-color : #F2F7FF;
		margin-bottom: 80px;
		text-align: center;
		vertical-align: middle;
	}
	.table-borderd {
		margin-bottom: 80px;
		border: 1px solid #ddd;
	}
	.date{
		width: 200px;
		display: inline-block;
	}
	.inputText{
		width: 415px;
	}
	.dataTable-dropdown{
		float: right;
	}
	.titleFont{
		font-weight: bold;
		font-size: 18px;
		color: #25396F;
	}
</style>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<body>
    <div id="app">
        <div id="sidebar" class="active"></div>

        <div class="page-heading">
<!--             <div class="page-title"> -->
<!--                 <div class="row"> -->
<!--                     <div class="col-12 col-md-6 order-md-1 order-last"> -->
<!--                         <h3>예치금 조회</h3> -->
<!--                         <p class="text-subtitle text-muted">가맹점 예치금조회</p> -->
<!--                     </div> -->
<!--                     <div class="col-12 col-md-6 order-md-2 order-first"> -->
<!--                         <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end"> -->
<!--                             <ol class="breadcrumb"> -->
<!--                                 <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li> -->
<!--                                 <li class="breadcrumb-item active" aria-current="page">예치금 조회</li> -->
<!--                             </ol> -->
<!--                         </nav> -->
<!--                     </div> -->
<!--                 </div> -->
            </div>
            <section class="section">
                <div class="card">
                    <div class="card-header">
                        <h4 class="card-title" style="display:inline-block;">예치금 조회</h4>
                        <button type="button" id="excelDownBtn" class="btn btn-primary float-end pribtn" >엑셀 다운로드 </button>
                        <button type="button" class="btn btn-primary float-end pribtn"  onclick="fnPrint('selectArea')">인쇄 </button>
                        <button type="button" class="btn btn-primary float-end pribtn" data-bs-toggle="modal" data-bs-target="#default">충전 </button>
                        <div class="dataTable-dropdown float-end">
                            <select id="screenSize" class="dataTable-selector form-select">
                                <option value="5">5개씩 보기</option>
								<option value="10" selected="">10개씩 보기</option>
								<option value="15">15개씩 보기</option>
								<option value="20">20개씩 보기</option>
								<option value="25">25개씩 보기</option>
                            </select>
                        </div>
                    </div>

                    <!-- 내용 -->
                    <div class="card-body">

                        <div id="cardbody-wrap" class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns">
                             <div class="dataTable-top">
<!-- 								<span class="titleFont">가맹본부 검색</span> -->
		                            <table id="searchTable" class="table table-borderd">
										<tr>
											<th class="searchTh">입출금 선택</th>
											<td>
												<select name="searchType" class="form-control mr-2" onChange="fn_search(this)">
												<option value="">입출금 구분</option>
												<option value="A0001">입금</option>
												<option value="B0001">출금</option>
											</select>
											</td>
										</tr>
										<tr>
											<th class="searchTh">내용 검색</th>
											<td>
												<input class="form-control mr-2" type="text"  placeholder="Search..." name="searchWord" value="${pagingVO.searchMap.searchWord }" onkeyup="fn_search(this)"/>
											</td>
										</tr>
										<tr>
											<th class="searchTh">기간</th>
											<td>
												<input class="form-control mr-2" type="date" name="minDate" value="${pagingVO.searchMap.minDate }" onchange="fn_search(this)" /> 
												-
												<input class="form-control mr-2" type="date" name="maxDate" value="${pagingVO.searchMap.maxDate }" onchange="fn_search(this)"/>
											</td>
										</tr>
		                            </table>
		                        <div id="div-blce">
		                            <p> 잔액 &nbsp;
		                                <span id="totalBlce">
		                                </span>원 
		                            </p>
		                        </div>
                            </div>
                            <div class="dataTable-container" id="selectArea" >
                                <table class="table table-hover dataTable-table" id="table1">
                                    <thead>
                                        <tr>
                                            <th data-sortable="" style="width: 16%;"><a href="#" class="dataTable">날짜</a></th>
                                            <th data-sortable="" style="width: 16%;"><a href="#" class="dataTable">시간</a></th>
                                            <th data-sortable="" style="width: 16%;"><a href="#" class="dataTable">내용</a></th>
                                            <th data-sortable="" style="width: 16%;"><a href="#" class="dataTable">상태</a></th>
                                            <th data-sortable="" style="width: 16%;"><a href="#" class="dataTable">금액</a></th>
                                            <th data-sortable="" style="width: 16%;"><a href="#" class="dataTable">잔액</a></th>

                                        </tr>
                                    </thead>
                                    <tbody id="listBody">
                                        <c:choose>
                                            <c:when test="${not empty pagingVO.dataList }">
                                                <c:forEach items="${pagingVO.dataList }" var="deposit">
                                                    <tr>
                                                        <td>${deposit.yymmdd }</td>
                                                        <td>${deposit.hh24mi }</td>
                                                        <td>${deposit.memo }</td>
                                                        <td>${deposit.dscnm }</td>
                                                        <td>${deposit.dsmn_mvmoney }</td>
                                                        <td>${deposit.dsmn_blce }</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <tr>
                                                    <td colspan="6">조건에 맞는 게시글이 없음.</td>
                                                </tr>
                                            </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                            <div class="dataTable-bottom">
                                <div class="dataTable-info">
                                    Showing ${pagingVO.startPage } to <span id="totalPage">${pagingVO.totalPage }</span> of <span id="currentPage">${pagingVO.currentPage }</span> entries
                                </div>
                            </div>
                            <div id="pagingArea" class="d-flex justify-content-center">
                                ${pagingVO.pagingHTMLBS }</div>
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
                    <h5 class="modal-title" id="myModalLabel1">예치금 충전</h5>
                    <button type="button" class="close rounded-pill" data-bs-dismiss="modal" aria-label="Close">
                        <i data-feather="x"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <p>예치금은 가맹점과의 거래 및 시스템 상품 결제에 사용하실 수 있습니다.</p>
                    <div id="dsmn-notice">
                    	<ul>
                    		<li>예치금은 카드결제만 가능합니다.</li>
                    		<li>충전된 내역은 <span>매출관리 &gt; 입금관리</span> 페이지에서 확인하실 수 있습니다.</li>
                    	</ul>
                    </div>
                    	<table border="1" id="dsmn-table">
                    		<tr>
                    			<td>충전 금액 입력</td>
                    			<td><input type="text" id="dsmn_money" name="dsmn_money"> 원</td>
                    		</tr>
                    		<tr>
                    			<td>결제 수단 선택</td>
                    			<td>
                    				<select>
                    					<option>결제수단선택</option>
                    					<option>카카오페이</option>
                    				</select>
                    			</td>
                    		</tr>
                    	</table>
                    	
                    	<input type="checkbox" name="ok_check" value="ok"> 결제 동의하기
                </div>
                <div class="modal-footer">
                    
                    <button type="button" id="paymentBtn" class="btn btn-primary ml-1" data-bs-dismiss="modal">
                        <i class="bx bx-check d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">결제하기</span>
                    </button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="bx bx-x d-block d-sm-none"></i>
                        <span class="d-none d-sm-block" id="paycancleBtn">취소</span>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- 검색 폼 -->
    <form id="searchForm" action="${cPath }/fran/deposit">
        <input type="hidden" name="searchType" value="${pagingVO.searchMap.searchType }" />
        <input type="hidden" name="searchWord" value="${pagingVO.searchMap.searchWord }" />
        <input type="hidden" name="page" />
        <input type="hidden" name="minDate" value="${pagingVO.searchMap.minDate }"/>
		<input type="hidden" name="maxDate" value="${pagingVO.searchMap.maxDate }"/>
		<input type="hidden" name="screenSize" value="${pagingVO.searchMap.screenSize }"/>
    </form>

    <!-- 스크립트  -->
    <script type="text/javascript">
        let listBody = $("#listBody");
        let pagingArea = $("#pagingArea");
        let currentPage = $("#currentPage");
        let locale = navigator.language;
        let paymentBtn = $("#paymentBtn");
        let searchUI = $("#searchUI");
        let searchForm = $("#searchForm");
        let totalPage = $("#totalPage");
        let excelDownBtn = $("#excelDownBtn");
        let myModalEl = $('#default');
        let totalBlce = $('#totalBlce');
        
        var money_regx = /^[0-9]+$/;
        
        //검색
    	searchUI.find("[name='searchType']").val("${pagingVO.searchMap.searchType }");
    	function fn_search(obj){
    		let name = obj.getAttribute('name');
    		searchForm.find("input[name="+name+"]").val(obj.value);
    		searchForm.submit()
    	};
    	
    	
    	
        //아임포트
        paymentBtn.on("click", function(){
        			

                    var dsmn_money = $("input[name='dsmn_money']")
                    if (dsmn_money.val().length > 0) {
                        if (!dsmn_money.val().match(money_regx)) {
                            alert("숫자만 입력가능합니다.");
                            dsmn_money.val('');
                            return false;
                        }
                    }

                    var ok_check = $("input[name='ok_check']")
                    if (ok_check.is(":checked") == false) {
                        alert("결제 동의를 해주세요.");
                        dsmn_money.val('');
                    } else {

                        var IMP = window.IMP; 
                        IMP.init('imp90445686'); 

                        IMP.request_pay({
                            pg : 'kakao', 
                            pay_method : 'card',
                            merchant_uid : 'merchant_' + new Date().getTime(),
                            name : '예치금 충전',
                            amount : dsmn_money.val(),
                            buyer_email : 'iamport@siot.do',
                            buyer_name : '구매자이름',
                            buyer_tel : '010-1234-5678',
                            buyer_addr : '서울특별시 강남구 삼성동',
                            buyer_postcode : '123-456',
                            m_redirect_url : 'https://www.yourdomain.com/payments/complete'
                        }, function(rsp) {
                            if ( rsp.success ) {
                                var msg = '결제가 완료되었습니다.';
//                                 msg += '고유ID : ' + rsp.imp_uid;
//                                 msg += '상점 거래ID : ' + rsp.merchant_uid;
//                                 msg += '결제 금액 : ' + rsp.paid_amount;
//                                 msg += '카드 승인번호 : ' + rsp.apply_num;
                                
                                $.ajax({
                        			type : "GET",
                        			url : "${cPath }/fran/deposit/form",
                        			data : {
                        				money : rsp.paid_amount,
                        				pg : rsp.pg_provider
                        			},
                        			success : function(resp){
                        				searchForm.submit();
                        			},
                        			error : function(xhr){
                        				alert("실패");
                        			}
                        		});
                                
                            } else {
                                var msg = '결제에 실패하였습니다.';
                                msg += '에러내용 : ' + rsp.error_msg;
                            }
                            alert(msg);
                        });

                        };

                    });
        

    	
    	pagingArea = $("#pagingArea").on("click", "a", function(event){
    		event.preventDefault();
    		let page = $(this).data("page");
    		if(page){
    			searchForm.find("[name='page']").val(page);
    			searchForm.submit();
    		}
    		return false;
    	});
        
        //페이징 처리
        pagingArea.on("click", "a", function(event) {
            event.preventDefault();
            let page = $(this).data("page");
            if (page) {
                searchForm.find("[name='page']").val(page);
                searchForm.submit();
            }
            return false;
        });

       searchForm = $("#searchForm").ajaxForm({
            dataType: "json",
            beforeSubmit: function() {
                searchForm.find("[name='page']").val("");
            },
            success: function(resp) {
                listBody.empty();
                pagingArea.empty();
                currentPage.empty();	
                totalPage.empty();
                totalBlce.empty();
                let trTags = [];
                if (resp.dataList) {
                    $(resp.dataList).each(function(idx, deposit) {
                    	
                        let tr = $("<tr>").append(
                            $("<td>").html(deposit.yymmdd), $("<td>").html(deposit.hh24mi), $("<td>").html(deposit.memo), $("<td>").html(deposit.dscnm),
                            $("<td>").html(deposit.dsmn_mvmoney.toLocaleString(locale)), $("<td>").html(deposit.dsmn_blce.toLocaleString(locale))
                        ).css("cursor", "pointer");
                        trTags.push(tr);
                    });
                } else {
                    trTags.push(
                        $("<tr>").html(
                            $("<td>").attr("colspan", "8").html("조건에 맞는 내역이 없음")
                        )
                    );
                }
                
                totalBlce.html(resp.depositBlce.toLocaleString(locale));
                listBody.html(trTags);
                currentPage.html(resp.currentPage);
                pagingArea.html(resp.pagingHTMLBS);
                totalPage.html(resp.totalPage);
            },
            error: function(xhr, resp, error) {
            }
        });
        searchForm.submit();
        
        //프린트
        function fnPrint($id) {
        	var _print = '<style>#table1 {border : 1px solid black; border-collapse : collapse; }  #table1 td, #table1 th {border : 1px solid black; padding : 10px;} a {color : black; text-decoration : none;}</style>';
        	_print += document.getElementById($id).innerHTML;
        	
			var objWin = window.open('', 'print');
			objWin.document.write(_print);
			objWin.document.close();

			objWin.print();
			objWin.close();

        };
        
        $("#screenSize").on("change", function(){
        	searchForm.find("input[name='screenSize']").val($(this).val());
        	searchForm.submit();
    	});
        
        //엑셀 다운 
        excelDownBtn.on("click", function(){
        	location.href = "${cPath }/fran/deposit/excel";
        });
        
        <c:if test="${not empty msg}" var="msg">
	    	location.href = "${cPath }/fran/deposit";
	    	alert("로그인 후 다시 시도해 주세요.");
   		 </c:if>
        
        </script>
        