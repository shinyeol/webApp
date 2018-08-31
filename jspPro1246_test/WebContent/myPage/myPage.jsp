<%@ include file="../include/session_check.jsp" %>
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
   <div id="page">
   
	<%@ include file="../main/menu.jsp" %>
 
      <div id="content">
         <div id="content-inner">
            <div id="contentbar">
				<div class="article">
					
					
	<ul id="table-wrap">			
		<li>
			<div class="table-wrap-header">
				<h2 class="table-wrap-title" id="free_bulletin_board">주문내역</h2>
			</div>

			<table class="table-board">
				<tbody>
				<tr>
					<th>주문내역</th>
				</tr>
				
				<tr>
					<td>없음</td>
				</tr>
				</tbody>
			</table>
					
		</li>
	</ul>
					
					
					
				</div>
			</div>
				
				<nav id="sidebar">
					<%@ include file="sidebar.jsp" %>
				</nav>
            
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