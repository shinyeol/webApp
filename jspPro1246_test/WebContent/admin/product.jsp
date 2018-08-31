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
		$(function() {
			admin_beans_list();
			admin_machine_list();
			admin_mochaPort_list();
			admin_handDrip_list();
			admin_utensils_list();
		});
	
		function admin_beans_list() {
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productManageList.do?p_type=bean",
				success: function(result) {
					console.log(result);
					$("#admin_beans_list").html(result);
				}
			});
		}
		
		function admin_machine_list() {
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productManageList.do?p_type=machine",
				success: function(result) {
					console.log(result);
					$("#admin_machine_list").html(result);
				}
			});
		}
		
		function admin_mochaPort_list() {
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productManageList.do?p_type=mochaPort",
				success: function(result) {
					console.log(result);
					$("#admin_mochaPort_list").html(result);
				}
			});
		}
		
		function admin_handDrip_list() {
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productManageList.do?p_type=handDrip",
				success: function(result) {
					console.log(result);
					$("#admin_handDrip_list").html(result);
				}
			});
		}
		
		function admin_utensils_list() {
			$.ajax({
				type: "post",
				url: "${path}/product_servlet/productManageList.do?p_type=utensils",
				success: function(result) {
					console.log(result);
					$("#admin_utensils_list").html(result);
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
            <div class="content-login">
 
 
 				<div class="content-beans-topImg">
					<h2>상품관리 페이지 </h2>
				</div>
					
				<script>
					$(function() {
						$("#btnWrite").click(function() {
							location.href="${path}/product_servlet/write.do";
						});
					});
				</script>
				
				<div>
					<button class="btn-Type3" id="btnWrite">상품등록</button>
				</div>
						
				<div class="product-list" id="admin_wapper-beans">
					<h2>원두</h2>
					<div id="admin_beans_list"></div>
				</div>
													
				<div class="product-list" id="admin_wapper-machine">
					<h2>머신</h2>
					<div id="admin_machine_list"></div>
				</div>	
										
				<div class="product-list" id="admin_wapper-mochaPort">
					<h2>모카포트</h2>
					<div id="admin_mochaPort_list"></div>
				</div>
				
				<div class="product-list" id="admin_wapper-handDrip">
					<h2>핸드드립</h2>
					<div id="admin_handDrip_list"></div>
				</div>
				
				<div class="product-list" id="admin_wapper-utensils">
					<h2>관련용품</h2>
					<div id="admin_utensils_list"></div>
				</div>
 
	
   			</div>
   			
   			
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