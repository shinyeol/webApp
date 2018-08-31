<%@ include file="../include/session_check.jsp" %>
<%@page import="member.dto.*"%>
<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커피는 자바빈스</title>

	<script>
		$(function() {
			$("#btnUpdate").click(function() {
				if($("#passwd").val() == "") {
					alert("비밀번호를 입력해주세요.");
					document.form_login.passwd.focus();
					return;
				}
				if(confirm("수정하시겠습니까?")) {
					document.member_view_form.action="${path}/member_servlet/member_update.do";
					document.member_view_form.submit();
				}
			});
			
			$("#btnDelete").click(function() {
				if(confirm("탈퇴처리 하시겠습니까?")) {
					document.member_view_form.action="${path}/member_servlet/member_delete.do";
					document.member_view_form.submit();
				}
			});
			
			$("#btnList").click(function() {
				location.href="${path}/member_servlet/memberManage.do";
			});
		});
	</script>
	
</head>
<body>
   <div id="page">
   
	<%@ include file="../main/menu.jsp" %>
      
      <div id="content">
         <div id="content-inner">
            <div class="content-login">
            
            
<div>
	<form name="member_view_form" method="post">
	<%	MemberDTO dto = (MemberDTO)request.getAttribute("dto"); %>

	<table style="width: 100%">
		<tr>
	 		<td>아이디</td>
			<td>${dto.id}</td>
		</tr>	
		<tr>
	 		<td>이름</td>
			<td>${dto.name}</td>
		</tr>
		<tr>
			<td>이메일</td>
			<td>${dto.email}</td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td>${dto.birth}</td>
		</tr> 
		<tr>
			<td>성별</td>
			<td>${dto.sex}</td>
		</tr> 
		<tr>
			<td>휴대전화</td>
			<td>${dto.hp}</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>${dto.addr}</td>
		</tr>
		<tr>
			<td>상세주소</td>
			<td>${dto.addrDetail}</td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td>${dto.zip}</td>
		</tr>
		<tr>
			<td>광고수신여부</td>
			<td>${dto.agreeAd}</td>
		</tr>
		<tr>
			<td>가입일자</td>
			<td>
				<fmt:formatDate value="${sessionScope.join_date}" pattern="yyyy년 MM월 dd일 a h시 mm분 ss초"/>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" name="id" value="${dto.id}">
				<input type="hidden" name="name" value="${dto.name}">
				<input type="hidden" name="email" type="email" value="${dto.email}">
				<input type="hidden" type="password" name="passwd" value="${dto.passwd}">
				<input type="hidden" name="birth" type="date" value="${dto.birth}">
				<input type="hidden" name="sex" value="${dto.sex}">
				<input type="hidden" name="hp" value="${dto.hp}">
				<input type="hidden" name="addr" value="${dto.addr}">
				<input type="hidden" name="addrDetail" value="${dto.addrDetail}">
				<input type="hidden" name="zip" value="${dto.zip}">
				<input type="hidden" name="agreeAd" value="${dto.agreeAd}">
				<input type="hidden" name="join_date" type="date" value="${dto.join_date}">
				<button class="btn-Type3" type="button" id="btnList" style="float: none;">목록</button>
<!-- 		    	<button type="button" id="btnUpdate">수정</button> -->
		    	<button class="btn-Type3" type="button" id="btnDelete" style="float: none;">탈퇴</button>
			</td>
		</tr>
	</table>
	</form>
</div>
            
   			</div>
            
            <div class="clr"></div>
         </div>
      </div>
      <br><br><br><br><br><br><br><br>
      
      <div id="footerblurb">
         <%@ include file="../main/footerblurb.jsp" %>
      </div>
         
      <footer id="footer">
         <%@ include file="../main/footer.jsp" %>
      </footer>
   </div>
</body>

</html>
