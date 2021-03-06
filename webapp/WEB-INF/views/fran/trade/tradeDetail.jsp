    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 6. 10. 이진수          최초작성
*
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">    
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">

<style>
.orderHeader {
 	display : flex;
 	justify-content: space-between;
 	width : 100%;
 	border : 5px solid #f5ebe7;
 	padding : 0.75rem;
 	color : #b9a7a7;
 	margin-bottom: 10px;
}
.ordHeaderSpan {
	font-size: 14px;
	color : #876767;
}
.custom-table-orderInfo {
	border-top : 1px solid #876767;
	border-bottom : 1px solid #ddd;
	width : 100%;
	
	
}
.custom-table-orderInfo td {
	padding : 0.5rem 2.25rem;
}
.custom-table-orderInfo th {
	background-color: #f5ebe7;
	text-align: center;
	vertical-align: middle;
	font-size: 14px;
	color : #876767;
}


.myImage{
		width: 40px;
	} 
#table1 {
	text-align: center;
}
#table1 th {
	text-align: center;
}
#table2 {
	text-align: center;
}
#table2 th {
	text-align: center;
}
.talbeSearchArea  th {
	background-color: #fff;
	border: 1px solid #ddd;
}
.okSts {
	background-color: #51a288; color :#fff;
}
.cancleSts {
	background-color: #f54e5c; color :#fff;
}
.ingSts {
	background-color: #826767; color :#fff;
}
.waitSts {
	background-color: #888; color :#fff;
}
.btn-secondary:hover {
	background-color: #555;
	border-color: #555;
}
.dataAreaAll {
	display : flex;
	justify-content: center;
}

.dataArea {
    height: 500px;
    width : 50%;
}

.stateBox-ing{
	width : 48px;
	hegith : 48px;
	font-size : 10px;
	background-color: #f5ebe7;
	border : 1px solid #876767;
	border-radius: 10px;
	padding : 10px;
	margin :5px;
	color : #876767;
}
.stateBox-com{
	width : 48px;
	height : 48px;
	font-size : 10px;
	background-color: #876767;
	border : 1px solid #876767;
	border-radius: 10px;
	padding : 10px;
	margin :5px;
	color : #f5ebe7;
}
.stateBox-cancle{
	width : 48px;
	hegith : 48px;
	font-size : 10px;
	background-color: #c16161;
	border : 1px solid #c16161;
	border-radius: 10px;
	padding : 10px;
	margin :5px;
	color : #f5ebe7;
}
.stateArea {
	width: 100%;
}
.stateContainer {
	position : relative;
	z-index:10;
	display: flex;
	justify-content: space-between;
	max-width: 700px;
	margin: 0 auto;
}
.stateBox {
	display: flex;
	flex-direction: column;
	align-items: center;
	
}
.stickDeco {
	position : absolute;
	width: 90%;
	top:36%;
	left:7%;
	z-index:-1;
	height: 5px;
	background-color: #876767;
}
.stateBox span {
	color: #876767;
	font-size: 12px;
}
.thisState {
	animation: stateBox-ing 2s infinite;
}
@keyframes stateBox-ing {
    0% {
        box-shadow: 0 0 0 0 rgba(193, 161, 161, 0.7);
    }
    70% {
        box-shadow: 0 0 0 10px rgba(193, 161, 161, 0);
    }
    100% {
        box-shadow: 0 0 0 0 rgba(193, 161, 161, 0);
    }
}

.btn-primary:disabled {
	background-color: #876767;
	border-color: #876767;
}
.tableSetting {
	display: flex;;
	justify-content: space-between;
}
.totalMoney {
	background-color: #f5ebe7;
	text-align: right;
	display : block;
	width: 100%;
	padding : 5px;
	margin-top: 5px;
}
.dataAreaLine{
	width: 1px;
    height: 500px;
    border: 1px solid #ddd;
    margin-right: 5px;
}
.completeImg{
	position: absolute;
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
}
.completeImg img{
	width: 50%;
    opacity: 0.65;
}
.mydataArea{
	position: relative;
}
.dataTable-container{
	overflow-x: hidden;.
}
</style>

<body>

<input type="hidden" class="cancleIcon" value='<svg class="svg-inline--fa fa-window-close fa-w-16 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="window-close" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h416c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm-83.6 290.5c4.8 4.8 4.8 12.6 0 17.4l-40.5 40.5c-4.8 4.8-12.6 4.8-17.4 0L256 313.3l-66.5 67.1c-4.8 4.8-12.6 4.8-17.4 0l-40.5-40.5c-4.8-4.8-4.8-12.6 0-17.4l67.1-66.5-67.1-66.5c-4.8-4.8-4.8-12.6 0-17.4l40.5-40.5c4.8-4.8 12.6-4.8 17.4 0l66.5 67.1 66.5-67.1c4.8-4.8 12.6-4.8 17.4 0l40.5 40.5c4.8 4.8 4.8 12.6 0 17.4L313.3 256l67.1 66.5z"></path></svg>'>

<div id="app">
    	<section class="section">
    		<!-- card 영역 -->
    		<div class="card">
    			<!-- card-header 영역 -->
				<div class="card-header">
					<div class="row">
						<div class="rowLeft">
							<h4>발주 상세 정보</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/fran/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">발주 상세 정보</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>	
				<!-- card-header 끝 -->
				<!-- card-body 영역 -->
					<div class="card-body">
						<c:if test="${not empty ordersVO }">
                       	  <div class="orderHeader">
                       	  	<div><span class="ordHeaderSpan">주문일자</span> ${ordersVO.yymmdd } &nbsp;&nbsp; | &nbsp;&nbsp;<span class="ordHeaderSpan">주문번호</span> ${ordersVO.order_no }</div> 
                       	  	
                       	  </div>
						<!-- 상태 영역 -->
							<div class="stateArea">
								<div class="stateContainer">
									<div class="stickDeco"></div>
								
									<div class="stateBox">
									<c:choose>
										<c:when test="${ordersVO.steps.step != '7' }">
											<div class="stateBox-com" >
													<svg class="svg-inline--fa fa-edit fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="edit" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M402.6 83.2l90.2 90.2c3.8 3.8 3.8 10 0 13.8L274.4 405.6l-92.8 10.3c-12.4 1.4-22.9-9.1-21.5-21.5l10.3-92.8L388.8 83.2c3.8-3.8 10-3.8 13.8 0zm162-22.9l-48.8-48.8c-15.2-15.2-39.9-15.2-55.2 0l-35.4 35.4c-3.8 3.8-3.8 10 0 13.8l90.2 90.2c3.8 3.8 10 3.8 13.8 0l35.4-35.4c15.2-15.3 15.2-40 0-55.2zM384 346.2V448H64V128h229.8c3.2 0 6.2-1.3 8.5-3.5l40-40c7.6-7.6 2.2-20.5-8.5-20.5H48C21.5 64 0 85.5 0 112v352c0 26.5 21.5 48 48 48h352c26.5 0 48-21.5 48-48V306.2c0-10.7-12.9-16-20.5-8.5l-40 40c-2.2 2.3-3.5 5.3-3.5 8.5z"></path></svg>
													<span>발주신청</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="stateBox-cancle" >
                        	  					<svg class="svg-inline--fa fa-window-close fa-w-16 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="window-close" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h416c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm-83.6 290.5c4.8 4.8 4.8 12.6 0 17.4l-40.5 40.5c-4.8 4.8-12.6 4.8-17.4 0L256 313.3l-66.5 67.1c-4.8 4.8-12.6 4.8-17.4 0l-40.5-40.5c-4.8-4.8-4.8-12.6 0-17.4l67.1-66.5-67.1-66.5c-4.8-4.8-4.8-12.6 0-17.4l40.5-40.5c4.8-4.8 12.6-4.8 17.4 0l66.5 67.1 66.5-67.1c4.8-4.8 12.6-4.8 17.4 0l40.5 40.5c4.8 4.8 4.8 12.6 0 17.4L313.3 256l67.1 66.5z"></path></svg> 
											</div> 
												<span>발주취소</span>
										</c:otherwise>
									</c:choose>
									</div>
									
									<div class="stateBox">
									<c:choose>
										<c:when test="${ordersVO.steps.step == '2' }">
											<div class="stateBox-com" >
												<svg class="svg-inline--fa fa-clipboard-check fa-w-18 fa-fw select-all" style="width: 25px; height: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="clipboard-check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" data-fa-i2svg=""><path fill="currentColor" d="M336 64h-80c0-35.3-28.7-64-64-64s-64 28.7-64 64H48C21.5 64 0 85.5 0 112v352c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48V112c0-26.5-21.5-48-48-48zM192 40c13.3 0 24 10.7 24 24s-10.7 24-24 24-24-10.7-24-24 10.7-24 24-24zm121.2 231.8l-143 141.8c-4.7 4.7-12.3 4.6-17-.1l-82.6-83.3c-4.7-4.7-4.6-12.3.1-17L99.1 285c4.7-4.7 12.3-4.6 17 .1l46 46.4 106-105.2c4.7-4.7 12.3-4.6 17 .1l28.2 28.4c4.7 4.8 4.6 12.3-.1 17z"></path></svg>
											</div>
											<span>발주승인</span>
										</c:when>
										<c:when test="${ordersVO.steps.step == '1' }">
											<div class="stateBox-ing thisState" >
												<svg class="svg-inline--fa fa-clipboard-check fa-w-18 fa-fw select-all" style="width: 25px; height: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="clipboard-check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" data-fa-i2svg=""><path fill="currentColor" d="M336 64h-80c0-35.3-28.7-64-64-64s-64 28.7-64 64H48C21.5 64 0 85.5 0 112v352c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48V112c0-26.5-21.5-48-48-48zM192 40c13.3 0 24 10.7 24 24s-10.7 24-24 24-24-10.7-24-24 10.7-24 24-24zm121.2 231.8l-143 141.8c-4.7 4.7-12.3 4.6-17-.1l-82.6-83.3c-4.7-4.7-4.6-12.3.1-17L99.1 285c4.7-4.7 12.3-4.6 17 .1l46 46.4 106-105.2c4.7-4.7 12.3-4.6 17 .1l28.2 28.4c4.7 4.8 4.6 12.3-.1 17z"></path></svg>
											</div>
											<span>발주승인</span>
										</c:when>
										<c:when test="${ordersVO.steps.step == '7' }">
											<div class="stateBox-cancle" >
                        	  					<svg class="svg-inline--fa fa-window-close fa-w-16 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="window-close" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h416c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm-83.6 290.5c4.8 4.8 4.8 12.6 0 17.4l-40.5 40.5c-4.8 4.8-12.6 4.8-17.4 0L256 313.3l-66.5 67.1c-4.8 4.8-12.6 4.8-17.4 0l-40.5-40.5c-4.8-4.8-4.8-12.6 0-17.4l67.1-66.5-67.1-66.5c-4.8-4.8-4.8-12.6 0-17.4l40.5-40.5c4.8-4.8 12.6-4.8 17.4 0l66.5 67.1 66.5-67.1c4.8-4.8 12.6-4.8 17.4 0l40.5 40.5c4.8 4.8 4.8 12.6 0 17.4L313.3 256l67.1 66.5z"></path></svg> 
											</div> 
												<span>발주취소</span>
										</c:when>
										<c:otherwise>
											<div class="stateBox-com " >
												<svg class="svg-inline--fa fa-clipboard-check fa-w-18 fa-fw select-all" style="width: 25px; height: 25px;" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="clipboard-check" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512" data-fa-i2svg=""><path fill="currentColor" d="M336 64h-80c0-35.3-28.7-64-64-64s-64 28.7-64 64H48C21.5 64 0 85.5 0 112v352c0 26.5 21.5 48 48 48h288c26.5 0 48-21.5 48-48V112c0-26.5-21.5-48-48-48zM192 40c13.3 0 24 10.7 24 24s-10.7 24-24 24-24-10.7-24-24 10.7-24 24-24zm121.2 231.8l-143 141.8c-4.7 4.7-12.3 4.6-17-.1l-82.6-83.3c-4.7-4.7-4.6-12.3.1-17L99.1 285c4.7-4.7 12.3-4.6 17 .1l46 46.4 106-105.2c4.7-4.7 12.3-4.6 17 .1l28.2 28.4c4.7 4.8 4.6 12.3-.1 17z"></path></svg>
											</div>
											<span>발주승인</span>
										</c:otherwise>
									</c:choose>
									</div>
									
									<div class="stateBox">
										<c:choose>
											<c:when test="${ordersVO.steps.step == '3' }">
												<div class="stateBox-com" >
													<svg class="svg-inline--fa fa-boxes fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="boxes" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M560 288h-80v96l-32-21.3-32 21.3v-96h-80c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16h224c8.8 0 16-7.2 16-16V304c0-8.8-7.2-16-16-16zm-384-64h224c8.8 0 16-7.2 16-16V16c0-8.8-7.2-16-16-16h-80v96l-32-21.3L256 96V0h-80c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16zm64 64h-80v96l-32-21.3L96 384v-96H16c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16h224c8.8 0 16-7.2 16-16V304c0-8.8-7.2-16-16-16z"></path></svg>
												</div>
												<span>출고준비중</span>
											</c:when>
											<c:when test="${ordersVO.steps.step == '8' }">
												<div class="stateBox-cancle" >
                        	  						<svg class="svg-inline--fa fa-window-close fa-w-16 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="window-close" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h416c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm-83.6 290.5c4.8 4.8 4.8 12.6 0 17.4l-40.5 40.5c-4.8 4.8-12.6 4.8-17.4 0L256 313.3l-66.5 67.1c-4.8 4.8-12.6 4.8-17.4 0l-40.5-40.5c-4.8-4.8-4.8-12.6 0-17.4l67.1-66.5-67.1-66.5c-4.8-4.8-4.8-12.6 0-17.4l40.5-40.5c4.8-4.8 12.6-4.8 17.4 0l66.5 67.1 66.5-67.1c4.8-4.8 12.6-4.8 17.4 0l40.5 40.5c4.8 4.8 4.8 12.6 0 17.4L313.3 256l67.1 66.5z"></path></svg> 
												</div> 
												<span>출고취소</span>
											</c:when>
											<c:when test="${ordersVO.steps.step == '1'}">
												<div class="stateBox-ing" >
													<svg class="svg-inline--fa fa-boxes fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="boxes" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M560 288h-80v96l-32-21.3-32 21.3v-96h-80c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16h224c8.8 0 16-7.2 16-16V304c0-8.8-7.2-16-16-16zm-384-64h224c8.8 0 16-7.2 16-16V16c0-8.8-7.2-16-16-16h-80v96l-32-21.3L256 96V0h-80c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16zm64 64h-80v96l-32-21.3L96 384v-96H16c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16h224c8.8 0 16-7.2 16-16V304c0-8.8-7.2-16-16-16z"></path></svg>
												</div>
												<span>출고준비중</span>
											</c:when>
											<c:when test="${ordersVO.steps.step == '2'}">
												<div class="stateBox-ing thisState" >
													<svg class="svg-inline--fa fa-boxes fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="boxes" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M560 288h-80v96l-32-21.3-32 21.3v-96h-80c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16h224c8.8 0 16-7.2 16-16V304c0-8.8-7.2-16-16-16zm-384-64h224c8.8 0 16-7.2 16-16V16c0-8.8-7.2-16-16-16h-80v96l-32-21.3L256 96V0h-80c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16zm64 64h-80v96l-32-21.3L96 384v-96H16c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16h224c8.8 0 16-7.2 16-16V304c0-8.8-7.2-16-16-16z"></path></svg>
												</div>
												<span>출고준비중</span>
											</c:when>
											<c:when test="${ordersVO.steps.step == '7'}">
												<div class="stateBox-ing" >
													<svg class="svg-inline--fa fa-boxes fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="boxes" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M560 288h-80v96l-32-21.3-32 21.3v-96h-80c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16h224c8.8 0 16-7.2 16-16V304c0-8.8-7.2-16-16-16zm-384-64h224c8.8 0 16-7.2 16-16V16c0-8.8-7.2-16-16-16h-80v96l-32-21.3L256 96V0h-80c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16zm64 64h-80v96l-32-21.3L96 384v-96H16c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16h224c8.8 0 16-7.2 16-16V304c0-8.8-7.2-16-16-16z"></path></svg>
												</div>
												<span>출고준비중</span>
											</c:when>
											<c:otherwise>
												<div class="stateBox-com" >
													<svg class="svg-inline--fa fa-boxes fa-w-18 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="boxes" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512" data-fa-i2svg=""><path fill="currentColor" d="M560 288h-80v96l-32-21.3-32 21.3v-96h-80c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16h224c8.8 0 16-7.2 16-16V304c0-8.8-7.2-16-16-16zm-384-64h224c8.8 0 16-7.2 16-16V16c0-8.8-7.2-16-16-16h-80v96l-32-21.3L256 96V0h-80c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16zm64 64h-80v96l-32-21.3L96 384v-96H16c-8.8 0-16 7.2-16 16v192c0 8.8 7.2 16 16 16h224c8.8 0 16-7.2 16-16V304c0-8.8-7.2-16-16-16z"></path></svg>
												</div>
												<span>출고준비중</span>
											</c:otherwise>
										</c:choose>
									</div>
									
									<div class="stateBox">
										<c:choose>
											<c:when test="${ordersVO.steps.step == '4' }">
												<div class="stateBox-ing" >
													<svg class="svg-inline--fa fa-truck fa-w-20 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="truck" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M624 352h-16V243.9c0-12.7-5.1-24.9-14.1-33.9L494 110.1c-9-9-21.2-14.1-33.9-14.1H416V48c0-26.5-21.5-48-48-48H48C21.5 0 0 21.5 0 48v320c0 26.5 21.5 48 48 48h16c0 53 43 96 96 96s96-43 96-96h128c0 53 43 96 96 96s96-43 96-96h48c8.8 0 16-7.2 16-16v-32c0-8.8-7.2-16-16-16zM160 464c-26.5 0-48-21.5-48-48s21.5-48 48-48 48 21.5 48 48-21.5 48-48 48zm320 0c-26.5 0-48-21.5-48-48s21.5-48 48-48 48 21.5 48 48-21.5 48-48 48zm80-208H416V144h44.1l99.9 99.9V256z"></path></svg>
												</div>
												<span>출고완료</span>
											</c:when>
											<c:when test="${ordersVO.steps.step == '8' }">
												<div class="stateBox-cancle" >
                        	  						<svg class="svg-inline--fa fa-window-close fa-w-16 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="window-close" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M464 32H48C21.5 32 0 53.5 0 80v352c0 26.5 21.5 48 48 48h416c26.5 0 48-21.5 48-48V80c0-26.5-21.5-48-48-48zm-83.6 290.5c4.8 4.8 4.8 12.6 0 17.4l-40.5 40.5c-4.8 4.8-12.6 4.8-17.4 0L256 313.3l-66.5 67.1c-4.8 4.8-12.6 4.8-17.4 0l-40.5-40.5c-4.8-4.8-4.8-12.6 0-17.4l67.1-66.5-67.1-66.5c-4.8-4.8-4.8-12.6 0-17.4l40.5-40.5c4.8-4.8 12.6-4.8 17.4 0l66.5 67.1 66.5-67.1c4.8-4.8 12.6-4.8 17.4 0l40.5 40.5c4.8 4.8 4.8 12.6 0 17.4L313.3 256l67.1 66.5z"></path></svg> 
												</div> 
												<span>출고취소</span>
											</c:when>
											<c:when test="${ordersVO.steps.step == '1' || ordersVO.steps.step == '2' || ordersVO.steps.step == '7'}">
												<div class="stateBox-ing " >
													<svg class="svg-inline--fa fa-truck fa-w-20 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="truck" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M624 352h-16V243.9c0-12.7-5.1-24.9-14.1-33.9L494 110.1c-9-9-21.2-14.1-33.9-14.1H416V48c0-26.5-21.5-48-48-48H48C21.5 0 0 21.5 0 48v320c0 26.5 21.5 48 48 48h16c0 53 43 96 96 96s96-43 96-96h128c0 53 43 96 96 96s96-43 96-96h48c8.8 0 16-7.2 16-16v-32c0-8.8-7.2-16-16-16zM160 464c-26.5 0-48-21.5-48-48s21.5-48 48-48 48 21.5 48 48-21.5 48-48 48zm320 0c-26.5 0-48-21.5-48-48s21.5-48 48-48 48 21.5 48 48-21.5 48-48 48zm80-208H416V144h44.1l99.9 99.9V256z"></path></svg>
												</div>
												<span>출고완료</span>
											</c:when>
											<c:when test="${ordersVO.steps.step == '3'}">
												<div class="stateBox-ing thisState" >
													<svg class="svg-inline--fa fa-truck fa-w-20 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="truck" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M624 352h-16V243.9c0-12.7-5.1-24.9-14.1-33.9L494 110.1c-9-9-21.2-14.1-33.9-14.1H416V48c0-26.5-21.5-48-48-48H48C21.5 0 0 21.5 0 48v320c0 26.5 21.5 48 48 48h16c0 53 43 96 96 96s96-43 96-96h128c0 53 43 96 96 96s96-43 96-96h48c8.8 0 16-7.2 16-16v-32c0-8.8-7.2-16-16-16zM160 464c-26.5 0-48-21.5-48-48s21.5-48 48-48 48 21.5 48 48-21.5 48-48 48zm320 0c-26.5 0-48-21.5-48-48s21.5-48 48-48 48 21.5 48 48-21.5 48-48 48zm80-208H416V144h44.1l99.9 99.9V256z"></path></svg>
												</div>
												<span>출고완료</span>
											</c:when>
											
											<c:otherwise>
												<div class="stateBox-com " >
													<svg class="svg-inline--fa fa-truck fa-w-20 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="truck" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M624 352h-16V243.9c0-12.7-5.1-24.9-14.1-33.9L494 110.1c-9-9-21.2-14.1-33.9-14.1H416V48c0-26.5-21.5-48-48-48H48C21.5 0 0 21.5 0 48v320c0 26.5 21.5 48 48 48h16c0 53 43 96 96 96s96-43 96-96h128c0 53 43 96 96 96s96-43 96-96h48c8.8 0 16-7.2 16-16v-32c0-8.8-7.2-16-16-16zM160 464c-26.5 0-48-21.5-48-48s21.5-48 48-48 48 21.5 48 48-21.5 48-48 48zm320 0c-26.5 0-48-21.5-48-48s21.5-48 48-48 48 21.5 48 48-21.5 48-48 48zm80-208H416V144h44.1l99.9 99.9V256z"></path></svg>
												</div>
												<span>출고완료</span>
											</c:otherwise>
										</c:choose>
									</div>
									
									<div class="stateBox">
										<c:choose>
											<c:when test="${ordersVO.steps.step == '5' || ordersVO.steps.step == '4'}">
												<div class="stateBox-ing thisState" >
													<svg class="svg-inline--fa fa-warehouse fa-w-20 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="warehouse" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M504 352H136.4c-4.4 0-8 3.6-8 8l-.1 48c0 4.4 3.6 8 8 8H504c4.4 0 8-3.6 8-8v-48c0-4.4-3.6-8-8-8zm0 96H136.1c-4.4 0-8 3.6-8 8l-.1 48c0 4.4 3.6 8 8 8h368c4.4 0 8-3.6 8-8v-48c0-4.4-3.6-8-8-8zm0-192H136.6c-4.4 0-8 3.6-8 8l-.1 48c0 4.4 3.6 8 8 8H504c4.4 0 8-3.6 8-8v-48c0-4.4-3.6-8-8-8zm106.5-139L338.4 3.7a48.15 48.15 0 0 0-36.9 0L29.5 117C11.7 124.5 0 141.9 0 161.3V504c0 4.4 3.6 8 8 8h80c4.4 0 8-3.6 8-8V256c0-17.6 14.6-32 32.6-32h382.8c18 0 32.6 14.4 32.6 32v248c0 4.4 3.6 8 8 8h80c4.4 0 8-3.6 8-8V161.3c0-19.4-11.7-36.8-29.5-44.3z"></path></svg>
												</div>
												<span>입고완료</span>
											</c:when>
											<c:when test="${ordersVO.steps.step == '6' }">
												<div class="stateBox-com" >
													<svg class="svg-inline--fa fa-warehouse fa-w-20 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="warehouse" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M504 352H136.4c-4.4 0-8 3.6-8 8l-.1 48c0 4.4 3.6 8 8 8H504c4.4 0 8-3.6 8-8v-48c0-4.4-3.6-8-8-8zm0 96H136.1c-4.4 0-8 3.6-8 8l-.1 48c0 4.4 3.6 8 8 8h368c4.4 0 8-3.6 8-8v-48c0-4.4-3.6-8-8-8zm0-192H136.6c-4.4 0-8 3.6-8 8l-.1 48c0 4.4 3.6 8 8 8H504c4.4 0 8-3.6 8-8v-48c0-4.4-3.6-8-8-8zm106.5-139L338.4 3.7a48.15 48.15 0 0 0-36.9 0L29.5 117C11.7 124.5 0 141.9 0 161.3V504c0 4.4 3.6 8 8 8h80c4.4 0 8-3.6 8-8V256c0-17.6 14.6-32 32.6-32h382.8c18 0 32.6 14.4 32.6 32v248c0 4.4 3.6 8 8 8h80c4.4 0 8-3.6 8-8V161.3c0-19.4-11.7-36.8-29.5-44.3z"></path></svg>
												</div>
												<span>입고완료</span>
											</c:when>
											<c:otherwise>
												<div class="stateBox-ing" >
													<svg class="svg-inline--fa fa-warehouse fa-w-20 fa-fw select-all" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="warehouse" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M504 352H136.4c-4.4 0-8 3.6-8 8l-.1 48c0 4.4 3.6 8 8 8H504c4.4 0 8-3.6 8-8v-48c0-4.4-3.6-8-8-8zm0 96H136.1c-4.4 0-8 3.6-8 8l-.1 48c0 4.4 3.6 8 8 8h368c4.4 0 8-3.6 8-8v-48c0-4.4-3.6-8-8-8zm0-192H136.6c-4.4 0-8 3.6-8 8l-.1 48c0 4.4 3.6 8 8 8H504c4.4 0 8-3.6 8-8v-48c0-4.4-3.6-8-8-8zm106.5-139L338.4 3.7a48.15 48.15 0 0 0-36.9 0L29.5 117C11.7 124.5 0 141.9 0 161.3V504c0 4.4 3.6 8 8 8h80c4.4 0 8-3.6 8-8V256c0-17.6 14.6-32 32.6-32h382.8c18 0 32.6 14.4 32.6 32v248c0 4.4 3.6 8 8 8h80c4.4 0 8-3.6 8-8V161.3c0-19.4-11.7-36.8-29.5-44.3z"></path></svg>
												</div>
												<span>입고완료</span>
											</c:otherwise>
										</c:choose>
										
									</div>
								</div>
							</div>
						<!-- 조회 영역 -->
						<div class="row">
							<h6></h6>
						</div>
						<div class="dataTable-container">
							<div class="tableSetting">
								<div class="totalRecode">
<%-- 										총  ${ordersVO.totalRecode } 건  --%>
								</div>
								<div class="btnArea">
									<c:choose>
										<c:when test="${ordersVO.out_sttus_code == 'A0001' && ordersVO.in_sttus_code == 'B0001' }">
											<button type="button" id="inCom" class="btn btn-primary float-end pribtn statusBtn"  name="${ordersVO.out_code }">입고완료</button>
										</c:when>
										<c:otherwise>
											<button type="button" id="inCom" class="btn btn-primary float-end pribtn statusBtn" disabled name="${ordersVO.out_code }">입고완료</button>
										</c:otherwise>
										
									</c:choose>
										<button type="button" id="backList" class="btn btn-primary float-end pribtn statusBtn">목록으로</button>
								</div>
							</div>
							<!-- 발주 내역 -->
							<div style="display: flex; justify-content: space-between;">
								<div class="row" style="width: 49%;">
									<h6 style="display: inline-block; width: 50%;">발주 상세 내역</h6>
									<h6 class="totalRecode" style="display: inline-block; width: 50%; text-align: right;">총  ${ordersVO.totalRecode } 건 </h6>
								</div>
								<div class="row" style="width: 50%;">
									<h6 style="display: inline-block; width: 50%;">입고 상세 내역</h6>
									<h6 style="display: inline-block; width: 50%; text-align: right;">총  ${ordersVO.totalRecode } 건</h6>
								</div>

							</div>
							<div class="dataAreaAll">
							<div class="dataArea">
								<table class="table table-hover dataTable-table" id="table1">
									<thead>
										<tr>
											<th data-sortable="" style="width: 5%;">
												순번
											</th>
											<th data-sortable="" style="width: 8%;">
												이미지
											</th >
											<th data-sortable="" style="width: 15%;" class="left">
												제품명
											</th>
											<th data-sortable="" style="width: 10%;"  class="right">
												주문수량
											</th>
<!-- 											<th data-sortable="" style="width: 10%;"  class="right"> -->
<!-- 												주문제한수량 -->
<!-- 											</th> -->
											<th data-sortable="" style="width: 10%;"  class="right">
												현재재고량
											</th>
											<th data-sortable="" style="width: 10%;"  class="right">
												공급가
											</th>
											<th data-sortable="" style="width: 10%;"  class="right">
												공급가 합계
											</th>
<!-- 											<th data-sortable="" style="width: 18%;" class="left"> -->
<!-- 												메모 -->
<!-- 											</th> -->
										</tr>
									</thead>
									<tbody id="listBody">
									<c:choose> 
                               		   		<c:when test="${not empty ordersVO.orderlistVO }">
                               		   			<c:forEach items="${ordersVO.orderlistVO }" var="list">
                               		   				<tr>
                               		   					<td>${list.rnum }</td>
                               		   					<td>
                               		   						<c:choose>
                                		   						<c:when test ="${not empty list.franInvenVO.attachfileList }">
                                		   							<img class='myImage' src="data:image/jpeg;base64,${list.franInvenVO.attachfileList[0].file_img }">
                                		   						</c:when>
                                		   						<c:otherwise>
                                		   							<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>
                                		   						</c:otherwise>
                               		   						</c:choose>
                               		   					</td>
                               		   					<td class="left">${list.franInvenVO.prod_nm }</td>
                               		   					<td class="right">${list.order_qy }</td>
<%--                                		   					<td class="right">${list.franInvenVO.head_maxcord_qy }</td> --%>
                               		   					<td class="right">${list.franInvenVO.fran_nowinven }</td>
                               		   					<td class="right">${list.prod_suply_pc }</td>
                               		   					<td class="right">${list.order_qy * list.prod_suply_pc}</td>
<!--                                		   					<td class="left"> -->
<%--                                		   						<c:if test="${list.order_qy gt list.headInvenVO.head_maxcord_qy}"> --%>
<!--                                		   							최대 주문 수량이 넘어갔습니다. -->
<%--                                		   						</c:if> --%>
<!--                                		   					</td> -->
                               		   				</tr>
                               		   			</c:forEach>
                               		   		</c:when>
                               		   		<c:otherwise>
                               		   		</c:otherwise>
                               		   </c:choose>
									</tbody>
								</table>
							</div>
						<!-- data-Area 끝 -->
							
						<div class="dataAreaLine"></div>
						
						<!-- 입고확인서 내역 -->
						<div class="dataArea mydataArea">
						<c:if test="${ordersVO.in_sttus_code == 'A0001' }">
							<div class="completeImg"><img id="completeImage" alt="" src="${cPath }/resources/images/completion/Completionstamp.png"> </div>
						</c:if>
								<table class="table table-hover dataTable-table" id="table1">
									<thead>
										<tr>
											<th data-sortable="" style="width: 5%;">
												순번
											</th>
											<th data-sortable="" style="width: 8%;">
												이미지
											</th >
											<th data-sortable="" style="width: 15%;" class="left">
												제품명
											</th>
											<th data-sortable="" style="width: 10%;"  class="right">
												주문수량
											</th>
<!-- 											<th data-sortable="" style="width: 10%;"  class="right"> -->
<!-- 												주문제한수량 -->
<!-- 											</th> -->
											<th data-sortable="" style="width: 10%;"  class="right">
												현재재고량
											</th>
											<th data-sortable="" style="width: 10%;"  class="right">
												공급가
											</th>
											<th data-sortable="" style="width: 10%;"  class="right">
												공급가 합계
											</th>
<!-- 											<th data-sortable="" style="width: 18%;" class="left"> -->
<!-- 												메모 -->
<!-- 											</th> -->
										</tr>
									</thead>
									<tbody id="listBody">
									<c:choose> 
                               		   		<c:when test="${not empty ordersVO.in_no }">
                               		   			<c:forEach items="${ordersVO.orderlistVO }" var="list">
                               		   				<tr>
                               		   					<td>${list.rnum }</td>
                               		   					<td>
                               		   						<c:choose>
                                		   						<c:when test ="${not empty list.franInvenVO.attachfileList }">
                                		   							<img class='myImage' src="data:image/jpeg;base64,${list.franInvenVO.attachfileList[0].file_img }">
                                		   						</c:when>
                                		   						<c:otherwise>
                                		   							<img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'>
                                		   						</c:otherwise>
                               		   						</c:choose>
                               		   					</td>
                               		   					<td class="left">${list.franInvenVO.prod_nm }</td>
                               		   					<td class="right">${list.order_qy }</td>
<%--                                		   					<td class="right">${list.franInvenVO.head_maxcord_qy }</td> --%>
                               		   					<td class="right">${list.franInvenVO.fran_nowinven }</td>
                               		   					<td class="right">${list.prod_suply_pc }</td>
                               		   					<td class="right">${list.order_qy * list.prod_suply_pc}</td>
<!--                                		   					<td class="left"> -->
<%--                                		   						<c:if test="${list.order_qy gt list.headInvenVO.head_maxcord_qy}"> --%>
<!--                                		   							최대 주문 수량이 넘어갔습니다. -->
<%--                                		   						</c:if> --%>
<!--                                		   					</td> -->
                               		   				</tr>
                               		   			</c:forEach>
                               		   		</c:when>
                               		   		<c:otherwise>
                               		   			<tr><th colspan="7">출고 완료가 진행되지 않았습니다.</th></tr>
                               		   		</c:otherwise>
                               		   </c:choose>
									</tbody>
								</table>
							
							
						</div>
						<!-- data-Area 끝 -->
						
						</div>
						<!-- data-AreaAll 끝 -->
						</div>
						<!-- 페이징 및 푸터 영역 -->
						<div class="dataTable-bottom">
							<div class="totalMoney"> ${ordersVO.order_suplypc_sm } </div> 
						</div>
					</c:if>
					</div>
					<!-- card-body 끝 -->
                </div>
    		<!-- card 끝 -->
    	</section>
    </div>


<form id="inComplete" action="${cPath }/fran/trade" method="post">
	<input type="hidden" name="orderNo" value="${ordersVO.order_no }">
</form>
</body>

<script type="text/javascript">
	let statusBtn = $(".statusBtn");
	let listBody = $("#listBody");
	let locale = navigator.language;
	let orderOk = $("#orderOk");
	let okBtn =  $("#okBtn");
	let orderCancle = $("#orderCancle");
	let outWirte = $("#outWirte");
	let backList = $("#backList");
	let outCom =  $("#outCom");
	
	
	statusBtn.on("click",function(){
		console.log($(this).parent().find("form").val());
	})
	
	$(function(){
		listBody.find("tr").each(function(i){

			$(this).find("td").eq(3).text(Number($(this).find("td").eq(3).text()).toLocaleString(locale));
			$(this).find("td").eq(4).text(Number($(this).find("td").eq(4).text()).toLocaleString(locale));
			$(this).find("td").eq(5).text(Number($(this).find("td").eq(5).text()).toLocaleString(locale));
			$(this).find("td").eq(6).text(Number($(this).find("td").eq(6).text()).toLocaleString(locale) + "원");
			$(this).find("td").eq(7).text(Number($(this).find("td").eq(7).text()).toLocaleString(locale) + "원");
		})
		
		let sum = $(".totalMoney").text();
		$(".totalMoney").text("총 가격 : " +Number(sum).toLocaleString(locale)+" 원" );
	})
	
	
	//목록으로 버튼 클릭 이벤트
	backList.on("click",function(){
		location.href = "${cPath }/fran/trade";
	})
	
	
	// 입고확인 버튼
	inCom = $("#inCom");
	inComplete = $("#inComplete");
	inCom.on("click", function() {
		if (confirm("입고확인을 하시겠습니까?") == true){
			inComplete.submit();
		}else{
			return false;
		}
	})
	
	$("#completeImage").on("click", function() {
		$(".completeImg").remove();
	});

</script>
