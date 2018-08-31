<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="widget">
	<h3>게시판</h3>
	<ul>
		<li><a href="${path}/board_servlet/list.do?b_type=news">공지사항 | 뉴스</a></li>
		<li><a href="${path}/board_servlet/list.do?b_type=product">상품관련 게시판</a></li>
		<li><a href="${path}/board_servlet/list.do?b_type=order">주문관련 문의</a></li>
		<li><a href="${path}/board_servlet/list.do?b_type=free">자유 게시판</a></li>
	</ul>
</div>