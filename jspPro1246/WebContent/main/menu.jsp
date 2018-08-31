<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String name = (String)session.getAttribute("name");
	
	if(name==null || name=="") { %>
		<header id="header">
			<%@ include file="header.jsp" %>
		</header>
		
		<div class="feature">
			<%@ include file="feature.jsp" %>
		</div>
	<% } else { %>
		<header id="header">
			<%@ include file="header_logOn.jsp" %>
		</header>
		
		<div class="feature">
			<%@ include file="feature_logOn.jsp" %>
		</div>
	<% } 
%>	