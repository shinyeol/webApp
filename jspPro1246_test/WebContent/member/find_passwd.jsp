<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커피는 자바빈스</title>
	<script>
		function passwdCheck() {
			var id = $("#id").val();
			var name = $("#name").val();
			var email = $("#email").val();
			var hp = $("#hp").val();
			
			if(id == "") {
				alert("아이디를 입력해주세요.");
				document.form_login.id.focus();
				return;
			}
			if(name == "") {
				alert("이름을 입력해주세요.");
				document.form_login.name.focus();
				return;
			}
			if(email == "") {
				alert("이메일을 입력해주세요.");
				document.form_login.email.focus();
				return;
			}
			if(hp == "") {
				alert("휴대전화 번호를 입력해주세요.");
				document.form_login.hp.focus();
				return;
			}
			document.form_login.action="${path}/member_servlet/passwdCheck.do";
			document.form_login.submit();
		}
	</script>
<c:if test="${param.message == 'error' }">
  <script>
    alert("일치하는 회원정보가 없습니다.");
  </script>
</c:if>
</head>
<body>
<div style="text-align: center;">     
	<br>
	<h3>비밀번호 찾기</h3>
	<br>
	
	<form name="form_login" method="post">
		<div class="input-td" style="text-align: center;">
			<input class="input-join" id="id" name="id" placeholder="아이디"><br>
			<input class="input-join" id="name" name="name" placeholder="이름"><br>
			<input class="input-join" id="email" name="email" placeholder="이메일"><br>
			<input class="input-join" type="tel" name="hp" id="hp" title="###-####-####" placeholder="휴대전화번호 (ex ###-####-####)">
		</div>
	 	<br><br><br><br><br><br>
	 	<input class="btn-Type4" type="button" value="비밀번호 찾기" onclick="passwdCheck()">
	</form>
</div>           
</body>

</html>