<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.5.18.  진예은            최초작성
* 2021.5.21.  진예은            메뉴구조 변경
* 2021.5.24.  진예은            메뉴고정 스크립트 추가
* 2021.6.12.  진예은            메뉴순서변경
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<style>

.ml300 {
	margin-left: 300px !important;
}
.ml0 {
	margin-left : 0px !important;
}
</style>
<div id="sidebar" class="active">
	<div class="sidebar-wrapper active">
		<div class="sidebar-header">
			<div class="d-flex justify-content-between">
				<div class="logo">
					<a href="${cPath}/admin/main">
						<img src="${cPath}/resources/assets/images/logo/cfmslogo_width.png" class="logo" alt="Logo" srcset=""></a>
					</a>
				</div>
				<div class="toggler">
					<a href="#" class="sidebar-hide d-xl d-block"><i
						class="bi bi-x bi-middle"></i></a>
				</div>
			</div>
		</div>
		<!-- 프로필 이미지 -->
		<div class="mainImg">
			<img src="${cPath}/resources/assets/images/users/profile-pic.jpg"
				alt="user" class="rounded-circle mainImg" width="100">
		</div>
		<h6 class="font-bold mainName">${name}</h6>
		<div class="sidebar-menu">
			<ul id="Ad" class="menu">
				<li class="sidebar-title">Menu</li>

				<li class="sidebar-item dash"><a href="${cPath}/admin/main"
					class='sidebar-link'> <i class="bi bi-grid-fill"></i> <span>Dashboard</span>
				</a></li>

				<li id='Ad01' class='sidebar-item  has-sub'>
				<a href='#' class='sidebar-link'> 
					<svg class='svg-inline--fa fa-store fa-w-20 fa-fw select-all svgicon' aria-hidden='true' focusable='false' data-prefix='fas' data-icon='store' role='img' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 616 512' data-fa-i2svg=''>
							<path fill='currentColor'
								d='M602 118.6L537.1 15C531.3 5.7 521 0 510 0H106C95 0 84.7 5.7 78.9 15L14 118.6c-33.5 53.5-3.8 127.9 58.8 136.4 4.5.6 9.1.9 13.7.9 29.6 0 55.8-13 73.8-33.1 18 20.1 44.3 33.1 73.8 33.1 29.6 0 55.8-13 73.8-33.1 18 20.1 44.3 33.1 73.8 33.1 29.6 0 55.8-13 73.8-33.1 18.1 20.1 44.3 33.1 73.8 33.1 4.7 0 9.2-.3 13.7-.9 62.8-8.4 92.6-82.8 59-136.4zM529.5 288c-10 0-19.9-1.5-29.5-3.8V384H116v-99.8c-9.6 2.2-19.5 3.8-29.5 3.8-6 0-12.1-.4-18-1.2-5.6-.8-11.1-2.1-16.4-3.6V480c0 17.7 14.3 32 32 32h448c17.7 0 32-14.3 32-32V283.2c-5.4 1.6-10.8 2.9-16.4 3.6-6.1.8-12.1 1.2-18.2 1.2z'></path></svg>
						<span>회원관리</span>
				</a>
					<ul class='submenu '>
						<li class='submenu-item' id='Ad02'><a
							href='/Last_Cafe/admin/headmanage'>가맹본부 조회</a></li>
					</ul></li>
				<li id='Ad03' class='sidebar-item  has-sub'><a href='#'
					class='sidebar-link'> <svg
							class='svg-inline--fa fa-shopping-cart fa-w-18 fa-fw select-all svgicon'
							aria-hidden='true' focusable='false' data-prefix='fas'
							data-icon='shopping-cart' role='img'
							xmlns='http://www.w3.org/2000/svg' viewBox='0 0 576 512'
							data-fa-i2svg=''>
							<path fill='currentColor'
								d='M528.12 301.319l47.273-208C578.806 78.301 567.391 64 551.99 64H159.208l-9.166-44.81C147.758 8.021 137.93 0 126.529 0H24C10.745 0 0 10.745 0 24v16c0 13.255 10.745 24 24 24h69.883l70.248 343.435C147.325 417.1 136 435.222 136 456c0 30.928 25.072 56 56 56s56-25.072 56-56c0-15.674-6.447-29.835-16.824-40h209.647C430.447 426.165 424 440.326 424 456c0 30.928 25.072 56 56 56s56-25.072 56-56c0-22.172-12.888-41.332-31.579-50.405l5.517-24.276c3.413-15.018-8.002-29.319-23.403-29.319H218.117l-6.545-32h293.145c11.206 0 20.92-7.754 23.403-18.681z'></path></svg>
						<span>상품관리</span>
				</a>
					<ul class='submenu '>
						<li class='submenu-item ' id='Ad04'><a
							href='/Last_Cafe/admin/prod'>상품 조회</a></li>
					</ul></li>
				<li id='Ad05' class='sidebar-item  has-sub'>
					<a href='#' class='sidebar-link'>
						<svg class='svg-inline--fa fa-bell fa-w-14 fa-fw select-all svgicon' aria-hidden='true' focusable='false' data-prefix='fas' data-icon='bell' role='img' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512' data-fa-i2svg=''>
							<path fill='currentColor' d='M224 512c35.32 0 63.97-28.65 63.97-64H160.03c0 35.35 28.65 64 63.97 64zm215.39-149.71c-19.32-20.76-55.47-51.99-55.47-154.29 0-77.7-54.48-139.9-127.94-155.16V32c0-17.67-14.32-32-31.98-32s-31.98 14.33-31.98 32v20.84C118.56 68.1 64.08 130.3 64.08 208c0 102.3-36.15 133.53-55.47 154.29-6 6.45-8.66 14.16-8.61 21.71.11 16.4 12.98 32 32.1 32h383.8c19.12 0 32-15.6 32.1-32 .05-7.55-2.61-15.27-8.61-21.71z'></path></svg>
						<span>공지사항</span>
				</a>
					<ul class='submenu '>
						<li class='submenu-item ' id='Ad06'><a
							href='${cPath}/admin/notice'>공지사항 조회</a></li>
					</ul></li>
				<li id='Ad07' class='sidebar-item  has-sub'><a href='#'
					class='sidebar-link'> <svg class='svg-inline--fa
						fa-question-circle fa-w-16 fa-fw select-all svgicon'
						aria-hidden='true' focusable='false' data-prefix='fas'
						data-icon='question-circle' role='img'
						xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512'
						data-fa-i2svg=''><path fill='currentColor'
							d='M504 256c0 136.997-111.043 248-248 248S8 392.997 8 256C8 119.083 119.043 8 256 8s248 111.083 248 248zM262.655 90c-54.497 0-89.255 22.957-116.549 63.758-3.536 5.286-2.353 12.415 2.715 16.258l34.699 26.31c5.205 3.947 12.621 3.008 16.665-2.122 17.864-22.658 30.113-35.797 57.303-35.797 20.429 0 45.698 13.148 45.698 32.958 0 14.976-12.363 22.667-32.534 33.976C247.128 238.528 216 254.941 216 296v4c0 6.627 5.373 12 12 12h56c6.627 0 12-5.373 12-12v-1.333c0-28.462 83.186-29.647 83.186-106.667 0-58.002-60.165-102-116.531-102zM256 338c-25.365 0-46 20.635-46 46 0 25.364 20.635 46 46 46s46-20.636 46-46c0-25.365-20.635-46-46-46z'></path>
						</svg> <span>문의사항</span>
				</a>
					<ul class='submenu '>
						<li class='submenu-item ' id='Ad08'><a
							href='/Last_Cafe/admin/question'>문의사항 조회</a></li>
					</ul></li>
			</ul>
			</ul>
		</div>
		<button class="sidebar-toggler btn x">
			<i data-feather="x"></i>
		</button>
	</div>
</div>
<script>
$(function(){
	
	//출근시간
	var clockHeaderCommute = document.getElementById("HeaderClock");

	function clock() {
	    var date = new Date();

	    // date Object를 받아오고 
	    var month = date.getMonth();

	    // 달을 받아옵니다 
	    var clockDate = date.getDate();

	    // 몇일인지 받아옵니다 
	    var day = date.getDay();

	    // 요일을 받아옵니다. 
	    var week = ['일', '월', '화', '수', '목', '금', '토'];

	    // 요일은 숫자형태로 리턴되기때문에 미리 배열을 만듭니다. 
	    var hours = date.getHours();

	    // 시간을 받아오고 
	    var minutes = date.getMinutes();

	    // 분도 받아옵니다.
	    var seconds = date.getSeconds();

	    // 초까지 받아온후 
	    clockHeaderCommute.innerText = ((hours < 10) ? "0" +  hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes )+ ":" + (seconds < 10 ? "0"+ seconds : seconds);
	    //clockTargetCommute.innerText = ((hours < 10) ? "0" +  hours : hours) + ":" + (minutes < 10 ? "0" + minutes : minutes )+ ":" + (seconds < 10 ? "0"+ seconds : seconds);

	    // 월은 0부터 1월이기때문에 +1일을 해주고 

	    // 시간 분 초는 한자리수이면 시계가 어색해보일까봐 10보다 작으면 앞에0을 붙혀주는 작업을 3항연산으로 했습니다. 
	}



		function init() {
		
		clock();
		
		// 최초에 함수를 한번 실행시켜주고 
		setInterval(clock, 1000);
		
		// setInterval이라는 함수로 매초마다 실행을 해줍니다.
		
		// setInterval은 첫번째 파라메터는 함수이고 두번째는 시간인데 밀리초단위로 받습니다. 1000 = 1초 
		
		}

		init();
	})


var w = window.innerWidth;	
$(document).ready(function(){
$( window ).resize(function() {
		if(w < 1200){
			$("#main").removeClass('ml300');
	    	$("#main").addClass('ml0');
		}
	 
	});
	
	
var currentPath = window.location.pathname;
$('.submenu').removeClass('active');
$('.sidebar-item').removeClass('active');
	
$('li.submenu-item').each(function(index, submenu){
	let dept1 = $(this).find('a:first').attr('href');
	
	if(dept1 && currentPath.indexOf(dept1) == 0){
		let parentMenu = $(this).parent('.submenu');
		$(this).parents('.sidebar-item').addClass('active');
		parentMenu.addClass('active');
		$(this).addClass('active');
	
	}
	
	if(currentPath == '/Last_Cafe/admin/main'){
		$('.dash').addClass('active');
	}
});
	
	
	
	
 });
 
$('.sidebar-hide').on('click', function(){
		$("#main").removeClass('ml300');
		$("#main").addClass('ml0');
		$('#burgerIcon').removeClass('d-xl-none');
		$('#burgerIcon').addClass('d-xl');
});

$('.burger-btn').on('click', function(){
    if(w > 1200) {
    	$("#main").removeClass('ml0');
    	$("#main").addClass('ml300');
    	$('#burgerIcon').removeClass('d-xl');
		$('#burgerIcon').addClass('d-xl-none');
    }else{
    	$("#main").removeClass('ml300');
    	$("#main").removeClass('ml0');
    }
});
	
</script>