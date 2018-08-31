<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커피는 자바빈스</title>
<script>
function updatePasswd() {
	var passwd = document.joinForm.passwd.value;
	var passwdAgain = document.joinForm.passwdAgain.value;
	
	if(passwd == "") {
		alert("비밀번호를 입력해주세요.");
		document.joinForm.passwd.focus();
		return;
	}
	if(passwdAgain == "") {
		alert("비밀번호를 한 번 더 입력해주세요.");
		document.joinForm.passwdAgain.focus();
		return;
	}
	
	var regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
	if (!regPw.test(passwd)) {
        alert("유효하지 않은 비밀번호입니다.");
        document.joinForm.passwd.focus();
        return;
	}
   if(passwd!=passwdAgain) {
		alert("비밀번호 불일치");
		document.joinForm.passwdAgain.focus();
		return;
	}
   
	document.joinForm.action="${path}/member_servlet/updatePasswd.do";
	document.joinForm.submit();
}

function checkPasswd() {
	var transTextColor = document.getElementById("passwdConfirmArea");
	var passwd = document.joinForm.passwd.value;
	var regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
	
	if (!regPw.test(passwd)) {
		transTextColor.style.color = "red";
		document.getElementById("passwdConfirmArea").innerHTML = " 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
		document.joinForm.passwd.focus();
		return;
	}else {
		transTextColor.style.color = "green";
 		document.getElementById("passwdConfirmArea").innerHTML = " 유효한 비밀번호입니다.";
	}
}

function checkpasswdAgain() {
	var transTextColor = document.getElementById("passwdAgainConfirmArea");
	var passwd = document.joinForm.passwd.value;
	var passwdAgain = document.joinForm.passwdAgain.value;
   
	if(passwd!=passwdAgain) {
		transTextColor.style.color = "red";
		document.getElementById("passwdAgainConfirmArea").innerHTML = " 비밀번호 불일치";
		document.joinForm.passwdAgain.focus();
		return;
	} else {
		transTextColor.style.color = "green";
		document.getElementById("passwdAgainConfirmArea").innerHTML = " 비밀번호 일치";
	}
}
</script>
</head>
<body>
<div style="text-align: center; margin-top: 100px;">   
	<h3>새 비밀번호 설정</h3>
	<form name="joinForm" method="post">
		<div class="input-td" style="text-align: center;">
			<input class="input-join" id="id" readonly="readonly" name="id" value="${id}"><br>
			<br>
			<div>
            	<input class="input-join" type="password" name="passwd" id="passwd" onchange="checkPasswd()" placeholder="비밀번호 (문자/숫자 포함 4자 이상 12자 이내)">
            	<br><span style="font-size: 11px;" class="confirmArea" id="passwdConfirmArea"> </span>
            </div>
       
            <div>
            	<input class="input-join" type="password" name="passwdAgain" id="passwdAgain" onchange="checkpasswdAgain()" placeholder="비밀번호 확인">
            	<br><span style="font-size: 11px;" class="confirmArea" id="passwdAgainConfirmArea"> </span>
            </div>
		</div>
	 	
	 	<br><br><br><br><br><br>
	 	<input class="btn-Type4" type="button" value="비밀번호 변경" onclick="updatePasswd()">
	</form>
</div>
</body>
</html>