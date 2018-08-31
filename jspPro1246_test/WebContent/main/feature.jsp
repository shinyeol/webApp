<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- <script> 
$(document).ready(function() {
	$("#inner-nav-bean").hide();
	
    $("#bean").hover(function() {
		$("#inner-nav-bean").slideDown();
	});
    
	$("#inner-nav-bean").mouseleave(function(){
		$("#inner-nav-bean").slideUp();
	});

});
</script> -->
	
<div class="feature-inner">
	<div id="inner-nav">
		<ul>
			<li id="bean"><a href="${path}/product_servlet/bean.do">원두</a></li>
			<li><a href="${path}/product_servlet/machine.do">머신</a></li>
			<li><a href="${path}/product_servlet/mochaPort.do">모카포트</a></li>
			<li><a href="${path}/product_servlet/handDrip.do">핸드드립</a></li>
			<li><a href="${path}/product_servlet/utensils.do">관련용품</a></li>
			<li><a href="${path}/board_servlet/list.do?b_type=free">게시판</a></li>
		</ul>
	</div>
	
<%-- 	<div id="inner-nav-bean">
		<ul>
			<li><a href="${path}/product_servlet/bean.do">원두</a></li>
			<li><a href="${path}/product_servlet/machine.do">머신</a></li>
			<li><a href="${path}/product_servlet/mochaPort.do">모카포트</a></li>
			<li><a href="${path}/product_servlet/handDrip.do">핸드드립</a></li>
			<li><a href="${path}/product_servlet/utensils.do">관련용품</a></li>
			<li><a href="${path}/board_servlet/list.do?b_type=free">게시판</a></li>
		</ul>
	</div> --%>
</div>

	

	
