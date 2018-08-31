<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:if test="${sessionScope.name == null }">
  <script>
    alert("로그인하신 후 사용하세요.");
    location.href="${path}/member_servlet/login.do";
  </script>
</c:if>

<%-- <%@ page import="java.net.URLEncoder" %>

<% 
String userEmail = (String)session.getAttribute("userEmail");
if(userEmail==null) {
	String message = "먼저 로그인 하신 후 사용 가능 합니다.";
	message = URLEncoder.encode(message, "utf-8");
	
	response.sendRedirect("login.jsp?message="+message);
}
%> --%>