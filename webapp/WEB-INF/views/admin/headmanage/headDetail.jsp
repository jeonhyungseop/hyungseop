    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.05.27     진예은      가맹본부 상세조회
* 2021.06.03     진예은      남은구독일 계산 수정
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

    <style>
    .table-hover {
		border: 1px solid #ddd;
	}
	
	.table-hover  th{
		text-align: center;
		vertical-align: middle;
		width: 230px;
		height: 68px;
	}
	
	.payIcon{
		width: 60px;
		height: 60px;
		border-radius: 12px;
	}
	
	.table-bordered{
		height: 100px;
		text-align: center;
		vertical-align: middle;
	}
	
	.imgArea{
		width: 100px;
		border-right: 1px solid white;
		text-align: right;
	}
	
	.NameArea{
		width: 250px;
		text-align: left;
	}
	
	.fontCss{
		font-size: 30px;
		font-weight: bold;
	}

	.fontCss2{
		font-size: 30px;
		font-weight: bold;
		color: #567ecc;
	}
	
	.payArea{
		width: 400px;
	}
	
	.textArea{
		text-align: left;
	}
	
	.textArea > label{
		display: inline-block;
		font-size: 18px;
		font-weight: bold;
		margin-left: 20px;
		margin-right: 15px;
	}
	
	.textArea > input{
		width: 200px;
		display: inline;
	}
	
	.tdx{
		border-top: 0px solid white;
	}
	
	.inputm{
		margin-bottom: 10px;
	}
	
	.card-header{
		padding-bottom: 0.5rem;
		padding-top: 1.7rem;
	}
	
	.row>*{
		width: 50%;
	}
	
	.breadcrumb{
		float: right;
	}
	
	#main{
		padding-bottom: 0rem;
	}
	
	.detailCardBody{
		min-height: 550px;
	}
	
	.titleDisplay{
		display: inline-block;
	}
	
	.goList{
		float: right;
		margin-top: -8px;
	}
	
	.listSection{
		margin-top: -19px;
	}
    </style>
    
    <div id="app">
        <div id="sidebar" class="active">
            
        </div>

            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                    </div>
                </div>
				<section class="section">
					<div class="card">
					  <div class="card-header">
					<div class="row">
						<div class="rowLeft">
							<h4>가맹본부 상세조회</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">가맹본부 상세조회</li>
								</ol>
							</nav>
						</div>
                            	<c:set var="value" value="${pay.syspay_nm}"/>
					</div>
				</div>	
						  <div class="card-body">
                          <table class="table table-bordered">
							<tr>
								<td rowspan="2" class="imgArea">
								<c:choose>
									<c:when test="${fn:substring(value,0,3) eq 'BAS'}">
										<img alt="BIcon" class="payIcon" src="${cPath}/resources/images/logo/BIcon.png">
									</c:when>
									<c:when test="${fn:substring(value,0,3) eq 'STA'}">
										<img alt="BIcon" class="payIcon" src="${cPath}/resources/images/logo/StandardIcon.png">
									</c:when>
									<c:otherwise>
										<img alt="BIcon" class="payIcon" src="${cPath}/resources/images/logo/Premium.png">
									</c:otherwise>
								</c:choose>
								</td>
								<td rowspan="2" class="NameArea">
									<span class="fontCss">${pay.syspay_nm}</span>
								</td>
								<td rowspan="2" class="textArea">
									<label>가입일</label>
									<input class="form-control inputm paydate"/>
									<label>남은 구독일</label>
									<input class="form-control d_day"/>
								</td>
								<td rowspan="2" class="payArea">
									<c:if test="${pay.syspay_repay_at eq 'N'}">
										<span class="fontCss2">정기결제 사용안함</span>
									</c:if>
									<c:if test="${pay.syspay_repay_at eq 'Y'}">
										<span class="fontCss2">정기결제 신청됨</span>
									</c:if>
								</td>
							</tr>
                          </table>
						  </div>
					</div>
				</section>


                <section class="section listSection">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title titleDisplay">상세정보</h4>
                            <a type="button" class="btn btn-primary me-1 mb-1 pribtn goList" href="${cPath}/admin/headmanage">목록으로</a>
                        </div>
                        <div class="card-body detailCardBody">
                            
                            <table class="table table-hover">
                            	<tr>
                            		<th>가맹본부명</th>
                            		<td>${headmanage.head_comnm }</td>
                            		<th>주소</th>
                            		<td>
                            			(${headmanage.head_zipno }) 
                            			${headmanage.head_baadd }
                            			${headmanage.head_deadd}
                            		</td>
                            	</tr>
                            	<tr>
                            		<th>대표자명</th>
                            		<td>${headmanage.head_nm }</td>
                            		<th>담당자</th>
                            		<td>${headmanage.head_chargernm }</td>
                            	</tr>
                            	<tr>
                            		<th>사업자번호</th>
                            		<td>${headmanage.head_bizrno }</td>
                            		<th>업종구분</th>
                            		<td>	
                            			<c:set var="comCodeList" value="${headmanage.comCodeList }" />
                            			<c:forEach items="${comCodeList}" var="com">
                            				${com.com_code_nm }
                            			</c:forEach>
                            		</td>
                            	</tr>
                            	<tr>
                            		<th>전화번호</th>
                            		<td>${headmanage.head_telno }</td>
                            		<th>정기결제 여부</th>
                            		<td>${headmanage.repay_at }</td>
                            	</tr>
                            	<tr>
                            		<th>이메일</th>
                            		<td>${headmanage.head_email }</td>
                            		<th>가입일자</th>
                            		<td>${headmanage.head_srbde }</td>
                            	</tr>
                            	<tr>
                            	
                            	</tr>
                            <!-- 	<tr>
                            		<th>우편번호</th>
                            		<td></td>
                            	</tr> -->
                            	<tr>
                            		
                            	</tr>
                            	<tr>
                            	
                            	</tr>
                            	<tr>
                            		
                            	</tr>
                            	<tr>
                            		
                            	</tr>
                            	<tr>
                            		<th>탈퇴일자</th>
                            		<td>${headmanage.head_ledate }</td>
                            	</tr>
                            </table>
                        </div>
                    </div>
                </section>
            </div>
        </div>

<script>
  	$(function(){
  		
  		//남은 구독일 계산
  		let startDate = ${pay.syspay_pay_time}
  		let endDate = ${pay.syspay_end_time}
		
  		String(startDate).substring(0,1)
  		
  		var date_start = new Date(String(startDate).substring(0,4), String(startDate).substring(4,6), String(startDate).substring(6,8))
  		var date_end = new Date(String(endDate).substring(0,4), String(endDate).substring(4,6), String(endDate).substring(6,8))
  		var today = new Date();
  		
  		minus = date_end - date_start;
  		minus_current = date_end - today//오늘날짜를 구해서 남은 구독일 구하기
  		
  		day = 24*60*60*1000;
  		Month = day*30;
  		Year = Month*12;
  		
  		year = parseInt(minus/Year)
  		month = parseInt(minus/Month)
  		d_day = parseInt(minus/day)
  		d_day_current = parseInt(minus_current/day);
  		
  		$('.d_day').val(d_day_current + " day")
  		
  		
  		//가입날짜 계산
  		let paydate = ${pay.syspay_pay_time }
  		$('.paydate').val(String(paydate).substring(0,4) + "." + String(paydate).substring(4,6) + "." + String(paydate).substring(6,8));
  		
  	})
  
  
</script>