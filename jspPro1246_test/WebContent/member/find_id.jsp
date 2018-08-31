<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커피는 자바빈스</title>
	<script>
		function idCheck() {
			var email = $("#email").val();
			var name = $("#name").val();
			
			if(email == "") {
				alert("이메일을 입력해주세요.");
				document.form_login.email.focus();
				return;
			}
			if(name == "") {
				alert("이름을 입력해주세요.");
				document.form_login.name.focus();
				return;
			}
			document.form_login.action="${path}/member_servlet/idCheck.do";
			document.form_login.submit();
		}
	</script>
	
<c:if test="${param.message == 'error' }">
  <script>
    alert("일치하는 아이디가 없습니다.");
  </script>
</c:if>
</head>
<body>
<div style="text-align: center;">     
	<br><br>
	<h3>아이디 찾기</h3>
	<br><br>
	
	<form name="form_login" method="post">
		<div class="input-td" style="text-align: center;">
			<input class="input-join" id="email" name="email" placeholder="이메일"><br>
			<input class="input-join" id="name" name="name" placeholder="이름">		
		</div>
	 	<br><br>
	 	<input class="btn-Type4" type="button" value="아이디 찾기" onclick="idCheck()">
	</form>
</div>           
</body>

</html>