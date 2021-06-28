<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 6.  6. 배수진          전체적인 화면수정
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">    
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">

<style>
.stsBtn {
	display : inline-block;
	width : 23%;
	background-color: #826767;
	color :#fff;
	border-radius: 2px;
	text-align: center;
} 


#table1 th { 
 	text-align : center; 
 } 

.date {
	width : 47%;
	border : 1px solid #dce7f1;
	border-radius: 0.25rem;
	padding : 0.375rem;
	color : #607080;
}
.okSts {
	background-color: #51a288; color :#fff;
}
.cancleSts {
	background-color: #f54e5c; color :#fff;
}
.ingSts {
	background-color: #826767; color :#fff;
}
.waitSts {
	background-color: #888; color :#fff;
}
.tableSetting {
	display: flex;;
	justify-content: space-between;
}
#searchForm button {
	display: none;
}


</style>

    
<body>
    <div id="app">
    	<input type="hidden" id="message" value="${insertMsg }">
	
    	<section class="section">
    	
    		<!-- card 영역 -->
    		<div class="card">
    		
    			<!-- card-header 영역 -->
				<div class="card-header">
					<div class="row">
						<div class="rowLeft">
							<h4>주문 조회</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">주문 조회</li>
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
								<button type="submit"class="btn btn-primary float-end pribtn">검색</button>
								<button type="reset" id="reset" class="resetBtn icon dripicons-clockwise float-end"></button>
							</div>
							<table class="table table-borderd">
								<tbody class="talbeSearchArea">
									<tr>
										<th class="searchTh"  style="width: 10%;">상호명</th>
										<td style="width: 23.3%;">
											<input type="text" name="searchWord" id="searchWord" class="form-control" onKeyup="fn_search(this)">
										</td>
										<th class="searchTh"  style="width: 10%;">등록일자</th>
										<td style="width: 46.6%;" colspan="3">
											
												<input class="inputText mr-2 date" type="date" name="minDate" value="${pagingVO.searchMap.minDate }" placeholder="시작 검색 일" onchange="fn_search(this)" /> 
												-
												<input class="inputText mr-2 date" type="date" name="maxDate" value="${pagingVO.searchMap.maxDate }" placeholder="종료 검색 일" onchange="fn_search(this)"/>
										</td>
									</tr>
									<tr>
										<th class="searchTh"  style="width: 10%;">발주상태</th>
										<td style="width: 23.3%;">
											<select id='orsCode' name="orsCode" class="form-select" onchange="fn_search(this)">
												<option value="">전체</option>
												<c:if test="${not empty orsCode }">
	                                        		<c:forEach items="${orsCode.comCodeList }" var="ors">
	                                        			<option value="${ors.com_code }">${ors.com_code_nm }</option>
	                                        		</c:forEach>
	                                        	</c:if>
                                        	</select>
										</td>
										<th class="searchTh"  style="width: 10%;">출고상태</th>
										<td style="width: 23.3%;">
											<select id='oscCode' name="oscCode" class="form-select"  onchange="fn_search(this)">
												<option value="">전체</option>
												<c:if test="${not empty oscCode }">
	                                        		<c:forEach items="${oscCode.comCodeList }" var="osc">
	                                        			<option value="${osc.com_code }">${osc.com_code_nm }</option>
	                                        		</c:forEach>
	                                        	</c:if>
                                        	</select>
										</td>
										<th class="searchTh"  style="width: 10%;">입고상태</th>
										<td style="width: 23.3%;">
											<select id='istCode' name="istCode" class="form-select"  onchange="fn_search(this)"> 
												<option value="">전체</option>
												<c:if test="${not empty istCode }">
	                                        		<c:forEach items="${istCode.comCodeList }" var="ist">
	                                        			<option value="${ist.com_code }">${ist.com_code_nm }</option>
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
							<div class="tableSetting">
								<div class="totalRecode">
									총 ${pagingVO.totalRecord } 건 
								</div>
								<div class="btnArea">
									<button type="button" id="excelDownBtn" class="btn btn-primary float-end pribtn" >엑셀 다운로드 </button> 
		                            <button type="button" class="btn btn-primary float-end pribtn"  onclick="fnPrint('selectArea')">인쇄 </button>
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
							</div>
							
							
							<div class="dataArea" id="selectArea">
								<table class="table table-hover dataTable-table" id="table1">
									<thead>
										<tr>
											<th data-sortable="" style="width: 4.5%;"><a href="#" class="dataTable center">순번</a></th> 
											<th data-sortable="" style="width: 7.5%;"><a href="#" class="dataTable center">발주요청번호</a></th> 
				                            <th data-sortable="" style="width: 14%;"><a href="#" class="dataTable">가맹점</a></th>
				                            <th data-sortable="" style="width: 8%;"><a href="#" class="dataTable">발주등록일</a></th>
				                            <th data-sortable="" style="width: 8%;"><a href="#" class="dataTable">발주승인일</a></th>
				                            <th data-sortable="" style="width: 8%;"><a href="#" class="dataTable">출고등록일</a></th>
				                            <th data-sortable="" style="width: 8%;"><a href="#" class="dataTable">출고완료일</a></th>
				                            <th data-sortable="" style="width: 8%;"><a href="#" class="dataTable">입고완료일</a></th>
				                            <th data-sortable="" style="width: 8%;"><a href="#" class="dataTable">총주문가격</a></th>
				                            <th data-sortable="" style="width: 27%;"><a href="#" class="dataTable">상태</a></th>
										</tr>
									</thead>
									<tbody id="listBody">
									
									
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
    
        
        <!-- 검색 폼 -->
	    <form id="searchForm" action="${cPath }/head/limit" >
	    	<button type="reset"></button>
	        <input type="hidden" name="searchType" value="${pagingVO.searchMap.searchType }" />
	        <input type="hidden" name="searchWord" value="${pagingVO.searchMap.searchWord }" />
	        <input type="hidden" name="page" value="1"/>
	        <input type="hidden" name="minDate" value="${pagingVO.searchMap.minDate }"/>
			<input type="hidden" name="maxDate" value="${pagingVO.searchMap.maxDate }"/>
			<input type="hidden" name="screenSize" value=""/>
			<input type="hidden" name="orsCode" value=""/>
			<input type="hidden" name="oscCode" value=""/>
			<input type="hidden" name="istCode" value=""/>
	    </form>
	     
	    
	    <!-- 스크립트 -->
	    <script type="text/javascript">
		    let listBody = $("#listBody");
	        let pagingArea = $("#pagingArea");
	        let currentPage = $("#currentPage");
	        let locale = navigator.language;
	        let search = $("#searchForm");
	        let totalPage = $("#totalPage");
	        let excelDownBtn = $("#excelDownBtn");
	        let screenSize = $("#screenSize");
	        let totalRecode = $(".totalRecode");
	        let reset = $("#reset");
	        
			$(function(){
				if($("#message").val() != ""){
					alert($("#message").val());
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
			
			//리셋
			reset.on("click",function(){
			 search.clearForm();
             searchForm.submit();
           })
			
						
	        //검색
	    	function fn_search(obj){
	    		let name = obj.getAttribute('name');
	    		search.find("input[name="+name+"]").val(obj.value);
	    		searchForm.submit()
	    	};
	        
	    	//페이지 클릭 이벤트
		    pagingArea = $("#pagingArea").on("click", "a", function(event){
	    		event.preventDefault();
	    		let page = $(this).data("page");
	    		if(page){
	    			search.find("[name='page']").val(page);
	    			searchForm.submit();
	    		}
	    		return false;
	    	});
	        
		   //페이징 처리
	       searchForm = $("#searchForm").ajaxForm({
	            dataType: "json",
	            beforeSubmit: function() {
	            	search.find("[name='page']").val("");
	            },
	            success: function(resp) {
	                listBody.empty();
	                pagingArea.empty();
	                currentPage.empty();	
	                totalPage.empty();
	                totalRecode.empty();
	                let trTags = [];
	                if (resp.dataList) {
	                    $(resp.dataList).each(function(idx, datalist) {
                        	
                        	let orderColor = null;
                        	let outColor = null;
                        	let inColor = null;
                        	
                        	switch(datalist.order_sttus_code){
                           	case "A0001" : 
                           		orderColor = "okSts"
                           	break;
                           	case "B0001" : 
                           		orderColor = "ingSts"
                           	break;
                           	case "C0001" : 
                           		orderColor = "cancleSts"
                           	break;
                           	case "waitSts" : 
                           		orderColor = "waitSts"
                           	break;
                           	default :
                           		orderColor = "waitSts"
                           	break;
                	       }
                        	
                        	switch(datalist.out_sttus_code){
                           	case "A0001" : 
                           		outColor = "okSts"
                           	break;
                           	case "B0001" : 
                           		outColor = "ingSts"
                           	break;
                           	case "C0001" : 
                           		outColor = "cancleSts"
                           	break;
                           	case "D0001" : 
                           		outColor = "waitSts"
                           	break;
                           	default :
                           		outColor = "waitSts"
                           	break;
                	       }
                        	
                        	switch(datalist.in_sttus_code){
                           	case "A0001" : 
                           		inColor = "okSts"
                           	break;
                           	case "B0001" : 
                           		inColor = "ingSts"
                           	break;
                           	case "C0001" : 
                           		inColor = "cancleSts"
                           	break;
                           	case "D0001" : 
                           		inColor = "waitSts"
                           	break;
                           	default :
                           		inColor = "waitSts"
                           	break;
                	       }
                        	let oscNm = datalist.osc_nm ;
                        	if(oscNm == null){
                        		oscNm = "출고대기"
                        	}
                        	let iscNm = datalist.isc_nm ;
                        	if(iscNm == null){
                        		iscNm = "입고대기"
                        	}
                        	
                        	let order_comfn_time = "-";
                       		if(datalist.order_confm_time != null){
                       			order_comfn_time = moment(datalist.order_confm_time).format('YYYY-MM-DD');
                       		}
                        	let out_time = "-";
                       		if(datalist.out_time != null){
                       			out_time = moment(datalist.out_time).format('YYYY-MM-DD');
                       		};
                        	let out_cmpt_time = "-";
                       		if(datalist.out_cmpt_time != null){
                       			out_cmpt_time = moment(datalist.out_cmpt_time).format('YYYY-MM-DD');
                       		};
                        	let in_cmpt_time = "-";
                       		if(datalist.in_cmpt_time != null){
                       			in_cmpt_time = moment(datalist.in_cmpt_time).format('YYYY-MM-DD');
                       		};
                        	
	                        let tr = $("<tr>").append(
	                        	$("<td>").addClass("center").html(datalist.rnum),
	                        	$("<td>").addClass("center").html(datalist.order_no),
	                        	$("<td>").html(datalist.fran_comnm),
	                        	$("<td>").addClass("center").html(datalist.yymmdd),
	                        	$("<td>").addClass("center").html(order_comfn_time),
	                        	$("<td>").addClass("center").html(out_time),
	                        	$("<td>").addClass("center").html(out_cmpt_time),
	                        	$("<td>").addClass("center").html(in_cmpt_time),
	                        	$("<td>").addClass("right").html(datalist.order_suplypc_sm.toLocaleString() + "원"),
	                        	$('<td>').addClass("center").html('<div id="status"><div class="order-status stsBtn '+ orderColor +'">'+ datalist.orc_nm +' </div>'
	                        	        +'<svg class="bi" width="1em" height="1em" fill="#826767"><use xlink:href="${cPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.svg#arrow-right-short"></use></svg>'+
	                        	        '<div class="out-status stsBtn '+ outColor +'"> '+ oscNm +' </div>'
	                        	        +'<svg class="bi" width="1em" height="1em" fill="#826767"><use xlink:href="${cPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.svg#arrow-right-short"></use></svg>'+
	                        	        '<div class="in-status stsBtn '+ inColor +'"> '+ iscNm +' </div></div>')
	                        	
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
	                listBody.html(trTags);
	                totalRecode.html("총 " + resp.totalRecord + " 건");
	                currentPage.html(resp.currentPage);
	                pagingArea.html(resp.pagingHTMLBS);
	                totalPage.html(resp.totalPage);
	            },
	            error: function(xhr, resp, error) {
	            }
	        });
	       
	       // 한번에 보여주는 리스트 수  
	       $("#screenSize").on("change", function(){
	    	   search.find("input[name='screenSize']").val($(this).val());
	        	searchForm.submit();
	    	});
	       
		   
		   //프린트
	       function fnPrint($id) {
	        	var _print = '<style>#table1 {border : 1px solid black; border-collapse : collapse; }  #table1 td, #table1 th {border : 1px solid black; padding : 5px;} a {color : black; text-decoration : none;}</style>';
	        	_print += document.getElementById($id).innerHTML;
	        	
				var objWin = window.open('', 'print');
				objWin.document.write(_print);
				objWin.document.close();

				objWin.print();
				objWin.close();

	        };
	        
	        $(listBody).on("click",'tr',function(){
	        	let orderNo = $(this).find('td:eq(1)').text();
	        	location.href ="${cPath }/head/limit/detail?what=" + orderNo;
	        })
		   
	       
	        
	        
	       searchForm.submit();
	       
	    </script>
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    