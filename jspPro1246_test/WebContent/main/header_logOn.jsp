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
	
	<script>
		function p_search() {
			var p_keyword = document.p_search_form.p_keyword.value;
			
			if(p_keyword == "" || p_keyword == null) {
				alert("검색어를 입력해주세요.");
				document.p_search_form.p_keyword.focus();
				return;
			}
			document.p_search_form.action="${path}/product_servlet/productSearch.do";
			document.p_search_form.submit();
		}
	</script>
	<form name="p_search_form" method="get">
	<div id="top-nav">
		<ul>
			<li><a href="${path}/member_servlet/myPage.do">${sessionScope.id}(${sessionScope.name})님 반가워요!</a></li>
			<li>|<a href="${path}/member_servlet/logout.do">로그아웃</a></li>			
			<li>|<a href="${path}/member_servlet/myPage.do">내정보</a></li>
			<li>|<a href="${path}/cart_servlet/list.do">장바구니</a></li>
			<li>| <input name="p_keyword" id="p_keyword" style="font-size: 12px;" placeholder=" 상품검색"> 
				<input class="btn-Type2" type="button" value="찾기" onclick="p_search()"></li>
		</ul>
	</div>
	</form>

	<div class="clr"></div>
</div>
