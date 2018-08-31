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
			utensils_cup();
			utensils_tea();
			utensils_syrup();
			utensils_etc();
		});
	
		function utensils_cup() {
	
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=utensils&p_option1=utensils_cup",
				success: function(result) {
					console.log(result);
					$("#utensils_cup").html(result);
				}
			});
		}
		
		function utensils_tea() {
			
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=utensils&p_option1=utensils_tea",
				success: function(result) {
					console.log(result);
					$("#utensils_tea").html(result);
				}
			});
		}
		
		function utensils_syrup() {
			
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=utensils&p_option1=utensils_syrup",
				success: function(result) {
					console.log(result);
					$("#utensils_syrup").html(result);
				}
			});
		}
		
		function utensils_etc() {
			
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=utensils&p_option1=utensils_etc",
				success: function(result) {
					console.log(result);
					$("#utensils_etc").html(result);
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
						<img width="733px" height="auto" alt="" src="${path}/images/bgimg8.JPG">
						<br>
						<h2>관련용품, </h2>
						
					</div>
								
<div class="product-list" id="wapper-utensils_cup">
	<h2>커피잔</h2>
	<div id="utensils_cup"></div>
</div>
									
<div class="product-list" id="wapper-utensils_tea">
	<h2>차</h2>
	<div id="utensils_syrup"></div>
</div>

<div class="product-list" id="wapper-utensils_syrup">
	<h2>시럽</h2>
	<div id="utensils_syrup"></div>
</div>	

<div class="product-list" id="wapper-utensils_etc">
	<h2>기타용품</h2>
	<div id="utensils_etc"></div>
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