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
<!DOCTYPE html>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">    
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<style>

 
.section {
 display: flex;	
 justify-content: space-between;
}
.card:nth-child(1) {
	width :20%;
}
.card:nth-child(2) {
	width :79%;
}
#upChartArea {
	display : flex;
	height: 300px;
}
#roundChart{
	width : 50%;
	height: 300px;
}
#roundChartInfo {
	width : 50%;
}
.dataArea {
	height: 450px;
}
.franArea {
	height: 650px;
}
.bottomBtnArea {
	display: flex;
	justify-content: center;
	margin-top: 10px;
}
.rowLeft {
	width: 60% !important;
}
.rowRight {
	width:40% !important;
}
.card-header .row {
	margin : 0px;
}
.form-control{
	padding : 0.12rem;
	border-color : #dacdc6;
}
.form-control:focus {
	box-shadow: none;
	border-color : #876767;
}	
#today {
	font-weight: bold;
	font-size: 25px;
	color : #876767;
}
#table2  {
	border-top : 1px solid #fff;
}
.dataAreaRowLeft {
	padding : 1.5rem 1.5rem 0 0.7rem;
}
.card-headerSecond {
	padding-bottom : 0.65rem;
}
</style>



<div id="app">
	
    	<section class="section">
    	
    		<!-- 가맹점 조회 -->
    		<!-- card 영역 -->
    		<div class="card">
    			<!-- card-header 영역 -->
				<div class="card-header">
					<div class="row">
						<div class="rowLeft">
							<h4>일일판매레포트</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<button type="reset" id="reset" class="resetBtn icon dripicons-clockwise float-end"> </button>
							</nav>
						</div>
					</div>
				</div>	
				<!-- card-header 끝 -->
				<!-- card-body 영역 -->
					<div class="card-body">
						
						<!-- 조회 영역 -->
						<div class="dataTable-container">
							<div class="btnArea">
								<button id="searchBtn" type="submit" class="btn btn-primary float-end pribtn">검색</button>
								<input id="searchFranNm" class="form-control float-end" type="text" style="width :50%;">
							</div>
							<div class="dataArea franArea">
								<table class="table table-hover dataTable-table" id="table1">
									<thead>
										<tr>
											<th data-sortable="" colspan="2">
												<a href="#" class="dataTable">가맹점 상호명</a>
											</th>
										</tr>
									</thead>
									<tbody class="listBody franlist">
										
										<c:if test="${not empty franlist}">
											<c:forEach items="${franlist }" var="list" varStatus="status">
											<tr>
												<td><input  type="radio" name="check" class="form-check-input"><input type="hidden" name="franCode" value="${list.fran_code }"/></td>
												<td>${list.fran_comnm }</td>
											</tr>	
											</c:forEach>
										</c:if>
 									
									</tbody>
								</table>
							</div>
						</div>
						<!-- data-Area 끝 -->
						<!-- 페이징 및 푸터 영역 -->
						<div class="dataTable-bottom bottomBtnArea">
							<button id="goDetailBtn" type="button" class="btn btn-primary pribtn" disabled><span class='franNm'>가맹점 </span> 상세보기</button>
						</div>

					</div>
					<!-- card-body 끝 -->
                </div>
    		<!-- card 끝 -->
    		
    		
    		<!-- 그래프  -->
    		<div class="card">
    			<!-- card-header 영역 -->
				<div class="card-header card-headerSecond">
					<div class="row">
						<div class="rowLeft">
							<h6>지역별 일일매출 비율</h6>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">일일판매 레포트</li>
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
							<div id="upChartArea">
								
								<div id="roundChartInfo">
									<table class="table table-hover dataTable-table" id="table2">
										
										<tbody class="listBody">
										<tr>
											<td colspan="2"   id="today"></td>
										</tr>
										<tr>
											<td>일일 총 매출 금액</td>
											<td>${statistics.dayTotal }</td>
										</tr>
										<tr>
											<td>월 총 매출 금액</td>
											<td>${statistics.momthTotal }</td>
										</tr>
										<tr>
											<td>월 목표금액 달성률</td>
											<td>${statistics.nowStatistics }</td>
										</tr>
										<tr>
											<td>이 달 실적우수 지점</td>
											<td>${statistics.topFran }</td>
										</tr>
										<tr>
											<td>이 달 관리대상 지점</td>
											<td>${statistics.endFran }</td>
										</tr>
										<!-- 
											데이터 넣는 영역 
										 -->
										</tbody>
									</table>
								</div>
								
								<div id="roundChart"></div>
							</div>	
						</form>
						<!-- 조회 영역 -->
						<div class="dataTable-container">
							<div class="dataArea">
								<div class="row">
									<div class="rowLeft dataAreaRowLeft">
										<h6>가맹점별 일일매출</h6>
									</div>
								</div>	
								<div id="chart"></div>
							</div>
						</div>
						<!-- data-Area 끝 -->
						<!-- 페이징 및 푸터 영역 -->
				
					</div>
					<!-- card-body 끝 -->
                </div>
    		<!-- card 끝 -->
    	</section>
    </div>
    
    <!-- 검색 폼 -->
    <form id="searchForm" action="${cPath }/head/dayreport" >
    	<input type="hidden" name="franCode" value="">
    	<input type="hidden" name="franNm" value="">
    </form>
      
 

 <script type="text/javascript">
   let reset = $("#reset");	
   let locale = navigator.language; 
   
   


  $(function(){
	  
  	//어제 날짜 받아오기
  	var now = new Date();	// 현재 날짜 및 시간
	var yesterday = new Date(now.setDate(now.getDate() - 1));	// 어제
	

	let year = yesterday.getFullYear();
	let month = yesterday.getMonth() + 1;
	month = month >= 10 ? month :'0' + month;
	let day = yesterday.getDate();
	day = day >= 10 ? day :'0' + day;

	
	$("#today").text(year + "-" + month + "-" + day + " 일일 레포트");
	
	$("#table2").find("td").eq(2).text(Number($("#table2").find("td").eq(2).text()).toLocaleString(locale) + " 원");
	$("#table2").find("td").eq(4).text(Number($("#table2").find("td").eq(4).text()).toLocaleString(locale) + " 원");
	$("#table2").find("td").eq(6).text($("#table2").find("td").eq(6).text() + " %");
	 
  	
  });
  
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
	$("#searchForm").clearForm();
	$(".franlist").find(":input[type='radio']").prop('checked', false);
	$(".franNm").text("가맹점");
	$("#goDetailBtn").prop('disabled', true);
	$(".dataAreaRowLeft h6").text("가맹점별 일일매출");	
	$("#searchFranNm").val("");
    searchForm.submit();
 })
 
 //전부체크 이벤트
 $("#checkAll").on("click", function() {
		console.log($(".listBody input[type='checkbox']"));
		if($(this).is(":checked")){
			$(".listBody input[type='checkbox']").prop("checked", true);
		}else{
			$(".listBody input[type='checkbox']").prop("checked", false);
		}
	});
 
 //가맹점리스트 클릭했을 때 이벤트
 $(".franlist").on("click","tr",function(){
	 //검색
	 let selectFranCode = $(this).find("input[name='franCode']").val();
	 $("#searchForm").find("input[name='franCode']").val(selectFranCode);
	 searchForm.submit();
	 
	 //버튼
	 let selectFranNm = $(this).find("td").eq(1).text();
	 $(this).find("input[name='check']").prop('checked', true);
	 $(".franNm").text(selectFranNm);
	 $(".franNm").parent().attr('name',$(this).find("input[name='franCode']").val());
	 $("#goDetailBtn").prop('disabled', false);
	 
	 
	 
 })
  //가맹점리스트의 체크 박스를 클릭했을 때 
  $(".franlist input[type='radio']").on("click",function(){
		$(this).parent().find("td").eq(1).text();
  		$(".franNm").text(selectFranNm);
  		$("#goDetailBtn").prop('disabled', false);
  		
  		
  })
  
  //검색 창 검색
  $("#searchFranNm").on("keyup",function(){
	  $("#searchForm").find("input[name='franNm']").val($(this).val());
  })
  
  //검색 버튼 클릭 이벤트
  $("#searchBtn").on("click",function(){
	  searchForm.submit()
  })
  
  $("#goDetailBtn").on("click",function(){
  	 location.href ="${cPath }/head/dayreport/detail?what=" + $(this).attr('name');
  });
  
  //지역별 가맹점 매출
  <c:if test="${not empty areaList }">
      var franArea = [];
      var areaMoney = [];
	  <c:forEach items="${areaList }" var="item" >
	    franArea.push("${item.fran_area}");
	    areaMoney.push(Number("${item.area_money}"));
	  </c:forEach>
  </c:if>
  
  //가맹점 별 차트 조회를 위한 ajaxForm
  var barDataTotal = [];
  var barDataGole = [];
  var barCategories =[];
  let searchForm = $("#searchForm").ajaxForm({
      dataType: "json", 
      beforeSubmit: function() {
    	 barDataTotal = [];
    	 barDataGole = [];
    	 barCategories =[];
    	
      },
      success: function(resp) {
      	if (resp.totalSaleByFran) {
      		$("#chart").empty();
      		
           	if($("#searchForm").find("input[name='franCode']").val() == null || $("#searchForm").find("input[name='franCode']").val() == ""){
	            $(resp.totalSaleByFran).each(function(i, tsbf) {
	            	barDataTotal.push(tsbf.total_ordmoney);
	            	barDataGole.push(tsbf.target_money);
	            	barCategories.push(tsbf.fran_comnm);
	            	})
	            	
         		chart.updateOptions({
        	 		  series:[{
        	 	         name: '가맹점 일매출 금액',
        	 	         data: barDataTotal
        	 	       }, {
        	 	         name: '가맹점 목표매출 금액',
        	 	         data: barDataGole
        	 	       }],
        	 		  xaxis: {
        	 			 categories: barCategories,
        	 		  }
        	 	 })
           	
           	}else {
           		$(resp.totalSaleByFran).each(function(i, tsbf) {
	            	barDataTotal.push(tsbf.total_ordmoney);
	            	barCategories.push(tsbf.days);
	            	})
           		
           		chart.updateOptions({
      	 		  series:[{
      	 	         name: '가맹점 일매출 금액',
      	 	         data: barDataTotal
      	 	       }],
      	 		  xaxis: {
      	 			 categories: barCategories
      	 		  	}
      	 	 		})
      	 	 		
      	 	 	$(".dataAreaRowLeft h6").text($(".franNm").text() + " 한달 매출");	
           		}
            }//if문 끝
      	
            //가맹점 리스트 비동기
      		let trTags = [];
      		$(".franlist").empty();
      		let franCodeInput = $("#searchForm").find("input[name='franCode']");
      		
      		$(resp.franlist).each(function(i, list) {
      			let tr = "";
      			if(franCodeInput.val() == list.fran_code){
      				tr = $("<tr>").append(
    						$("<td>").html(
    							'<input  type="radio" name="check" checked class="form-check-input"><input type="hidden" name="franCode" value="'+ list.fran_code +'"/>'	
    						),
    						$("<td>").html(list.fran_comnm)
    	      			);
      			}else{
	      			tr = $("<tr>").append(
						$("<td>").html(
							'<input  type="radio" name="check" class="form-check-input"><input type="hidden" name="franCode" value="'+ list.fran_code +'"/>'	
						),
						$("<td>").html(list.fran_comnm)
	      			);
      			}
      			trTags.push(tr);
      		});
      		$(".franlist").html(trTags);
      		
      		
      	
      },
	  error : function(xhr, resp, error) {
      }
  })
  
 
  searchForm.submit();
 

 
 //차트 옵션
 var options = {
         series: [],
         chart: {
         type: 'bar',
         height: 380
       },
       colors :[
    	   "#F2913D",
       	   "#876767"
       ],
       plotOptions: {
         bar: {
           horizontal: false,
           columnWidth: '55%',
           endingShape: 'rounded'
         },
       },
       dataLabels: {
         enabled: false
       },
       stroke: {
         show: true,
         width: 2,
         colors: ['transparent']
       },
       fill: {
         opacity: 1
       },
       tooltip: {
         y: {
           formatter: function (val) {
             return val + " 원"
           }
         }
       }
       };

       var chart = new ApexCharts(document.querySelector("#chart"), options);
       chart.render();
       
       //동그란 그래프
       
        var options = {
          series: areaMoney,
          labels: franArea,
          chart: {
          type: 'donut',
          width : 420
        },
        plotOptions: {
            pie: {
              customScale: 1.0,
              donut: {
                  size: '15%'
              }
            }
          },
        responsive: [{
          breakpoint: 300,
          options: {
            chart: {
              width: 40,
              hegiht : 300
            },
            legend: {
              position: 'bottom'
            }
          }
        }],
        colors :[
        	"#876767",
        	"#F2913D",
       		"#F2AB6D",
       		"#D96E30",
       		"#BF755A"
       		
        ]
        };

        var roundChart = new ApexCharts(document.querySelector("#roundChart"), options);
        roundChart.render();
          
</script> 