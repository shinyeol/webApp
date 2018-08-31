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
		$("#btnWrite").click(function() {
			location.href="${path}/board_servlet/write.do?b_type=${b_type}";
		});
	});
	
	function list(curPage) {
		location.href="${path}/board_servlet/list.do?b_type=${b_type}&curPage="+curPage;
	}
	</script>
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
				<h2 class="table-wrap-title" id="free_board">내가 쓴 게시물 (${count}개)</h2>
			</div>

			<table class="table-board">
				<tbody>
				<tr>
					<th style="width: 15%;">게시판 분류</th>
					<th style="width: 13%;">이름</th>
					<th style="width: 42%;text-align: left;">제목</th>
					<th style="width: 13%">날짜</th>
					<th style="width: 7%;">첨부</th>
					<th style="width: 10%;">조회수</th>
				</tr>
				
				<c:forEach var="dto" items="${list}">
<c:choose>
	<c:when test="${dto.show == 'y' }">				
				<tr>
				<c:choose>
					<c:when test="${dto.b_type == 'news'}">
						<td style="font-weight: bold;">공지사항|뉴스</td>
					</c:when>
					<c:when test="${dto.b_type == 'product'}">
						<td style="font-weight: bold;">상품관련</td>
					</c:when>
					<c:when test="${dto.b_type == 'order'}">
						<td style="font-weight: bold;">주문관련</td>
					</c:when>
					<c:otherwise>
						<td style="font-weight: bold;">자유게시판</td>
					</c:otherwise>
				</c:choose>
					<td>${dto.writer}</td>
					<td style="text-align: left;">
						<c:forEach var="i" begin="1" end="${dto.re_level }">
							&nbsp;&nbsp;
						</c:forEach>
						
						<a id="border-content-subject" href="${path}/board_servlet/view.do?num=${dto.num}">${dto.subject}</a>
						<c:if test="${dto.comment_count > 0 }">
							<span style="color: #977a5b;">(${dto.comment_count })</span>
						</c:if>
					</td>
					<td>${dto.reg_date}</td>
					<td align="center">
						<c:if test="${dto.filesize > 0 }">
							<a href="${path }/board_servlet/download.do?num=${dto.num}">
								<img title="${dto.filename } ( ${dto.filesize } bytes )" class="icon-download" alt="" src="../images/file.png">
							</a>
						</c:if>	
					<td>${dto.readcount}</td>
				</tr>
				
</c:when>
	<c:otherwise>
		<tr>
			<c:choose>
					<c:when test="${b_type == 'news'}">
						<td style="font-weight: bold;">공지사항|뉴스</td>
					</c:when>
					<c:when test="${b_type == 'product'}">
						<td style="font-weight: bold;">상품관련</td>
					</c:when>
					<c:when test="${b_type == 'order'}">
						<td style="font-weight: bold;">주문관련</td>
					</c:when>
					<c:otherwise>
						<td style="font-weight: bold;">자유게시판</td>
					</c:otherwise>
				</c:choose>
			<td colspan="6" align="center">삭제된 게시물입니다.</td>
		</tr>
	</c:otherwise>
</c:choose>
					
				</c:forEach>
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
