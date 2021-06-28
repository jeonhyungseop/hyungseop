
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<div class="col-12 col-xl-6 Area Area1 " id="B0004" index="4">
   <div class="card table-card">
       <div class="card-header">
           <span class="fontSet">상품 판매량  TOP3</span>
           <div class="card-header-right">
              <ul class="list-unstyled card-option" style="display : flex; width:30px;">
                  <li ><i class="fa fa fa-wrench open-card-option"></i></li>
                  <li ><i class="fa fa-window-maximize full-card"></i></li>
                  <li ><i class="fa fa-minus minimize-card"></i></li>
                  <li ><i class="fa fa-refresh reload-card"></i></li>
                  <li ><i class="fa fa-trash Min1"></i></li>
              </ul>
         </div>
       </div>
       <div class="card-body card-block">
       <c:if test="${not empty rankGoods}">
			<c:forEach items="${rankGoods }" var="list" varStatus="idx">
	           <div class="row">
	               <div class="col-8">
	                   <div class="d-flex align-items-center">
	                       <svg class="bi " width="32" height="32" 
	                           style="width:10px; color : #F2913D">
	                           <use xlink:href="../resources/assets/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill" />
	                       </svg>
	                       <h5 class="mb-0 ms-3">${list.goods_nm }</h5>
	                   </div>
	               </div>
	               <div class="col-4">
	                   <h5 class="mb-0">${list.goods_qy } 개</h5>
	               </div>
	               <div class="col-12">
	                   <div id="chart${idx.index +1 }"></div>
	               </div>
	           </div>
	   		</c:forEach> 
	   	</c:if>	       

        </div>
    </div>
</div>

<script type="text/javascript">

var chart1Data = [];
var chart1Category = [];
var chart2Data = [];
var chart2Category = [];
var chart3Data = [];
var chart3Category = [];
<c:if test="${not empty rankGoods}">
	<c:forEach items="${rankGoods }" var="list" varStatus="idx">
		<c:if test="${idx.index eq 0}">
			<c:forEach items="${list.goodsByDateList }" var="goods" varStatus="idx">
				chart1Category.push("${goods.dt}");
				chart1Data.push(${goods.goods_qy});
			</c:forEach>
		</c:if>
		<c:if test="${idx.index eq 1}">
			<c:forEach items="${list.goodsByDateList }" var="goods" varStatus="idx">
				chart2Category.push("${goods.dt}");
				chart2Data.push(${goods.goods_qy});
			</c:forEach>
		</c:if>
		<c:if test="${idx.index eq 2}">
			<c:forEach items="${list.goodsByDateList }" var="goods" varStatus="idx">
				chart3Category.push("${goods.dt}");
				chart3Data.push(${goods.goods_qy});
			</c:forEach>
		</c:if>
	</c:forEach>
</c:if>


//chart 1
var options = {
        series: [{
        name: '판매수량',
        data: chart1Data
      }],
        chart: {
        height: 100,
        type: 'area',
        toolbar: {
            show: false
        }
      },
      colors :[
     	   "#F2913D",
        	"#876767"
        ],
      dataLabels: {
        enabled: false
      },
      stroke: {
        curve: 'smooth'
      },
      xaxis: {
        type: '날짜',
        categories: chart1Category,
      	labels : {
	        show : false
      	}
      },
      yaxis :{
    	labels : {
  	        show : false
        } 
      },
      tooltip: {
        x: {
          format: 'dd/MM/yy HH:mm'
        },
      },
      grid: {
    	  show:false
      },
      legend: {
    	    show: false
    	  }
      };

      var chart1 = new ApexCharts(document.querySelector("#chart1"), options);
      chart1.render();
//chart 2
  var options = {
          series: [{
       	  	name: '판매수량',
            data: chart2Data
        }],
          chart: {
          height: 100,
          type: 'area',
          toolbar: {
              show: false
          }
        },
        colors :[
      	   "#876767",
         	"#876767"
         ],
        dataLabels: {
          enabled: false
        },
        stroke: {
          curve: 'smooth'
        },
        xaxis: {
        	type: '날짜',
            categories: chart2Category,
            labels : {
  	        show : false
        	}
        },
        yaxis :{
      	labels : {
    	        show : false
          } 
        },
        tooltip: {
          x: {
            format: 'dd/MM/yy HH:mm'
          },
        },
        grid: {
      	  show:false
        },
        legend: {
      	    show: false
        }
     };
		
        var chart2 = new ApexCharts(document.querySelector("#chart2"), options);
        chart2.render();      
//chart 3
  var options = {
          series: [{
        	name: '판매수량',
            data: chart3Data
        }],
          chart: {
          height: 100,
          type: 'area',
          toolbar: {
              show: false
          }
        },
        colors :[
       	   "#BF755A",
          	"#876767"
          ],
        dataLabels: {
          enabled: false
        },
        stroke: {
          curve: 'smooth'
        },
        xaxis: {
        	type: '날짜',
            categories: chart1Category,
            labels : {
  	        show : false
        	}
        },
        yaxis :{
      	labels : {
    	        show : false
          } 
        },
        tooltip: {
          x: {
            format: 'dd/MM/yy HH:mm'
          },
        },
        grid: {
      	  show:false
        },
        legend: {
      	    show: false
      	  }
        };

        var chart3 = new ApexCharts(document.querySelector("#chart3"), options);
        chart3.render(); 
</script>