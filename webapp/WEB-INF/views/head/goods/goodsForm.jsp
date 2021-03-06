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
    	border-radius: 7px;
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
                <c:choose>
                <c:when test="${goodsupdate eq 'goodsupdate'}">
                 <h4 class="card-title">상품 수정</h4>
                </c:when>
                <c:otherwise>
                 <h4 class="card-title">상품 등록</h4>
                </c:otherwise>
                
                </c:choose>
                   
                </div>
                    <div class="card-body">
                    
                    
                     <div class="card-content">
                     <div class="row">
		                <div class="col-md-6 col-12 d-flex justify-content-first">
		               		<a href="${cPath }/head/goods" class="btn btn-primary me-1 mb-1 pribtn">목록으로</a>
		                </div>
	               		<div class="col-md-6 col-12 d-flex justify-content-end">
	               			<c:choose>
	               				<c:when test="${goodsupdate ne 'goodsupdate'}">
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
                        	<c:when test="${goodsupdate eq 'goodsupdate'}">
                        	
		                       
		                        <form:form modelAttribute="inven" id="updateForm" class="form" action="${cPath }/head/goods/update" method="post" enctype="multipart/form-data">
<!--                         	<input type="hidden" name="_method" value="put"> -->
                        	<c:forEach items="${headGoodsList}" var="headGoodsList" step="1" varStatus="status">
                        		<div class="row formList">
		                        	<input type="hidden" value="${headGoodsList.goods_code }" name="headGoodsListVO[${status.index}].goods_code">
		                        	<input type="hidden" value="${headGoodsList.head_code }" name="headGoodsListVO[${status.index}].head_code">
		                            <div class="row col-md-11 col-12">
		                        		<input type="hidden" name="headGoodsListVO[${status.index}].att_fileno" value="${headGoodsList.att_fileno }">
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-name">상품명</label>
		                                        <input type="text" id="prod-name" class="form-control"  name="headGoodsListVO[${status.index}].goods_nm" value="${headGoodsList.goods_nm }">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod_cl_code">상품 종류</label>
		                                        <select id="prod_cl_code" class="form-select" name="headGoodsListVO[${status.index}].goods_cl_code">
		                                        	<c:if test="${not empty gccCode }">
		                                        		<c:forEach items="${gccCode.comCodeList }" var="pcc">
		                                        			<option value="${pcc.com_code }" ${pcc.com_code == headGoodsList.goods_cl_code ? 'selected' : ''}>${pcc.com_code_nm }</option>
		                                        		</c:forEach>
		                                        	</c:if>
		                                        </select>
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-unit-qy">상품 공급가</label>
		                                        <input type="number" id="prod-unit-qy" class="form-control"  name="headGoodsListVO[${status.index}].goods_suply_pc" value="${headGoodsList.goods_suply_pc }">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-unit-code">상품 레시피</label>
		                                        <input type="text" id="prod-puchas" class="form-control" name="headGoodsListVO[${status.index}].goods_reci"value="${headGoodsList.goods_reci}" >
		                                     
		                                    </div>
		                                </div>
		                                
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-puchas">상품 등록일자</label>

		                                        <input type="date" id="prod-puchas" class="form-control" name="headGoodsListVO[${status.index}].goods_upde" value="${headGoodsList.goods_upde }">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-suply">상품 기준가격</label>
		                                        <input type="number" id="prod-suply" class="form-control" name="headGoodsListVO[${status.index}].goods_basepc" value="${headGoodsList.goods_basepc }" >
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="buyer-id-column">상품 특가 여부</label>
		                                       
		                                   		<select id="prod_use_at" class="form-select" name="headGoodsListVO[${status.index}].special_at">
		                                			<option value="Y" ${headGoodsList.special_at eq 'Y' ? 'selected' : '' }>Y</option>
		                                			<option value="N" ${headGoodsList.special_at eq 'N' ? 'selected' : '' }>N</option>
		                                		</select>
		                                    </div>
		                                </div>
		                                 <div class="col-md-3 col-12">
		                              <div class="form-group">
		                                		<label for="prod_use_at">상품 판매 여부</label>
		                                		<select id="prod_use_at" class="form-select" name="headGoodsListVO[${status.index}].sale_at" value="${headGoodsList.sale_at }">
		                                			<option value="Y" ${headGoodsList.sale_at eq 'Y' ? 'selected' : '' }>Y</option>
		                                			<option value="N" ${headGoodsList.sale_at eq 'N' ? 'selected' : '' }>N</option>
		                                		</select>
		                                	</div>
		                                	</div>
		                               <div class="col-12">
											<div class="form-group">
<!-- 												<input class="multiple-files-filepond" type="file" name="inven_files"> -->
		<!-- 										<input type="file" class="my-pond" name="inven_files"/> -->
												<input type="file" name="headGoodsListVO[0].prod_files" multiple="multiple"/>
												<c:if test="${not empty headGoodsList.attachfileList }">
													<c:forEach items="${headGoodsList.attachfileList }" var="attatch">
														<span data-delattseq="${attatch.att_seq }">
															${attatch.file_nm }
															<span class="delFileBtn btn btn-secondary">-</span>
														</span>
													</c:forEach>
												</c:if>
												<p></p>
											</div>
		                                </div>
		                            
		                              
		                             
		                               
		                                
		
		                                
		                                
		                           
		                          
		                            </div>
		                            <div class="row col-md-1 col-12">
		                            	<div class="form-group deleteXDiv">
		                               		<a class="btn btn-secandary deleteOne deleteXA">
		                               			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
												  <path d="M1.293 1.293a1 1 0 0 1 1.414 0L8 6.586l5.293-5.293a1 1 0 1 1 1.414 1.414L9.414 8l5.293 5.293a1 1 0 0 1-1.414 1.414L8 9.414l-5.293 5.293a1 1 0 0 1-1.414-1.414L6.586 8 1.293 2.707a1 1 0 0 1 0-1.414z"/>
												</svg>
		                               		</a>
		                               	</div>
		                            </div>
		                            <hr>
		                            </div>
                        	</c:forEach>
                        </form:form>
                        	</c:when>
                        	<c:otherwise>
                        	<form:form  id="insertForm" class="form" action="${cPath }/head/goods" method="post" enctype="multipart/form-data">
                        		
                        		
                        		<div class="row formList">
       						
		                        	<input type="hidden" value="${headgoodsvo.head_code }" name="headGoodsListVO[0].head_code">
		                        	<input type="hidden" value="${headgoodsvo.head_code }" name="head_code">
		                        	
		                            <div class="row col-md-11 col-12">
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-name">상품 명</label>
		                                        <input type="text" id="prod-name" class="form-control"  name="goods_nm" value="돌체 카라멜 칩 커피 프라푸치노">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod_cl_code">상품 종류</label>
		                                        <select id="prod_cl_code" class="form-select" name="goods_cl_code">
		                                        	<c:if test="${not empty gccCode }">
		                                        		<c:forEach items="${gccCode.comCodeList }" var="pcc">
		                                        			<option value="${pcc.com_code }">${pcc.com_code_nm }</option>
		                                        		</c:forEach>
		                                        	</c:if>
		                                        </select>
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-unit-qy">상품 공급가</label>
		                                        <input type="number" id="prod-unit-qy" class="form-control"  name="goods_suply_pc" value="2000">
		                                    </div>
		                                </div>		                          
		                                
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-puchas">상품 레시피</label>
		                                        <input type="text" id="prod-puchas" class="form-control" name="goods_reci"  value="모카칩 100g 물2컵 원두 3컵 우유 4컵">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="prod-suply">상품 등록일자</label>
		                                        <input type="date" id="prod-suply" class="form-control" name="goods_upde"  value="${headgoodsvo.goods_upde }">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="buyer-id-column">상품 기준가격</label>
		                                        <input type="number" id="buyer-id-column" class="form-control" name="goods_basepc" value="4000">
		                                    </div>
		                                </div>
		                                <div class="col-md-3 col-12">
		                                    <div class="form-group">
		                                        <label for="brcd-id-column">상품 특가 여부</label>
		                                        <input type="text" id="brcd-id-column" class="form-control" name="special_at" value="N">
		                                    </div>
		                                </div>
		                                <div class="col-md-2 col-12">
		                                    <div class="form-group">
		                                        <label for="maxcord-id-column">상품 판매 여부</label>
		                                        <input type="text" id="maxcord-id-column" class="form-control" name="sale_at" value="Y">
		                                    </div>
		                                </div>
		                           
		                                <div class="col-12">
											<div class="form-group">
<!-- 												<input class="multiple-files-filepond" type="file" name="headInvenListVO[0].inven_files"> -->
<!-- 												<input type="file" class="image-crop-filepond" name="headInvenListVO[0].inven_files"/> -->
<!-- 												<input type="file" class="basic-filepond" name="headInvenListVO[0].inven_files"/> -->
<!-- 												<input type="file" class="multiple-files-filepond" name="headInvenListVO[0].inven_files"/> -->
												<input type="file" name="prod_files" multiple="multiple" id="input-image"/>
											</div>
		                                </div>
		                                
		                            </div>
		                            <div class="row col-md-1 col-12">
		                            	<div class="form-group deleteXDiv">
		                               		<a class="btn btn-secandary deleteOne deleteXA">
		                               			<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-lg" viewBox="0 0 16 16">
												  <path d="M1.293 1.293a1 1 0 0 1 1.414 0L8 6.586l5.293-5.293a1 1 0 1 1 1.414 1.414L9.414 8l5.293 5.293a1 1 0 0 1-1.414 1.414L8 9.414l-5.293 5.293a1 1 0 0 1-1.414-1.414L6.586 8 1.293 2.707a1 1 0 0 1 0-1.414z"/>
												</svg>
		                               		</a>
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

function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
/* const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
}) */
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