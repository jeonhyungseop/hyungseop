<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="card table-card Area Area0" index="1" id="A0001">
     <div class="card-header">
         <span class="fontSet">월별 가입자수</span>
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
 <script>
 var options = {
         series: [{
         name: 'Inflation',
         data: [2.3, 3.1, 4.0, 10.1, 4.0, 3.6, 3.2, 2.3, 1.4, 0.8, 0.5, 0.2]
       }],
         chart: {
         height: 350,
         type: 'bar',
       },
       plotOptions: {
         bar: {
           borderRadius: 10,
           dataLabels: {
             position: 'top', // top, center, bottom
           },
         }
       },
       dataLabels: {
         enabled: true,
         formatter: function (val) {
           return val + "%";
         },
         offsetY: -20,
         style: {
           fontSize: '12px',
           colors: ["#304758"]
         }
       },
       
       xaxis: {
         categories: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
         position: 'top',
         axisBorder: {
           show: false
         },
         axisTicks: {
           show: false
         },
         crosshairs: {
           fill: {
             type: 'gradient',
             gradient: {
               colorFrom: '#D8E3F0',
               colorTo: '#BED1E6',
               stops: [0, 100],
               opacityFrom: 0.4,
               opacityTo: 0.5,
             }
           }
         },
         tooltip: {
           enabled: true,
         }
       },
       yaxis: {
         axisBorder: {
           show: false
         },
         axisTicks: {
           show: false,
         },
         labels: {
           show: false,
           formatter: function (val) {
             return val + "%";
           }
         }
       
       },
       title: {
         text: 'Monthly Inflation in Argentina, 2002',
         floating: true,
         offsetY: 330,
         align: 'center',
         style: {
           color: '#444'
         }
       },
       colors : [ "#F2913D" ]
       };

       var chart = new ApexCharts(document.querySelector("#chart"), options);
       chart.render();
 </script>	  