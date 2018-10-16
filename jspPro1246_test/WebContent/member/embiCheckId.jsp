<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커피는 자바빈스</title>
	<script>
		function embiCheckId() {
			var id = $("#id").val();

			if(id == "") {
				alert("아이디를 입력해주세요.");
				document.form_login.id.focus();
				return;
			}
			var regId = /^[a-z0-9][a-z0-9]{4,19}$/;
			if (!regId.test(id)) {
				alert("유효하지 않은 아이디입니다.");
				document.joinForm.id.focus();
				return;
			}
			document.form_login.action="${path}/member_servlet/embiCheckId.do";
			document.form_login.submit();
		}
		
		function sendCheckValue() {
			opener.document.joinForm.idDuplication.value ="idCheck";
			opener.document.joinForm.id.value = document.getElementById("id").value;
			if (opener != null) {
		    	opener.chkForm = null;
		    	self.close();
			}	
		}
	</script>

</head>
<body>
<div style="text-align: center;">     
	<br><br>
	<h3>아이디 중복확인</h3>
	<br><br>
	
	<form name="form_login" method="post">
		<div class="input-td" style="text-align: center;">
			<input class="input-join" id="id" name="id" placeholder="아이디 (영문/숫자 포함 4자 이상 12자 이내)" value="${param.id}">
		</div>
			<c:if test="${param.message == 'embi' }">
			  	<div id="msg">사용중인 아이디입니다.</div>
			  	<input class="btn-Type4" type="button" value="아이디 중복확인" onclick="embiCheckId()">
			</c:if>
			<c:if test="${param.message == 'uniq' }">
			  	<div id="msg">사용 가능한 아이디입니다.</div>
			  	<input class="btn-Type4" type="button" value="아이디 사용" onclick="sendCheckValue()">
			</c:if>
			<c:if test="${param.message == null }">
			  	<div id="msg"></div>
			  	<input class="btn-Type4" type="button" value="아이디 중복확인" onclick="embiCheckId()">
			</c:if>
	 	<br><br>
	</form>
</div>           
</body>

</html>