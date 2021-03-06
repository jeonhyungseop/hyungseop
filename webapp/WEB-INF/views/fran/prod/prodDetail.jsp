    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 04. 이진수          최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${cPath }/resources/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="${cPath }/resources/slick/slick-theme.css"/>
<style>
 	.myImage{ 
 		width: 70%; 
 		height: 70%; 
/* 	    display: inline-block; */
 	}
 	.myslick{
 		text-align: center;
    	margin: auto;
 	}
 	.myImageCol{
 		text-align: center;
    	display: inline-block;
 	}
 	.slick-slide img{
 	    display: inline;
 	}
</style>
<body>
	<div class="page-title">
		<div class="row">
			<div class="col-12 col-md-6 order-md-1 order-last">
				<h3>재고 조회</h3>
<!-- 				<p class="text-subtitle text-muted">재고 상세 조회</p> -->
			</div>
			<div class="col-12 col-md-6 order-md-2 order-first">
				<nav aria-label="breadcrumb"
					class="breadcrumb-header float-start float-lg-end">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="${cPath }/fran/main">Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">재고 상세 조회</li>
					</ol>
				</nav>
			</div>
		</div>
	</div>
<%-- 	<c:if test="${not empty inven }"> --%>
<%-- 		${inven.prod_nm } --%>
<%-- 	</c:if> --%>
	<section id="multiple-column-form">
	    <div class="row match-height">
	        <div class="col-12">
	            <div class="card">
	                <div class="card-header">
	                    <h4 class="card-title" style="display:inline-block;">${inven.prod_nm } 상세보기</h4>
<!-- 	                       <button id="delete" type="button" class="btn btn-light-secondary me-1 mb-1 float-end" data-bs-toggle="modal" data-bs-target="#defaultSize">삭제</button> -->
<!-- 	                       <button id="modify" type="button" class="btn btn-primary me-1 mb-1 pribtn float-end">수정</button> -->
	                   	   <a href="${cPath }/head/inven" class="btn btn-primary me-1 mb-1 pribtn float-end">목록으로</a>
	                </div>
	         		<div class="card-content">
                       <div class="card-body">
                               <div class="form-body">
                                   <div class="row col-12">
                                   	<div class="co-md-4 col-4 myslick">
                                   		<c:choose>
                                   			<c:when test="${inven.att_fileno eq null}">
                                   				<div class="myImageCol"><img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'></div>
                                   			</c:when>
                                   			<c:otherwise>
                                   				<c:forEach items="${inven.attachfileList }" var="attach">
			                                       <div class="myImageCol">
			                                           <img class="myImage" alt="" src="data:image/jpeg;base64,${attach.file_img }">
			                                       </div>
		                                       </c:forEach>
                                   			</c:otherwise>
                                   		</c:choose>
                                   	</div>
                                   	<div class="row co-md-8 col-8">
                                   	<div class="col-3 form-group">
                                        <label>제품 명</label>
                                    </div>
                                    <div class="col-9 form-group">
                                        ${inven.prod_nm }
                                    </div>
                                    <div class="col-3 form-group">
                                        <label>제품 코드</label>
                                    </div>
                                    <div class="col-9 form-group" id="prod_code">
                                        ${inven.prod_code }
                                    </div>
                                    <div class="col-3 form-group">
                                        <label>최대주문수량</label>
                                    </div>
                                    <div class="col-9 form-group">
                                        ${inven.head_maxcord_qy }
                                    </div>
                                    <div class="col-3 form-group">
                                        <label>적정수량</label>
                                    </div>
                                    <div class="col-9 form-group">
                                        ${inven.head_proinven }
                                    </div>
                                    <div class="col-3 form-group">
                                        <label>현재수량</label>
                                    </div>
                                    <div class="col-9 form-group">
                                        ${inven.head_nowinven }
                                    </div>
                                    <div class="col-3 form-group">
                                        <label>제품 매입가</label>
                                    </div>
                                    <div class="col-9 form-group">
                                        ${inven.prod_puchas_pc }
                                    </div>
                                    <div class="col-3 form-group">
                                        <label>제품 공급가</label>
                                    </div>
                                    <div class="col-9 form-group">
                                        ${inven.prod_suply_pc}
                                    </div>
                                    <div class="col-3 form-group">
                                        <label>제품 제조사명</label>
                                    </div>
                                    <div class="col-9 form-group">
                                        ${inven.prod_mafanm }
                                    </div>
                                    <div class="col-3 form-group">
                                        <label>제품 메모</label>
                                    </div>
                                    <div class="col-9 form-group">
                                        ${inven.prod_memo }
                                    </div>
<!--                                     <div class="col-3 form-group"> -->
<!--                                         <label>사용 여부</label> -->
<!--                                     </div> -->
<!--                                     <div class="col-9 form-group"> -->
<%--                                         ${inven.prod_use_at } --%>
<!--                                     </div> -->
                                   	</div>
                               </div>
                       </div>
                   </div>
	            </div>
	        </div>
	    </div>
	    </div>
	    
	    
	    
	    <div class="row column">
	        <div class="col-12 col-xl-12">
	            <div class="card">
	                <div class="card-header">
	                    <span class="fontSet">단가 변동율</span>
	                	 <br>
	                </div>
	                <div class="card-body">
	                    <div class="row">
	                        <div class="col-6">
	                            <div class="d-flex align-items-center">
<!-- 	                                <svg class="bi text-primary" width="32" height="32" fill="blue" style="width:10px"> -->
<%-- 	                                    <use xlink:href="${cPath }/resources/assets/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill"></use> --%>
<!-- 	                                </svg> -->
	                                <h5 class="mb-0 ms-3">${inven.prod_nm }</h5>
	                            </div>
	                        </div>
	                        <div class="col-6">
	                            <h5 class="mb-0">현재 공급가 : ${inven.prod_suply_pc} 원</h5>
	                        </div>
	                        <div class="col-12" style="position: relative;">
	                        <div id="area"></div>
	                    </div>
	                    
	                </div>
	            </div>
	        </div>
	    </div>
	    </div>
	   
	</section>
	
	<!--Modal default md size -->
    <div class="me-1 mb-1 d-inline-block">
        <!-- Button trigger for default modal -->


        <!--Default size Modal -->
        <div class="modal fade text-left" id="defaultSize" tabindex="-1" role="dialog" aria-labelledby="myModalLabel18" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                       
                       <div aria-labelledby="swal2-title" aria-describedby="swal2-content" class="swal2-popup swal2-modal swal2-icon-error swal2-show" tabindex="-1" role="dialog" aria-live="assertive" aria-modal="true" style="display: flex;">
	<div class="swal2-header">
		<ul class="swal2-progress-steps" style="display: none;"></ul>
		<div class="swal2-icon swal2-error swal2-icon-show" style="display: flex;">
			<span class="swal2-x-mark"> 
			<span class="swal2-x-mark-line-left"></span> 
			<span class="swal2-x-mark-line-right"></span>
			</span>
		</div>
		<div class="swal2-icon swal2-question" style="display: none;"></div>
		<div class="swal2-icon swal2-warning" style="display: none;"></div>
		<div class="swal2-icon swal2-info" style="display: none;"></div>
		<div class="swal2-icon swal2-success" style="display: none;"></div>
		<img class="swal2-image" style="display: none;">
		<h2 class="swal2-title" id="swal2-title" style="display: flex;">상품을 삭제하시겠습니까?</h2>
		<button type="button" class="swal2-close"
			aria-label="Close this dialog" style="display: none;">×</button>
	</div>
	<div class="swal2-content">
		<div id="swal2-content" class="swal2-html-container"
			style="display: none;"></div>
		<input class="swal2-input" style="display: none;"><input
			type="file" class="swal2-file" style="display: none;">
		<div class="swal2-range" style="display: none;">
			<input type="range">
			<output></output>
		</div>
		<select class="swal2-select" style="display: none;"></select>
		<div class="swal2-radio" style="display: none;"></div>
		<label for="swal2-checkbox" class="swal2-checkbox"
			style="display: none;"><input type="checkbox"><span
			class="swal2-label"></span></label>
		<textarea class="swal2-textarea" style="display: none;"></textarea>
		<div class="swal2-validation-message" id="swal2-validation-message"></div>
	</div>
	<div class="swal2-actions">
		<div class="swal2-loader"></div>
		<button type="button" class="swal2-confirm swal2-styled delOK" aria-label=""
			style="display: inline-block;" >OK</button>
		<button type="button" class="swal2-deny swal2-styled" aria-label=""
			style="display: none;">No</button>
		<button type="button" class="swal2-cancel swal2-styled" aria-label=""
			style="display: none;">Cancel</button>
	</div>
	<div class="swal2-footer" style="display: none;"></div>
	<div class="swal2-timer-progress-bar-container">
		<div class="swal2-timer-progress-bar" style="display: none;"></div>
	</div>
</div>
                       
                    </div>
                </div>
            </div>
        </div>
    </div>
	
	

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<script type="text/javascript" src="${cPath }/resources/slick/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${cPath }/resources/slick/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${cPath }/resources/slick/slick.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	   $('.myslick').slick({
		   dots: true,
		   infinite: true,
		   speed: 500,
		   fade: true,
		   cssEase: 'linear',
		   autoplay: true,
		   arrows: false,
		   autoplaySpeed: 2000,
	   });
	 });

var unitpc = [];
var change_de = [];
$(function() {
	$.ajax({
		url : "${cPath}/fran/prod/unitpclist"
		, method : "get"
		, data : {
			"prod_code" : '${inven.prod_code}'
			
		}
		, dataType : "json"
		, success : function(resp) {
			if(resp){
				$(resp).each(function(idx, unit) {
					unitpc.push(unit.unitpc);
					change_de.push(unit.change_de);
				});
			}
// 			console.log("성공")
// 			console.log(resp)
		}, error : function(xhr, error, msg) {
			console.log(xhr);
			console.log(error);
			console.log(msg);
		}
	});
})

var areaOptions = {
		   series: [ 
		     {
		       name: "공급가	",
		       data: unitpc,
// 		       data: [31, 40, 28, 51, 42, 109, 100],
		     },
// 		     {
// 		       name: "series2",
// 		       data: [11, 32, 45, 32, 34, 52, 41],
// 		     },
		   ],
		   chart: {
		     height: 350,
		     type: "area",
		   },
		   dataLabels: {
		     enabled: false,
		   },
		   stroke: {
		     curve: "smooth",
		   },
		   xaxis: {
		     type: "datetime",
		     categories: change_de,
// 		     categories: [
// 		       "2018-09-19T00:00:00.000Z",
// 		       "2018-09-19T01:30:00.000Z",
// 		       "2018-09-19T02:30:00.000Z",
// 		       "2018-09-19T03:30:00.000Z",
// 		       "2018-09-19T04:30:00.000Z",
// 		       "2018-09-19T05:30:00.000Z",
// 		       "2018-09-19T06:30:00.000Z",
// 		     ],
		   },
		   tooltip: {
		     x: {
		       format: "dd/MM/yy HH:mm",
		     },
		   },
		   // 색 변경 그래프 순서대로
		   colors: ["#826767"]
		   // 마우스 올렷을때 그래프에 찍히는 마커 색
// 		   markers: {
// 			   colors: ['#F44336', '#E91E63', '#9C27B0']
// 			}
		   // 그래프에 값 띄우기 및 색 설정
// 		   dataLabels: {
// 			   style: {
// 			     colors: ['#F44336', '#E91E63', '#9C27B0']
// 			   }
// 			 }
		   // 그래프 배경 색
// 		   grid: {
// 			   row: {
// 			     colors: ['#F44336', '#E91E63', '#9C27B0']
// 			   },
// 			   column: {
// 			     colors: ['#F44336', '#E91E63', '#9C27B0']
// 			   }
// 			 }
		   // 그래프 아래 색 채우기
// 		   fill: {
// 			   colors: ['#F44336', '#E91E63', '#9C27B0']
// 			 }
		 };
var area = new ApexCharts(document.querySelector("#area"), areaOptions);
area.render();
$(".apexcharts-reset-icon").on("click",function(){
	area.render();
});
</script>	

</body>
