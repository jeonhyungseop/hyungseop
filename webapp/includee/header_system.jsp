<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.5.18.  진예은            최초작성
* 2021.5.19.  진예은            dropdown 수정
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
body{
    animation: fadein 1000ms ease-out;
    -moz-animation: fadein 1000ms ease-out; /* Firefox */
    -webkit-animation: fadein 1000ms ease-out; /* Safari and  Chrome */
    -o-animation: fadein 1000ms ease-out; /* Opera */
}
@keyframes fadein {
    from {opacity:0;}
    to {opacity:1;}
}
@-moz-keyframes fadein { /* Firefox */
    from {opacity:0;}
    to {opacity:1;}
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {opacity:0;}
    to {opacity:1;}
}
@-o-keyframes fadein { /* Opera */
    from {opacity:0;}
    to {opacity: 1;}
}

#loading {
            width: 100%;
            height: 100%;
            top: 0px;
            left: 0px;
            position: fixed;
            display: block;
            opacity: 1;
            background-color: #fff;
            z-index: 99;
            text-align: center;
        }

#loading-image {
     position: absolute;
     top: 50%;
     left: 50%;
     z-index: 100;
 }
hr {
	margin-top : 0.2rem;
	margin-bottom : 0.2rem;
}
.noticeicon {
	margin-top: 0px;
}
.dropdown-menu.show{
	margin: -17px !important;
}
</style>    
<header class="mb-2">
        <!-- 프로필 메뉴 -->
        <div class="navbar-collapse collapse" id="navbarSupportedContent">
<!--         <a href="#" class="burger-btn d-block d-xl-none" id="burgerIcon"> -->
<!--             <i class="bi bi-justify fs-3"></i> -->
<!--         </a> -->
            <!-- ============================================================== -->
            <!-- toggle and nav items -->
            <!-- ============================================================== -->
            <ul class="navbar-nav float-left mr-auto ml-3 pl-1">
                <!-- Notification -->
                <li class="nav-item dropdown">
                    <div class="customize-input"  style="display: flex; align-items: center; justify-content: space-between;">
                    
                    <!--  알림 dropdown -->
                    	<div class="btn-group dropdown me-1 mb-1 noticeicon" >
                    		<a href="#" class="burger-btn d-block d-xl-none" id="burgerIcon">
					            <i class="bi bi-justify fs-3"></i>
					        </a>
		                    <a type="button" class="dropdown-toggle dropdown-toggle-split noticeicon" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-reference="parent" style="margin-top: 4px;">
		                      <span>
                    			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell svg-icon noticeicon">
                    				<path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                    			</svg>
                  			  </span>
		                 	</a>
		                 	<div class="dropdown-menu protoggle">
                                 <a class="dropdown-item" href="#">
                                 	<span class="btn btn-success text-white rounded-circle btn-circle leftnotice noticeimg">
                                 		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar text-white"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line>
                                 		</svg>
                                 	</span>
                                 	&nbsp;&nbsp;
                                 	
                                       <h6 class="message-title mb-0 mt-1 leftnotice">교육일정</h6>
                                       <span class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                           a reminder that you have event</span>
                                 </a>
                                 <div class="dropdown-divider"></div>
                                 <a class="dropdown-item" href="#">
                                 	<span class="btn btn-info rounded-circle btn-circle leftnotice noticeimg">
                                 		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings text-white"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path>
                                 		</svg>
                                 	</span>
                                 	&nbsp;&nbsp;
                                 	<h6 class="message-title mb-0 mt-1 leftnotice">점검일정</h6>
                                       <span class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                           a reminder that you have event</span>
                                 </a>
                                 <div class="dropdown-divider"></div>
                                 <a class="dropdown-item" href="#">
                                 	<span class="btn btn-danger rounded-circle btn-circle leftnotice noticeimg">
                                 		<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-airplay text-white"><path d="M5 17H4a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v10a2 2 0 0 1-2 2h-1"></path><polygon points="12 15 17 21 7 21 12 15"></polygon>
                                 		</svg>
                                 	</span>
                                 	&nbsp;&nbsp;
                                 	<h6 class="message-title mb-0 mt-1 leftnotice">이벤트 일정</h6>
                                       <span class="font-12 text-nowrap d-block text-muted text-truncate">Just
                                           a reminder that you have event</span>
                                 </a>
                             </div>
                         <div>
                   			<h4 id="HeaderClock">00:99</h4>
                   		</div>
	                 	</div>
                    
                    
                    
                    	<!--  프로필 dropdown -->
                    	<div class="btn-group dropdown me-1 mb-1 imgfloat" >
		                    <a type="button" class="dropdown-toggle dropdown-toggle-split imgfloat" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" data-reference="parent">
		                      <img src="${cPath}/resources/assets/images/users/profile-pic.jpg" alt="user" class="rounded-circle" width="32">
		                      <span class="ml-2 d-none d-lg-inline-block"><span>Hello,</span> <span class="text-dark">${name}</span> 
		                      </span>
		                 	</a>
		                 	<div class="dropdown-menu protoggle" style="top:80%">
                                 <a class="dropdown-item" href="#">Option 3</a>
                                 <div class="dropdown-divider"></div>
                                 <a class="dropdown-item" href="${cPath}/logout">
                                 	<svg class="svg-inline--fa fa-sign-out-alt fa-w-16 fa-fw select-all svgicon" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="sign-out-alt" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M497 273L329 441c-15 15-41 4.5-41-17v-96H152c-13.3 0-24-10.7-24-24v-96c0-13.3 10.7-24 24-24h136V88c0-21.4 25.9-32 41-17l168 168c9.3 9.4 9.3 24.6 0 34zM192 436v-40c0-6.6-5.4-12-12-12H96c-17.7 0-32-14.3-32-32V160c0-17.7 14.3-32 32-32h84c6.6 0 12-5.4 12-12V76c0-6.6-5.4-12-12-12H96c-53 0-96 43-96 96v192c0 53 43 96 96 96h84c6.6 0 12-5.4 12-12z"></path></svg>
                                 	&nbsp;로그아웃
                                 </a>
                             </div>
	                 	</div>
	                 	
                     </div>
                </li>
            </ul>
          <hr >
        </div>
        <div id="loading"><img id="loading-image" src="${cPath }/resources/assets/images/1474.gif" alt="Loading..." /></div>
        <!-- //프로필 메뉴 -->
 </header>
 