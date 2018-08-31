<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커피는 자바빈스</title>
	<script type="text/javascript">
		var bodyText=["아라비카 원두 100%, 품질 좋은 원두를 직접 로스팅합니다.", 
			"다양한 커피용품을 만나보세요.", 
			"에스프레소 머신부터 핸드드립 용품까지, 유명 브랜드를 비교해서 구입하세요.", 
			"선주문 후로스팅 시스템으로 갓볶은 원두를 집으로..", 
			"</p><p>커피는 맥심.", 
			"날 쏘고 가라.", 
			"<h3>제목</h3><p>커피 앤 티 엔드 자바 앤 미. 어컵 어컵 어컵 어컵. 자바빈즈 로스터리 커피용품점."]
		function generateText(sentenceCount){
			for (var i=0; i<sentenceCount; i++)
			document.write(bodyText[Math.floor(Math.random()*7)]+" ")
		}
	</script>

	<script>
		function loginCheck() {
			var id = $("#id").val();
			var passwd = $("#passwd").val();
			
			if(id == "") {
				alert("아이디를 입력해주세요.");
				document.form_login.id.focus();
				return;
			}
			if(passwd == "") {
				alert("비밀번호를 입력해주세요.");
				document.form_login.passwd.focus();
				return;
			}
			document.form_login.action="${path}/member_servlet/loginCheck.do";
			document.form_login.submit();
		}
		function findingId() {
			window.open("${path}/member_servlet/findingId.do", "findingId", "width=600px, height=400px, top=300px, left=650px");
		}
		function findingPasswd() {
			window.open("${path}/member_servlet/findingPasswd.do", "findingPasswd", "width=600px, height=400px, top=300px, left=650px");
		}
	</script>

<c:if test="${param.message == 'error' }">
  <script>
    alert("아이디 또는 비밀번호가 일치하지 않습니다.");
  </script>
</c:if>

<c:if test="${param.message == 'logout' }">
  <script>
    alert("로그아웃 되었습니다.");
  </script>
</c:if>

<c:if test="${param.message == 'withdraw' }">
  <script>
    alert("정상적으로 탈퇴처리 되었습니다.");
  </script>
</c:if>

</head>
<body>
   <div id="page">
   
	<%@ include file="../main/menu.jsp" %>
      
      <div id="content">
         <div id="content-inner">
            <div class="content-login">
            
            
	<br><br>
	<h3>로그인해서 더 많은 혜택을 누리세요.</h3>
	<br><br>
	
	<form name="form_login" method="post">
		<div class="input-td" style="text-align: center;">
			<input class="input-join" id="id" name="id" placeholder="아이디"><br>
			<input class="input-join" type="password" id="passwd" name="passwd" placeholder="비밀번호">		
		</div>
	 	<br><br>
	 	<input class="btn-Type1" type="button" value="로그인" onclick="loginCheck()">
		<div class="signinQ">
			<h4>아이디나 비밀번호를 잊어버렸나요?</h4><a class="aInsignin" href="#" onclick="findingId()">아이디 찾기</a> 
			/ <a class="aInsignin" href="#" onclick="findingPasswd()">비밀번호 찾기</a>
		</div>
		<div class="signinQ">
			<h4>아직 자바빈즈의 회원이 아니신가요?</h4><a class="aInsignin" href="${path}/member_servlet/join.do">회원가입</a>
		</div>
	</form>
            
   			</div>
            
            <div class="clr"></div>
         </div>
      </div>
      <br><br><br><br><br><br><br><br>
      
      <div id="footerblurb">
         <%@ include file="../main/footerblurb.jsp" %>
      </div>
         
      <footer id="footer">
         <%@ include file="../main/footer.jsp" %>
      </footer>
   </div>
</body>

</html>