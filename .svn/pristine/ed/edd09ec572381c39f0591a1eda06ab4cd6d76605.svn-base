    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 31. 이진수          최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="https://unpkg.com/filepond/dist/filepond.css" rel="stylesheet">
<link href="https://unpkg.com/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.css" rel="stylesheet">
<<style>
	.myImage{
		width: 40px;
		height: 40px;
	}
</style>
<body>
<section id="multiple-column-form">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">적정 재고 수정</h4>
                </div>
                    <div class="card-body">
                     <div class="card-content">
                     <div class="row">
		                <div class="col-md-6 col-12 d-flex justify-content-first">
		               		<a href="${cPath }/fran/inven" class="btn btn-primary me-1 mb-1 pribtn">목록으로</a>
		                </div>
	               		<div class="col-md-6 col-12 d-flex justify-content-end">
							<button id="update" type="button" class="btn btn-primary me-1 mb-1 pribtn">저장</button>
						</div>
					</div>
	                	<hr>
                        <form:form modelAttribute="inven" id="updateForm" class="form" action="${cPath }/fran/inven" method="post" enctype="multipart/form-data">
							<div class="dataTable-container">
								<table class="table table-hover dataTable-table" id="table1">
									<thead>
										<tr>
											<th data-sortable="" style="width: 10.8215%;">
												<a href="#" class="dataTable">사진</a>
											</th>
											<th data-sortable="" style="width: 30.8215%;">
												<a href="#" class="dataTable">제품명</a>
											</th>
											<th data-sortable="" style="width: 15.737%;">
												<a href="#" class="dataTable">현재재고</a>
											</th>
											<th data-sortable="" style="width: 15.737%;">
												<a href="#" class="dataTable">적정재고</a>
											</th>
											<th data-sortable="" style="width: 15.8179%;">
												<a href="#" class="dataTable">제품공급가</a>
											</th>
											<th data-sortable="" style="width: 10.8179%;">
												<a href="#" class="dataTable">제품 단위</a>
											</th>
										</tr>
									</thead>
									<tbody id="listBody">
									<c:choose>
										<c:when test="${not empty franInvenList }">
										<input type="hidden" name="_method" value="put">
											<c:forEach items="${franInvenList }" var="inven" step="1" varStatus="status">
											<input type="hidden" value="${inven.prod_code }" name="franInvenListVO[${status.index}].prod_code">
											<input type="hidden" value="${inven.fran_code }" name="franInvenListVO[${status.index}].fran_code">
												<tr>
													<c:choose>
														<c:when test="${inven.att_fileno eq null }">
															<td><img class='myImage' src='${cPath}/resources/assets/images/logo/cfmslogo-notext.png'></td>
														</c:when>
														<c:otherwise>
															<td><img class='myImage' src="data:image/jpeg;base64,${inven.attachfileList[0].file_img }"></td>
														</c:otherwise>
													</c:choose>
													<td>${inven.prod_nm }</td>
													<td>${inven.fran_nowinven }</td>
													<td><input type="text" class="form-control" name="franInvenListVO[${status.index}].fran_proinven" value="${inven.fran_proinven }"></td>
													<td>${inven.prod_suply_pc }</td>
													<td>${inven.com_code_nm }</td>
												</tr>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<tr>
												<td colspan="7">
													조건에 맞는 게시글이 없음.
												</td>
											</tr>
										</c:otherwise>
									</c:choose>
									</tbody>
								</table>
							</div>                        		
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>




<script type="text/javascript">
	$("#update").on("click", function() {
		$("#updateForm").submit();
	});
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
  
    // First register any plugins
    $.fn.filepond.registerPlugin(FilePondPluginImagePreview);

    // Turn input element into a pond
    $('.image-crop-filepond').filepond();

    // Set allowMultiple property to true
    $('.image-crop-filepond').filepond('allowMultiple', true);
  
    // Listen for addfile event
    $('.image-crop-filepond').on('FilePond:addfile', function(e) {
        console.log('file added event', e);
//     console.log(pond)
//     console.log(pond.getFile)
//     console.log(pond.name);
//     pond.name.val(pond.getFile)
	$(pond.name).val(pond.getFile)
	console.log(pond.element)
    pondFiles = pond.getFiles();
    console.log(pondFiles.length)
    for(var i = 0; i < pondFiles.length; i++){
        console.log(pondFiles[i]);
    }
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
</script>
</body>
</body>
