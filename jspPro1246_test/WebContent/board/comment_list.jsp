<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<c:set var="path" value="${pageContext.request.contextPath}" />   
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
            

<script type="text/javascript">
/* $(function() {
	$("#comment_btnDel").click(function() {
		if($("#passwd").val()=="") {
            alert("비밀번호를 입력하세요");
            passwd.focus();
            return;
         }
		if(confirm("삭제하시겠습니까?"))	{
	    	document.comment_form.action="";
	    	document.comment_form.submit();
		}
	 }); 
}); */
</script>
<body>
<c:forEach var="dto" items="${list}">
<form name="comment_form" method="post" action="${path}/board_servlet/commentDelete.do">
<table class="comment-table-wrap" style="width: 100%">
	<tr class="comment-header-wrap">
		<td class="comment-header-writer" style="width: 10%;">${dto.writer}<td>
		<td style="color: gray; font-size: 12px; width: 60%;">
			( <fmt:formatDate value="${dto.reg_date}" pattern="yyyy-MM-dd" /> )
		</td>
		<td style="width: 10%;">
			<input class="comment-input-passwd" id="passwd" name="passwd" type="password" placeholder="댓글 비밀번호">          		
		</td>
		<td class="comment-header-btn" style="width: 10%;">
			<input id="comment_num" name="comment_num" type="hidden" value="${dto.comment_num}">
			<input class="btn-Type4" type="submit" id="comment_btnDel" value="삭제">
		</td>
	</tr>
	<tr>
		<td colspan="3" class="comment-content-wrap">
			${dto.content}
		</td>
	</tr>
</table>
</form>
</c:forEach>
</body>
