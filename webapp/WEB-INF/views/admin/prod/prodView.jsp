    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* ${date}      작성자명      최초작성
* 2021.05.25   진예은         상세보기
* Copyright (c) ${year} by DDIT All right reserved
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    	th{
    		width: 20%;
    		text-align: center;
    		height: 50px;
    	}
    </style>
<section id="multiple-column-form">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">상품상세정보</h4>
                </div>
                
                <div class="card-content">
                    <div class="card-body">
						<div class="row">
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="syspay_nm">상품명</label>
                                        <input type="text" id="syspay_nm" class="form-control" value="${adminprodVO.syspay_nm}" placeholder="" name="syspay_nm">
                                    </div>
                                </div> <span></span>
                                <br>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="syspay_month">개월 수</label>
                                        <input type="number" id="syspay_month" class="form-control" value="${adminprodVO.syspay_month}" placeholder="" name="syspay_month">
                                    </div>
                                </div><span></span>
                                <br>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="syspay_user_num">사용자 제한</label>
                                        <input type="number" id="syspay_user_num" class="form-control" value="${adminprodVO.syspay_user_num}" placeholder="" name="syspay_user_num">
                                    </div>
                                </div>
                                <span></span>
                                <br>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="syspay_pc">가격</label>
                                        <input type="number" id="syspay_pc" class="form-control" value="${adminprodVO.syspay_pc}" placeholder="" name="syspay_pc">
                                    </div>
                                </div>
                                <span></span>
                                <br>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="memo">메모</label>
                                        <textarea class="form-control" rows="5" cols="100" name="memo" id="memo-id-column">${adminprodVO.memo}</textarea>
                                    </div>
                                </div>
                                
                                <div class="col-12 d-flex justify-content-end">
                                	<a type="button" class="btn btn-primary me-1 mb-1 pribtn" href="${cPath}/admin/prod">목록으로</a>
                                    <a href="${cPath}/admin/prod/modify?what=${adminprodVO.syspay_code}" class="btn btn-primary me-1 mb-1 pribtn pribtn">수정</a>
                                    <button type="reset" class="btn btn-light-secondary me-1 mb-1">취소</button>
                                </div>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>