<%@ include file="../include/session_check.jsp" %>
<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커피는 자바빈스</title>
	
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