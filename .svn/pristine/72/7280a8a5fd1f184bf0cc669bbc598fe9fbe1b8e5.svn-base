/**
 * 
 */
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

            document.getElementById('head_zipno').value = data.zonecode;
            document.getElementById("head_baadd").value = addr;
            document.getElementById("head_deadd").focus();
			
            checkAdd();
        }
    }).open({
    	 popupName : 'postcodePopup',
    	 left: (window.screen.width / 2) - (width / 2),
    	 top: (window.screen.height / 2) - (height / 2)
    });
}

var idFlag = false;
var pwFlag = false;
var authFlag = false;
var bizrnoFlag = false;
var submitFlag = false;

$(document).ready(function() {
	
    //region unreal id
    $("#id").blur(function() {
        idFlag = false;
        checkId("first");
    });
    
    $("#pswd1").blur(function() {
        pwFlag = false;
        checkPswd1();
    }).keyup(function(event) {
        checkShiftUp(event);
    }).keypress(function(event) {
        checkCapslock(event);
    }).keydown(function(event) {
        checkShiftDown(event);
    });

    $("#pswd2").blur(function() {
        checkPswd2();
    }).keyup(function(event) {
        checkShiftUp(event);
    }).keypress(function(event) {
        checkCapslock2(event);
    }).keydown(function(event) {
        checkShiftDown(event);
    });
	
   	$("#head_comnm").blur(function() {
   		checkComnm();
    });
   	
   	$("#head_comnm_em").blur(function() {
   		checkComnmEm();
    });
   	
	$("#head_nm").blur(function() {
   		checkNm();
    });
   	
   	$(".bizrno").change(function() {
   		checkBizrno();
    });
   	
   	$("#emailselect").change(function(){
   		 var select = $("#emailselect");
   		 var email2 = $("#email2");
   		 
   		 if(select.val() == "9"){
   			 email2.attr("readonly", false);
   			 email2.val("");
   		 }else{
   			 email2.attr("readonly", true);
   			 email2.val(select.val());
   		 }
   	});
   	
   	$(".email").change(function(){
   		checkEmail();
   	});
   	
   	$(".phone").change(function(){
   		checkPhone();
   	});
   	
   	$("#sendemail").on("click", function(){
   		var email = $("input[name='head_email']").val();
   	   
   		$("#authNumber").val("");
   		if(email != ""){
   			$.ajax({
   		        type:"GET",
   		        url: "sign/mailauth?email=" + email ,
   		        success : function(data) {
   		        	var result = data.result;
   		        	
   		            if (result == "N") {
   		            	alert("인증번호를 메일을 통해 보내는 것을 실패했습니다. 다시 시도해주세요.");
   		            } else {
   		            	alert("인증번호를 메일을 통해 보냈습니다.");
   		            	$("#authEmail").attr("disabled", false);
   		            	$("#authNumber").attr("readonly", false);
   		            }
   		        }
   		    });
   		};
   	});
   	
   	$("#authEmail").on("click", function(){
   		authFlag = false;
   		checkauthEmail();
   	});
   	
   	$("#bizrnoFile").on("change", function(){
   		checkFile();
   	});
   	
   	$("#btnJoin").on("click", function(event){
   		event.preventDefault();
   		var oMsg = $("#joinMsg");
   		if(idFlag&&pwFlag&&bizrnoFlag&&authFlag){
   			if(checkUnrealInput()){
   				$("#joinForm").submit();
   				hideMsg(oMsg);
   			}
   		}else{
   			if(!checkUnrealInput()){
   				showErrorMsg(oMsg,"빠진 정보가 있는지 확인하세요.");
   			};
   		}
   	});

});	//ready function finish

function checkUnrealInput() {
    if (checkId('join')
          & checkPswd1()
          & checkPswd2()
          & checkComnm()
          & checkComnmEm()
          & checkNm()
          & checkBizrno()
          & checkEmail()
          & checkauthEmail()
          & checkAdd()
          & checkFile()
          & checkPhone()
    ) {
        return true;
    } else {
        return false;
    }
}
function checkPhone(){
	 var phone1 = $("#phone1").val();
	 var phone2 = $("#phone2").val();
	 var phone3 = $("#phone3").val();
     var oMsg = $("#PhoneMsg");
     var oInput1 = $("#phone1");
     var oInput2 = $("#phone2");
     var oInput3 = $("#phone3");

	 $("input[name='head_telno']").val("");
	 
	 if(phone2 == "") fail(oInput2);
	 if(phone3 == "") fail(oInput3);
	 
     var ispNo1 = /^\d{3}$/;
     var ispNo2 = /^\d{3,4}$/;
     var ispNo3 = /^\d{4}$/;
     if (phone2 == "" && phone3 == "") {
         showErrorMsg(oMsg,"핸드폰번호는 필수 정보입니다.");
         setFocusToInputObject(oInput2);
         fail(oInput2);
         fail(oInput3);
         return false;
     }
     
	 if(phone1 != "" && !ispNo1.test(phone1)){
		 showErrorMsg(oMsg, "핸드폰 번호의 앞번호는 3자리입니다.");
		 setFocusToInputObject(oInput1);
		 return false;
	 }
	 
	 if(phone2 != "" && !ispNo2.test(phone2)){
		 showErrorMsg(oMsg, "핸드폰 번호의 중간번호는 3~4자리입니다.");
		 setFocusToInputObject(oInput2);
		 fail(oInput2);
		 return false;
	 }else if(phone2 != ""){
	 	success(oInput2);
	 }
	 
	 if(phone3 != "" && !ispNo3.test(phone3)){
		 showErrorMsg(oMsg, "핸드폰 번호의 뒷번호는 4자리입니다.");
		 setFocusToInputObject(oInput3);
		 fail(oInput3);
		 return false;
	 }else if(phone3 != ""){
	 	success(oInput3);
	 }
	 
	 hideMsg(oMsg);
	 
	 var telNo = phone1+phone2+phone3;
     var istelNo = /^\d{10,11}$/;
     if(telNo != "" && istelNo.test(telNo)){
     	$("input[name='head_telno']").val(telNo);
     	return true;
     }else if(telNo != "" && !istelNo.test(telNo)){
     	return false;
     }
     hideMsg(oMsg);
     return true;
}
function checkFile(){
	var file = $("#bizrnoFile").val();
	var oMsg = $("#BizrnoFileMsg");
	var oInput = $("#bizrnoFile");
	if(file == ""){
		showErrorMsg(oMsg,"파일을 첨부해주세요.");
        setFocusToInputObject(oInput);
        return false;
	}

	hideMsg(oMsg);
    return true;
}
function checkAdd(){
	var zip = $("#head_zipno")
	var add1 = $("#head_baadd");
	var oMsg = $("#adMsg");
	
	if(zip.val() == "" && add1.val() == ""){
		showErrorMsg(oMsg,"우편번호와 주소는 필수 정보입니다.");
		setFocusToInputObject("#find_zipno");
		fail(zip);
		fail(add1);
		return false;
	}
	
	if(zip.val() != ""){
		success(zip);
	}
	
	if(add1.val() != ""){
		success(add1);
	}
	
	hideMsg(oMsg);
	return true;
}
function checkauthEmail(){
	if(authFlag) return true;
	
	var authNumber = $("#authNumber").val();
    var oMsg = $("#authMsg");
    var oInput = $("#authNumber");

    normal(oInput);
    
    if (authNumber == "") {
        showErrorMsg(oMsg,"인증번호를 입력해주세요.");
        setFocusToInputObject(oInput);
        fail(oInput);
        return false;
    }
    
    authFlag = false;
    $.ajax({
        type:"POST",
        url: "sign/mailauthcheck",
        data : {"auth" : authNumber},
        success : function(data) {
            var result = data.result;

            if (result == "Y") {
                showSuccessMsg(oMsg, "인증이 완료되었습니다");
                success(oInput);
                authFlag = true;
            } else {
                showErrorMsg(oMsg, "인증번호와 다릅니다.");
                fail(oInput);
                setFocusToInputObject(oInput);
            }
        }
    });
    
    return true;
};

function checkId(event) {
    if(idFlag) return true;

    var id = $("#id").val();
    var oMsg = $("#idMsg");
    var oInput = $("#id");

    normal(oInput);
    
    if (id == "") {
        showErrorMsg(oMsg,"아이디는 필수 정보입니다.");
        setFocusToInputObject(oInput);
        fail(oInput);
        return false;
    }

    var isID = /^[a-zA-Z0-9]{6,20}$/g;
    if (!isID.test(id)) {
        showErrorMsg(oMsg,"6~20자의 영문 대＊소문자, 숫자만 사용 가능합니다.");
        setFocusToInputObject(oInput);
        fail(oInput);
        return false;
    }

    idFlag = false;
    $.ajax({
        type:"GET",
        url: "sign/idcheck?id=" + id ,
        success : function(data) {
            var result = data.result;

            if (result == "Y") {
                if (event == "first") {
                	success(oInput);
                    showSuccessMsg(oMsg, "사용 가능한 아이디입니다!");
                } else {
                    hideMsg(oMsg);
                }
                idFlag = true;
            } else {
                showErrorMsg(oMsg, "이미 사용중이거나 탈퇴한 아이디입니다.");
                setFocusToInputObject(oInput);
            }
        }
    });
    return true;
}

function checkPswd1() {
    if(pwFlag) return true;

    var id = $("#id").val();
    var pw = $("#pswd1").val();
    var oMsg = $("#pswd1Msg");
    var oInput = $("#pswd1");
    
    normal(oInput);

    if (pw == "") {
        showErrorMsg(oMsg,"비밀번호를 입력하세요.");
        setFocusToInputObject(oInput);
        fail(oInput);
        return false;
    }
    if (isValidPasswd(pw) != true) {
        showErrorMsg(oMsg,"8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.");
        setFocusToInputObject(oInput);
        fail(oInput);
        return false;
    }
    pwFlag = false;
	if(isValidPasswd(pw) == true){
		 pwFlag = true;
		 success(oInput);
	}
    
	hideMsg(oMsg);
    return true;
}

function checkPswd2() {
    var pswd1 = $("#pswd1");
    var pswd2 = $("#pswd2");
    var oMsg = $("#pswd2Msg");
    var oInput = $("#pswd2");

    normal(oInput);
    
    if (pswd2.val() == "") {
        showErrorMsg(oMsg,"비밀번호는 필수 정보입니다.");
        setFocusToInputObject(oInput);
        fail(oInput);
        return false;
    }
    if (pswd1.val() != pswd2.val()) {
        showErrorMsg(oMsg,"비밀번호가 일치하지 않습니다.");
        setFocusToInputObject(oInput);
        fail(oInput);
        return false;
    } else {
    	showSuccessMsg(oMsg, "일치합니다!");
    	success(oInput);
        return true;
    }

    return true;
}

function checkComnm() {
    var oMsg = $("#ComnmMsg");
    var nonchar = /^[가-힣 ][가-힣]{1,30}$/;
    var name = $("#head_comnm").val();
    var oInput = $("#head_comnm");
    
    normal(oInput);
    
    if (name == "") {
        showErrorMsg(oMsg,"상호명(한글)은 필수 정보입니다.");
        setFocusToInputObject(oInput);
        fail(oInput);
        return false;
    }
   
    if (name != "" && !nonchar.test(name)) {
        showErrorMsg(oMsg,"30자이내의 한글만 사용가능합니다.(띄어쓰기 허용/마지막 띄어쓰기는 불가)");
        setFocusToInputObject(oInput);
        fail(oInput);
        return false;
    }
	
    success(oInput);
    hideMsg(oMsg);
    return true;
}

function checkComnmEm() {
    var nonchar = /^[a-zA-Z ][a-zA-Z]{1,50}$/;
    var name = $("#head_comnm_em").val();
    var oMsg = $("#ComnmEmMsg");
    var oInput = $("#head_comnm_em");
    
    normal(oInput);
    
    if (name == "") {
        showErrorMsg(oMsg,"상호명(영문) 필수 정보입니다.");
        setFocusToInputObject(oInput);
        fail(oInput);
        return false;
    }
    if (name != "" && !nonchar.test(name)) {
        showErrorMsg(oMsg,"50자이내의 영어만 사용가능합니다.(띄어쓰기 허용/마지막 띄어쓰기는 불가)");
        setFocusToInputObject(oInput);
        fail(oInput);
        return false;
    }

    success(oInput);
    hideMsg(oMsg);
    return true;
}

function checkNm() {
    var nonchar = /^[가-힣]{1,5}$/;
    var name = $("#head_nm").val();
    var oMsg = $("#NmMsg");
    var oInput = $("#head_nm");
    
    normal(oInput);
    
    if (name == "") {
        showErrorMsg(oMsg,"대표자명은 필수 정보입니다.");
        setFocusToInputObject(oInput);
        fail(oInput);
        return false;
    }
    if (name != "" && !nonchar.test(name)) {
        showErrorMsg(oMsg,"5자이내의 한글만 사용가능합니다.");
        setFocusToInputObject(oInput);
        fail(oInput);
        return false;
    }
	
    success(oInput);
    hideMsg(oMsg);
    return true;
}

function checkBizrno(){
	 var bizrNo1 = $("#head_bizrno1").val();
	 var bizrNo2 = $("#head_bizrno2").val();
	 var bizrNo3 = $("#head_bizrno3").val();
     var oMsg = $("#BizrnoMsg");
     var oInput1 = $("#head_bizrno1");
     var oInput2 = $("#head_bizrno2");
     var oInput3 = $("#head_bizrno3");

	 $("input[name='head_bizrno']").val("");
	 
     if(bizrNo1 == "") fail(oInput1);
	 if(bizrNo2 == "") fail(oInput2);
	 if(bizrNo3 == "") fail(oInput3);
	 
     var isbNo1 = /^\d{3}$/;
     var isbNo2 = /^\d{2}$/;
     var isbNo3 = /^\d{5}$/;
     if (bizrNo1 == "" && bizrNo2 == "" && bizrNo3 == "") {
         showErrorMsg(oMsg,"사업자번호는 필수 정보입니다.");
         setFocusToInputObject(oInput1);
         fail(oInput1);
         fail(oInput2);
         fail(oInput3);
         return false;
     }
     
	 if(bizrNo1 != "" && !isbNo1.test(bizrNo1)){
		 showErrorMsg(oMsg, "첫번째 자리에 3자리 사업자 번호를 입력해주세요");
		 setFocusToInputObject(oInput1);
		 fail(oInput1);
		 return false;
	 }else if(bizrNo1 != ""){
	 	success(oInput1);
	 }
	 
	 if(bizrNo2 != "" && !isbNo2.test(bizrNo2)){
		 showErrorMsg(oMsg, "두번째 자리에 2자리 사업자 번호를 입력해주세요");
		 setFocusToInputObject(oInput2);
		 fail(oInput2);
		 return false;
	 }else if(bizrNo2 != ""){
	 	success(oInput2);
	 }
	 
	 if(bizrNo3 != "" && !isbNo3.test(bizrNo3)){
		 showErrorMsg(oMsg, "세번째 자리에 5자리 사업자 번호를 입력해주세요");
		 setFocusToInputObject(oInput3);
		 fail(oInput3);
		 return false;
	 }else if(bizrNo3 != ""){
	 	success(oInput3);
	 }
	 
     bizrnoFlag = false;
	 hideMsg(oMsg);
	 var bizrno = bizrNo1+bizrNo2+bizrNo3;
     var isbzrNo = /^\d{10}$/;
     if(bizrno != "" && isbzrNo.test(bizrno)){
		$("input[name='head_bizrno']").val(bizrno);
     	$.ajax({
	        type:"GET",
	        url: "sign/bizrnocheck?bizrno=" + bizrno ,
	        success : function(data) {
	            var result = data.result;
	
	            if (result == "Y") {
                    showSuccessMsg(oMsg, "등록 가능한 사업자 번호입니다!");
     				bizrnoFlag = true;
	            } else {
	                showErrorMsg(oMsg, "이미 등록된 사업자 번호입니다.");
	                fail(oInput1);
	                fail(oInput2);
	                fail(oInput3);
	            }
	        }
	    });
     }else if(bizrno != "" && !isbzrNo.test(bizrno)){
     	return false;
     }
     
     hideMsg(oMsg);
     return true;
}

function checkEmail(){
	var email1 = $("#email1").val();
	var email2 = $("#email2").val();
	var oMsg = $("#authMsg");
	var eInput1 = $("#email1");
	var eInput2 = $("#email2");
	var sendemail = $("#sendemail");
	
	$("input[name='head_email']").val("");
	sendemail.attr("disabled", true);
	
	if(email1 == "") fail(eInput1);
	if(email2 == "") fail(eInput2);
	
	if(email1 != "") success(eInput1);
	if(email2 != "") success(eInput2);
	
	if(email1 == "" && email2 == ""){
		showErrorMsg(oMsg,"이메일을 입력해주세요.");
	    setFocusToInputObject(eInput1);
	    return false;
	}
	
	if(email1 != "" && email2 != ""){
		 $("input[name='head_email']").val(email1+"@"+email2);
		 sendemail.attr("disabled", false);
	     return true;
	}
	 hideMsg(oMsg);
     return true;
}

//공통함수
function getLenChar(texts) {
    texts = texts + '';
    return String.fromCharCode(texts.length);
}
function checkSpace(str) {
    if (str.search(/\s/) != -1) {
        return true;
    } else {
        return false;
    }
}
function isValidPasswd(str) {
    var cnt = 0;
    if (str == "") {
        return false;
    }

    /* check whether input value is included space or not */
    var retVal = checkSpace(str);
    if (retVal) {
        return false;
    }
    if (str.length < 8) {
        return false;
    }
    for (var i = 0; i < str.length; ++i) {
        if (str.charAt(0) == str.substring(i, i + 1))
            ++cnt;
    }
    if (cnt == str.length) {
        return false;
    }

    var isPW = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[~!@#$%^&*<>?]).{8,16}$/;
    if (!isPW.test(str)) {
        return false;
    }

    return true;
}
var isShift = false;
function checkShiftUp(e) {
    if (e.which && e.which == 16) {
        isShift = false;
    }
}
function checkShiftDown(e) {
    if (e.which && e.which == 16) {
        isShift = true;
    }
}
function checkCapslock(e) {
    var myKeyCode = 0;
    var myShiftKey = false;
    if (window.event) { // IE
        myKeyCode = e.keyCode;
        myShiftKey = e.shiftKey;
    } else if (e.which) { // netscape ff opera
        myKeyCode = e.which;
        myShiftKey = isShift;
    }

    var oMsg = $("#pswd1Msg");
    if ((myKeyCode >= 65 && myKeyCode <= 90) && !myShiftKey) {
        showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
    } else if ((myKeyCode >= 97 && myKeyCode <= 122) && myShiftKey) {
        showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
    } else {
        hideMsg(oMsg);
    }
}

function checkCapslock2(e) {
    var myKeyCode = 0;
    var myShiftKey = false;
    if (window.event) { // IE
        myKeyCode = e.keyCode;
        myShiftKey = e.shiftKey;
    } else if (e.which) { // netscape ff opera
        myKeyCode = e.which;
        myShiftKey = isShift;
    }

    var oMsg = $("#pswd2Msg");
    if ((myKeyCode >= 65 && myKeyCode <= 90) && !myShiftKey) {
        showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
    } else if ((myKeyCode >= 97 && myKeyCode <= 122) && myShiftKey) {
        showErrorMsg(oMsg,"Caps Lock이 켜져 있습니다.");
    } else {
        hideMsg(oMsg);
    }
}
function setFocusToInputObject(obj) {
    if(submitFlag) {
        submitFlag = false;
        obj.focus();
    }
}
function showErrorMsg(obj, msg) {
    obj.attr("class", "error_next_box");
    obj.html(msg);
    obj.show();
}
function showSuccessMsg(obj, msg) {
    obj.attr("class", "error_next_box green");
    obj.html(msg);
    obj.show();
}
function hideMsg(obj) {
    obj.hide();
}
function success(obj){
	obj.attr("class", "int success");
}
function normal(obj){
	obj.attr("class", "int normal");
}
function fail(obj){
	obj.attr("class", "int fail");
}
function isValidDate(param) {
    try {
        param = param.replace(/-/g, '');

        // 자리수가 맞지않을때
        if (isNaN(param) || param.length != 8) {
            return false;
        }

        var year = Number(param.substring(0, 4));
        var month = Number(param.substring(4, 6));
        var day = Number(param.substring(6, 8));

        if (month < 1 || month > 12) {
            return false;
        }

        var maxDaysInMonth = [ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 ];
        var maxDay = maxDaysInMonth[month - 1];

        // 윤년 체크
        if (month == 2 && (year % 4 == 0 && year % 100 != 0 || year % 400 == 0)) {
            maxDay = 29;
        }

        if (day <= 0 || day > maxDay) {
            return false;
        }
        return true;

    } catch (err) {
        return false;
    }
}
function winOpenAtCenter(sURL, sWindowName, w, h, sScroll) {
    // 화면 중앙으로 Popup 띄우기.. 스크롤바는 옵션..
    // ex)
    // openWin("test.asp", "winTest", 400, 300); ☞ 스크롤바 없음
    // openWin("test.asp", "winTest", 400, 300, "yes"); ☞ 스크롤바 있음
    // openWin("test.asp", "winTest", 400, 300, "auto"); ☞ 스크롤바 자동

    var x = (screen.width - w) / 2;
    var y = (screen.height - h) / 2;

    if (sScroll == null)
        sScroll = "no";

    var sOption = "";
    sOption = sOption + "toolbar=no, channelmode=no, location=no, directories=no, resizable=no, menubar=no";
    sOption = sOption + ", scrollbars=" + sScroll + ", left=" + x + ", top=" + y + ", width=" + w + ", height=" + h;

    var win = window.open(sURL, sWindowName, sOption);
    return win;
}