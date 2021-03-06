    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 25.      이진수      최초작성
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
	/*레이아웃 css*/
	.card-header .row div, .card-header .row h4,  .card-header .row ol li, .card-header .row ol {
		margin : 0;
		padding : 0;
	}
	.card-header .row{
		display: flex;
		justify-content: space-between;
		margin : 0 10px;
	}
	
	.card-header .rowLeft, .card-header .rowRight  {
		width : 50%;
	}
	.card-header .rowRight ol {
		justify-content: flex-end;
	} 	
</style>
<body>
	<div class="page-title">
	</div>
	<section id="multiple-column-form">
	    <div class="row match-height">
	        <div class="col-12">
	            <div class="card">
	                <div class="card-header">
	                	<div class="row">
							<div class="rowLeft">
								<h4 class="card-title">${inven.prod_nm } 상세보기</h4>
							</div>
							<div class="rowRight">
								<nav aria-label="breadcrumb" >
									<ol class="breadcrumb">
										<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
										<li class="breadcrumb-item active" aria-current="page">재고 상세 조회</li>
									</ol>
								</nav>
							</div>
						</div>
	                    
	                    <button id="modify" type="button" class="btn btn-primary me-1 mb-1 pribtn float-end">수정</button>
	                    <a href="${cPath }/fran/inven" class="btn btn-primary me-1 mb-1 pribtn float-end">목록으로</a>
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
<!--                                     <div class="col-3 form-group"> -->
<!--                                         <label>제품 코드</label> -->
<!--                                     </div> -->
<!--                                     <div class="col-9 form-group" id="prod_code"> -->
<%--                                         ${inven.prod_code } --%>
<!--                                     </div> -->
                                    <div class="col-3 form-group">
                                        <label>적정수량</label>
                                    </div>
                                    <div class="col-9 form-group">
                                        ${inven.fran_proinven }
                                    </div>
                                    <div class="col-3 form-group">
                                        <label>현재수량</label>
                                    </div>
                                    <div class="col-9 form-group">
                                        ${inven.fran_nowinven }
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
<form id="modiForm" action="${cPath }/fran/inven/modify" method="post">
	<input type="hidden" name="prod_code" value="${inven.prod_code }"/>
</form>	
<script src="${cPath }/resources/charts/apexcharts.js"></script>
<!-- <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script> -->
<script type="text/javascript" src="${cPath }/resources/slick/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="${cPath }/resources/slick/jquery-migrate-1.2.1.min.js"></script>
<script type="text/javascript" src="${cPath }/resources/slick/slick.min.js"></script>

<script type="text/javascript">
$("#modify").on("click", function() {
	$("#modiForm").submit();
});
$(document).ready(function(){
   $('.myslick').slick({
	   dots: true,
	   infinite: true,
	   speed: 500,
	   fade: true,
	   cssEase: 'linear',
	   autoplay: true,
	   arrows: false,
	   autoplaySpeed: 1500,
   });
 });
</script>	
<script type="text/javascript">
var unitpc = [];
var change_de = [];
$(function() {
	$.ajax({
		url : "${cPath}/fran/inven/unitpclist"
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
		     toolbar:{
		    	 show : false
			   }
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
		   colors: ["#F2913D"]
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
