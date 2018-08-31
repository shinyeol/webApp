<%@ include file="../include/session_check.jsp" %>
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
		function checkPasswd() {
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
			document.form1.action="${path}/member_servlet/myinfoCheck.do";
			document.form1.submit();
		}
	</script>
	
	<c:if test="${param.message == 'error' }">
		<script>
    		alert("비밀번호가 일치하지 않습니다.");
		</script>
	</c:if>	
</head>
<body>
   <div id="page">
   
	<%@ include file="../main/menu.jsp" %>
 
      <div id="content">
         <div id="content-inner">
            <div id="contentbar">
				<div class="article">
					
					
	<ul id="table-wrap">			
		<li>
			<div class="table-wrap-header">
				<h2 class="table-wrap-title" id="free_bulletin_board">회원정보 수정을 위한 비밀번호 재확인</h2>
			</div>
			
			<form method="post" name="form1">
			<table class="table-board" id="table-myinfo">	
				<tbody>
				<tr>
					<td>아이디</td>
					<td align="left">${sessionScope.id}</td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td align="left">
						<input type="password" name="passwd" id="passwd">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input type="hidden" name="id" id="id" value="${sessionScope.id}">
						<input style="float: none;" class="btn-Type3" type="button" value="제출" onclick="checkPasswd()">
					</td>
				</tr>
				</tbody>
			</table>
			</form>		
		</li>
	</ul>
					
					
					
				</div>
			</div>
				
				<nav id="sidebar">
					<%@ include file="sidebar.jsp" %>
				</nav>
            
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