<%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021. 5. 14.      전형섭      500error
* Copyright (c) 2021 by DDIT All right reserved
 --%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
 <link href="${path}/resources/css/500css.css" rel="stylesheet" >
 <script type="text/javascript" src="${path}/resources/js/500js/500js.js" ></script>
<title>Insert title here</title>
</head>
<body>
<div class="full-screen">
      <div class='container'>
        <span class="error-num">5</span>
        <div class='eye'></div>
        <div class='eye'></div>

        <p class="sub-text">Oh eyeballs! Something went wrong. We're <span class="italic">looking</span> to see what happened.</p>
        <a href="">Go back</a>
      </div>
    </div>
</body>
</html>