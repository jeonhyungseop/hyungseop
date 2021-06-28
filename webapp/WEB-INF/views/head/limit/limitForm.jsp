    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* ${date}      작성자명      최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">    
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<style>
.dataArea {
    height: 550px;
}
.myImage{
		width: 40px;
	} 
.orderHeader {
 	display : flex;
 	justify-content: space-between;
 	width : 100%;
 	border : 5px solid #f5ebe7;
 	padding : 0.75rem;
 	color : #b9a7a7;
 	margin-bottom: 10px;
}
.ordHeaderSpan {
	font-size: 14px;
	color : #876767;
}
#searchForm button {
	display: none;
}

.first {
	display: flex;
}
.first  div {
	width: 50%;
}
.first  div  h6 {
	margin-top: 2%;
}
.dataTable-bottom {
	margin-top: 10px;
}
.dataTable-container {
	overflow-x: hidden; 
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
							<h4>출고 지시서 작성</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">출고지시서 작성</li>
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
							<div class="row first">
								<div>
									<h6>기본 정보</h6>
								</div>
								<div class="btnArea">
									<a href="#" id="putBtn" class="btn btn-primary float-end pribtn">등록</a>
									<button type="button" id="excelDownBtn" class="btn btn-primary float-end pribtn" >엑셀 다운로드 </button>
                     				<button type="button" class="btn btn-primary float-end pribtn"  onclick="fnPrint('selectArea')">인쇄 </button>
									<button type="button" id="backList" class="btn btn-primary float-end pribtn">목록으로</button>
								</div>
							</div>
							<table class="table table-borderd">
								<tbody class="talbeSearchArea">
									<tr>
										<th class="searchTh"  style="width: 8%;">No.</th>
										<td style="width: 17%;">
											 ${pagingVO.detailSearch.out_code }
										</td>
										<th class="searchTh"  style="width: 8%;">거래처</th>
										<td style="width: 17%;">
											${pagingVO.detailSearch.fran_comnm }
										</td>
										<th class="searchTh"  style="width: 8%;">작성일</th>
										<td style="width: 17%;">
											 <span class="wirteDay"> </span>
										</td>
										<th class="searchTh"  style="width: 8%;">건수</th>
										<td style="width: 17%;">
											 ${pagingVO.detailSearch.totalRecode } 건
										</td>
									</tr>        
								</tbody>
							</table>
						</form>
						<!-- 조회 영역 -->
						<div class="dataTable-container">
							<div class="row">
								<h6>상세 내역</h6>
							</div>
							<div class="dataArea" id="selectArea">
								<table class="table table-hover dataTable-table" id="table1">
									<thead>
										<tr>
											<th data-sortable="" style="width: 5%;">
												순번
											</th>
											<th data-sortable="" style="width: 8%;">
												이미지
											</th >
											<th data-sortable="" style="width: 15%;" class="left">
												제품명
											</th>
											<th data-sortable="" style="width: 10%;"  class="right">
												주문수량
											</th>
											<th data-sortable="" style="width: 10%;"  class="right">
												주문제한수량
											</th>
											<th data-sortable="" style="width: 10%;"  class="right">
												현재재고량
											</th>
											<th data-sortable="" style="width: 10%;"  class="right">
												공급가
											</th>
											<th data-sortable="" style="width: 10%;"  class="right">
												공급가 합계
											</th>
											<th data-sortable="" style="width: 18%;" class="left">
												메모
											</th>
										</tr>
								
									</thead>
									<tbody id="listBody">
									<c:choose> 
                               		   		<c:when test="${not empty pagingVO.detailSearch.orderlistVO  }">
                               		   			<c:forEach items="${pagingVO.detailSearch.orderlistVO }" var="list">
                               		   				<tr>
                               		   					<td>${list.rnum }</td>
                               		   					<td>
                               		   						<c:choose>
                                		   						<c:when test ="${not empty list.headInvenVO.attachfileList }">
                                		   							<img class='myImage' src="data:image/jpeg;base64,${list.headInvenVO.attachfileList[0].file_img }">
                                		   						</c:when>
                                		   						<c:otherwise>
                                		   							<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>
                                		   						</c:otherwise>
                               		   						</c:choose>
                               		   					</td>
                               		   					<td class="left">${list.headInvenVO.prod_nm }</td>
                               		   					<td class="right">${list.order_qy }</td>
                               		   					<td class="right">${list.headInvenVO.head_maxcord_qy }</td>
                               		   					<td class="right">${list.headInvenVO.head_nowinven }</td>
                               		   					<td class="right">${list.prod_suply_pc }</td>
                               		   					<td class="right">${list.order_qy * list.prod_suply_pc}</td>
                               		   					<td class="left">
                               		   						<c:if test="${list.order_qy gt list.headInvenVO.head_maxcord_qy}">
                               		   							최대 주문 수량이 넘어갔습니다.
                               		   						</c:if>
                               		   					</td>
                               		   				</tr>
                               		   			</c:forEach>
                               		   		</c:when>
                               		   		<c:otherwise>
                               		   		</c:otherwise>
                               		   </c:choose>
									</tbody>
								</table>
							</div>
						</div>
						<!-- data-Area 끝 -->
						<!-- 페이징 및 푸터 영역 -->
						<div class="dataTable-bottom">
							<div class="row">
								<h6>총 합계 내역</h6>
							</div>
							<table class="table table-borderd tableTotalInfo">
								<tbody>
									<tr>
										<th class="searchTh"  style="width: 10%;">총 합계</th>
										<td style="width: 90%;" colspan="3">
											${pagingVO.detailSearch.order_suplypc_sm }
										</td>
									</tr>        
								</tbody>
							</table>
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
        <input type="hidden" name="page" value="1"/>
    </form>
    
    <!-- 데이터 폼 -->
    <form id="dataForm" action="${cPath }/head/limit/form" method="post">
    	<input type="hidden" name="out_code" value="${pagingVO.detailSearch.out_code }">
    	<input type="hidden" name="head_code" value="${pagingVO.detailSearch.head_code }">
    	<input type="hidden" name="order_no" value="${pagingVO.detailSearch.order_no }">
    </form>
	     
	<!-- 모달 -->
    <div class="modal fade text-left" id="default" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable  modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="myModalLabel1">출고지시서 작성</h5>
                    <button type="button" class="close rounded-pill" data-bs-dismiss="modal" aria-label="Close">
                        <i data-feather="x"></i>
                    </button>
                </div>
                <div class="modal-body">
                    	출고지시서를 작성 하시겠습니까?
                </div>
               	<form id="stateChange" action="${cPath }/head/limit">
               		<input type="hidden" name="orderNO" id="modalOderNo" value="${ordersVO.order_no }">
               		<input type="hidden" name="code" id="modalCode" value="">
               	</form>
                <div class="modal-footer">
                    
                    <button type="button" id="okBtn" class="btn btn-primary ml-1 pribtn" data-bs-dismiss="modal">
                        <i class="bx bx-check d-block d-sm-none"></i>
                        <span class="d-none d-sm-block">승인</span>
                    </button>
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                        <i class="bx bx-x d-block d-sm-none"></i>
                        <span class="d-none d-sm-block" id="paycancleBtn">취소</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    
    
 <script type="text/javascript">
 var now = new Date();
 var year = now.getFullYear();
 var month = now.getMonth() + 1;    
 var date = now.getDate();
 
 let listBody = $("#listBody");
 let locale = navigator.language;
 let backList = $("#backList");
 let excelDownBtn = $("#excelDownBtn");
 let okBtn =  $("#okBtn");
 let putBtn = $("#putBtn");
 

 $(function(){
		 //돈 콤마 찍기
		listBody.find("tr").each(function(i){
			let orderQy = $(this).find("td").eq(3).text();
			let maxQy = $(this).find("td").eq(4).text();
			
			if(parseInt(orderQy) > parseInt(maxQy)){
				$(this).find("td").eq(8).text("최대 주문 수량이 넘어갔습니다.");
			}
			
			$(this).find("td").eq(3).text(Number($(this).find("td").eq(3).text()).toLocaleString(locale));
			$(this).find("td").eq(4).text(Number($(this).find("td").eq(4).text()).toLocaleString(locale));
			$(this).find("td").eq(5).text(Number($(this).find("td").eq(5).text()).toLocaleString(locale));
			$(this).find("td").eq(6).text(Number($(this).find("td").eq(6).text()).toLocaleString(locale) + "원");
			$(this).find("td").eq(7).text(Number($(this).find("td").eq(7).text()).toLocaleString(locale) + "원");
		})
		
		$('.tableTotalInfo').find("td").text(Number($('.tableTotalInfo').find("td").text()).toLocaleString(locale) + "원");
		
		//작성일자 	
		
		month = month >=10 ? month : "0" + month;
 		date  = date  >= 10 ? date : "0" + date;
		let yymmdd = ""+year +"-"+ month +"-"+ date;
		$(".wirteDay").text(yymmdd);
	 });
	 
	 //전부체크 이벤트
	 $("#checkAll").on("click", function() {
			console.log($("#listBody input[type='checkbox']"));
			if($(this).is(":checked")){
				$("#listBody input[type='checkbox']").prop("checked", true);
			}else{
				$("#listBody input[type='checkbox']").prop("checked", false);
			}
		});
	 
	
	 
	//목록으로 버튼 이벤트
	 backList.on("click",function(){
			location.href = "${cPath }/head/limit";
		})
		


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
     
     //등록 버튼을 클릭할 때
     putBtn.on("click",function(){
    	 $('#default').modal('show');
     })
     
     //승인 버튼을 클릭할 때
     okBtn.on("click",function(){
    	 $("#dataForm").submit();
     })


 </script>