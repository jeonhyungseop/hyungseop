<!--  [[개정이력(Modification Information)]]       -->
<!--  수정일        수정자     수정내용               -->
<!--  ==========   ======    ==============        -->
<!--  ${date}}     작성자명     최초작성               -->
<!--  Copyright (c) ${year} by DDIT All right reserved -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<script type="text/javascript" src="${cPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${cPath }/resources/js/myjQueryPlugin.js"></script>
<script type="text/javascript" src="${cPath }/resources/js/jquery.form.min.js"></script>
<script type="text/javascript" src="${cPath }/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript">
	$.getContextPath=function(){
		return "${cPath}";
	}
   jQuery(function($) {
	   $("body").css("display", "none");
	   $("body").fadeIn(500);
	   $("#loading").delay(300).fadeOut(500);
	   
	   $("a.transition").click(function(event){
	   event.preventDefault();
	   linkLocation = this.href;
	   $("body").fadeOut(0, redirectPage)
	   });
	   function redirectPage() {
	   window.location = linkLocation;
	   }
	   });
</script>
