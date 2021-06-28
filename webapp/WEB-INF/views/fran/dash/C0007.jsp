<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <div class="card table-card Area Area4 " index="7" id="C0007">
           <div class="card-header">
               <span class="fontSet">목표매출 달성</span>
               <div class="card-header-right">
	              <ul class="list-unstyled card-option" style="display : flex; width:30px;">
	                  <li ><i class="fa fa fa-wrench open-card-option"></i></li>
	                  <li ><i class="fa fa-window-maximize full-card"></i></li>
	                  <li ><i class="fa fa-minus minimize-card"></i></li>
	                  <li ><i class="fa fa-refresh reload-card"></i></li>
	                  <li ><i class="fa fa-trash Min4"></i></li>
	              </ul>
	         </div>
	       </div>
           <div class="card-body card-block">
               <div id="rchart"></div>
           </div>
           </div>
 
<script type="text/javascript">

let rate = 0;
<c:if test="${not empty rate}">
	rate = ${rate};
</c:if>

var options = {
        series: [rate],
        colors :[
      	   "#F2913D",
         	"#876767"
         ],
        chart: {
        height: 420,
        type: 'radialBar',
      },
      plotOptions: {
        radialBar: {
          hollow: {
            size: '70%',
          }
        },
      },
      labels: ['목표달성율'],
      };

      var rchart = new ApexCharts(document.querySelector("#rchart"), options);
      rchart.render();
</script>