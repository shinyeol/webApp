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
		$(function() {
			Bialetti();
			Ancap();
			ilsa();
		});
	
		function Bialetti() {
	
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/mochaPortList.do?p_type=mochaPort&p_option2=Bialetti",
				success: function(result) {
					console.log(result);
					$("#Bialetti").html(result);
				}
			});
		}
		
		function Ancap() {
			
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/mochaPortList.do?p_type=mochaPort&p_option2=Ancap",
				success: function(result) {
					console.log(result);
					$("#Ancap").html(result);
				}
			});
		}

		function ilsa() {
			
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/mochaPortList.do?p_type=mochaPort&p_option2=ilsa",
				success: function(result) {
					console.log(result);
					$("#ilsa").html(result);
				}
			});
		}		
	</script>
		
</head>

<body>
	<div id="page">
   
	<%@ include file="../main/menu.jsp" %>
	
		<div id="content">
			<div id="content-inner">
				<div id="contentbar">
					<div class="article">
					
					<div class="content-beans-topImg">
						<h2>커피, </h2>
						<script>generateText(2)</script>
					</div>
					
						
<div class="product-list" id="wapper-Bialetti">
	<h2>비알레띠</h2>
	<div id="Bialetti"></div>
</div>
									
<div class="product-list" id="wapper-Ancap">
	<h2>안캅</h2>
	<div id="Ancap"></div>
</div>	

<div class="product-list" id="wapper-ilsa">
	<h2>일사</h2>
	<div id="ilsa"></div>
</div>	
									
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