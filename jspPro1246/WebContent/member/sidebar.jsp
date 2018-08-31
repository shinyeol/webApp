<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="widget">
	<h3>내정보</h3>
	<ul>
		<li><a href="#">내주문 관리</a></li>
		<li><a href="#">내게시물 관리</a></li>
		<li><a href="${path}/member_servlet/myinfo.do">수정 / 탈퇴</a></li>
	</ul>
</div>