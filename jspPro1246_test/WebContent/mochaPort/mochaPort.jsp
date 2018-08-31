<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>커피는 자바빈스</title>
	
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
						<img width="733px" height="auto" alt="" src="${path}/images/bgimg6.JPG">
						<br>
						<h2>모카포트, </h2>
						
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