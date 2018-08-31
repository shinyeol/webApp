<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script>
function sorry() {
	window.open("${path}/member_servlet/sorry.do", "sorry", "width=600px, height=400px, top=300px, left=650px");
}
</script>

<c:choose>
	<c:when test="${sessionScope.id =='admin00' }">
		<div class="feature-inner">
			<div id="inner-nav">
				<ul>
					<li><a href="${path}/product_servlet/bean.do">원두</a></li>
					<li><a href="${path}/product_servlet/machine.do">머신</a></li>
					<li><a href="${path}/product_servlet/mochaPort.do">모카포트</a></li>
					<li><a href="${path}/product_servlet/handDrip.do">핸드드립</a></li>
					<li><a href="${path}/product_servlet/utensils.do">관련용품</a></li>
					<li><a href="${path}/board_servlet/list.do?b_type=free">게시판</a></li>
					<li><a href="${path}/member_servlet/memberManage.do">회원관리</a></li>
					<li><a href="${path}/product_servlet/productManage.do">상품관리</a></li>
					<li><a href="#" onclick="sorry()">게시판관리</a></li>
<%-- 				<li><a href="${path}/board_servlet/boardManage.do">게시판관리</a></li> --%>

				</ul>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="feature-inner">
			<div id="inner-nav">
				<ul>
					<li><a href="${path}/product_servlet/bean.do">원두</a></li>
					<li><a href="${path}/product_servlet/machine.do">머신</a></li>
					<li><a href="${path}/product_servlet/mochaPort.do">모카포트</a></li>
					<li><a href="${path}/product_servlet/handDrip.do">핸드드립</a></li>
					<li><a href="${path}/product_servlet/utensils.do">관련용품</a></li>
					<li><a href="${path}/board_servlet/list.do?b_type=free">게시판</a></li>
				</ul>
			</div>
		</div>	
	
	</c:otherwise>
</c:choose>
