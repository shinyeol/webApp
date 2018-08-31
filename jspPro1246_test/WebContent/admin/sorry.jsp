<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커피는 자바빈스</title>
</head>
<body>
<div style="text-align: center; margin-top: 100px;">   
<h3>
	<span style="color: black; font-size: 15px; font-style: italic;">
		${sessionScope.name}
	</span>님 불편을 드려 죄송합니다. 
	<br><br>준비 중인 페이지입니다.
	<br><br><br>
	<input class="btn-Type4" type="button" value="닫기" onclick="window.close();">
</h3>
</div>
</body>
</html>