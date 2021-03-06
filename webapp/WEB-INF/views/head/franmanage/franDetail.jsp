<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.06.03    진유리      최초작성
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
	.card .card-header h4 {font-size: 1.0rem;font-weight: 800;}
	.card-header { padding: 1.5rem 1.5rem 0.5rem 1.5rem;}
	.card .card-body{padding : 1.5rem;}
	.myImage{ width: 30%; }
 	.col-md-3 label{font-weight: 900;}
 	.close{font-weight: 800;}
</style>
<div id="app">
	<div id="sidebar" class="active"></div>
	<div class="page-title">
		
	</div>
	<section id="multiple-column-form">
		    <div class="row match-height">
		        <div class="col-12">
		            <div class="card">
		                <div class="card-header">
		                	<div class="row">
								<div class="col-12 col-md-6 order-md-1 order-last">
									<h3>가맹점 ${fran.fran_comnm} 상세조회
			                    		<c:if test="${fran.fran_clsbizde ne null}">
			                                  <span class="close">(폐점일 : ${fran.fran_clsbizde})</span>
			                	   		</c:if>
		                	   		</h3>
								</div>
								<div class="col-12 col-md-6 order-md-2 order-first">
									<nav aria-label="breadcrumb"
										class="breadcrumb-header float-start float-lg-end">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a href="${cPath}/head/main">Dashboard</a></li>
											<li class="breadcrumb-item active" aria-current="page">가맹점상세 조회</li>
										</ol>
									</nav>
								</div>
							</div>
		                   	   <a href="${cPath}/head/franmanage" class="btn btn-primary me-1 mb-1 pribtn float-end">목록으로</a>
		                   	   <c:choose>
		                   	   		<c:when test="${fran.fran_clsbizde eq null}">
			                   	  	 	<button id="closing" type="button" class="btn btn-light-secondary me-1 mb-1 float-end" data-bs-toggle="modal" data-bs-target="#closingModal">폐점</button>
		                   	   		</c:when>
		                   	   		<c:otherwise>
			                   	  	 	<button id="restore" type="button" class="btn btn-light-secondary me-1 mb-1 float-end" data-bs-toggle="modal" data-bs-target="#restoreModal">복구</button>
		                   	   		</c:otherwise>
		                   	   </c:choose>
		                </div>
		         		<div class="card-content">
	                       <div class="card-body">
	                               <div class="form-body">
	                                   <div class="row col-12">
	                                   	    <div class="row co-md-8 col-8"> 
		                                       <div class="col-md-3">
		                                           <label>가맹점 상호</label>
		                                       </div>
		                                       <div class="col-md-3 form-group">
		                                           ${fran.fran_comnm }
		                                       </div>
		                                       <div class="col-md-3">
		                                           <label>사업자번호</label>
		                                       </div>
		                                       <div class="col-md-3 form-group" id="prod_code">
		                                           ${fran.fran_bizrno }
		                                       </div>
		                                       <div class="col-md-3">
		                                           <label>가맹점 가입일자</label>
		                                       </div>
		                                       <div class="col-md-3 form-group">
		                                           ${fran.fran_srbde }
		                                       </div>
		                                       <div class="col-md-3">
		                                           <label>가맹점 오픈일자</label>
		                                       </div>
		                                       <div class="col-md-3 form-group">
		                                           ${fran.fran_opende }
		                                       </div>
		                                       <div class="col-md-3">
		                                           <label>가맹점 상태</label>
		                                       </div>
		                                       <div class="col-md-3 form-group">
		                                           ${fran.fran_sttus_code }
		                                       </div>
		                                       <div class="col-md-3">
		                                           <label>가맹점 구분</label>
		                                       </div>
		                                       <div class="col-md-3 form-group">
		                                           ${fran.fran_se_code }
		                                       </div>
		                                       <div class="col-md-3">
		                                           <label>가맹점 아이디</label>
		                                       </div>
		                                       <div class="col-md-3 form-group">
		                                           ${fran.fran_id }
		                                       </div>
		                                       <div class="col-md-3">
		                                           <label>가맹점주명</label>
		                                       </div>
		                                       <div class="col-md-3 form-group">
		                                           ${fran.fowner_nm }
		                                       </div>
		                                       <div class="col-md-3">
		                                           <label>가맹점 전화번호</label>
		                                       </div>
		                                       <div class="col-md-3 form-group">
		                                           ${fran.fran_telno }
		                                       </div>
		                                       <div class="col-md-3">
		                                           <label>가맹점주 핸드폰번호</label>
		                                       </div>
		                                       <div class="col-md-3 form-group">
		                                           ${fran.fowner_celno }
		                                       </div>
		                                       <div class="col-md-3">
		                                           <label>가맹점 우편번호</label>
		                                       </div>
		                                       <div class="col-md-3 form-group">
		                                           ${fran.fran_zipno }
		                                       </div>
		                                       <div class="col-md-3">
		                                           <label>가맹점주  이메일</label>
		                                       </div>
		                                       <div class="col-md-3 form-group">
		                                           ${fran.fowner_email }
		                                       </div>
		                                       <div class="col-md-3">
		                                           <label>가맹점 주소</label>
		                                       </div>
		                                       <div class="col-md-9 form-group">
		                                           ${fran.fran_baadd} ${fran.fran_deadd}
		                                       </div>
		                                       <div class="col-md-3">
		                                           <label>사업자 등록증</label>
		                                       </div>
		                                       <div class="col-md-9 form-group">
			                                       <c:choose>
		                                   			<c:when test="${fran.att_fileno eq null}">
		                                   				<div class="myImageCol"><img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'></div>
		                                   			</c:when>
		                                   			<c:otherwise>
		                                   				<c:forEach items="${fran.attachfileList}" var="attach" varStatus="status">
		                                   				   <c:if test="${status.index eq 0}">
						                                       <div class="myImageCol">
						                                           <img class="myImage" alt="" src="data:image/jpeg;base64,${attach.file_img}">
						                                       </div>
					                                       </c:if>
				                                       </c:forEach>
		                                   			</c:otherwise>
			                                   	</c:choose>
		                                     </div>
		                                       <div class="col-md-3">
		                                           <label>첨부 파일</label>
		                                       </div>
		                                      <div class="col-md-9 form-group">
			                                       <c:choose>
		                                   			<c:when test="${fran.att_fileno eq null}">
		                                   				<div class="myImageCol"><img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'></div>
		                                   			</c:when>
		                                   			<c:otherwise>
		                                   				<c:forEach items="${fran.attachfileList}" var="attach" varStatus="status">
		                                   				   <c:if test="${status.index eq 1}">
						                                       <div class="myImageCol">
						                                           <img class="myImage" alt="" src="data:image/jpeg;base64,${attach.file_img}">
						                                       </div>
					                                       </c:if>
				                                       </c:forEach>
		                                   			</c:otherwise>
			                                   	</c:choose>
		                                     </div>
	                                     </div>
	                                     <div class="co-md-4 col-4">
	                                          <div id="map" style="width:100%;height:60%;"></div>
	                                   	</div>
	                                  </div>
	                                  <input type="hidden" id="lati" value="${fran.fran_lati}"/>
	                                  <input type="hidden" id="loti" value="${fran.fran_loti}"/>
									  <input type="hidden" id="franCode" value="${fran.fran_code}"/>
	                             </div>
	                       </div>
	                   </div>
		            </div>
		        </div>
		    </div>
		</section>
	</div>
	
<!--Modal default md size -->
<div class="me-1 mb-1 d-inline-block">
    <!-- Button trigger for default modal -->
  	<!--Default size Modal -->
  	<div class="modal fade text-left" id="closingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel18" aria-hidden="true">
      	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
          	<div class="modal-content">
             	 <div class="modal-body">
						<div aria-labelledby="swal2-title" aria-describedby="swal2-content" class="swal2-popup swal2-modal swal2-icon-error swal2-show" tabindex="-1" role="dialog" aria-live="assertive" aria-modal="true" style="display: flex;">
							<div class="swal2-header">
								<ul class="swal2-progress-steps" style="display: none;"></ul>
								<div class="swal2-icon swal2-error swal2-icon-show" style="display: flex;">
									<span class="swal2-x-mark"> 
										<span class="swal2-x-mark-line-left"></span> 
										<span class="swal2-x-mark-line-right"></span>
									</span>
								</div>
								<h2 class="swal2-title" id="swal2-title" style="display: flex;">정말로 폐점을<br>시키겠습니까?</h2>
								<button type="button" class="swal2-close"
									aria-label="Close this dialog" style="display: flex;" data-bs-dismiss="modal">×</button>
							</div>
							<div class="swal2-content">
								<div class="swal2-validation-message" id="swal2-validation-message"></div>
							</div>
							<div class="swal2-actions">
								<div class="swal2-loader"></div>
								<button type="button" class="swal2-confirm swal2-styled closeOk" aria-label=""
									style="display: inline-block;" >OK</button>
								<button type="button" class="swal2-cancel swal2-styled" aria-label=""
									style="display: inline-block;" data-bs-dismiss="modal">Cancel</button>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!--Modal default md size -->
<div class="me-1 mb-1 d-inline-block">
    <!-- Button trigger for default modal -->
  	<!--Default size Modal -->
  	<div class="modal fade text-left" id="restoreModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel18" aria-hidden="true">
      	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
          	<div class="modal-content">
             	 <div class="modal-body">
						<div aria-labelledby="swal2-title" aria-describedby="swal2-content" class="swal2-popup swal2-modal swal2-icon-error swal2-show" tabindex="-1" role="dialog" aria-live="assertive" aria-modal="true" style="display: flex;">
							<div class="swal2-header">
								<ul class="swal2-progress-steps" style="display: none;"></ul>
								<div class="swal2-icon swal2-error swal2-icon-show" style="display: flex;">
									<span class="swal2-x-mark"> 
										<span class="swal2-x-mark-line-left"></span> 
										<span class="swal2-x-mark-line-right"></span>
									</span>
								</div>
								<h2 class="swal2-title" id="swal2-title" style="display: flex;">복구을<br>시키겠습니까?</h2>
								<button type="button" class="swal2-close"
									aria-label="Close this dialog" style="display: flex;" data-bs-dismiss="modal">×</button>
							</div>
							<div class="swal2-content">
								<div class="swal2-validation-message" id="swal2-validation-message"></div>
							</div>
							<div class="swal2-actions">
								<div class="swal2-loader"></div>
								<button type="button" class="swal2-confirm swal2-styled restoreOk" aria-label=""
									style="display: inline-block;" >OK</button>
								<button type="button" class="swal2-cancel swal2-styled" aria-label=""
									style="display: inline-block;" data-bs-dismiss="modal">Cancel</button>
							</div>
						</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91b9c89742f31f21bd7a096c6fe38a6a"></script>
<script type="text/javascript">
var lati = $("#lati").val();
var loti = $("#loti").val();
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
   mapOption = { 
       center: new kakao.maps.LatLng(lati, loti), // 지도의 중심좌표
       level: 1 // 지도의 확대 레벨
   };

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(lati, loti); 

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
    position: markerPosition
});

// 마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

$("#closing").on("click", function(){
	$(".closeOk").on("click", function(){
		$.ajax({
	        type:"POST",
	        url: "${cPath}/head/franmanage/closing" ,
	        data : {"franCode" : $("#franCode").val()},
	        success : function(data) {
	        	var result = data.result;
	        	
	        	if(result == "OK"){
	        		location.href="${cPath}/head/franmanage";
	        		alert("폐점등록에 성공했습니다.")
	        	}else{
	        		alert("폐점등록에 실패했습니다.");
	        	}
	            
	        }
	    });
	});
});

$("#restore").on("click", function(){
	$(".restoreOk").on("click", function(){
		$.ajax({
	        type:"POST",
	        url: "${cPath}/head/franmanage/restore" ,
	        data : {"franCode" : $("#franCode").val()},
	        success : function(data) {
	        	var result = data.result;
	        	
	        	if(result == "OK"){
	        		location.href="${cPath}/head/franmanage";
	        		alert("복구에 성공했습니다.")
	        	}else{
	        		alert("복구에 실패했습니다.");
	        	}
	            
	        }
	    });
	});
})
</script>
