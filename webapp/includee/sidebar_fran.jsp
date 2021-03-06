<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.5.18.  진예은            최초작성
* 2021.5.21.  진예은            메뉴구조 변경
* 2021.5.24.  진예은            메뉴고정 스크립트 추가
* 2021.6.12   진예은            메뉴 순서변경
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<tilesx:useAttribute name="fran"/>
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


<div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="${cPath}/fran/main">
								<img src="${cPath}/resources/assets/images/logo/cfmslogo_width.png" class="logo" alt="Logo" srcset="">
                            </a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <!-- 프로필 이미지 -->
                <div class="mainImg">
           		<c:choose>
				<c:when test="${not empty franImgVO.att_fileno}">
					<c:forEach items="${franImgVO.attachfileList}" var="attach"
						varStatus="status">
						<c:if test="${status.index eq 0}">
							<img class="myImage_sidebar"
								src="data:image/jpeg;base64,${attach.file_img}" alt="user">
						</c:if>
					</c:forEach>
				</c:when> 
				
				</c:choose>
				
                 </div>
	                <h6 class="font-bold mainName">${name}</h6>
                <div class="sidebar-menu">
                    <ul id="Ad" class="menu">
                        <li class="sidebar-title">Menu</li>

                        <li class="sidebar-item dash">
                            <a href="${cPath}/fran/main" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>Dashboard</span>
                            </a>
                        	
                        </li>
                       
               <!-- POS시스템 -->
            <li id='Fr23' class='sidebar-item  has-sub'>                      
		      <a href='#' class='sidebar-link'>                             
		          <svg class='svg-inline--fa fa-cash-register fa-w-16 fa-fw select-all svgicon' aria-hidden='true' focusable='false' data-prefix='fas' data-icon='cash-register' role='img' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512' data-fa-i2svg=''><path fill='currentColor' d='M511.1 378.8l-26.7-160c-2.6-15.4-15.9-26.7-31.6-26.7H208v-64h96c8.8 0 16-7.2 16-16V16c0-8.8-7.2-16-16-16H48c-8.8 0-16 7.2-16 16v96c0 8.8 7.2 16 16 16h96v64H59.1c-15.6 0-29 11.3-31.6 26.7L.8 378.7c-.6 3.5-.9 7-.9 10.5V480c0 17.7 14.3 32 32 32h448c17.7 0 32-14.3 32-32v-90.7c.1-3.5-.2-7-.8-10.5zM280 248c0-8.8 7.2-16 16-16h16c8.8 0 16 7.2 16 16v16c0 8.8-7.2 16-16 16h-16c-8.8 0-16-7.2-16-16v-16zm-32 64h16c8.8 0 16 7.2 16 16v16c0 8.8-7.2 16-16 16h-16c-8.8 0-16-7.2-16-16v-16c0-8.8 7.2-16 16-16zm-32-80c8.8 0 16 7.2 16 16v16c0 8.8-7.2 16-16 16h-16c-8.8 0-16-7.2-16-16v-16c0-8.8 7.2-16 16-16h16zM80 80V48h192v32H80zm40 200h-16c-8.8 0-16-7.2-16-16v-16c0-8.8 7.2-16 16-16h16c8.8 0 16 7.2 16 16v16c0 8.8-7.2 16-16 16zm16 64v-16c0-8.8 7.2-16 16-16h16c8.8 0 16 7.2 16 16v16c0 8.8-7.2 16-16 16h-16c-8.8 0-16-7.2-16-16zm216 112c0 4.4-3.6 8-8 8H168c-4.4 0-8-3.6-8-8v-16c0-4.4 3.6-8 8-8h176c4.4 0 8 3.6 8 8v16zm24-112c0 8.8-7.2 16-16 16h-16c-8.8 0-16-7.2-16-16v-16c0-8.8 7.2-16 16-16h16c8.8 0 16 7.2 16 16v16zm48-80c0 8.8-7.2 16-16 16h-16c-8.8 0-16-7.2-16-16v-16c0-8.8 7.2-16 16-16h16c8.8 0 16 7.2 16 16v16z'></path></svg> 
		          <span>POS시스템</span>                                     
		      </a>                                                           
		      <ul class='submenu '>                                          
		          <li id='Fr24' class='submenu-item '>                       
		              <a href='/Last_Cafe/fran/posorder'>POS시스템 시작</a> 
		          </li>                                                      
		          <li id='Fr25' class='submenu-item '>                    
		              <a href='/Last_Cafe/fran/posmenu'>POS메뉴관리</a>       
		          </li>                                                     
		      </ul>                                                         
		  </li>   
            <!-- POS시스템 끝 -->
            
            <!-- 매입/재고관리 -->
             <li id='Fr07' class="sidebar-item has-sub">                       
		     <a href='#' class='sidebar-link'>                              
		     	<svg class='svg-inline--fa fa-dolly-flatbed fa-w-20 fa-fw select-all svgicon' aria-hidden='true' focusable='false' data-prefix='fas' data-icon='dolly-flatbed' role='img' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 640 512' data-fa-i2svg=''><path fill='currentColor' d='M208 320h384c8.8 0 16-7.2 16-16V48c0-8.8-7.2-16-16-16H448v128l-48-32-48 32V32H208c-8.8 0-16 7.2-16 16v256c0 8.8 7.2 16 16 16zm416 64H128V16c0-8.8-7.2-16-16-16H16C7.2 0 0 7.2 0 16v32c0 8.8 7.2 16 16 16h48v368c0 8.8 7.2 16 16 16h82.9c-1.8 5-2.9 10.4-2.9 16 0 26.5 21.5 48 48 48s48-21.5 48-48c0-5.6-1.2-11-2.9-16H451c-1.8 5-2.9 10.4-2.9 16 0 26.5 21.5 48 48 48s48-21.5 48-48c0-5.6-1.2-11-2.9-16H624c8.8 0 16-7.2 16-16v-32c0-8.8-7.2-16-16-16z'></path></svg>
		         <span>매입/재고관리</span>                                      
		     </a>                                                           
		     <ul class='submenu '>                                          
		         <li id='Fr08' class='submenu-item '>                       
		             <a href='/Last_Cafe/fran/prod'>발주서 작성</a>   
		         </li>                                                      
		         <li id='Fr09' class='submenu-item '>                       
		             <a href='/Last_Cafe/fran/trade'>거래내역 조회</a>      
		         </li>                                                      
<!--                  <li id='Fr20' class='submenu-item '>                    
		             <a href='/Last_Cafe/fran/exchange'>교환요청 조회</a>
		         </li>                                                   
		         <li id='Fr21' class='submenu-item '>                    
		             <a href='/Last_Cafe/fran/franReturn'>반품요청 조회</a>
		         </li>    -->                                                
		         <li id='Fr22' class='submenu-item '>                    
		             <a href='/Last_Cafe/fran/inven'>재고조회</a>        
		         </li>
		       </ul>                                                        
		   </li>       
           <!-- 매입/재고관리 끝 -->         
           
           	<!-- 매출관리 -->
            <li id='Fr12' class='sidebar-item  has-sub'>                     
	       <a href='#' class='sidebar-link'>                            
	           <svg class='svg-inline--fa fa-calculator fa-w-14 fa-fw select-all svgicon' aria-hidden='true' focusable='false' data-prefix='fas' data-icon='calculator' role='img' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512' data-fa-i2svg=''><path fill='currentColor' d='M400 0H48C22.4 0 0 22.4 0 48v416c0 25.6 22.4 48 48 48h352c25.6 0 48-22.4 48-48V48c0-25.6-22.4-48-48-48zM128 435.2c0 6.4-6.4 12.8-12.8 12.8H76.8c-6.4 0-12.8-6.4-12.8-12.8v-38.4c0-6.4 6.4-12.8 12.8-12.8h38.4c6.4 0 12.8 6.4 12.8 12.8v38.4zm0-128c0 6.4-6.4 12.8-12.8 12.8H76.8c-6.4 0-12.8-6.4-12.8-12.8v-38.4c0-6.4 6.4-12.8 12.8-12.8h38.4c6.4 0 12.8 6.4 12.8 12.8v38.4zm128 128c0 6.4-6.4 12.8-12.8 12.8h-38.4c-6.4 0-12.8-6.4-12.8-12.8v-38.4c0-6.4 6.4-12.8 12.8-12.8h38.4c6.4 0 12.8 6.4 12.8 12.8v38.4zm0-128c0 6.4-6.4 12.8-12.8 12.8h-38.4c-6.4 0-12.8-6.4-12.8-12.8v-38.4c0-6.4 6.4-12.8 12.8-12.8h38.4c6.4 0 12.8 6.4 12.8 12.8v38.4zm128 128c0 6.4-6.4 12.8-12.8 12.8h-38.4c-6.4 0-12.8-6.4-12.8-12.8V268.8c0-6.4 6.4-12.8 12.8-12.8h38.4c6.4 0 12.8 6.4 12.8 12.8v166.4zm0-256c0 6.4-6.4 12.8-12.8 12.8H76.8c-6.4 0-12.8-6.4-12.8-12.8V76.8C64 70.4 70.4 64 76.8 64h294.4c6.4 0 12.8 6.4 12.8 12.8v102.4z'></path></svg>
	           <span>매출관리</span>                                      
	       </a>                                                           
	       <ul class='submenu '>                                          
	        <!--    <li id='Fr13' class='submenu-item '>                       
	               <a href='/Last_Cafe/fran/analysis'>손익분석</a>        
	           </li>                                                      
	           <li id='Fr14' class='submenu-item '>                       
	               <a href='/Last_Cafe/fran/sales'>매출리스트 관리</a>    
	           </li>   -->                                                    
	           <li id='Fr15' class='submenu-item '>                       
	               <a href='/Last_Cafe/fran/deposit'>예치금 내역조회</a>  
	           </li>                                                      
	           <li id='Fr16' class='submenu-item '>                       
	               <a href='/Last_Cafe/fran/dayreport'>일일판매레포트</a> 
	           </li>                                                      
	       </ul>                                                          
	   </li>         
         <!-- 매출관리 끝-->             
           
		 
		  <!-- 교육일정 -->
            <li id='Fr03' class="sidebar-item  has-sub">                            
		      <a href='#' class='sidebar-link'>                                   
		          <svg class='svg-inline--fa fa-calendar-check fa-w-14 fa-fw select-all svgicon' aria-hidden='true' focusable='false' data-prefix='fas' data-icon='calendar-check' role='img' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512' data-fa-i2svg=''><path fill='currentColor' d='M436 160H12c-6.627 0-12-5.373-12-12v-36c0-26.51 21.49-48 48-48h48V12c0-6.627 5.373-12 12-12h40c6.627 0 12 5.373 12 12v52h128V12c0-6.627 5.373-12 12-12h40c6.627 0 12 5.373 12 12v52h48c26.51 0 48 21.49 48 48v36c0 6.627-5.373 12-12 12zM12 192h424c6.627 0 12 5.373 12 12v260c0 26.51-21.49 48-48 48H48c-26.51 0-48-21.49-48-48V204c0-6.627 5.373-12 12-12zm333.296 95.947l-28.169-28.398c-4.667-4.705-12.265-4.736-16.97-.068L194.12 364.665l-45.98-46.352c-4.667-4.705-12.266-4.736-16.971-.068l-28.397 28.17c-4.705 4.667-4.736 12.265-.068 16.97l82.601 83.269c4.667 4.705 12.265 4.736 16.97.068l142.953-141.805c4.705-4.667 4.736-12.265.068-16.97z'></path></svg>
		          <span>교육일정</span>                                   
		      </a>                                                             
		      <ul class='submenu '>                                            
		          <li id='Fr04' class="submenu-item ">                         
		              <a href='/Last_Cafe/fran/education'>교육일정 조회</a>    
		          </li>                                                        
		      </ul>                                                            
		  </li>
		 <!-- 교육일정 끝  --> 
		 
         <!-- 가맹비 수납 -->
            <li id='Fr26' class="sidebar-item  has-sub">                            
		      <a href='#' class='sidebar-link'>   
		      	  <svg class="svg-inline--fa fa-money-check-alt fa-w-14 fa-fw select-all svgicon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="money-check-alt" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512" data-fa-i2svg=""><path fill="currentColor" d="M608 32H32C14.33 32 0 46.33 0 64v384c0 17.67 14.33 32 32 32h576c17.67 0 32-14.33 32-32V64c0-17.67-14.33-32-32-32zM176 327.88V344c0 4.42-3.58 8-8 8h-16c-4.42 0-8-3.58-8-8v-16.29c-11.29-.58-22.27-4.52-31.37-11.35-3.9-2.93-4.1-8.77-.57-12.14l11.75-11.21c2.77-2.64 6.89-2.76 10.13-.73 3.87 2.42 8.26 3.72 12.82 3.72h28.11c6.5 0 11.8-5.92 11.8-13.19 0-5.95-3.61-11.19-8.77-12.73l-45-13.5c-18.59-5.58-31.58-23.42-31.58-43.39 0-24.52 19.05-44.44 42.67-45.07V152c0-4.42 3.58-8 8-8h16c4.42 0 8 3.58 8 8v16.29c11.29.58 22.27 4.51 31.37 11.35 3.9 2.93 4.1 8.77.57 12.14l-11.75 11.21c-2.77 2.64-6.89 2.76-10.13.73-3.87-2.43-8.26-3.72-12.82-3.72h-28.11c-6.5 0-11.8 5.92-11.8 13.19 0 5.95 3.61 11.19 8.77 12.73l45 13.5c18.59 5.58 31.58 23.42 31.58 43.39 0 24.53-19.05 44.44-42.67 45.07zM416 312c0 4.42-3.58 8-8 8H296c-4.42 0-8-3.58-8-8v-16c0-4.42 3.58-8 8-8h112c4.42 0 8 3.58 8 8v16zm160 0c0 4.42-3.58 8-8 8h-80c-4.42 0-8-3.58-8-8v-16c0-4.42 3.58-8 8-8h80c4.42 0 8 3.58 8 8v16zm0-96c0 4.42-3.58 8-8 8H296c-4.42 0-8-3.58-8-8v-16c0-4.42 3.58-8 8-8h272c4.42 0 8 3.58 8 8v16z"></path></svg>                                
		          <span>가맹비 수납</span>                                   
		      </a>                                                             
		      <ul class='submenu '>                                            
		          <li id='Fr27' class="submenu-item ">                         
		              <a href='/Last_Cafe/fran/bill'>가맹비 수납 </a>    
		          </li>                                                        
		      </ul>                                                            
		  </li>
		 <!-- 가맹비 수납 끝  --> 
                        
		  <li id='Fr01' class="sidebar-item  has-sub"> 
		      <a href='#' class='sidebar-link'> 
		          <svg class='svg-inline--fa fa-bell fa-w-14 fa-fw select-all svgicon' aria-hidden='true' focusable='false' data-prefix='fas' data-icon='bell' role='img' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 448 512' data-fa-i2svg=''><path fill='currentColor' d='M224 512c35.32 0 63.97-28.65 63.97-64H160.03c0 35.35 28.65 64 63.97 64zm215.39-149.71c-19.32-20.76-55.47-51.99-55.47-154.29 0-77.7-54.48-139.9-127.94-155.16V32c0-17.67-14.32-32-31.98-32s-31.98 14.33-31.98 32v20.84C118.56 68.1 64.08 130.3 64.08 208c0 102.3-36.15 133.53-55.47 154.29-6 6.45-8.66 14.16-8.61 21.71.11 16.4 12.98 32 32.1 32h383.8c19.12 0 32-15.6 32.1-32 .05-7.55-2.61-15.27-8.61-21.71z'></path></svg>
		          <span>공지사항</span>                                           
		      </a>                                                                
		      <ul class='submenu '>                                               
		          <li id='Fr02' class="submenu-item ">                            
		              <a href='/Last_Cafe/fran/notice'>공지사항 조회</a>          
		          </li>                                                           
		      </ul>                                                               
		  </li>                                                                   
		                                                                
		  <li id='Fr05' class="sidebar-item  has-sub">                         
		      <a href='#' class='sidebar-link'>                                
		          <svg class='svg-inline--fa fa-question-circle fa-w-16 fa-fw select-all svgicon' aria-hidden='true' focusable='false' data-prefix='fas' data-icon='question-circle' role='img' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512' data-fa-i2svg=''><path fill='currentColor' d='M504 256c0 136.997-111.043 248-248 248S8 392.997 8 256C8 119.083 119.043 8 256 8s248 111.083 248 248zM262.655 90c-54.497 0-89.255 22.957-116.549 63.758-3.536 5.286-2.353 12.415 2.715 16.258l34.699 26.31c5.205 3.947 12.621 3.008 16.665-2.122 17.864-22.658 30.113-35.797 57.303-35.797 20.429 0 45.698 13.148 45.698 32.958 0 14.976-12.363 22.667-32.534 33.976C247.128 238.528 216 254.941 216 296v4c0 6.627 5.373 12 12 12h56c6.627 0 12-5.373 12-12v-1.333c0-28.462 83.186-29.647 83.186-106.667 0-58.002-60.165-102-116.531-102zM256 338c-25.365 0-46 20.635-46 46 0 25.364 20.635 46 46 46s46-20.636 46-46c0-25.365-20.635-46-46-46z'></path></svg>
		          <span>문의사항</span>                                     
		      </a>                                                          
		      <ul class='submenu '>                                         
		          <li id='Fr06' class="submenu-item ">                      
		              <a href='/Last_Cafe/fran/question'>문의사항 조회</a>  
		          </li>                                                     
		      </ul>                                                         
		 </li>                                                              
		                                                           
		                                                              
<!-- 		    <li id='Fr17' class='sidebar-item  has-sub'>                      
		        <a href='#' class='sidebar-link'>                             
		            <svg class='svg-inline--fa fa-splotch fa-w-16 fa-fw select-all svgicon' aria-hidden='true' focusable='false' data-prefix='fas' data-icon='splotch' role='img' xmlns='http://www.w3.org/2000/svg' viewBox='0 0 512 512' data-fa-i2svg=''><path fill='currentColor' d='M472.29 195.89l-67.06-22.95c-19.28-6.6-33.54-20.92-38.14-38.3L351.1 74.19c-11.58-43.77-76.57-57.13-109.98-22.62l-46.14 47.67c-13.26 13.71-33.54 20.93-54.2 19.31l-71.88-5.62c-52.05-4.07-86.93 44.88-59.03 82.83l38.54 52.42c11.08 15.07 12.82 33.86 4.64 50.24L24.62 355.4c-20.59 41.25 22.84 84.87 73.49 73.81l69.96-15.28c20.11-4.39 41.45 0 57.07 11.73l54.32 40.83c39.32 29.56 101.04 7.57 104.45-37.22l4.7-61.86c1.35-17.79 12.8-33.86 30.63-42.99l62-31.74c44.88-22.96 39.59-80.17-8.95-96.79z'></path></svg>
		            <span>이벤트</span>                                       
		        </a>                                                          
		        <ul class='submenu '>                                         
		            <li id='Fr18' class='submenu-item '>                      
		                <a href='/Last_Cafe/fran/event'>이벤트 조회</a>       
		            </li>                                                     
		        </ul>                                                         
		    </li>    -->                                                          
                                                            
		  

					</ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
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
			$("#main").removeClass('ml300');
	    	$("#main").addClass('ml0');
		 
		});
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
		
		if(currentPath == '/Last_Cafe/fran/main'){
			$('.dash').addClass('active');
		}
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