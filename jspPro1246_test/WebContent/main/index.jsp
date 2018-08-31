<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>커피는 자바빈스</title>
	
<%-- <!-- 로그인 환영메시지  -->	
	<c:if test="${welcome != null }">
		<script>
    		alert("${welcome}님 반갑습니다.");
		</script>
	</c:if> --%>
	
</head>

<body>
	<div id="page">
	
	<%@ include file="../main/menu.jsp" %>
	
		<div id="content">
			<div id="content-inner">
			
				<div class="article">
				<div class="main-img">
					<img width="970" height="auto" alt="" src="${path}/images/bgimg1.JPG">
				</div>
					<h1>환영합니다. <span style="color: #7c654b">Java</span> <em style="color: #BCCE98">Beans</em> 입니다. </h1>
				</div>
	
				<div class="clr"></div>
			</div>
		</div>
		
		<div id="footerblurb">
			<%@ include file="footerblurb.jsp" %>
		</div>
			
		<footer id="footer">
			<%@ include file="footer.jsp" %>
		</footer>
	</div>
</body>

</html>