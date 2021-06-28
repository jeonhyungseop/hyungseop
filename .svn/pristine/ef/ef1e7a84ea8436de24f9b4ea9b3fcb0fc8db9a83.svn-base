<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
    <div class="card table-card Area Area4 " index="7" id="B0007">
        <div class="card-header">
            <span class="fontSet">가맹점위치</span>
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
               <div id="map" style="width:100%;height:420px;"></div>
        </div>
           
    </div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91b9c89742f31f21bd7a096c6fe38a6a&libraries=services,clusterer"></script>
<script type="text/javascript">

	var map = new kakao.maps.Map(document.getElementById('map'), { // 지도를 표시할 div
	    center : new kakao.maps.LatLng(36.2683, 127.6358), // 지도의 중심좌표
	    level : 13 // 지도의 확대 레벨
	});
	
	//주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 마커 클러스터러를 생성합니다
	// 마커 클러스터러를 생성할 때 disableClickZoom 값을 true로 지정하지 않은 경우
	// 클러스터 마커를 클릭했을 때 클러스터 객체가 포함하는 마커들이 모두 잘 보이도록 지도의 레벨과 영역을 변경합니다
	// 이 예제에서는 disableClickZoom 값을 true로 설정하여 기본 클릭 동작을 막고
	// 클러스터 마커를 클릭했을 때 클릭된 클러스터 마커의 위치를 기준으로 지도를 1레벨씩 확대합니다
	var clusterer = new kakao.maps.MarkerClusterer({
	    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체
	    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정
	    minLevel: 10, // 클러스터 할 최소 지도 레벨
	    disableClickZoom: true // 클러스터 마커를 클릭했을 때 지도가 확대되지 않도록 설정한다
	});
	
	// 데이터를 가져오기 위해 jQuery를 사용합니다
	// 데이터를 가져와 마커를 생성하고 클러스터러 객체에 넘겨줍니다
	$.get("${cPath}/head/main/B0007/getMap", function(data) {
	    // 데이터에서 좌표 값을 가지고 마커를 표시합니다
	    // 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
	    console.log("data : ",data)
	   $(data).each(function(i, position) {
		   var markeri = new kakao.maps.Marker({
			   position: new kakao.maps.LatLng(position.fran_lati, position.fran_loti),
		   	   clickable: true //마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다.
			});

			clusterer.addMarker(markeri);//클러스터에 마커를 추가합니다.
			
			var iwContenti = '<div style="padding:5px;">'+position.fran_comnm+'<br><a href="${cPath}/head/franmanage/detail?what='+position.fran_code+'" style="color:blue" target="_blank">상세보기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				iwRemoveablei = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

			// 인포윈도우를 생성합니다
			var infowindowi = new kakao.maps.InfoWindow({
			    content : iwContenti,
			    removable : iwRemoveablei
			});
			  
			// 마커에 클릭이벤트를 등록합니다
			kakao.maps.event.addListener(markeri, 'click', function() {
			      // 마커 위에 인포윈도우를 표시합니다
			      infowindowi.open(map, markeri);  
			});
	    });

	});

</script>