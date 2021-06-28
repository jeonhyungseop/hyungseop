
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<!------------------------------ AREA0 ----------------------------------------->	
 <div class="card table-card Area Area0" index="3" id="B0003">
     <div class="card-header">
	     <span class="fontSet">일일매출그래프</span>
	     <div class="card-header-right">
              <ul class="list-unstyled card-option" style="display : flex; width:30px;">
                  <li ><i class="fa fa fa-wrench open-card-option"></i></li>
                  <li ><i class="fa fa-window-maximize full-card"></i></li>
                  <li ><i class="fa fa-minus minimize-card"></i></li>
                  <li ><i class="fa fa-refresh reload-card"></i></li>
                  <li ><i class="fa fa-trash Min0"></i></li>
              </ul>
         </div>
          </div>
	     <div class="card-body card-block">
	         <div id="chart"></div>
	     </div>
    
 </div>
<!------------------------------ AREA0  끝----------------------------------------->	  




<script>


//가맹점 이름 출력
<c:if test="${not empty dailyGraph.totalSaleByFran }">
var barDataTotal = [];
var barDataGole = [];
var barCategories =[];
	 <c:forEach items="${dailyGraph.totalSaleByFran }" var="tsbf">
	 	barDataTotal.push("${tsbf.total_ordmoney}");
 		barCategories.push("${tsbf.days }");
	 </c:forEach>
</c:if>





//차트 옵션
var options = {
	series:  [{
		    name: '가맹점 일매출 금액',
            data: barDataTotal
	    }],
	chart: {
      type: 'bar',
      height: 380
    },
    colors :[
 	   "#F2913D",
    	"#876767"
    ],
	xaxis: {
        categories: barCategories
    },
    plotOptions: {
	      bar: {
	        horizontal: false,
	        columnWidth: '55%',
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




 
</script>