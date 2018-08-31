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
			machine_espresso();
			machine_grinder();
		});
	
		function machine_espresso() {
	
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=machine&p_option1=machine_espresso",
				success: function(result) {
					console.log(result);
					$("#machine_espresso").html(result);
				}
			});
		}
		
		function machine_grinder() {
			
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=machine&p_option1=machine_grinder",
				success: function(result) {
					console.log(result);
					$("#machine_grinder").html(result);
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
						<img width="733px" height="auto" alt="" src="${path}/images/bgimg5.JPG">
						<br>
						<h2>에스프레소 머신, </h2>
					
					</div>
					
						
<div class="product-list" id="wapper-machine_espresso">
	<h2>커피머신</h2>
	<div id="machine_espresso"></div>
</div>
									
<div class="product-list" id="wapper-machine_grinder">
	<h2>글라인더</h2>
	<div id="machine_grinder"></div>
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