    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 25. 이진수          최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css" rel="stylesheet">

<style>
	.mybiplusbtn{
		float : right;
	    width: 2.5rem;
    	height: 2.5rem;
    	margin-right: 10px;
	} 
	.mybiminusbtn{
		float : right;
	    width: 2.5rem;
    	height: 2.5rem;
    	margin-right: 10px;
	}
	.deleteXDiv{
		background-color: #ddd;
    	border-radius: 4px;
    	display: flex;
    	justify-content: center;
	}
	.deleteXA{
	    line-height: 1500%;
	    margin: 0;
	    margin-left: 5px;
	    padding: 0;
	}
</style>
<body>
<section id="multiple-column-form">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">재고 등록</h4>
                </div>
                    <div class="card-body">
                     <div class="card-content">
                     <div class="row">
		                <div class="col-md-6 col-12 d-flex justify-content-first">
		               		<a href="${cPath }/head/inven" class="btn btn-primary me-1 mb-1 pribtn">목록으로</a>
		                </div>
	               		<div class="col-md-6 col-12 d-flex justify-content-end">
	               			<c:choose>
	               				<c:when test="${update ne 'update'}">
	               					<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square-fill text-primary mybiplusbtn" viewBox="0 0 16 16">
				                	<a id="plusBtn" class="btn">
									  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm6.5 4.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3a.5.5 0 0 1 1 0z"/>
								    </a>
									</svg>
				               		<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-dash-square-fill text-secondary mybiminusbtn" viewBox="0 0 16 16">
									<a id="minusBtn" class="btn">
									  <path d="M2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2zm2.5 7.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1 0-1z"/>
									</a>
									</svg>
									<button id="insert" type="button" class="btn btn-primary me-1 mb-1 pribtn">저장</button>
	               				</c:when>
	               				<c:otherwise>
									<button id="update" type="button" class="btn btn-primary me-1 mb-1 pribtn">저장</button>
	               				</c:otherwise>
	               			</c:choose>
						</div>
					</div>
	                	<hr>
                        
                        <c:choose>
                        	<c:when test="${update eq 'update'}">
		                        <form:form modelAttribute="inven" id="updateForm" class="form" action="${cPath }/head/inven/update" method="post" enctype="multipart/form-data">
<!--                         	<input type="hidden" name="_method" value="put"> -->
                        	<c:forEach items="${headInvenList}" var="invenList" step="1" varStatus="status">
                        		<div class="row formList">
		                        	<input type="hidden" value="${invenList.prod_code }" name="headInvenListVO[${status.index}].prod_code">
		                        	<input type="hidden" value="${invenList.head_code }" name="headInvenListVO[${status.index}].head_code">
		                            <div class="row col-12">
		                        		<input type="hidden" name="headInvenListVO[${status.index}].att_fileno" value="${invenList.att_fileno }">
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-name">제품 명</label>
		                                        <input type="text" id="prod-name" class="form-control"  name="headInvenListVO[${status.index}].prod_nm" value="${invenList.prod_nm }">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod_cl_code">제품 분류</label>
		                                        <select id="prod_cl_code" class="form-select" name="headInvenListVO[${status.index}].prod_cl_code">
		                                        	<c:if test="${not empty pccCode }">
		                                        		<c:forEach items="${pccCode.comCodeList }" var="pcc">
		                                        			<option value="${pcc.com_code }" ${pcc.com_code == invenList.prod_cl_code ? 'selected' : ''}>${pcc.com_code_nm }</option>
		                                        		</c:forEach>
		                                        	</c:if>
		                                        </select>
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-unit-qy">제품 단위 수량</label>
		                                        <input type="number" id="prod-unit-qy" class="form-control"  name="headInvenListVO[${status.index}].prod_unit_qy" value="${invenList.prod_unit_qy }">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-unit-code">제품 단위</label>
		                                        <select id="prod-unit-code" class="form-select" name="headInvenListVO[${status.index}].prod_unit_code">
		                                        	<c:if test="${not empty pucCode }">
		                                        		<c:forEach items="${pucCode.comCodeList }" var="puc">
		                                        			<option value="${puc.com_code }" ${puc.com_code == invenList.prod_unit_code ? 'selected' : ''}>${puc.com_code_nm }</option>
		                                        		</c:forEach>
		                                        	</c:if>
		                                        </select>
		                                    </div>
		                                </div>
		                                
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-puchas">제품 매입가</label>
		                                        <input type="number" id="prod-puchas" class="form-control" name="headInvenListVO[${status.index}].prod_puchas_pc" value="${invenList.prod_puchas_pc }">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-suply">제품 공급가</label>
		                                        <input type="number" id="prod-suply" class="form-control" name="headInvenListVO[${status.index}].prod_suply_pc" value="${invenList.prod_suply_pc }" >
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="buyer-id-column">제품 제조사명</label>
		                                        <input type="text" id="buyer-id-column" class="form-control" name="headInvenListVO[${status.index}].prod_mafanm" value="${invenList.prod_mafanm }">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="maxcord-id-column">바코드</label>
		                                        <input type="text" id="maxcord-id-column" class="form-control" name="headInvenListVO[${status.index}].prod_brcd" value="${invenList.prod_brcd }">
		                                    </div>
		                                </div>
		                                <div class="col-md-2 col-12">
		                                    <div class="form-group">
		                                        <label for="maxcord-id-column">최대주문 수량</label>
		                                        <input type="number" id="maxcord-id-column" class="form-control" name="headInvenListVO[${status.index}].head_maxcord_qy" value="${invenList.head_maxcord_qy }">
		                                    </div>
		                                </div>
		                                <div class="col-md-2 col-12">
		                                    <div class="form-group">
		                                        <label for="proinven-id-column">적정재고</label>
		                                        <input type="text" id="proinven-id-column" class="form-control" name="headInvenListVO[${status.index}].head_proinven" value="${invenList.head_proinven }">
		                                    </div>
		                                </div>
		                                <div class="col-md-2 col-12">
		                                    <div class="form-group">
		                                        <label for="nowinven-id-column">현재재고</label>
		                                        <input type="text" id="nowinven-id-column" class="form-control" name="headInvenListVO[${status.index}].head_nowinven" value="${invenList.head_nowinven }">
		                                    </div>
		                                </div>
		                                <div class="col-md-1 col-12">
		                                	<div class="form-group">
		                                		<label for="prod_use_at">사용여부</label>
		                                		<select id="prod_use_at" class="form-select" name="headInvenListVO[${status.index}].prod_use_at">
		                                			<option value="Y" ${invenList.prod_use_at eq 'Y' ? 'selected' : '' }>Y</option>
		                                			<option value="N" ${invenList.prod_use_at eq 'N' ? 'selected' : '' }>N</option>
		                                		</select>
		                                	</div>
		                                </div>
		                                <div class="col-md-6 col-12">
		                                    <div class="form-group">
		                                        <label for="memo-id-column">메모</label>
		                                        <input type="text" class="form-control" name="headInvenListVO[${status.index}].prod_memo" id="memo-id-column" value="${invenList.prod_memo }"></input>
		                                    </div>
		                                </div>
		                                <div class="col-md-11 col-12">
											<div class="form-group">
<!-- 												<input class="multiple-files-filepond" type="file" name="inven_files"> -->
		<!-- 										<input type="file" class="my-pond" name="inven_files"/> -->
												<input type="file" name="headInvenListVO[0].inven_files" class="form-control" multiple="multiple"/>
												<c:if test="${not empty invenList.attachfileList }">
													<c:forEach items="${invenList.attachfileList }" var="attatch">
														<span data-delattseq="${attatch.att_seq }">
															${attatch.file_nm }
															<span class="delFileBtn btn btn-secondary">-</span>
														</span>
													</c:forEach>
												</c:if>
												<p></p>
											</div>
		                                </div>
		                                <div class="col-md-1 col-12">
		                            	<div class="form-group deleteXDiv">
		                               		<a class="btn btn-secandary deleteOne">
		                               			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
												  <path d="M1.293 1.293a1 1 0 0 1 1.414 0L8 6.586l5.293-5.293a1 1 0 1 1 1.414 1.414L9.414 8l5.293 5.293a1 1 0 0 1-1.414 1.414L8 9.414l-5.293 5.293a1 1 0 0 1-1.414-1.414L6.586 8 1.293 2.707a1 1 0 0 1 0-1.414z"/>
												</svg>
		                               		</a>
		                               	</div>
		                            </div>
		                            </div>
		                            
		                            <hr>
		                            </div>
                        	</c:forEach>
                        </form:form>
                        	</c:when>
                        	<c:otherwise>
                        	<form:form modelAttribute="inven" id="insertForm" class="form" action="${cPath }/head/inven" method="post" enctype="multipart/form-data">
                        		<div class="row formList">
		                        	<input type="hidden" value="${head.head_code }" name="headInvenListVO[0].head_code">
		                            <div class="row col-12">
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-name">제품 명</label>
		                                        <input type="text" id="prod-name" class="form-control"  name="headInvenListVO[0].prod_nm">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod_cl_code">제품 분류</label>
		                                        <select id="prod_cl_code" class="form-select" name="headInvenListVO[0].prod_cl_code">
		                                        	<c:if test="${not empty pccCode }">
		                                        		<c:forEach items="${pccCode.comCodeList }" var="pcc">
		                                        			<option value="${pcc.com_code }">${pcc.com_code_nm }</option>
		                                        		</c:forEach>
		                                        	</c:if>
		                                        </select>
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-unit-qy">제품 단위 수량</label>
		                                        <input type="number" id="prod-unit-qy" class="form-control"  name="headInvenListVO[0].prod_unit_qy" value="1">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-unit-code">제품 단위</label>
		                                        <select id="prod-unit-code" class="form-select" name="headInvenListVO[0].prod_unit_code">
		                                        	<c:if test="${not empty pucCode }">
		                                        		<c:forEach items="${pucCode.comCodeList }" var="puc">
		                                        			<option value="${puc.com_code }">${puc.com_code_nm }</option>
		                                        		</c:forEach>
		                                        	</c:if>
		                                        </select>
		                                    </div>
		                                </div>
		                                
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-puchas">제품 매입가</label>
		                                        <input type="number" id="prod-puchas" class="form-control" name="headInvenListVO[0].prod_puchas_pc" value="100">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-suply">제품 공급가</label>
		                                        <input type="number" id="prod-suply" class="form-control" name="headInvenListVO[0].prod_suply_pc" value="250">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="buyer-id-column">제품 제조사명</label>
		                                        <input type="text" id="buyer-id-column" class="form-control" name="headInvenListVO[0].prod_mafanm" value="카페인한가득">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="brcd-id-column">바코드</label>
		                                        <input type="text" id="brcd-id-column" class="form-control" name="headInvenListVO[0].prod_brcd" value="123456789">
		                                    </div>
		                                </div>
		                                <div class="col-md-2 col-12">
		                                    <div class="form-group">
		                                        <label for="maxcord-id-column">최대주문 수량</label>
		                                        <input type="number" id="maxcord-id-column" class="form-control" name="headInvenListVO[0].head_maxcord_qy" value="100">
		                                    </div>
		                                </div>
		                                <div class="col-md-2 col-12">
		                                    <div class="form-group">
		                                        <label for="proinven-id-column">적정재고</label>
		                                        <input type="text" id="proinven-id-column" class="form-control" name="headInvenListVO[0].head_proinven" value="5000">
		                                    </div>
		                                </div>
		                                <div class="col-md-2 col-12">
		                                    <div class="form-group">
		                                        <label for="nowinven-id-column">현재재고</label>
		                                        <input type="text" id="nowinven-id-column" class="form-control" name="headInvenListVO[0].head_nowinven" value="2500">
		                                    </div>
		                                </div>
		                                <div class="col-md-6 col-12">
		                                    <div class="form-group">
		                                        <label for="memo-id-column">메모</label>
		                                        <input type="text" class="form-control" name="headInvenListVO[0].prod_memo" id="memo-id-column" value="메에에에에에모"></input>
		                                    </div>
		                                </div>
		                                <div class="col-md-11 col-12">
											<div class="form-group">
<!-- 												<input class="multiple-files-filepond" type="file" name="headInvenListVO[0].inven_files"> -->
<!-- 												<input type="file" class="image-crop-filepond" name="headInvenListVO[0].inven_files"/> -->
<!-- 												<input type="file" class="basic-filepond" name="headInvenListVO[0].inven_files"/> -->
<!-- 												<input type="file" class="multiple-files-filepond" name="headInvenListVO[0].inven_files"/> -->
												<input type="file" name="headInvenListVO[0].inven_files" class="form-control" multiple="multiple"/>
											</div>
		                                </div>
		                                <div class="col-md-1 col-12">
		                            	<div class="form-group deleteXDiv">
		                               		<a class="btn btn-secandary deleteOne">
		                               			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
												  <path d="M1.293 1.293a1 1 0 0 1 1.414 0L8 6.586l5.293-5.293a1 1 0 1 1 1.414 1.414L9.414 8l5.293 5.293a1 1 0 0 1-1.414 1.414L8 9.414l-5.293 5.293a1 1 0 0 1-1.414-1.414L6.586 8 1.293 2.707a1 1 0 0 1 0-1.414z"/>
												</svg>
		                               		</a>
		                               	</div>
		                            </div>
		                            </div>
		                            
		                            <hr>
		                            </div>
                        </form:form>
                        	</c:otherwise>
                        </c:choose>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




<script type="text/javascript">
	$(".delFileBtn").on("click", function() {
		let fileSpan = $(this).parents("span:first");
		let inputName = $(this).parents("span:first").siblings("input").attr("name");
		let name = inputName.split(".");
		let delAttSeq = fileSpan.data("delattseq");
// 		let newInput = $("<input>").attr({
// 							"type":"text"
// 							, "name":"delAttNos"
// 						}).val("dsa");
		let newInput = "<input type='text' name = '"+name[0]+".delAttSeq' value='"+delAttSeq+"'>";
		$(this).append(newInput);
		fileSpan.hide();
		
	});
	$("#insert").on("click", function() {
		console.log($("#insertForm"));
		$("#insertForm").submit();
	});
	$("#update").on("click", function() {
		$("#updateForm").submit();
	});
	let cardContent = $(".card-content")
	var formList = $("#insertForm").html();
	var count = 0;
	$("#plusBtn").on("click", function() {
		count+=1;
		console.log(count)
		$("#insertForm").append(formList);
		var num = $("#insertForm").children(".formList").length-1;
		var names = null;
		$("#insertForm").children(".formList:eq("+num+")").find(":input").each(function() {
			let names = $(this).attr("name").replace(0, count);
			$(this).attr("name", names);
		})
	});
	
	$("#minusBtn").on("click", function() {
		$(".formList:last").remove();
	});
	
	$(".row").on("click", ".deleteXDiv", function() {
		$(this).parents(".formList").remove();
	});
	
// 	$(".deleteXDiv").on("click", function() {
// 		console.log($(this))
// 		console.log($(this).parents(".formList"))
// 		$(this).parents(".formList").remove();
// 	});

// 	function delRow(obj) {
// 		console.log(obj)
// 		console.log(this.parents(".formList"))
// 		console.log(obj.parents(".formList"))
// 	}
	 $("from-group").on("click", ".image-crop-filepond", function() {
    		console.log($(this).prop("name"))
    	});
	 $("input[type=file]").on("change",function(){
		 console.log($(this));
	 })
	 
</script>


<!-- include jQuery library -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.js"></script>

<!-- include FilePond library -->
<script src="https://unpkg.com/filepond/dist/filepond.min.js"></script>

<!-- include FilePond plugins -->
<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.js"></script>

<!-- include FilePond jQuery adapter -->
<script src="https://unpkg.com/jquery-filepond/filepond.jquery.js"></script>

<script>
  $(function(){
	  
// 	  const inputElement = document.querySelector('input[type="file"]');
// 	  const pond = FilePond.create( inputElement );
// 	    // attributes have been set to pond options
// 	    console.log("name : " + pond.name);  // 'filepond'
// 	    console.log("maxFiles : " + pond.maxFiles); // 10
// 	    console.log("required : " + pond.required); // true
//   	$("input[name='"+pond.name+"']").attr("type",'file')

    // First register any plugins
    $.fn.filepond.registerPlugin(FilePondPluginImagePreview);

    // Turn input element into a pond
    $('.image-crop-filepond').filepond();

    // Set allowMultiple property to true
    $('.image-crop-filepond').filepond('allowMultiple', true);
  
    // Listen for addfile event
    $('.image-crop-filepond').on('FilePond:addfile', function(e) {
        console.log('file added event', e);
    console.log(pond)
    console.log(pond.getFile)
    console.log(pond.name);
    pond.name.val(pond.getFile)
		$(pond.name).val(pond.getFile)
		console.log(pond.element)
	    pondFiles = pond.getFiles;
	    console.log(pondFiles)
	    console.log(pond.getFileEncodeDataURL)
	    console.log(e.getFileEncodeDataURL)
	    let name = pond.name
	    console.log($(this).find(":input[type='file']"))
	    $(this).find(":input[type='file']").attr("name", name);
	    $(this).find(":input[type='file']").val(pond.getFiles);
	    console.log(pond.name)
    });
	
    
    
    // Manually add a file using the addfile method
//     $('.image-crop-filepond').first().filepond('addFile', 'index.html').then(function(file){
//       console.log('file added', file);
//     });
  
  });
</script>

<!-- filepond validation -->
<script src="https://unpkg.com/filepond-plugin-file-validate-size/dist/filepond-plugin-file-validate-size.js"></script>
<script src="https://unpkg.com/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.js"></script>

<!-- image editor -->
<script src="https://unpkg.com/filepond-plugin-image-exif-orientation/dist/filepond-plugin-image-exif-orientation.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-crop/dist/filepond-plugin-image-crop.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-filter/dist/filepond-plugin-image-filter.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.js"></script>
<script src="https://unpkg.com/filepond-plugin-image-resize/dist/filepond-plugin-image-resize.js"></script>

<!-- toastify -->
<script src="${cPath }/resources/assets/vendors/toastify/toastify.js"></script>
<!-- filepond -->
<script src="https://unpkg.com/filepond/dist/filepond.js"></script>
<script>
    // register desired plugins...
	FilePond.registerPlugin(
        // validates the size of the file...
        FilePondPluginFileValidateSize,
        // validates the file type...
        FilePondPluginFileValidateType,

        // calculates & dds cropping info based on the input image dimensions and the set crop ratio...
        FilePondPluginImageCrop,
        // preview the image file type...
        FilePondPluginImagePreview,
        // filter the image file
        FilePondPluginImageFilter,
        // corrects mobile image orientation...
        FilePondPluginImageExifOrientation,
        // calculates & adds resize information...
        FilePondPluginImageResize,
    );
    
    // Filepond: Basic
    FilePond.create( document.querySelector('.basic-filepond'), { 
        allowImagePreview: false,
        allowMultiple: false,
        allowFileEncode: false,
        required: false
    });

    // Filepond: Multiple Files
    FilePond.create( document.querySelector('.multiple-files-filepond'), { 
        allowImagePreview: false,
        allowMultiple: true,
        allowFileEncode: false,
        required: false
    });

    // Filepond: With Validation
    FilePond.create( document.querySelector('.with-validation-filepond'), { 
        allowImagePreview: false,
        allowMultiple: true,
        allowFileEncode: false,
        required: true,
        acceptedFileTypes: ['image/png'],
        fileValidateTypeDetectType: (source, type) => new Promise((resolve, reject) => {
            // Do custom type detection here and return with promise
            resolve(type);
        })
    });

    // Filepond: ImgBB with server property
    FilePond.create( document.querySelector('.imgbb-filepond'), { 
        allowImagePreview: false, 
        server: {
            process: (fieldName, file, metadata, load, error, progress, abort) => {
                // We ignore the metadata property and only send the file

                const formData = new FormData();
                formData.append(fieldName, file, file.name);

                const request = new XMLHttpRequest();
                // you can change it by your client api key
                request.open('POST', 'https://api.imgbb.com/1/upload?key=762894e2014f83c023b233b2f10395e2');

                request.upload.onprogress = (e) => {
                    progress(e.lengthComputable, e.loaded, e.total);
                };

                request.onload = function() {
                    if (request.status >= 200 && request.status < 300) {
                        load(request.responseText);
                    }
                    else {
                        error('oh no');
                    }
                };

                request.onreadystatechange = function() {
                    if (this.readyState == 4) {
                        if(this.status == 200) {
                            let response = JSON.parse(this.responseText);
                            
                            Toastify({
                                text: "Success uploading to imgbb! see console f12",
                                duration: 3000,
                                close:true,
                                gravity:"bottom",
                                position: "right",
                                backgroundColor: "#4fbe87",
                            }).showToast();
                
                            console.log(response);
                        } else {
                            Toastify({
                                text: "Failed uploading to imgbb! see console f12",
                                duration: 3000,
                                close:true,
                                gravity:"bottom",
                                position: "right",
                                backgroundColor: "#ff0000",
                            }).showToast();   

                            console.log("Error", this.statusText);
                        }
                    }
                };

                request.send(formData);
            }
        }
    });
    
    

    // Filepond: Image Preview
    FilePond.create( document.querySelector('.image-preview-filepond'), { 
        allowImagePreview: true, 
        allowImageFilter: false,
        allowImageExifOrientation: false,
        allowImageCrop: false,
        acceptedFileTypes: ['image/png','image/jpg','image/jpeg'],
        fileValidateTypeDetectType: (source, type) => new Promise((resolve, reject) => {
            // Do custom type detection here and return with promise
            resolve(type);
        })
    });

    // Filepond: Image Crop
    const pond = FilePond.create( document.querySelector('.image-crop-filepond'), { 
        allowImagePreview: true, 
        allowImageFilter: false,
        allowImageExifOrientation: false,
        allowImageCrop: true,
        acceptedFileTypes: ['image/png','image/jpg','image/jpeg'],
        fileValidateTypeDetectType: (source, type) => new Promise((resolve, reject) => {
            // Do custom type detection here and return with promise
            resolve(type);
        })
       
    });
    
        // Filepond: Image Exif Orientation
    FilePond.create( document.querySelector('.image-exif-filepond'), { 
        allowImagePreview: true, 
        allowImageFilter: false,
        allowImageExifOrientation: true,
        allowImageCrop: false,
        acceptedFileTypes: ['image/png','image/jpg','image/jpeg'],
        fileValidateTypeDetectType: (source, type) => new Promise((resolve, reject) => {
            // Do custom type detection here and return with promise
            resolve(type);
        })
        
    });

    // Filepond: Image Filter
    FilePond.create( document.querySelector('.image-filter-filepond'), {
        allowImagePreview: true, 
        allowImageFilter: true,
        allowImageExifOrientation: false,
        allowImageCrop: false,
        imageFilterColorMatrix: [
            0.299, 0.587, 0.114, 0, 0,
            0.299, 0.587, 0.114, 0, 0,
            0.299, 0.587, 0.114, 0, 0,
            0.000, 0.000, 0.000, 1, 0
        ],
        acceptedFileTypes: ['image/png','image/jpg','image/jpeg'],
        fileValidateTypeDetectType: (source, type) => new Promise((resolve, reject) => {
            // Do custom type detection here and return with promise
            resolve(type);
        })
    });

    // Filepond: Image Resize
    FilePond.create( document.querySelector('.image-resize-filepond'), {
        allowImagePreview: true, 
        allowImageFilter: false,
        allowImageExifOrientation: false,
        allowImageCrop: false,
        allowImageResize: true,
        imageResizeTargetWidth: 200,
        imageResizeTargetHeight: 200,
        imageResizeMode: 'cover',
        imageResizeUpscale: true,
        acceptedFileTypes: ['image/png','image/jpg','image/jpeg'],
        fileValidateTypeDetectType: (source, type) => new Promise((resolve, reject) => {
            // Do custom type detection here and return with promise
            resolve(type);
        })
    });
    FilePond.setOptions({
        server: '${cPath }/head/inven'
    });
</script>
</body>