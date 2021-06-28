<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 25. 진예은       최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<body>
<script type="text/javascript" src="${cPath }/resources/js/ckeditor/ckeditor.js"></script>
<section id="multiple-column-form">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                <c:choose>
                	<c:when test="${not empty prod.syspay_nm}">
                    	<h4 class="card-title">상품 수정</h4>
                	</c:when>
                	<c:otherwise>
                    	<h4 class="card-title">상품 등록</h4>
                   	</c:otherwise>
                </c:choose>
                </div>
                <div class="card-content">
                    <div class="card-body">
 	                	<c:choose>
	 	                	<c:when test="${not empty prod.syspay_nm}">
	                	       <form class="form" method="post" data-action="${cPath}/admin/prod/modify">
                	     	   <input type="hidden" name="_method" value="put"/>
		                	</c:when>
		                	<c:otherwise>
		                    	<form class="form" method="post">
		                   	</c:otherwise>
 	                   	</c:choose>
 	                   	
	 	                       	<input type="hidden" name="syspay_code"  value="${prod.syspay_code }"/>
                            <div class="row">
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="syspay_nm">상품명</label>
                                        <input type="text" id="syspay_nm" class="form-control" value="${prod.syspay_nm}" placeholder="" name="syspay_nm">
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="syspay_month">개월 수</label>
                                        <input type="number" id="syspay_month" class="form-control" value="${prod.syspay_month}" placeholder="" name="syspay_month">
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="syspay_user_num">사용자 제한</label>
                                        <input type="number" id="syspay_user_num" class="form-control" value="${prod.syspay_user_num}" placeholder="" name="syspay_user_num">
                                    </div>
                                </div>
                                <div class="col-md-6 col-12">
                                    <div class="form-group">
                                        <label for="syspay_pc">가격</label>
                                        <input type="number" id="syspay_pc" class="form-control" value="${prod.syspay_pc}" placeholder="" name="syspay_pc">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="memo">메모</label>
                                        <textarea class="form-control" rows="5" cols="100" name="memo" id="memo-id-column"></textarea>
                                    </div>
                                </div>
                                
                                <div class="col-12 d-flex justify-content-end">
                                	<a type="button" class="btn btn-primary me-1 mb-1 pribtn" href="${cPath}/admin/prod">목록으로</a>
                                    <button type="submit" class="btn btn-primary me-1 mb-1 pribtn">등록</button>
                                    <button type="reset" class="btn btn-light-secondary me-1 mb-1">취소</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript">
CKEDITOR.replace("memo-id-column", {
	filebrowserImageUploadUrl : '${cPath}/board/boardImage.do?type=Images'
});
</script>
</body>