<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<div id="header-inner">
	<div id="logo">
		<h1>
			<a href="${path}/main/index.jsp"><img class="logoImg"
				src="${path}/images/logo2.png" alt=""></a><a href="${path}/main/index.jsp">JAVA<span> Beans</span></a>
		</h1>
	</div>

	<div id="top-nav">
		<ul>
			<li><a href="${path}/member_servlet/myPage.do">${sessionScope.id}(${sessionScope.name})님 반가워요!</a></li>
			<li>|<a href="${path}/member_servlet/logout.do">로그아웃</a></li>			
			<li>|<a href="${path}/member_servlet/myPage.do">내정보</a></li>
			<li>|<a href="${path}/cart_servlet/list.do">장바구니</a></li>
			<li>| <input type="text" placeholder=" 상품검색"> <input class="btn-Type2" type="button" value="찾기"></li>
		</ul>
	</div>

	<div class="clr"></div>
</div>
