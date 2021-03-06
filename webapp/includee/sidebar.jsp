<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.5.18.  진예은            최초작성
* 2021.5.21.  진예은            메뉴구조 변경
* 2021.5.24.  진예은            메뉴고정 스크립트 추가
* 2021.6.10   진예은            근태관리(출근) 수정
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
	margin-left: 0px !important;
}

.myImage_sidebar {
	object-fit: cover;
	object-position: top; /*정사각형이 아니라 직사각형일 경우 원 안에 보여지게 할 중심 이미지의 위치를 지정*/
	border-radius: 50%; /*사각형의 모서리 둥근 정도를 지정하는 속성인데 50%를 지정하면 완전한 원이 됨*/
	width: 100px;
	height: 100px;
}

.goworkModalBody {
	height: 450px;
}

.myImage_gotoWork {
	object-fit: cover;
	object-position: top; /*정사각형이 아니라 직사각형일 경우 원 안에 보여지게 할 중심 이미지의 위치를 지정*/
	border-radius: 50%;
	margin-left: 35%;
	margin-top: 3%;
	width: 135px;
	height: 135px;
}

.gowork_td {
	text-align: center;
	color: #6c5151;
	font-weight: bold;
}

.goliv_td {
	text-align: center;
	color: #6c757d;
	font-weight: bold;
}

.gowork_table {
	margin-left: 24%;
	margin-top: 16px;
	margin-bottom: 5%;
}

.gowork_name {
	font-size: 24px;
}

.gowork_size {
	font-size: 15px;
}

.goworkTrue {
	margin-left: 16%;
	width: 67%;
}

.golivTrue {
	margin-left: 16%;
	width: 67%;
}

.gowork_bi {
	margin-top: 3px;
}

.gowork_email {
	padding-top: 22px;
}

.bi-clock::before {
	color: black;
	margin-top: 3px;
	margin-left: 8px;
	margin-right: 8px;
}

.bi-calendar-check::before {
	color: black;
	margin-top: 3px;
	margin-left: 8px;
	margin-right: 8px;
}

.gowork_calendar {
	color: black;
}

.gowork_clock {
	color: black;
}

#livclock {
	color: black;
}

.bi-x::before {
	font-size: 40px;
	float: right;
}

.gowork_xICON, .gohome_xICON {
	cursor: pointer;
}

.btn-primary:disabled {
	background-color: #826767;
	border-color: #826767;
}

.GoLiv {
	height: 38px;
	margin-left: 0px;
}

.empimg_dept {
	font-weight: bold;
	font-size: 15px;
	color: #6b5050;
	background-color: #f7e9e2;
}

.mainName {
	margin-bottom: 0px;
}

.sidebarTable {
	border: 0px solid white;
}
</style>
<script type="text/javascript" src="${cPath}/resources/js/moment.js"></script>
<input type="hidden" class="dclzVOatt" value="${dclzVO.attend_time}">
<input type="hidden" class="dclzVOliv" value="${dclzVO.lvffc_time}">
<div id="sidebar" class="active">
	<div class="sidebar-wrapper active">
		<div class="sidebar-header">
			<div class="d-flex justify-content-between">
				<div class="logo">
					<a href="${cPath}/head/main"> <img
						src="${cPath}/resources/assets/images/logo/cfmslogo_width.png"
						class="logo" alt="Logo" srcset=""></a>
				</div>
				<div class="toggler">
					<a href="#" class="sidebar-hide d-xl d-block"><i
						class="bi bi-x bi-middle"></i></a>
				</div>
			</div>
		</div>
		<!-- 프로필 이미지 -->
		<div class="mainImg">
			<c:choose>
				<c:when test="${not empty empImgVO.att_fileno}">
					<c:forEach items="${empImgVO.attachfileList}" var="attach"
						varStatus="status">
						<c:if test="${status.index eq 0}">
							<img class="myImage_sidebar"
								src="data:image/jpeg;base64,${attach.file_img}" alt="user">
						</c:if>
					</c:forEach>
				</c:when>
				<c:when test="${not empty headImgVO.att_fileno}">
					<c:forEach items="${headImgVO.attachfileList}" var="attach"
						varStatus="status">
						<c:if test="${status.index eq 0}">
							<img class="myImage_sidebar"
								src="data:image/jpeg;base64,${attach.file_img}" alt="user">
						</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<img class="myImage_sidebar"
						src="${cPath}/resources/assets/images/users/twosomePlace.jpg">

				</c:otherwise>
			</c:choose>
		</div>

		<c:choose>
			<c:when test="${not empty empImgVO}">
				<h5 class="font-bold mainName">${name}님</h5>
				<table class="table table-bordered sidebarTable">
					<tr>
						<td class="center"><span
							class="empimg_dept badge bg-light-primary">${empImgVO.deptList[0].dept_nm}/${empImgVO.emp_clsf_code}</span>
						</td>
					</tr>
				</table>
			</c:when>
			<c:otherwise>
				<h6 class="font-bold mainName">${name}</h6>
			</c:otherwise>
		</c:choose>

		<c:if test="${not empty empImgVO}">
			<div class="mainBtn">
				<!-- <button class="btn btn-primary GoWork"  data-bs-toggle="modal" data-bs-target="#exampleModalCenter">출근</button>
				<button class="btn btn-secondary GoLiv" data-bs-toggle="modal" data-bs-target="#livModal">퇴근</button> -->
			</div>
		</c:if>

		<input type="hidden" value="${WorkOK}" class="gotoWorkCheck">
		<input type="hidden" value="${livOK}" class="gotoHomeCheck">
		<div class="sidebar-menu">
			<ul id="Ad" class="menu">
				<li class="sidebar-title">Menu</li>


				<!-- Dashboard -->
				<li class="sidebar-item dash"><a href="${cPath}/head/main"
					class='sidebar-link'> <i class="bi bi-grid-fill"></i> <span>Dashboard</span>
				</a></li>

				<!-- 가맹점관리 -->
				<li id='Hd01' class='sidebar-item  has-sub'><a href='#'
					class='sidebar-link'> <svg
							class='svg-inline--fa fa-store fa-w-20 fa-fw select-all svgicon'
							aria-hidden='true' focusable='false' data-prefix='fas'
							data-icon='store' role='img' xmlns='http://www.w3.org/2000/svg'
							viewBox='0 0 616 512' data-fa-i2svg=''>
							<path fill='currentColor'
								d='M602 118.6L537.1 15C531.3 5.7 521 0 510 0H106C95 0 84.7 5.7 78.9 15L14 118.6c-33.5 53.5-3.8 127.9 58.8 136.4 4.5.6 9.1.9 13.7.9 29.6 0 55.8-13 73.8-33.1 18 20.1 44.3 33.1 73.8 33.1 29.6 0 55.8-13 73.8-33.1 18 20.1 44.3 33.1 73.8 33.1 29.6 0 55.8-13 73.8-33.1 18.1 20.1 44.3 33.1 73.8 33.1 4.7 0 9.2-.3 13.7-.9 62.8-8.4 92.6-82.8 59-136.4zM529.5 288c-10 0-19.9-1.5-29.5-3.8V384H116v-99.8c-9.6 2.2-19.5 3.8-29.5 3.8-6 0-12.1-.4-18-1.2-5.6-.8-11.1-2.1-16.4-3.6V480c0 17.7 14.3 32 32 32h448c17.7 0 32-14.3 32-32V283.2c-5.4 1.6-10.8 2.9-16.4 3.6-6.1.8-12.1 1.2-18.2 1.2z'></path></svg>
						<span>가맹점관리</span>
				</a>
					<ul class='submenu' data-dept1="/Last_Cafe/head">
						<li id='Hd02' class='submenu-item'><a
							href='/Last_Cafe/head/franmanage'>가맹점 조회</a></li>
						<!-- 	<li id='Hd03' class='submenu-item '><a
							href='/Last_Cafe/head/prod'>가맹점 물품관리</a></li> -->
						<li id='Hd04' class='submenu-item '><a
							href='/Last_Cafe/head/education'>교육일정 관리</a></li>
						<li id='Hd05' class='submenu-item '><a
							href='/Last_Cafe/head/royal'>가맹비 관리</a></li>
						<li id='Hd06' class='submenu-item '><a
							href='/Last_Cafe/head/bill/BillList'>가맹비 수납내역 조회</a></li>
					</ul></li>

				<!-- 가맹점관리 끝 -->

				<!-- 매출관리 -->
				<li id='Hd09' class='sidebar-item  has-sub'><a href='#'
					class='sidebar-link'> <svg
							class='svg-inline--fa fa-calculator fa-w-14 fa-fw select-all svgicon'
							aria-hidden='true' focusable='false' data-prefix='fas'
							data-icon='calculator' role='img'
							xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512'
							data-fa-i2svg=''>
							<path fill='currentColor'
								d='M400 0H48C22.4 0 0 22.4 0 48v416c0 25.6 22.4 48 48 48h352c25.6 0 48-22.4 48-48V48c0-25.6-22.4-48-48-48zM128 435.2c0 6.4-6.4 12.8-12.8 12.8H76.8c-6.4 0-12.8-6.4-12.8-12.8v-38.4c0-6.4 6.4-12.8 12.8-12.8h38.4c6.4 0 12.8 6.4 12.8 12.8v38.4zm0-128c0 6.4-6.4 12.8-12.8 12.8H76.8c-6.4 0-12.8-6.4-12.8-12.8v-38.4c0-6.4 6.4-12.8 12.8-12.8h38.4c6.4 0 12.8 6.4 12.8 12.8v38.4zm128 128c0 6.4-6.4 12.8-12.8 12.8h-38.4c-6.4 0-12.8-6.4-12.8-12.8v-38.4c0-6.4 6.4-12.8 12.8-12.8h38.4c6.4 0 12.8 6.4 12.8 12.8v38.4zm0-128c0 6.4-6.4 12.8-12.8 12.8h-38.4c-6.4 0-12.8-6.4-12.8-12.8v-38.4c0-6.4 6.4-12.8 12.8-12.8h38.4c6.4 0 12.8 6.4 12.8 12.8v38.4zm128 128c0 6.4-6.4 12.8-12.8 12.8h-38.4c-6.4 0-12.8-6.4-12.8-12.8V268.8c0-6.4 6.4-12.8 12.8-12.8h38.4c6.4 0 12.8 6.4 12.8 12.8v166.4zm0-256c0 6.4-6.4 12.8-12.8 12.8H76.8c-6.4 0-12.8-6.4-12.8-12.8V76.8C64 70.4 70.4 64 76.8 64h294.4c6.4 0 12.8 6.4 12.8 12.8v102.4z'></path></svg>
						<span>매출관리</span>
				</a>
					<ul class='submenu '>
						<!-- <li id='Hd10' class='submenu-item '><a
							href='/Last_Cafe/head/account'>거래명세표 조회</a></li>
						<li id='Hd11' class='submenu-item '><a
							href='/Last_Cafe/head/analysis'>손익분석</a></li> -->
						<li id='Hd12' class='submenu-item '><a
							href='/Last_Cafe/head/dayreport'>일일판매레포트</a></li>
						<li id='Hd14' class='submenu-item '><a
							href='/Last_Cafe/head/limit'>주문관리</a></li>
						<!-- 	<li id='Hd15' class='submenu-item '><a
							href='/Last_Cafe/head/spacial'>특가판매</a></li> -->
					</ul></li>

				<!-- 재고관리 -->
				<li id='Hd34' class='sidebar-item  has-sub'><a href='#'
					class='sidebar-link'> <svg
							class='svg-inline--fa fa-box fa-w-16 fa-fw select-all svgicon'
							aria-hidden='true' focusable='false' data-prefix='fas'
							data-icon='box' role='img' xmlns='http://www.w3.org/2000/svg'
							viewBox='0 0 512 512' data-fa-i2svg=''>
							<path fill='currentColor'
								d='M509.5 184.6L458.9 32.8C452.4 13.2 434.1 0 413.4 0H272v192h238.7c-.4-2.5-.4-5-1.2-7.4zM240 0H98.6c-20.7 0-39 13.2-45.5 32.8L2.5 184.6c-.8 2.4-.8 4.9-1.2 7.4H240V0zM0 224v240c0 26.5 21.5 48 48 48h416c26.5 0 48-21.5 48-48V224H0z'></path></svg>
						<span>재고관리</span>
				</a>
					<ul class='submenu '>
						<li id='Hd35' class='submenu-item '><a
							href='/Last_Cafe/head/inven'>재고조회</a></li>
						<%-- <li id='Hd35' class='submenu-item '><a
							href='${cPath}/head/inven/form'>재고등록</a></li> --%>
						<!-- <li id='Hd36' class='submenu-item '><a
							href='/Last_Cafe/head/bacode'>바코드조회</a></li> -->
						<li id='Hd39' class='submenu-item '><a
							href='/Last_Cafe/head/salesall'>판매출고조회</a></li>
					</ul></li>
				<!-- 재고관리 끝 -->

				<!-- 상품관리 -->
				<li id='Hd29' class='sidebar-item  has-sub'><a href='#'
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
						<li id='Hd30' class='submenu-item '><a
							href='/Last_Cafe/head/goods'>상품조회</a></li>
					</ul></li>
				<!-- 상품관리 끝 -->

				<!-- 인사관리 -->
				<c:if test="${not empty empImgVO}">
					<li id='Hd24' class='sidebar-item  has-sub'><a href='#'
						class='sidebar-link'> <svg
								class='svg-inline--fa fa-user fa-w-14 fa-fw select-all svgicon'
								aria-hidden='true' focusable='false' data-prefix='fas'
								data-icon='user' role='img' xmlns='http://www.w3.org/2000/svg'
								viewBox='0 0 448 512' data-fa-i2svg=''>
							<path fill='currentColor'
									d='M224 256c70.7 0 128-57.3 128-128S294.7 0 224 0 96 57.3 96 128s57.3 128 128 128zm89.6 32h-16.7c-22.2 10.2-46.9 16-72.9 16s-50.6-5.8-72.9-16h-16.7C60.2 288 0 348.2 0 422.4V464c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48v-41.6c0-74.2-60.2-134.4-134.4-134.4z'></path>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
				</svg> <span>인사관리</span>
					</a>
						<ul class='submenu '>
							<c:choose>
								<c:when test="${empImgVO.deptList[0].dept_code eq '4'}">
									<li id='Hd25' class='submenu-item '><a
										href='${cPath}/head/employee'>직원목록 조회</a></li>
									<li id='Hd27' class='submenu-item '><a
										href='${cPath}/head/attendance'>직원근태 관리</a></li>
									<li id='Hd27' class='submenu-item '><a
										href='${cPath}/head/changeatt'>수정요청관리</a></li>
									<li id='Hd27' class='submenu-item '><a
										href='${cPath}/head/reqvacation'>휴가요청관리</a></li>
									<li id='Hd26' class='submenu-item '><a
										href='${cPath}/head/salary'>급여관리</a></li>
								</c:when>
								<c:otherwise>
									<li id='Hd26' class='submenu-item '><a
										href='${cPath}/head/myattendance'>나의 근태관리</a></li>
									<li id='Hd28' class='submenu-item '><a
										href='${cPath}/head/restList'>휴가관리</a></li>
									<li id='Hd28' class='submenu-item '><a
										href='${cPath}/head/mysalary'>급여관리</a></li>
								</c:otherwise>
							</c:choose>

						</ul></li>
				</c:if>
				<!-- 인사관리 끝 -->


				<!-- 공지사항 -->
				<li id='Hd07' class='sidebar-item  has-sub'><a href='#'
					class='sidebar-link'> <svg
							class='svg-inline--fa fa-bell fa-w-14 fa-fw select-all svgicon'
							aria-hidden='true' focusable='false' data-prefix='fas'
							data-icon='bell' role='img' xmlns='http://www.w3.org/2000/svg'
							viewBox='0 0 448 512' data-fa-i2svg=''>
							<path fill='currentColor'
								d='M224 512c35.32 0 63.97-28.65 63.97-64H160.03c0 35.35 28.65 64 63.97 64zm215.39-149.71c-19.32-20.76-55.47-51.99-55.47-154.29 0-77.7-54.48-139.9-127.94-155.16V32c0-17.67-14.32-32-31.98-32s-31.98 14.33-31.98 32v20.84C118.56 68.1 64.08 130.3 64.08 208c0 102.3-36.15 133.53-55.47 154.29-6 6.45-8.66 14.16-8.61 21.71.11 16.4 12.98 32 32.1 32h383.8c19.12 0 32-15.6 32.1-32 .05-7.55-2.61-15.27-8.61-21.71z'></path></svg>
						<span>공지사항</span>
				</a>
					<ul class='submenu '>
						<li id='Hd08' class='submenu-item '><a
							href='/Last_Cafe/head/notice'>공지사항 조회</a></li>
					</ul></li>
				<!-- 공지사항끝 -->

				<!-- 문의사항 -->
				<li id='Hd16' class='sidebar-item  has-sub'><a href='#'
					class='sidebar-link'> <svg
							class='svg-inline--fa fa-question-circle fa-w-16 fa-fw select-all svgicon'
							aria-hidden='true' focusable='false' data-prefix='fas'
							data-icon='question-circle' role='img'
							xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512'
							data-fa-i2svg=''>
							<path fill='currentColor'
								d='M504 256c0 136.997-111.043 248-248 248S8 392.997 8 256C8 119.083 119.043 8 256 8s248 111.083 248 248zM262.655 90c-54.497 0-89.255 22.957-116.549 63.758-3.536 5.286-2.353 12.415 2.715 16.258l34.699 26.31c5.205 3.947 12.621 3.008 16.665-2.122 17.864-22.658 30.113-35.797 57.303-35.797 20.429 0 45.698 13.148 45.698 32.958 0 14.976-12.363 22.667-32.534 33.976C247.128 238.528 216 254.941 216 296v4c0 6.627 5.373 12 12 12h56c6.627 0 12-5.373 12-12v-1.333c0-28.462 83.186-29.647 83.186-106.667 0-58.002-60.165-102-116.531-102zM256 338c-25.365 0-46 20.635-46 46 0 25.364 20.635 46 46 46s46-20.636 46-46c0-25.365-20.635-46-46-46z'></path></svg>
						<span>문의사항</span>
				</a>
					<ul class='submenu '>
						<li id='Hd17' class='submenu-item '><a
							href='/Last_Cafe/head/question'>문의사항 조회</a></li>
					</ul></li>
				<!-- 문의사항끝 -->

				<!-- 이벤트 -->
				<!-- 				<li id='Hd22' class='sidebar-item  has-sub'><a href='#'
					class='sidebar-link'> <svg
							class='svg-inline--fa fa-splotch fa-w-16 fa-fw select-all svgicon'
							aria-hidden='true' focusable='false' data-prefix='fas'
							data-icon='splotch' role='img' xmlns='http://www.w3.org/2000/svg'
							viewBox='0 0 512 512' data-fa-i2svg=''>
							<path fill='currentColor'
								d='M472.29 195.89l-67.06-22.95c-19.28-6.6-33.54-20.92-38.14-38.3L351.1 74.19c-11.58-43.77-76.57-57.13-109.98-22.62l-46.14 47.67c-13.26 13.71-33.54 20.93-54.2 19.31l-71.88-5.62c-52.05-4.07-86.93 44.88-59.03 82.83l38.54 52.42c11.08 15.07 12.82 33.86 4.64 50.24L24.62 355.4c-20.59 41.25 22.84 84.87 73.49 73.81l69.96-15.28c20.11-4.39 41.45 0 57.07 11.73l54.32 40.83c39.32 29.56 101.04 7.57 104.45-37.22l4.7-61.86c1.35-17.79 12.8-33.86 30.63-42.99l62-31.74c44.88-22.96 39.59-80.17-8.95-96.79z'></path></svg>
						<span>이벤트</span>
				</a>
					<ul class='submenu '>
						<li id='Hd23' class='submenu-item '><a
							href='/Last_Cafe/head/event'>이벤트 조회</a></li>
					</ul>
				</li> -->
				<!-- 이벤트끝 -->
				<c:if test="${empty empImgVO}">
					<!-- 시스템상품관리 -->
					<li id='Hd18' class='sidebar-item  has-sub'><a href='#'
						class='sidebar-link'> <svg
								class='svg-inline--fa fa-credit-card fa-w-18 fa-fw select-all svgicon'
								aria-hidden='true' focusable='false' data-prefix='fas'
								data-icon='credit-card' role='img'
								xmlns='http://www.w3.org/2000/svg' viewBox='0 0 576 512'
								data-fa-i2svg=''>
							<path fill='currentColor'
									d='M0 432c0 26.5 21.5 48 48 48h480c26.5 0 48-21.5 48-48V256H0v176zm192-68c0-6.6 5.4-12 12-12h136c6.6 0 12 5.4 12 12v40c0 6.6-5.4 12-12 12H204c-6.6 0-12-5.4-12-12v-40zm-128 0c0-6.6 5.4-12 12-12h72c6.6 0 12 5.4 12 12v40c0 6.6-5.4 12-12 12H76c-6.6 0-12-5.4-12-12v-40zM576 80v48H0V80c0-26.5 21.5-48 48-48h480c26.5 0 48 21.5 48 48z'></path></svg>
							<span>시스템 상품관리</span>
					</a>
						<ul class='submenu '>
							<li id='Hd19' class='submenu-item '><a
								href='/Last_Cafe/head/systemprod'>상품결제</a></li>
							<li id='Hd20' class='submenu-item '><a
								href='/Last_Cafe/head/systemprod/info'>상품정보</a></li>
							<!-- <li id='Hd21' class='submenu-item '><a
							href='/Last_Cafe/head/systemprod/regular'>정기결제</a></li> -->
						</ul></li>
					<!-- 시스템상품관리 끝 -->
				</c:if>

				<!-- 커스터마이징 -->
				<!-- 	<li id='Hd40' class='sidebar-item  has-sub'><a href='#'
					class='sidebar-link'> <svg
							class='svg-inline--fa fa-tools fa-w-16 fa-fw select-all svgicon'
							aria-hidden='true' focusable='false' data-prefix='fas'
							data-icon='tools' role='img' xmlns='http://www.w3.org/2000/svg'
							viewBox='0 0 512 512' data-fa-i2svg=''>
							<path fill='currentColor'
								d='M501.1 395.7L384 278.6c-23.1-23.1-57.6-27.6-85.4-13.9L192 158.1V96L64 0 0 64l96 128h62.1l106.6 106.6c-13.6 27.8-9.2 62.3 13.9 85.4l117.1 117.1c14.6 14.6 38.2 14.6 52.7 0l52.7-52.7c14.5-14.6 14.5-38.2 0-52.7zM331.7 225c28.3 0 54.9 11 74.9 31l19.4 19.4c15.8-6.9 30.8-16.5 43.8-29.5 37.1-37.1 49.7-89.3 37.9-136.7-2.2-9-13.5-12.1-20.1-5.5l-74.4 74.4-67.9-11.3L334 98.9l74.4-74.4c6.6-6.6 3.4-17.9-5.7-20.2-47.4-11.7-99.6.9-136.6 37.9-28.5 28.5-41.9 66.1-41.2 103.6l82.1 82.1c8.1-1.9 16.5-2.9 24.7-2.9zm-103.9 82l-56.7-56.7L18.7 402.8c-25 25-25 65.5 0 90.5s65.5 25 90.5 0l123.6-123.6c-7.6-19.9-9.9-41.6-5-62.7zM64 472c-13.2 0-24-10.8-24-24 0-13.3 10.7-24 24-24s24 10.7 24 24c0 13.2-10.7 24-24 24z'></path></svg>
						<span>커스터마이징</span>
				</a>
					<ul class='submenu '>
						<li id='Hd41' class='submenu-item '><a
							href='/Last_Cafe/head/custom'>권한설정</a></li>
						<li id='Hd42' class='submenu-item '><a
							href='/Last_Cafe/head/company'>회사정보관리</a></li>
					</ul>
				</li> -->
				<!-- 커스터마이징 끝 -->

			</ul>
		</div>
		<button class="sidebar-toggler btn x">
			<i data-feather="x"></i>
		</button>
	</div>
</div>

<!-- 출근모달 -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1"
	role="dialog" aria-labelledby="exampleModalCenterTitle"
	aria-hidden="true">
	<div
		class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
		role="document">
		<div class="modal-content">
			<div class="modal-body goworkModalBody">
				<i class="bi bi-x gowork_xICON"></i> <br>
				<!-- 프로필 이미지 -->
				<c:choose>
					<c:when test="${empImgVO.att_fileno eq null}">
						<img class="myImage_gotoWork"
							src="${cPath}/resources/assets/images/users/profile-pic.jpg">
					</c:when>
					<c:otherwise>
						<c:forEach items="${empImgVO.attachfileList}" var="attach"
							varStatus="status">
							<c:if test="${status.index eq 0}">
								<img class="myImage_gotoWork"
									src="data:image/jpeg;base64,${attach.file_img}" alt="user">
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<table class="gowork_table">
					<tr>
						<td class="gowork_td gowork_name">${empImgVO.emp_nm}님</td>
					</tr>
					<tr>
						<td class="gowork_td gowork_size"><c:if
								test="${not empty empImgVO.deptList }">
								<c:forEach items="${empImgVO.deptList}" var="dept">
									${dept.dept_nm }/${empImgVO.emp_clsf_code }
								</c:forEach>
							</c:if></td>
					</tr>
					<tr>
						<td class="gowork_td gowork_size">${empImgVO.emp_email }</td>
					</tr>
					<tr>
						<td class="gowork_email"><i
							class="bi bi-calendar-check gowork_bi"></i><span
							class="gowork_calendar"></span> <i class="bi bi-clock gowork_bi"></i><span
							id="clock" class="gowork_clock clock">00:00</span></td>
					</tr>
				</table>
				<button class="btn btn-primary goworkTrue">출근하시겠습니까?</button>
			</div>
		</div>
	</div>
</div>


<!-- 퇴근모달 -->
<div class="modal fade" id="livModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	<div
		class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
		role="document">
		<div class="modal-content">
			<div class="modal-body goworkModalBody">
				<i class="bi bi-x gohome_xICON"></i> <br>
				<!-- 프로필 이미지 -->
				<c:choose>
					<c:when test="${empImgVO.att_fileno eq null}">
						<img class="myImage_gotoWork"
							src="${cPath}/resources/assets/images/users/profile-pic.jpg">
					</c:when>
					<c:otherwise>
						<c:forEach items="${empImgVO.attachfileList}" var="attach"
							varStatus="status">
							<c:if test="${status.index eq 0}">
								<img class="myImage_gotoWork"
									src="data:image/jpeg;base64,${attach.file_img}" alt="user">
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<table class="gowork_table">
					<tr>
						<td class="goliv_td gowork_name">${empImgVO.emp_nm}님</td>
					</tr>
					<tr>
						<td class="goliv_td gowork_size"><c:if
								test="${not empty empImgVO.deptList }">
								<c:forEach items="${empImgVO.deptList}" var="dept">
									${dept.dept_nm }/${empImgVO.emp_clsf_code }
								</c:forEach>
							</c:if></td>
					</tr>
					<tr>
						<td class="goliv_td gowork_size">${empImgVO.emp_email}</td>
					</tr>
					<tr>
						<td class="gowork_email"><i
							class="bi bi-calendar-check gowork_bi"></i><span
							class="gowork_calendar"></span> <i class="bi bi-clock gowork_bi"></i><span
							id="livclock" class="goliv_clock clock">00:00</span></td>
					</tr>
				</table>
				<button class="btn btn-secondary golivTrue">퇴근하시겠습니까?</button>
			</div>
		</div>
	</div>
</div>



<script>
	$(function() {

		if ($('.gotoWorkCheck').val() == "ok") {
			//$('.GoWork').css("background-color", "#826767").css("border-color", "#826767")
			$('.GoWork').prop("disabled", "disabled");
			//$('.mainBtn').remove();
			//$('.mainBtn').append('<button class="btn btn-primary GoWork"  data-bs-toggle="modal" data-bs-target="#exampleModalCenter" disabled>출근</button><button class="btn btn-secondary">퇴근</button>')
		}

		if ($('.gotoHomeCheck').val() == "ok") {
			//$('.GoLiv').css("background-color", "#826767").css("border-color", "#826767")
			$('.GoLiv').prop("disabled", "disabled");
			//$('.mainBtn').remove();
			//$('.mainBtn').append('<button class="btn btn-primary GoWork"  data-bs-toggle="modal" data-bs-target="#exampleModalCenter" disabled>출근</button><button class="btn btn-secondary">퇴근</button>')
		}

		if ($('.dclzVOatt').val() != "") {
			//$('.GoWork').prop("disabled", "disabled");
			$('.GoWork').attr("data-bs-toggle", "");
			$('.GoWork').attr("data-bs-target", "");
			$('.GoWork').hide();
		} else {
			$('.GoLiv').hide();
		}

		if ($('.dclzVOliv').val() != "") {
			//$('.GoLiv').addClass("disabled");
			$('.GoLiv').attr("data-bs-toggle", "");
			$('.GoLiv').attr("data-bs-target", "");

		}

		//출근시간
		var clockTarget = document.getElementById("clock");
		var clockTargetLiv = document.getElementById("livclock");
		var clockTargetCommute = document.getElementById("clockCommute");
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
			var week = [ '일', '월', '화', '수', '목', '금', '토' ];

			// 요일은 숫자형태로 리턴되기때문에 미리 배열을 만듭니다. 
			var hours = date.getHours();

			// 시간을 받아오고 
			var minutes = date.getMinutes();

			// 분도 받아옵니다.
			var seconds = date.getSeconds();

			// 초까지 받아온후 
			clockTarget.innerText = ((hours < 10) ? "0" + hours : hours) + ":"
					+ (minutes < 10 ? "0" + minutes : minutes) + ":"
					+ (seconds < 10 ? "0" + seconds : seconds);
			clockTargetLiv.innerText = ((hours < 10) ? "0" + hours : hours)
					+ ":" + (minutes < 10 ? "0" + minutes : minutes) + ":"
					+ (seconds < 10 ? "0" + seconds : seconds);
			clockHeaderCommute.innerText = ((hours < 10) ? "0" + hours : hours)
					+ ":" + (minutes < 10 ? "0" + minutes : minutes) + ":"
					+ (seconds < 10 ? "0" + seconds : seconds);
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
	$(document).ready(function() {

		let today = new Date();

		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1; // 월
		let date = today.getDate(); // 날짜
		let day = today.getDay(); // 요일

		let hours = today.getHours(); // 시
		let minutes = today.getMinutes(); // 분
		let seconds = today.getSeconds(); // 초
		let milliseconds = today.getMilliseconds(); // 밀리초

		/* document.write(year + '/' + month + '/' + date)
		 document.write('<br>')
		 document.write(day); */

		$('.gowork_calendar').text(year + '년' + month + '월' + date + '일');
		$('.gowork_clock').text(hours + ':' + minutes + ':' + seconds);
		//$('.gowork_clock').text(moment().format('MMMM Do YYYY, h:mm:ss a'));

		$(window).resize(function() {
			if (w < 1200) {
				$("#main").removeClass('ml300');
				$("#main").addClass('ml0');
			}

		});
	});
	$('.sidebar-hide').on('click', function() {
		$("#main").removeClass('ml300');
		$("#main").addClass('ml0');
		$('#burgerIcon').removeClass('d-xl-none');
		$('#burgerIcon').addClass('d-xl');
	});

	$('.burger-btn').on('click', function() {
		if (w > 1200) {
			$("#main").removeClass('ml0');
			$("#main").addClass('ml300');
			$('#burgerIcon').removeClass('d-xl');
			$('#burgerIcon').addClass('d-xl-none');
		} else {
			$("#main").removeClass('ml300');
			$("#main").removeClass('ml0');
		}
	});

	var currentPath = window.location.pathname;
	$('.submenu').removeClass('active');
	$('.sidebar-item').removeClass('active');

	$('li.submenu-item').each(function(index, submenu) {
		let dept1 = $(this).find('a:first').attr('href');

		if (dept1 && currentPath.indexOf(dept1) == 0) {
			let parentMenu = $(this).parent('.submenu');
			$(this).parents('.sidebar-item').addClass('active');
			parentMenu.addClass('active');
			$(this).addClass('active');

		}

		if (currentPath == '/Last_Cafe/head/main') {
			$('.dash').addClass('active');
		}
	});

	$('.gowork_xICON').on('click', function() {

		$('#exampleModalCenter').modal("hide");

	})

	$('.gohome_xICON').on('click', function() {

		$('#livModal').modal("hide");

	})

	$('.goworkTrue').on('click', function() {

		let clock = $('.gowork_clock').text();

		$.ajax({
			url : "${cPath}/head/commute/atten",
			method : "post",
			data : {
				"clock" : clock
			},
			dataType : 'json',
			success : function(resp) {
				console.log(resp)
				$('#exampleModalCenter').modal("hide");
				$('.GoWork').attr("data-bs-toggle", "");
				$('.GoWork').attr("data-bs-target", "");
				alert("출근체크 되었습니다.");
				location.href = "${cPath}/head/main";
			},
			error : function(xhr, error, msg) {
				console.log(xhr);
				console.log(error);
				console.log(msg);
				alert("상태 : " + xhr.status);
			}
		});

	})

	$('.golivTrue').on('click', function() {

		let clockliv = $('.goliv_clock').text();

		$.ajax({
			url : "${cPath}/head/commute/leave",
			method : "post",
			dataType : "json",
			success : function(resp) {
				alert("퇴근체크 되었습니다.");
				$('#livModal').modal("hide");
				//$('.GoLiv').attr("disabled", "disabled");
				$('.GoLiv').attr("data-bs-toggle", "");
				$('.GoLiv').attr("data-bs-target", "");
				location.href = "${cPath}/head/main";
			},
			error : function(xhr, error, msg) {
				console.log(xhr);
				console.log(error);
				console.log(msg);
				alert("상태 : " + xhr.status);
			}
		});

	});
</script>
