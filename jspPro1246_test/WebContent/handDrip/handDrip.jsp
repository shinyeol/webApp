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
			handDrip_dripSet();
			handDrip_handmill();
			handDrip_siphon();
			handDrip_waterDrip();
			handDrip_aeropress();
		});
	
		function handDrip_dripSet() {
	
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=handDrip&p_option1=handDrip_dripSet",
				success: function(result) {
					console.log(result);
					$("#handDrip_dripSet").html(result);
				}
			});
		}
		
		function handDrip_handmill() {
			
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=handDrip&p_option1=handDrip_handmill",
				success: function(result) {
					console.log(result);
					$("#handDrip_handmill").html(result);
				}
			});
		}

		function handDrip_siphon() {
			
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=handDrip&p_option1=handDrip_siphon",
				success: function(result) {
					console.log(result);
					$("#handDrip_siphon").html(result);
				}
			});
		}

		function handDrip_waterDrip() {
			
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=handDrip&p_option1=handDrip_waterDrip",
				success: function(result) {
					console.log(result);
					$("#handDrip_waterDrip").html(result);
				}
			});
		}

		function handDrip_aeropress() {
			
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=handDrip&p_option1=handDrip_aeropress",
				success: function(result) {
					console.log(result);
					$("#handDrip_aeropress").html(result);
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
						<img width="733px" height="auto" alt="" src="${path}/images/bgimg7.JPG">
						<br>
						<h2>핸드드립, </h2>
						
					</div>
					
						
<div class="product-list" id="wapper-handDrip_dripSet">
	<h2>드립세트</h2>
	<div id="handDrip_dripSet"></div>
</div>
									
<div class="product-list" id="wapper-handDrip_handmill">
	<h2>핸드밀</h2>
	<div id="handDrip_handmill"></div>
</div>

<div class="product-list" id="wapper-handDrip_siphon">
	<h2>사이폰</h2>
	<div id="handDrip_siphon"></div>
</div>

<div class="product-list" id="wapper-handDrip_waterDrip">
	<h2>워터드립</h2>
	<div id="handDrip_waterDrip"></div>
</div>

<div class="product-list" id="wapper-handDrip_aeropress">
	<h2>에어로프레스</h2>
	<div id="handDrip_aeropress"></div>
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