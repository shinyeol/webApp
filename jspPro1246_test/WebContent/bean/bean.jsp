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
			bean_local();
			bean_special();
			bean_blending();
		});
	
		function bean_local() {
	
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=bean&p_option1=bean_local",
				success: function(result) {
					console.log(result);
					$("#bean_local").html(result);
				}
			});
		}
		
		function bean_special() {
			
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=bean&p_option1=bean_special",
				success: function(result) {
					console.log(result);
					$("#bean_special").html(result);
				}
			});
		}
		
		function bean_blending() {
			
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productListPerPage.do?p_type=bean&p_option1=bean_blending",
				success: function(result) {
					console.log(result);
					$("#bean_blending").html(result);
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
						<img width="733px" height="auto" alt="" src="${path}/images/bgimg.JPG">
						<br>
						<h2>원두, </h2>
						
					</div>
					
						
<div class="product-list" id="wapper-bean_local">
	<h2>지역별 원두</h2>
	<div id="bean_local"></div>
</div>
									
<div class="product-list" id="wapper-bean_special">
	<h2>스페셜 원두</h2>
	<div id="bean_special"></div>
</div>	
						
<div class="product-list" id="wapper-bean_blending">
	<h2>블렌딩별 원두</h2>
	<div id="bean_blending"></div>
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