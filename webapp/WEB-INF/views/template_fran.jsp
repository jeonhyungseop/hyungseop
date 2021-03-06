    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* ${date}      작성자명      최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="shortcut icon" href="${cPath}/resources/images/favicon/favicon.ico" type="image/x-icon">
	<link rel="icon" href="${cPath}/resources/images/favicon/favicon.ico" type="image/x-icon">
	
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
	
	<link href="${cPath}/resources/assets/extra-libs/c3/c3.min.css" rel="stylesheet">
	<link href="${cPath}/resources/assets/libs/chartist/dist/chartist.min.css" rel="stylesheet">
	<link href="${cPath}/resources/assets/extra-libs/jvector/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
	
	<link rel="stylesheet" href="${cPath}/resources/assets/css/bootstrap.css">
	
	<link rel="stylesheet" href="${cPath}/resources/assets/vendors/iconly/bold.css">
	
	<link rel="stylesheet" href="${cPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
	<link rel="stylesheet" href="${cPath}/resources/assets/vendors/bootstrap-icons/bootstrap-icons.css">
	<link rel="stylesheet" href="${cPath}/resources/assets/css/app.css">
	<link rel="stylesheet" href="${cPath}/resources/assets/vendors/simple-datatables/style.css">
	<link rel="stylesheet" href="${cPath}/resources/assets/vendors/sweetalert2/sweetalert2.min.css">
	<tiles:insertAttribute name="preScript"/>
	    <!-- 추가 스타일 -->
    <style>
        .mb-3 {
            height: 150px;
        }
        .collapse:not(.show) {
            display: block;
        }
        
        .inputlegth{
        	float : right;
        	width: 270px;
        	margin-top: 1%;
        }
        
        .imgfloat{
        	float: right;
        	margin-left: 20px;
        	margin-top: 0.5%;
        }
        
        .noticeicon{
        	margin-top: 1.6%;
        }
        
        .page-heading{
        	margin-top : 1.5%;
       	}
       	
       	.svgicon{
       		width: 20px;
       		height: 20px;
       	}
       	
       	.mainImg{
       		margin-top : 2%;
       		text-align: center;
       	}
       	
       	.mainName{
       		margin-top : 5%;
       		text-align: center;
       	}
       	
       	.mainBtn{
       		text-align: center;
       	}
       	
       	.dropdown-menu{
       		margin : 100%;
       	}

		.dropdown-menu{
			top:75% !important;
		}
		
		
		
		.leftnotice{
			float: left;
		}
		
		.noticeimg{
			margin-right: 5%;
		}
		
		.pribtn{
			background: #826767;
			border-color: #826767;
			margin-left: 5px;
		}
		
		.btn-primary.active{
			background: #6b5050;
			border-color: #6b5050;
		}
		
		.btn-primary:active{
			background: #6b5050;
			border-color: #6b5050;
		}
		
		.left{
			text-align: left !important;
		}
		
		.right{
			text-align: right !important;
		}
		
		.center{
			text-align: center !important;
		}
		
    </style>
    <!-- //추가 스타일 -->
</head>
<body>
<main>
	<div id="main" class="bodyTile">
	
		<tiles:insertAttribute name="header"/>
			<tiles:insertAttribute name="sidebar"/>
		<tiles:insertAttribute name="body"/>
		
	</div>
</main>	

<script src="${cPath}/resources/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${cPath}/resources/assets/js/bootstrap.bundle.min.js"></script>

<%-- <script src="${cPath}/resources/assets/js/pages/dashboard.js"></script> --%>
<script src="${cPath}/resources/assets/js/main.js"></script>
</html>
