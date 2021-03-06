    <%--
* [[개정이력(Modification Information)]]
* 수정일                 수정자      수정내용
* ----------  ---------  -----------------
* 2021.06.03     진유리	         최초작성
* Copyright (c) ${year} by DDIT All right reserved
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=91b9c89742f31f21bd7a096c6fe38a6a&libraries=services"></script>
<style>
	.form-group {
    	margin-bottom: 2.0rem;
	}
	.bizrno_label, .celno_label, .telno_label{
		display: block;
	}
	.celno{
		display: inline-flex;
	}
	.celno .form-control{
		margin : 0 5px 0 2px;
	}
	.telno{
		display: inline-flex;
	}
	.telno .form-control{
		margin : 0 5px 0 2px;
	}
	.bizrno{
		display: inline-flex;
	}
	.bizrno .form-control{
		margin : 0 5px 0 2px;
	}
	#zipSearh{
		font-size : 13px;
		font-weight: 800;
	}
	.important{
		color : red;
	}
	.explain{
		text-align: right;
	}
</style>
<body>
<section id="multiple-column-form">
    <div class="row match-height">
        <div class="col-12">
            <div class="card">
            	<div class="card-header">
                    <h4 class="card-title" style="display:inline-block;">가맹점 등록</h4>
                    <button type="button" class="btn btn-light-secondary me-1 mb-1 pribtn float-end cancel">취소</button>
                    <button type="button" class="btn btn-primary me-1 mb-1 pribtn float-end register">등록</button>
	                <a href="${cPath}/head/franmanage" class="btn btn-primary me-1 mb-1 pribtn float-end">목록으로</a>
	             </div>
                <div class="card-content">
                    <div class="card-body">
		                <form:form class="form" method="post" modelAttribute="fran" action="${cPath}/head/franmanage/form"
		                   id="franForm" enctype="multipart/form-data">
                            <div class="row">
                            	<div class="col-md-12 explain"><b class="important">*</b>는 필수 항목입니다.</div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="fran_comnm">가맹점 상호명<b class="important">*</b></label>
                                        <input type="text" id="fran_comnm" class="form-control" name="fran_comnm" value="${fran_comnm}"/>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="fran_opende">가맹점 오픈일자<b class="important">*</b></label>
                                        <input type="date" id="fran_open_date" class="form-control" min="1900-01-01" max="2100-12-31"/>
                                        <input type="hidden" name="fran_opende" value="${fran_opende}"/>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="fran_sttus_code">가맹점 상태<b class="important">*</b></label>
                                        <select class="form-select" name="fran_sttus_code">
	                                        <c:if test="${not empty FstCode}">
	                                        	<c:forEach items="${FstCode.comCodeList}" var="fst">
	                                        		<option value="${fst.com_code}">${fst.com_code_nm}</option>
	                                        	</c:forEach>
	                                        </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="fran_se_code">가맹점 구분<b class="important">*</b></label>
                                        <select class="form-select" name="fran_se_code">
	                                        <c:if test="${not empty FseCode}">
	                                        	<c:forEach items="${FseCode.comCodeList}" var="fse">
	                                        		<option value="${fse.com_code}">${fse.com_code_nm}</option>
	                                        	</c:forEach>
	                                        </c:if>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="fran_id">가맹점 아이디<b class="important">*</b></label>
<%--                                         <input type="text" id="fran_id" class="form-control" name="fran_id" value="${fran_id}"/> --%>
                                        <input type="text" id="fran_id" class="form-control" name="fran_id" value="wlstn115"/>
                                    </div>
                                </div>
								<div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="fowner_nm">가맹점주명<b class="important">*</b></label>
<%--                                         <input type="text" id="fowner_nm" class="form-control" name="fowner_nm" value="${fowner_nm}"/> --%>
                                        <input type="text" id="fowner_nm" class="form-control" name="fowner_nm" value="이진수"/>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label class="telno_label" for="fran_telno">가맹점 전화번호<b class="important">*</b></label>
                                        <div class="telno">
											<select class="form-select form-control" id="telno1">
												<option value="" selected>선택</option>
												<option value="02">02</option>
												<option value="031">031</option>
												<option value="032">032</option>
												<option value="033">033</option>
												<option value="041">041</option>
												<option value="042">042</option>
												<option value="044">044</option>
												<option value="043">043</option>
												<option value="051">051</option>
												<option value="052">052</option>
												<option value="053">053</option>
												<option value="054">054</option>
												<option value="055">055</option>
												<option value="061">061</option>
												<option value="062">062</option>
												<option value="063">063</option>
												<option value="064">064</option>
											</select>
											<span class="at">-</span>
<!-- 											<input type="text" id="telno2" class="form-control" maxlength="3"/>  -->
											<input type="text" id="telno2" class="form-control" maxlength="3" value="123"/> 
											<span class="at">-</span>
											<input type="text" id="telno3" class="form-control" maxlength="4"/> 
	                                        <input type="hidden" id="fran_telno" class="form-control" name="fran_telno" value="${fran_telno}"/>
                                    	</div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label class="celno_label" for="fowner_celno">가맹점주 핸드폰번호<b class="important">*</b></label>
                                        <div class="celno">
		                                    <select class="form-select form-control" id="phone1">
												<option value="010" selected>010</option>
												<option value="011">011</option>
												<option value="016">016</option>
												<option value="017">017</option>
												<option value="018">018</option>
												<option value="019">019</option>
											</select>
											<span class="at">-</span>
<!-- 											<input type="text" id="phone2" class="form-control" maxlength="4"/>  -->
											<input type="text" id="phone2" class="form-control" maxlength="4" value="1234"/> 
											<span class="at">-</span>
											<input type="text" id="phone3" class="form-control" maxlength="4"/> 
	                                        <input type="hidden" id="fowner_celno" class="form-control" name="fowner_celno" value="${fowner_celno}"/>
                                    	</div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label class="bizrno_label" for="fran_bizrno">가맹점 사업자번호<b class="important">*</b></label>
                                        <div class="bizrno">
<!-- 											<input type="text" id="bizrno1" class="form-control" maxlength="3"/>  -->
											<input type="text" id="bizrno1" class="form-control" maxlength="3" value="235"/> 
											<span class="at">-</span>
<!-- 											<input type="text" id="bizrno2" class="form-control" maxlength="2"/>  -->
											<input type="text" id="bizrno2" class="form-control" maxlength="2" value="58"/> 
											<span class="at">-</span>
											<input type="text" id="bizrno3" class="form-control" maxlength="5"/> 
                                        	<input type="hidden" id="fran_bizrno" class="form-control" name="fran_bizrno" value="${fran_bizrno}"/>
                                    	</div>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="fowner_email">가맹점주 이메일<b class="important">*</b></label>
<%--                                         <input type="text" id="fowner_email" class="form-control" name="fowner_email" value="${fowner_email}"/> --%>
                                        <input type="text" id="fowner_email" class="form-control" name="fowner_email" value="wlstn115@naver.com"/>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="fowner_birtday">가맹점주 생년월일<b class="important">*</b></label>
                                        <input type="date" id="fowner_birtday_date" class="form-control" min="1900-01-01" max="2100-12-31"/>
                                        <input type="hidden" id="fowner_birtday" class="form-control" name="fowner_birtday" value="${fowner_birtday}"/>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                      <input type="hidden" id="fran_lati" name="fran_lati" value="${fran_lati}"/>
                                      <input type="hidden" id="fran_loti" name="fran_loti" value="${fran_loti}"/>
                                      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                </div>
                                <div class="col-md-2 col-12">
                                    <div class="form-group">
                                        <label for="fran_zipno">가맹점 우편번호<b class="important">*</b></label>
                                        <input type="text" id="fran_zipno" class="form-control" name="fran_zipno" value="${fran_zipno}"/>
                                    </div>
                                </div>
                                <div class="col-md-2 col-12">
                                    <div class="form-group">
                                        <label for="zipSearh"></label>
                                        <input type="button" id="zipSearh" class="form-control btn btn-primary" value="우편번호 찾기"
                                         name="syspay_pc" onclick="DaumPostcode();"/>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="fran_baadd">가맹점 기본주소<b class="important">*</b></label>
                                        <input type="text" id="fran_baadd" class="form-control" name="fran_baadd" value="${fran_baadd}"/>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="fran_deadd">가맹점 상세주소</label>
<%--                                         <input type="text" id="fran_deadd" class="form-control" name="fran_deadd" value="${fran_deadd}"/> --%>
                                        <input type="text" id="fran_deadd" class="form-control" name="fran_deadd" value="1층"/>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="fran_files">사업자 등록증 파일<b class="important">*</b></label>
                                        <input type="file" id="fran_files" class="form-control" name="fran_files"/>
                                    </div>
                                </div>
                                <div class="col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="fran_files">첨부 파일<b class="important">*</b></label>
                                        <input type="file" id="fran_files" class="form-control" name="fran_files"/>
                                    </div>
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript">
var geocoder = new kakao.maps.services.Geocoder();

function DaumPostcode() {
	var width = 500;
	var height = 600;    
    new daum.Postcode({
    	width : width,
    	height : height,
    	submitMode : false,
    	animation : true,
    	theme: {
	            searchBgColor: "#6B5050", 
	            queryTextColor: "#FFFFFF" 
	        },
        oncomplete: function(data) {
            var addr = ''; 
            var extraAddr = ''; 

            if (data.userSelectedType === 'R') { 
                addr = data.roadAddress;
            } else { 
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
               	
                addr = addr + extraAddr ;
            }else {
            	addr = addr + '';
            }

            document.getElementById('fran_zipno').value = data.zonecode;
            document.getElementById("fran_baadd").value = addr;
            document.getElementById("fran_deadd").focus();
            
            geocoder.addressSearch(addr, function(result, status) {
            	
        		// 정상적으로 검색이 완료됐으면 
        		 if (status === kakao.maps.services.Status.OK) {
        		    $("#fran_lati").val(result[0].y);
        		    $("#fran_loti").val(result[0].x)
        		} 
        	}); 
        }
    }).open({
    	 popupName : 'postcodePopup',
    	 left: (window.screen.width / 2) - (width / 2),
    	 top: (window.screen.height / 2) - (height / 2)
    });
}

var idFlag = false;
var bizrnoFlag = false;
var form = $("#franForm");

$(document).ready(function() {
	$("#fran_id").on("change", function(){
		checkId("first");
	});
	
	$(".cancel").on("click", function(){
		form[0].reset();
		hideMsg($("#fran_id"));
	});
	
	$("#fran_open_date").on("change", function(){
		checkOpenDate();
	});
	
	$("#fowner_birtday_date").on("change", function(){
		var birthday = $(this).val().split("-");//input을 통해 들어온 날짜
		var year=birthday[0];
		var month=birthday[1];
		var day=birthday[2];
		var birthdayFormat = year+month+day;
		$("#fowner_birtday").val(birthdayFormat);
	});
	
	$(".celno").change(function(){
   		checkPhone();
   	});
	
	$(".telno").change(function(){
		checkTel();
	});
	
	$(".bizrno").change(function(){
		checkBizrno();
	});
	$(".register").on("click", function(event){
   		event.preventDefault();
   		console.log(idFlag+"/"+bizrnoFlag);
   		if(idFlag&&bizrnoFlag){
   			if(checkUnrealInput()){
   				form.submit();
   			}
   		}else{
   			if(!checkUnrealInput()){
   				alert("빠진 정보가 있는지 확인하세요.")
   			};
   		}
   	});
});
function checkUnrealInput() {
    if ( checkId('join')
    	& checkPhone()
        & checkOpenDate()
        & checkBizrno()
        & checkTel()
    ) {
        return true;
    } else {
        return false;
    }
}
function checkBizrno(){
	var bizrNo1 = $("#bizrno1").val();
	var bizrNo2 = $("#bizrno2").val();
	var bizrNo3 = $("#bizrno3").val();

	$("input[name='fran_bizrno']").val("");
    
	bizrnoFlag = false;
	var bizrno = bizrNo1+bizrNo2+bizrNo3;
    var isbzrNo = /^\d{10}$/;
    if(bizrno != "" && isbzrNo.test(bizrno)){
		$("input[name='fran_bizrno']").val(bizrno);
		$.ajax({
	        type:"GET",
	        url: "${cPath}/sign/bizrnocheck?bizrno=" + bizrno ,
	        success : function(data) {
	            var result = data.result;
	
	            if (result == "Y") {
                    alert("등록 가능한 사업자 번호입니다!");
     				bizrnoFlag = true;
	            } else {
	            	alert("이미 등록된 사업자 번호입니다.");
	            	return false;
	            }
	        }
	    });
    }else if(bizrno != "" && !isbzrNo.test(bizrno)){
    	return false;
    }
    
    return true;
}
function checkPhone(){
	var phone1 = $("#phone1").val();
	var phone2 = $("#phone2").val();
	var phone3 = $("#phone3").val();

 	$("input[name='fowner_celno']").val("");

	var celno = phone1+phone2+phone3;
    var isphoneNo = /^\d{10,11}$/;
    if(celno != "" && isphoneNo.test(celno)){
    	$("input[name='fowner_celno']").val(celno);
    	return true;
    }else if(celno != "" && !isphoneNo.test(celno)){
    	return false;
    }
    
    return true;
}
function checkTel(){
	var tel1 = $("#telno1").val();
	var tel2 = $("#telno2").val();
	var tel3 = $("#telno3").val();

 	$("input[name='fran_telno']").val("");

	var tel = tel1+tel2+tel3;
    var istelNo = /^\d{9,10}$/;
    if(tel != "" && istelNo.test(tel)){
    	$("input[name='fran_telno']").val(tel);
    	return true;
    }else if(tel != "" && !istelNo.test(tel)){
    	return false;
    }
    
    return true;
}
function checkOpenDate(){
	var opendate = $("#fran_open_date").val();
	var oInput = $("#fran_open_date");
	
	hideMsg(oInput);
	$("input[name='fran_opende']").val("");
	
	var date = opendate.split("-");//input을 통해 들어온 날짜
	var year=date[0];
	var month=date[1];
	var day=date[2];
	var dateFormat = year+month+day;
	var today = getToday();
	if(dateFormat<today){
		alert("오픈일자는 오늘보다 전일수는 없습니다.");
		return false;
	}
	$("input[name='fran_opende']").val(dateFormat);
	return true;
};
function checkId(event) {
    if(idFlag) return true;

    var id = $("#fran_id").val();
    var oInput = $("#fran_id");

    hideMsg(oInput);
    
    idFlag = false;
    $.ajax({
        type:"GET",
        url: "${cPath}/sign/idcheck?id=" + id ,
        success : function(data) {
            var result = data.result;

            if (result == "Y") {
                if (event == "first") {
                    showSuccessMsg(oInput);
                }else{
                	hideMsg(oInput);
                } 
                idFlag = true;
            } else {
                alert("아이디가 중복되었습니다. 다시 입력해주세요.");
                setFocusToInputObject(oInput);
                return false;
            }
        }
    });
    
    return true;
}
function getToday(){
    var now = new Date();
    var year = now.getFullYear();
    var month = now.getMonth() + 1;    //1월이 0으로 되기때문에 +1을 함.
    var date = now.getDate();

    month = month >=10 ? month : "0" + month;
    date  = date  >= 10 ? date : "0" + date;
    // ""을 빼면 year + month (숫자+숫자) 됨.. ex) 2018 + 12 = 2030이 리턴됨.

    return today = ""+year + month + date; 
}
function setFocusToInputObject(obj) {
     obj.focus();
}
function hideMsg(obj) {
	obj.attr("class", "form-control");
	obj.show();
}
function showErrorMsg(obj) {
    obj.attr("class", "form-control is-invalid");
    obj.show();
}
function showSuccessMsg(obj) {
    obj.attr("class", "form-control is-valid");
    obj.show();
}
</script>
</body>