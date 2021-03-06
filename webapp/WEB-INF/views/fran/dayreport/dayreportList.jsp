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
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">    
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
<style>
.dataArea {
    height: 300px;
}
#infoArea, #listArea {
	display: flex;
	justify-content: space-between;
	align-items: center;
}
/* #listArea  { */
/* 	height: 410px; */
/* } */
#selectListArea{
	width : 59%;
}
#chartArea {
	width :69%;
}
#selectShowArea {
	width : 39%;
}
#statisticsArea {
	width:30%;
}
.searchInputLeft {
	width : 75%;
	display : flex;
}
.searchInputRight{
	width : 25%;
}
.searchInputArea {
	display : flex;
	align-items: center;
}
.inputStyle {
	width : 100%;
	margin : 0.5rem 0.2rem;
	border : 1px solid #ddd;
	color : #888;
}
#selectShowArea {
	padding : 1.0rem;

}

#showArea {
	background-color: #f5ebe7;
	width: 100%;
	height: 338px;
	color : #876767;
	text-align: center;
	border-radius: 10px;
	padding : 30%;
	overflow: scroll;
}
.card-header .row {
	margin : 0;
}
.rowHead {
	display: flex;
	width : 100%;
	align-items: center;
}
.rowLeft {
	width : 100%;
}
.rowLeft h6 {
	margin : 10px;
}
.rowRight {
	width : 50%;
}
#statisticsTable {
	margin-top :-43px;
	border-top :0px;
}
#statisticsTable tr:first-child {
	font-weight: bold;
	font-size: 25px;
	color : #876767;
}
#statisticsTable td {
	height: 35px
}
.card {
	margin-bottom: 10px;
}
#table1{
	font-size : 14px;
}
.colum {
	margin :5px;
	width :25%;
}
.targetInput {
	border : 1px solid #ddd;
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
							<h4><span class="franComnm">COFFEE1호점</span> 일일 레포트</h4>
						</div>
						<div class="rowRight">
							<div class="btnArea ">
								<button type="reset" id="reset" class="resetBtn icon dripicons-clockwise float-end"></button>
							</div>
						</div>
					</div>
				</div>	
				<!-- card-header 끝 -->
				<!-- card-body 영역 -->
					<div class="card-body">

						<!-- 차트 및 통계 데이터 조회내역 -->
						
						<div id="infoArea">
							
							<div id="statisticsArea">
								
								<table class="table table-hover dataTable-table" id="statisticsTable">
											
									<tbody>
										
										<tr> 
											<td colspan="2"> <span  class="todayMonth">06</span>월 </td>
										</tr>
										<tr>
											<td>이번 달 목표 매출</td>
											<td>${statistics.goleMoney}</td>
										</tr>
										<tr>
											<td>이번 달 매출 합계</td>
											<td>${statistics.sumMoney}</td>
										</tr>
										<tr>
											<td>목표 매출 달성률</td>
											<td>${statistics.targetRate} %</td>
										</tr>
										<tr>
											<td>총 주문 건수</td>
											<td>${statistics.cordCnt} 건</td>
										</tr>
									</tbody>
									
								</table>
							</div>
							<div id="chartArea">
								<div id="chart"></div>
							</div>
						</div>
					</div>
			<!-- card-body 끝 -->
              </div>
  		<!-- card 끝 -->
  		<!-- card 영역 -->
    		<div class="card">
    			<div class="card-body">
						<!-- 상세내역 조회영역 -->
						<div id="listArea">
							<div id="selectListArea">
										
								
								<!-- 조회 영역 -->
								<div class="dataTable-container">
									<div class="rowHead">
										<div class="rowLeft dataAreaRowLeft">
											<h6>6월 15일 매출 상세 조회</h6>
										</div>
										<div class="rowRight right">
											<span class="totalRecode">25</span>
										</div>
									</div>	
									<div class="dataArea">
										<table class="table table-hover dataTable-table" id="table1">
											<thead>
												<tr>
													<th data-sortable="" class="center" style="width: 8%;">
														<a href="#" class="dataTable">순번</a>
													</th>
													<th data-sortable="" class="center" style="width: 17%;">
														<a href="#" class="dataTable">결제완료시간</a>
													</th>
													<th data-sortable="" class="center" style="width: 14%;">
														<a href="#" class="dataTable">주문금액</a>
													</th>
													<th data-sortable="" class="center" style="width: 14%;">
														<a href="#" class="dataTable">결제금액</a>
													</th>
													<th data-sortable="" class="center" style="width: 14%;">
														<a href="#" class="dataTable">주문구분</a>
													</th>
													<th data-sortable="" class="center" style="width: 14%;">
														<a href="#" class="dataTable">결제상태</a>
													</th>
													<th data-sortable="" class="center" style="width: 14%;">
														<a href="#" class="dataTable">결제수단</a>
													</th>
												</tr>
											</thead>
											<tbody id="listBody">
												
											<!-- 
												데이터 넣는 영역 
											 -->
											</tbody>
										</table>
									</div>
								</div>
								
								<!-- data-Area 끝 -->
								<!-- 페이징 및 푸터 영역 -->
								<div class="dataTable-bottom">
									<div class="dataTable-info">Showing 1 to <span id="totalPage"></span> of <span id="currentPage"></span> entries</div>
								</div>
								<div id="pagingArea" class="d-flex justify-content-center">
									${pagingVO.pagingHTMLBS }
								</div>
							</div>
							<!-- selectList 끝 -->
							<div id="selectShowArea">
								<div id="showArea">
									목록을 클릭하시면 <br> 상세조회가 됩니다.
								</div>
							</div>
						</div>
					</div>
					<!-- card-body 끝 -->
              </div>
  				<!-- card 끝 -->
    	</section>
    </div>

	<!-- 검색 폼 -->
    <form id="searchForm" action="${cPath }/fran/dayreport" >
        <input type="hidden" name="page" value="1"/>
        <input type="hidden" name="what" value="${franCode }"/>
        <input type="hidden" name="searchDate" value=""/>
        <input type="hidden" name="ordpayNo" value=""/>
    </form>
   

    
 <script type="text/javascript">
 let franNm = "";
 let locale = navigator.language;
 let reset = $("#reset");
 let search = $("#searchForm");
 let listBody = $("#listBody");
 let pagingArea = $("#pagingArea");
 let totalPage = $("#totalPage");
 let currentPage = $("#currentPage");
 let totalRecode = $(".totalRecode");
 let backList = $("#backList");
 let upPercent = $("#upPercent");
 let upMoney = $("#upMoney");
 let insertTargetMoney = $("#insertTargetMoney");
 
//어제 날짜 받아오기
var now = new Date();	// 현재 날짜 및 시간
var yesterday = new Date(now.setDate(now.getDate() - 1));	// 어제
var nextMonthDay = new Date(now.setMonth(now.getMonth() + 1));

let nextMonth = nextMonthDay.getMonth() + 1;
nextMonth = nextMonth >= 10 ? nextMonth :'0' + nextMonth

let year = yesterday.getFullYear();
let month = yesterday.getMonth() + 1;
month = month >= 10 ? month :'0' + month;
let day = yesterday.getDate();
day = day >= 10 ? day :'0' + day;

$("#searchForm").find("input[name='searchDate']").val(year+month+day);
$(".dataAreaRowLeft").find("h6").text(month+" 월 "+day+" 일 상세조회");

 $(function(){
	 
	$(".todayMonth").text(month);
	$(".todayNextMonth").text(nextMonth);
	 
	$("#statisticsTable").find("td").eq(2).text(Number($("#statisticsTable").find("td").eq(2).text()).toLocaleString(locale) + " 원");
	$("#statisticsTable").find("td").eq(4).text(Number($("#statisticsTable").find("td").eq(4).text()).toLocaleString(locale) + " 원");
	
	//모달내 데터 포멧
	$("#modalYearAgoThead tr th").each(function(){
		$(this).text($(this).text().trim().substring(4,6)+" 월");
	})
	
	$("#modalYearAgoTbody tr td").each(function(){
		let number = Number($(this).text());
		$(this).text(number.toLocaleString(locale)+"원");
	})

	
	$(".todayNextMoney").text(Number($(".todayNextMoney").text()).toLocaleString(locale));
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
	$("#searchForm").find("input[name='searchDate']").val(year+month+day);
 	searchForm.submit();
})
 
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
         
         franNM = resp.dataList[0].fran_comnm;
         $(".franComnm").text(franNM);
		 if (resp.dataList) {
             $(resp.dataList).each(function(idx, datalist) {
            	 let tr = $("<tr>").append(
            		$("<input>").attr("name","ordpayNo").attr("type","hidden").val(datalist.ordpay_no),
            		$("<td>").addClass("center").html(datalist.rnum),	 
            		$("<td>").addClass("center").html(datalist.ordpay_time),	 
            		$("<td>").addClass("center").html(datalist.cord_total),	 
            		$("<td>").addClass("center").html(datalist.ordpay_money),	 
            		$("<td>").addClass("center").html(datalist.cord_cl_nm),	 
            		$("<td>").addClass("center").html(datalist.pay_sttus_nm),	 
            		$("<td>").addClass("center").html(datalist.pay_se_nm)	 
            	 ).css("cursor", "pointer");
            	 trTags.push(tr);
           	 });
     	 } else {
     		trTags.push(
                 $("<tr>").html(
                     $("<td>").attr("colspan", "7").html("조건에 맞는 내역이 없음")
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
 })
 
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
 
 searchForm.submit();
 
 //주문 상세 내역 출력
 listBody.on("click","tr",function(){
	 $("#searchForm").find("input[name='ordpayNo']").val($(this).find("input").val());
	
	 let ordpayNo = $(this).find("input").val();
	 console.log(ordpayNo)
	 
	 $.ajax({
	        url:'${cPath }/fran/dayreport/list'
	        , method : 'GET'
	        , data : {'ordpayNo' : ordpayNo}
	        , success :  function(resp){
	        	    let divTags = "<div class='rowHead'>";
	        	    divTags += "<div class='colum'>상품명</div>";
	        	    divTags += "<div class='colum'>주문수량</div>";
	        	    divTags += "<div class='colum'>주문 단가</div>";
	        	    divTags += "<div class='colum'>총 합계</div>";
	        	    divTags += "</div> <hr>";
	                $(resp).each(function(idx, resp) {
	                	divTags +="<div class='rowHead'>"
	                	divTags += "<div class='colum'>"+resp.goods_nm+"</div>";
	                	divTags += "<div class='colum'>"+resp.goods_qy+"</div>";
	               	 	divTags += "<div class='colum'>"+Number(resp.goods_pc).toLocaleString(locale)+"</div>";
	               	 	divTags += "<div class='colum'>"+Number((resp.goods_qy) * (resp.goods_pc)).toLocaleString(locale)+"</div>";
		                divTags += "</div>"
	                });
	            $("#showArea").css('padding',20);   
	   		 	$("#showArea").html(divTags);
	        }
	    })	
 });
 

 //가맹점 이름 출력
 <c:if test="${not empty cordlists }">
	 <c:forEach items="${cordlists }" var="cord" >
	 	franNm= "${cord.fran_comnm}";
	 </c:forEach>
 </c:if>
 


 //가맹점 한달동안의 일일 매출 조회 후 그래프 데이터 작성
 <c:if test="${not empty moneyByDay }">
     var days = [];
     var dayMoney = [];
	  <c:forEach items="${moneyByDay }" var="item" >
	    days.push("${item.days}");
	    dayMoney.push(Number("${item.total_ordmoney}"));
	  </c:forEach>
 </c:if>
 
 
 // 차트
   var options = {
    series: [{
    name: franNm,
    data: dayMoney
  }],
    chart: {
    type: 'bar',
    height: 250,
    events: {
     click: function(event, chartContext, config) {
       console.log(config.dataPointIndex)
       if(config.dataPointIndex > -1){
    	   let days = config.globals.labels[config.dataPointIndex];
    	   $("#searchForm").find("input[name='searchDate']").val(year+ days);
    	   $(".dataAreaRowLeft").find("h6").text(days.substring(0,2)+" 월 "+days.substring(2)+" 일 상세조회");
    	   searchForm.submit();	
       }
       }
    }
  },
  plotOptions: {
    bar: {
      horizontal: false,
      columnWidth: '55%',
      endingShape: 'rounded'
    },
  },
  legend: {
      position: 'top'
   },
  dataLabels: {
    enabled: false
  },
  colors :[
	   "#F2913D"
  ],
  stroke: {
    show: true,
    width: 2,
    colors: ['transparent']
  },
  xaxis: {
    categories: days,
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
 
 </script> 