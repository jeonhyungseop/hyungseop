<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 20. 진예은          최초작성
* 2021. 6.  6. 배수진          전체적인 화면수정
* Copyright (c) 2021 by DDIT All right reserved
 --%>
 <%@page import="com.sun.xml.internal.bind.CycleRecoverable.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<link rel="stylesheet" href="${cPath}/resources/assets/searchCSS.css">    
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${cPath}/resources/assets/vendors/dripicons/webfont.css">

<style>
.stsBtn {
	display : inline-block;
	width : 23%;
	background-color: #826767;
	color :#fff;
	border-radius: 2px;
	text-align: center;
} 


#table1 th { 
 	text-align : center; 
 } 

.date {
	width : 47%;
	border : 1px solid #dce7f1;
	border-radius: 0.25rem;
	padding : 0.375rem;
	color : #607080;
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
.tableSetting {
	display: flex;;
	justify-content: space-between;
}

/* th:nth-of-type(2) { display: none; }   
td:nth-of-type(2) { display: none; } */
.seq {display: none;}


</style>

    
<body>
    <div id="app">
    	<section class="section">
    	
    		<!-- card 영역 -->
    		<div class="card">
    		
    			<!-- card-header 영역 -->
				<div class="card-header">
					<div class="row">
						<div class="rowLeft">
							<h4>문의사항</h4>
						</div>
						<div class="rowRight">
							<nav aria-label="breadcrumb" >
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="${cPath }/head/main">Dashboard</a></li>
									<li class="breadcrumb-item active" aria-current="page">문의사항</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>	
				<!-- card-header 끝 -->
				
				<!-- card-body 영역 -->
					<div class="card-body">
						<!-- 검색 영역 -->
						<form>
							<div class="btnArea">
							<input class="btn btn-primary float-end pribtn" id="searchBtn" type="button" value="검색" />
							
								<c:url value="/fran/question/form" var="insertURL">			
								</c:url>
									<a href="${insertURL}"class="btn btn-primary float-end pribtn">글쓰기</a>
								
								<button type="reset" class="resetBtn icon dripicons-clockwise float-end"></button>
							</div>
							<div id="searchUI">	
							<table class="table table-borderd">						
								<tbody class="talbeSearchArea">						
									<tr>								
										<th class="searchTh"  style="width:10%;">등록일자</th>
										<td style="width: 23.3%;" colspan="3">
											
												<input class="inputText mr-2 date" type="date" name="minDate" value="${pagingVO.searchMap.minDate }" placeholder="시작 검색 일"/> 
												-
												<input class="inputText mr-2 date" type="date" name="maxDate" value="${pagingVO.searchMap.maxDate }" placeholder="종료 검색 일"/>
										</td>
										<th class="searchTh"  style="width: 10%;">카테고리</th>
										<td style="width: 23.3%;">
											<select name="searchType" class="form-select" >
												<option value="">전체</option>
												<c:if test="${not empty orsCode }">
	                                        		<c:forEach items="${orsCode.comCodeList }" var="qcc">
	                                        			<option value="${qcc.com_code }">${qcc.com_code_nm }</option>
	                                        		</c:forEach>
	                                        	</c:if>
                                        	</select>
										</td>
										<th class="searchTh"  style="width: 10%;">답변여부</th>
										<td style="width: 23.3%;">
											<select id="searchAnswer" name="searchAnswer" class="form-select"  >
												<option value="">전체</option>
												<c:if test="${not empty oscCode }">
	                                        		<c:forEach items="${oscCode.comCodeList }" var="qcc">
	                                        			<option value="${qcc.com_code }">${qcc.com_code_nm }</option>
	                                        		</c:forEach>
	                                        	</c:if>
                                        	</select>
										</td>
												
									</tr>								      
								</tbody>
							</table>
							</div>
						</form>
						
						
						<!-- 조회 영역 -->
						<div class="dataTable-container">
						
							
							<div class="dataArea" id="selectArea">
							<div class="card-body">
								<table class="table table-hover dataTable-table" id="table1">
									<thead>
										<tr>
											<th data-sortable="" style="width: 14.2215%;"><a
												href="#" class="dataTable-sorter">글번호</a></th>
												<th class="seq" data-sortable="" style="width:14.2215%;"><a
												href="#" class="dataTable-sorter">일련번호</a></th>
													<th data-sortable="" style="width: 14.2215%;"><a
												href="#" class="dataTable-sorter">카테고리</a></th>
											<th data-sortable="" style="width: 14.2215%;"><a href="#"
												class="dataTable-sorter">제목</a></th>									
											<th data-sortable="" style="width: 14.2215%;"><a
												href="#" class="dataTable-sorter">작성날짜</a></th>
										<!-- 	<th data-sortable="" style="width: 14.2215%;"><a
												href="#" class="dataTable-sorter">답변여부</a></th> -->
													<th data-sortable="" style="width:14.2215%;"><a
												href="#" class="dataTable-sorter">답변여부</a></th>
												

										</tr>
									</thead>
									<tbody id="listBody">
									
										<c:choose>
											<c:when test="${not empty pagingVO.dataList }">
												<c:forEach items="${pagingVO.dataList }" var="question">
													<tr>
													<td>${question.rnum}</td>
														<td class="seq">${question.ques_seq}</td>
															
														
														<td>${question.ques_cl_code}</td>
														
														<td>				
															${question.ques_title }</td>													
														<td>${question.ques_dt }</td>
														<%-- <td>${question.ques_sttus_code }</td> --%>
														
														<c:if test="${dataList.ques_sttus_code eq '답변완료'}">
					

														<c:url value="/fran/question/answerList" var="viewURL">
																<c:param name="what" value="${question.ques_seq}" />
															</c:url>
														<td><a href="${viewURL}" class="btn btn-outline-danger rounded-pill" >답변완료</a>
														</td>
														</c:if>
														<td><a href="#" class="btn btn-outline-secondary rounded-pill">답변준비중</a></td>												
													</tr>
												</c:forEach>
											</c:when>
											<c:otherwise>
												<tr>
													<td colspan="6">조건에 맞는 게시글이 없음.</td>
												</tr>
											</c:otherwise>
										</c:choose>
									
									</tbody>
								</table>
								</div>
							</div>
						</div>
						<!-- data-Area 끝 -->
						
						<!-- 페이징 및 푸터 영역 -->
						<div class="dataTable-bottom">
							<div class="dataTable-info">Showing ${pagingVO.startPage } to <span id="totalPage"></span> of <span id="currentPage"></span> entries</div>
							
						</div>
						<div id="pagingArea" class="d-flex justify-content-center">
							${pagingVO.pagingHTMLBS }
						</div>
						
						
					</div>
					<!-- card-body 끝 -->
					
    		</div>
    		<!-- card 끝 -->
    		
    	</section>
    </div>
    
        
        <!-- 검색 폼 -->
	    <form id="searchForm" action="${cPath }/fran/question" >
	        <input type="hidden" name="searchType" value="${pagingVO.searchMap.searchType }" />
	        <input type="hidden" name="searchAnswer" value="" />
	        <input type="hidden" name="searchWord" value="${pagingVO.searchMap.searchWord }" />
	        <input type="hidden" name="page" value="1"/>
	        <input type="hidden" name="minDate" value="${pagingVO.searchMap.minDate }"/>
			<input type="hidden" name="maxDate" value="${pagingVO.searchMap.maxDate }"/>
			<input type="hidden" name="screenSize" value=""/>
			<input type="hidden" name="orsCode" value=""/>
			<input type="hidden" name="oscCode" value=""/>
			<input type="hidden" name="istCode" value=""/>
	    </form>
	     
	    
	    <!-- 스크립트 -->
	    <script type="text/javascript">
		    let listBody = $("#listBody");
	        let pagingArea = $("#pagingArea");
	        let currentPage = $("#currentPage");
	        let locale = navigator.language;
	        let searchForm = $("#searchForm");
	        let totalPage = $("#totalPage");
	        let excelDownBtn = $("#excelDownBtn");
	        let screenSize = $("#screenSize");
	        let totalRecode = $(".totalRecode");
	        
	     /*    //검색
	    	function fn_search(obj){
	    		let name = obj.getAttribute('name');
	    		searchForm.find("input[name="+name+"]").val(obj.value);
	    		searchForm.submit()
	    	}; */
	  
	    	let searchUI = $("#searchUI");
	/*     	searchUI.find("[name='searchType']").val("${pagingVO.searchMap.searchType }"); */
	    
	     	$("#searchBtn").on("click", function(){
	    		let inputs = searchUI.find(":input[name]");
	    		$(inputs).each(function(idx, input){
	    			let name = $(this).attr("name");
	    			console.log(name)
	    			let sameInput = searchForm.find("[name='"+name+"']");
	    			$(sameInput).val($(this).val());
	    		});
	    		searchForm.submit();
	    	});
	     	
	  
	        
	    	//페이지 클릭 이벤트
		    pagingArea = $("#pagingArea").on("click", "a", function(event){
	    		event.preventDefault();
	    		let page = $(this).data("page");
	    		if(page){
	    			searchForm.find("[name='page']").val(page);
	    			searchForm.submit();
	    		}
	    		return false;
	    	});
	    	
		
	    	
	   
	        
		   //페이징 처리
	       searchForm = $("#searchForm").ajaxForm({
	            dataType: "json",
	            beforeSubmit: function() {
	                searchForm.find("[name='page']").val("");
	            },
	            success: function(resp) {
	                listBody.empty();
	                pagingArea.empty();
	                currentPage.empty();	
	                totalPage.empty();
	                totalRecode.empty();
	                let trTags = [];
	                let asn = "답변준비중"
	                let asn2 = "답변완료"
	                let answer
	            	
	                if(resp.dataList) {
	                    $(resp.dataList).each(function(idx, datalist) { 
	                     	
	                    	
	                    		viewURLPtrn ="${cPath}/fran/question/answerList?what=%d";
	                    	
	                    	
	                    	 viewURL = viewURLPtrn.replace("%d", datalist.ques_seq);
	                    	
	                    	if(datalist.ques_sttus_code=="답변완료"){
	                    		answer= $("<a class='btn btn-outline-danger rounded-pill'>").html(datalist.ques_sttus_code).attr("href",viewURL)
// 	                    		$(".ama").html(answer);
	                    		
	                    		console.log(answer)
                        	}else{
                        		answer=$("<a class='btn btn-outline-secondary rounded-pill'>").html(asn)
                        	} 
	    					
	                    	
	                    	
	                    
	                   	
	                    	
	                    
							
	                        let tr = $("<tr>").append(
	                        	$("<td>").addClass("center").html(datalist.rnum),
	                        	$("<td class='seq'>").addClass("center").html(datalist.ques_seq),
	                        	
	                        	
	                        
	                        	$("<td>").addClass("center").html(datalist.ques_cl_code),
	                        	$("<td>").addClass("center").html(datalist.ques_title),
	                        	$("<td>").addClass("center").html(datalist.ques_dt),
	                        
	                        	$("<td>").addClass("center").html(answer)
	                        	
	                        	
	                        ).css("cursor", "pointer");
	                        trTags.push(tr);
	                    });
	                } else {
	                    trTags.push(
	                        $("<tr>").html(
	                            $("<td>").attr("colspan", "8").html("조건에 맞는 내역이 없음")
	                        )
	                    );
	                }
	                listBody.html(trTags);
	                totalRecode.html("총 " + resp.totalRecord + " 건");
	                currentPage.html(resp.currentPage);
	                pagingArea.html(resp.pagingHTMLBS);
	                totalPage.html(resp.totalPage);
	            },
	            error: function(xhr, resp, error) {
	            }
	        });
	       searchForm.submit();
	       
  		   $(listBody).on("click",'tr',function(){
	        	let ques_seq = $(this).find('td:eq(1)').text();
	        	location.href ="${cPath }/fran/question/detail?what="+ ques_seq;
	        	
	        
	        	
	        }) 
	    
	       
	       // 한번에 보여주는 리스트 수  
	       $("#screenSize").on("change", function(){
	        	searchForm.find("input[name='screenSize']").val($(this).val());
	        	searchForm.submit();
	    	});
	       
		   
		
	        
	    
		   
	     
	       
	       
	    </script>
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    
	    