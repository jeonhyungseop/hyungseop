
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<div class="col-12 col-xl-6 Area Area1 " id="C0004" index="4">
   <div class="card table-card">
       <div class="card-header">
           <span class="fontSet">주문 비율</span>
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
	           <div class="row">
	               <div class="col-8">
	               </div>
	               <div class="col-12">
	                   <div id="clChart"></div>
	               </div>
	           </div>

        </div>
    </div>
</div>

<script type="text/javascript">

var a0001Data = [];
var b0001Data = [];
var c0001Data = [];
var clCategory = [];

<c:if test="${not empty clA0001 }">
	<c:forEach items="${clA0001 }" var="list" >
		a0001Data.push("${list.cnt }");
		clCategory.push("${list.ordpay_time }")
	</c:forEach>
</c:if>

<c:if test="${not empty clB0001 }">
	<c:forEach items="${clB0001 }" var="list" >
		b0001Data.push("${list.cnt }");
	</c:forEach>
</c:if>

<c:if test="${not empty clC0001 }">
	<c:forEach items="${clC0001 }" var="list" >
		c0001Data.push("${list.cnt }");
	</c:forEach>
</c:if>

//chart 1
var options = {
        series: [{
        name: '매장',
        data: a0001Data,
      },
      {
          name: '테이크아웃',
          data: b0001Data,
        },
      {
          name: '배달',
          data: c0001Data,
        }
      ],
        chart: {
        height: 402,
        type: 'area',
        toolbar: {
            show: false
        }
      },
      colors :[
     	   "#F2913D",
        	"#876767",
        	"#BF755A"
        ],
      dataLabels: {
        enabled: false
      },
      stroke: {
        curve: 'smooth'
      },
      xaxis: {
        type: '날짜',
        categories: clCategory,
      	labels : {
	        show : true
      	}
      },
      yaxis :{
    	labels : {
  	        show : true
        } 
      },
      tooltip: {
        x: {
          format: 'dd/MM/yy HH:mm'
        },
      },
      grid: {
    	  show:true
      }
      };

      var clChart = new ApexCharts(document.querySelector("#clChart"), options);
      clChart.render();

</script>