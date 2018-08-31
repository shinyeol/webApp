<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="widget">
<script>
function sorry() {
	window.open("${path}/member_servlet/sorry.do", "sorry", "width=600px, height=400px, top=300px, left=650px");
}
</script>
	<h3>내정보</h3>
	<ul>
		<li><a href="#" onclick="sorry()">내주문 관리</a></li>
		<li><a href="${path}/board_servlet/myBoard.do?writer=${sessionScope.id}">내게시물 관리</a></li>
		<li><a href="${path}/member_servlet/myinfo.do">수정 / 탈퇴</a></li>
	</ul>
</div>