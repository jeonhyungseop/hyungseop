<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <div class="card Area Area4" index="5" id="A0005">
            <div class="card-header table-card">
                <span class="fontSet">상품가입 비율</span>
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
                <div id="roundChart"></div>
            </div>
        </div>
<script>
//동그란 그래프
  
var options = {
  series: [44, 55, 13, 43, 22],
//   labels: ['Team A', 'Team B', 'Team C', 'Team D', 'Team E'],
  chart: {
  type: 'donut',
  width : 320
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
      width: 400,
      hegiht : 300
    },
    legend: {
      position: 'bottom',
	  show : false
    },
    tooltip:{
    	x:{
    		show : false
    	},
    	marker :{
			show : false    		
    	}
    }
  }
}],
legend :{
	show : false
},
colors :[
	"#876767",
	"#F2913D",
	"#F2AB6D",
	"#D96E30",
	"#BF755A"
	
],
// dataLabel :{
// 	enabled: true,
// }
};

var roundChart = new ApexCharts(document.querySelector("#roundChart"), options);
roundChart.render();
</script>