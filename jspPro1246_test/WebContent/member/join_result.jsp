<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커피는 자바빈스</title>
<script type="text/javascript">
function backToMain() {
	location.href = "${path}/main/index.jsp";
}
</script>

</head>
<body>
   <div id="page">
   
	<%@ include file="../main/menu.jsp" %>
      
      <div id="content">
         <div id="content-inner">
            <div class="content-join">
				<h2>${dto.name}님, 자바빈즈의 회원이 되신 걸 축하합니다.</h2>
				
				<table class="table-join-result">
				<tr>
					<th>아이디</th>
		        	<th>이메일</th>
		        	<th>이름</th>
		       		<th>성별</th>
		        	<th>생년월일</th>
		        	<th>휴대전화번호</th>
		        	<th>주소</th>
		        	<th>상세주소</th>
		        	<th>우편번호</th>
		        	<th>메일 수신 여부</th>
				</tr>
				<tr>
					<td>${dto.id}</td>
					<td>${dto.email}</td>
					<td>${dto.name}</td>
					<td>${dto.sex}</td>
					<td>${dto.birth}</td>
					<td>${dto.hp}</td>
					<td>${dto.addr}</td>
					<td>${dto.addrDetail}</td>
					<td>${dto.zip}</td>
					<td>${dto.agreeAd}</td>    
		        </tr>
		        <tr>
		        	<td colspan="10">
		        		<input class="btn-Type1" type="button" value="확인" onclick="backToMain()">
		        	</td>
		        </tr>
  				</table>
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