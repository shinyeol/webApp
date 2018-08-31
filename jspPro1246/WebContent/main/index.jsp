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

<!-- 로그인 환영메시지  -->	
<%-- 	<c:if test="${welcome != null }">
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
					<h2>커피, </h2>
					<script>generateText(2)</script>
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