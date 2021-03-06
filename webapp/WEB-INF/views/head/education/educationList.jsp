<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 6. 14. 진유리          캘린더 UI,조회
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">    
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">
<style>
.dataArea {height: 550px;}
#calendar { max-width: 1100px;margin: 0 auto;}
.bg-modal{background-color: #826767!important;}
.modal-title{color : #ffffff;}
.btn-modify{background-color: #F2913D;color : #ffffff;}
.btn-delete{background-color: #D96E30;color : #ffffff;}
/* .franList{ */
/* 	margin-bottom: 3% */
/* } */
/* .fran_content{ */
/* 	background: #ba9797; */
/* 	color: #ffffff; */
/* 	margin: 0% 1%; */
/* } */
</style>
<div id="app">
    <section class="section">
    	<!-- card 영역 -->
   		<div class="card">
   			<!-- card-header 영역 -->
			<div class="card-header">
				<div class="row">
					<div class="rowLeft">
						<h4>교육일정 관리</h4>
					</div>
					<div class="rowRight">
						<nav aria-label="breadcrumb" >
							<ol class="breadcrumb">
								<li class="breadcrumb-item"><a href="${cPath}/head/main">Dashboard</a></li>
								<li class="breadcrumb-item active" aria-current="page">교육일정 관리</li>
							</ol>
						</nav>
					</div>
				</div>
			</div>	
			<!-- card-header 끝 -->
			<!-- card-body 영역 -->
			<div class="card-body">
				<div id='calendar'></div>
			</div>
			<!-- card-body 끝 -->
        </div>
   		<!-- card 끝 -->
   	</section>
</div>

<!-- 교육 일정 상세 정보 Modal -->
<div class="modal fade text-left" id="eventDetail" tabindex="-1" role="dialog"
    aria-labelledby="myModalLabel4" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-modal">
                <h4 class="modal-title" id="eventDetailTitle"></h4>
            </div>
            <div class="modal-body">
                <div id="detailContent">
                	<div class="form-body">
                       <div class="row col-12">
                            <div class="col-md-3">
                                <label>교육 분류</label>
                            </div>
                            <div class="col-md-9 form-group edu_place"></div>
                            <div class="col-md-3">
                                <label>담당 직원명</label>
                            </div>
                            <div class="col-md-9 form-group emp_name"></div>
                            <div class="col-md-3">
                                <label>담당 직원 이메일</label>
                            </div>
                            <div class="col-md-9 form-group emp_email"></div>
                            <div class="col-md-3">
                                <label>교육 시작 일시</label>
                            </div>
                            <div class="col-md-9 form-group edu_start"></div>
                            <div class="col-md-3">
                                <label>교육 종료 일시</label>
                            </div>
                            <div class="col-md-9 form-group edu_cl"></div>
                            <div class="col-md-3">
                                <label>교육 장소</label>
                            </div>
                            <div class="col-md-9 form-group edu_end"></div>
                             <div class="col-md-3">
                                <label>교육 내용</label>
                            </div>
                            <div class="col-md-9 form-group edu_content"></div>
                            <input type="hidden" id="detail_emp_id" />
                            <input type="hidden" id="login_id" value="${authId}"/>
                            <input type="hidden" id="exist" value="${emp.emp_id}"/>
                      	 </div>
	                </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-modify">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">수정</span>
                </button>
                <button type="button" class="btn btn-delete">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">삭제</span>
                </button>
                <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">닫기</span>
                </button>
            </div>
        </div>
    </div>
</div>
<!-- 교육 일정 상세 정보 Modal End-->

<!-- 교육 일정 등록 Model -->
<div class="modal fade text-left" id="RegisterModal" tabindex="-1" role="dialog" 
    aria-labelledby="myModalLabel33" aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-modal">
                <h4 class="modal-title" id="myModalLabel33">교육일정 등록</h4>
            </div>
            <form:form modelAttribute="education" class="form form-horizontal" action="#" id="registerForm" method="post">
                <div class="modal-body">
                	<div class="form-body">
	                    <div class="row">
	                        <div class="col-md-3">
	                            <label>교육 명</label>
	                        </div>
	                        <div class="col-md-9 form-group">
	                            <input type="text" class="form-control" id="edc_nm" name="edc_nm" value="${education.edc_nm}"/>
	                        </div>
	                        <div class="col-md-3">
	                            <label>교육 분류</label>
	                        </div>
	                        <div class="col-md-9 form-group">
	                            <select class="choices form-select choices__input" id="edc_cl_code" name="edc_cl_code">
									<option value="">전체</option>
                                       <c:if test="${not empty EccCode}">
	                                       	<c:forEach items="${EccCode.comCodeList}" var="ecc">
	                                       		<option value="${ecc.com_code}" <c:if test="${ecc.com_code eq education.edc_cl_code}">selected</c:if>>${ecc.com_code_nm}</option>
	                                       	</c:forEach>
                                       </c:if>
                                </select>
	                        </div>
	                        <div class="col-md-3">
	                            <label>교육 시작일시</label>
	                        </div>
	                        <div class="col-md-9 form-group">
	                            <input type="datetime-local"  class="form-control" id="start_date" value="${education.edc_start_time}"/>
	                            <input type="hidden" id="edc_start_time" name="edc_start_time"/>
	                        </div>
	                        <div class="col-md-3">
	                            <label>교육 종료일시</label>
	                        </div>
	                        <div class="col-md-9 form-group">
	                            <input type="datetime-local" class="form-control" id="end_date" value="${education.edc_end_time}"/>
	                            <input type="hidden" id="edc_end_time" name="edc_end_time"/>
	                        </div>
	                        <div class="col-md-3">
	                            <label>담당 직원</label>
	                        </div>
	                        <div class="col-md-9 form-group">
		                        <c:choose>
	                           		<c:when test="${empList ne null}">
	                           			<select class="choices form-select choices__input" id="emp_id" name="emp_id">
	                           				<option value="">담당 직원을 선택하세요.</option>
	                           				<c:forEach items="${empList}" var="emp">
	                           					<option value="${emp.emp_id}" <c:if test="${emp.emp_id eq education.emp_id}">selected</c:if>>
	                           						${emp.emp_nm}(${emp.deptList[0].dept_nm} ${emp.emp_clsf_code})
	                           					</option>
	                           				</c:forEach>
	                           			</select>
		                           </c:when>
		                           <c:otherwise>
		                           		<p>${emp.emp_nm}(${emp.deptList[0].dept_nm} ${emp.emp_clsf_code})</p>
		                           </c:otherwise>
		                         </c:choose>
	                        </div>
<!-- 	                        <div class="col-md-3"> -->
<!-- 	                            <label>가맹점 목록</label> -->
<!-- 	                        </div> -->
<!-- 	                        <div class="col-md-9 form-group"> -->
<%-- 	                            <c:if test="${not empty franList}"> --%>
<!-- 	                            	<select class="choices form-select choices__input fran"> -->
<%-- 		                            	<c:forEach items="${franList}" var="fran"> --%>
<%-- 		                            		<option value="${fran.fran_code}">${fran.fran_comnm}</option> --%>
<%-- 		                            	</c:forEach> --%>
<!-- 	                            	</select> -->
<%-- 	                            </c:if> --%>
<!-- 	                        </div> -->
	                         <div class="col-md-12 franList">
	                        </div>
	                        <div class="col-md-3">
	                            <label>교육 장소</label>
	                        </div>
	                        <div class="col-md-9 form-group">
	                            <input type="text" class="form-control" id="edc_place" name="edc_place" value="${education.edc_place}"/>
	                        </div>
	                        <div class="col-md-12">
	                            <label>교육 내용</label>
	                        </div>
	                        <div class="col-md-12 form-group">
	                            <textarea  class="form-control" id="edc_cn" rows="5" cols="100">${education.edc_cn}</textarea>
	                        </div>
	               		</div>	
	               	</div>
               	</div>
            </form:form>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary ml-1 registerBtn">
                    <i class="bx bx-check d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">저장</span>
                </button>
                <button type="button" class="btn btn-light-secondary CloseBtn" data-bs-dismiss="modal">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">닫기</span>
                </button>
            </div>
        </div>
    </div>
</div>

<!-- 교육 일정 수정 Model -->
<div class="modal fade text-left" id="ModifyModal" tabindex="-1" role="dialog" 
    aria-labelledby="myModalLabel33" aria-hidden="true" data-bs-backdrop="static">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header bg-modal">
                <h4 class="modal-title" id="myModalLabel33">교육일정 수정</h4>
            </div>
            <form:form modelAttribute="edu" class="form form-horizontal" action="#" id="ModifyForm" method="post">
                <div class="modal-body">
                	<div class="form-body">
	                    <div class="row">
	                        <div class="col-md-3">
	                            <label>교육 명</label>
	                        </div>
	                        <div class="col-md-9 form-group">
	                            <input type="text" class="form-control" id="modify_edc_nm" value="${edu.edc_nm}"/>
	                        </div>
	                        <div class="col-md-3">
	                            <label>교육 분류</label>
	                        </div>
	                        <div class="col-md-9 form-group">
	                            <select class="choices form-select choices__input" id="modify_edc_cl_code">
									<option value="">전체</option>
                                       <c:if test="${not empty EccCode}">
	                                       	<c:forEach items="${EccCode.comCodeList}" var="ecc">
	                                       		<option value="${ecc.com_code}" <c:if test="${ecc.com_code eq edu.edc_cl_code}">selected</c:if>>${ecc.com_code_nm}</option>
	                                       	</c:forEach>
                                       </c:if>
                                </select>
	                        </div>
	                        <div class="col-md-3">
	                            <label>교육 시작일시</label>
	                        </div>
	                        <div class="col-md-9 form-group">
	                            <input type="datetime-local"  class="form-control" id="modify_start_date" value="${edu.edc_start_time}"/>
	                            <input type="hidden" id="modify_edc_start_time"/>
	                        </div>
	                        <div class="col-md-3">
	                            <label>교육 종료일시</label>
	                        </div>
	                        <div class="col-md-9 form-group">
	                            <input type="datetime-local" class="form-control" id="modify_end_date" value="${edu.edc_end_time}"/>
	                            <input type="hidden" id="modify_edc_end_time"/>
	                        </div>
	                        <div class="col-md-3">
	                            <label>담당 직원</label>
	                        </div>
	                        <div class="col-md-9 form-group">
	                           <c:choose>
	                           		<c:when test="${empList ne null}">
	                           			<select class="choices form-select choices__input" id="modify_emp_id">
	                           				<option value="">담당 직원을 선택하세요.</option>
	                           				<c:forEach items="${empList}" var="emp">
	                           					<option value="${emp.emp_id}" <c:if test="${emp.emp_id eq edu.emp_id}">selected</c:if>>
	                           						${emp.emp_nm}(${emp.deptList[0].dept_nm} ${emp.emp_clsf_code})
	                           					</option>
	                           				</c:forEach>
	                           			</select>
		                           </c:when>
		                           <c:otherwise>
		                           		<p>${emp.emp_nm}(${emp.deptList[0].dept_nm} ${emp.emp_clsf_code})</p>
		                           		<input type="hidden" id="modify_emp_id" value="${emp.emp_id }"/>
		                           </c:otherwise>
		                         </c:choose>
	                        </div>
	                        <div class="col-md-3">
	                            <label>교육 장소</label>
	                        </div>
	                        <div class="col-md-9 form-group">
	                            <input type="text" class="form-control" id="modify_edc_place" value="${edu.edc_place}"/>
	                        </div>
	                        <div class="col-md-12">
	                            <label>교육 내용</label>
	                        </div>
	                        <div class="col-md-12 form-group">
	                            <textarea  class="form-control" id="modify_edc_cn" rows="5" cols="100">${edu.edc_cn}</textarea>
	                        </div>
	                        <input type="hidden" id="modify_code"/>
	                        <input type="hidden" name="_method" value="put"/>
	               		</div>	
	               	</div>
               	</div>
               	<span ></span>
            </form:form>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary ml-1 ModifyBtn">
                    <i class="bx bx-check d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">저장</span>
                </button>
                <button type="button" class="btn btn-light-secondary ModifyCloseBtn" data-bs-dismiss="modal">
                    <i class="bx bx-x d-block d-sm-none"></i>
                    <span class="d-none d-sm-block">닫기</span>
                </button>
            </div>
        </div>
    </div>
</div>
<!-- 교육 일정 수정 Model End-->
<link href='${cPath}/resources/fullcalendar5.7/lib/main.css' rel='stylesheet' />
<script src='${cPath}/resources/fullcalendar5.7/lib/main.js'></script>
<script src='${cPath}/resources/fullcalendar5.7/lib/locales-all.js'></script>
<script src='${cPath}/resources/js/ckeditor/ckeditor.js'></script>
<script type="text/javascript" src="${cPath}/resources/js/moment.js"></script>
<script type="text/javascript" src="${cPath}/resources/sweetalert2/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="${cPath}/resources/js/education/education.js"></script>  