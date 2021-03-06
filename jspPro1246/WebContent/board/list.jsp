<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>커피는 자바빈스</title>
	
	<script type="text/javascript">
		var bodyText=["아라비카 원두 100%, 품질 좋은 원두를 직접 로스팅합니다.", 
			"다양한 커피용품을 만나보세요.", 
			"에스프레소 머신부터 핸드드립 용품까지, 유명 브랜드를 비교해서 구입하세요.", 
			"선주문 후로스팅 시스템으로 갓볶은 원두를 집으로..", 
			"</p><p>커피는 맥심.", 
			"날 쏘고 가라.", 
			"<h3>제목</h3><p>커피 앤 티 엔드 자바 앤 미. 어컵 어컵 어컵 어컵. 자바빈즈 로스터리 커피용품점."]
		function generateText(sentenceCount){
			for (var i=0; i<sentenceCount; i++)
			document.write(bodyText[Math.floor(Math.random()*7)]+" ")
		}
	</script>
	
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
			<div>
				<button class="btn-Type3" id="btnWrite">글쓰기</button>
			</div>
			<div class="table-wrap-header">
				<h2 class="table-wrap-title" id="free_board">게시판</h2>
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
			<td>자유게시판</td>
			<td colspan="6" align="center">삭제된 게시물입니다.</td>
		</tr>
	</c:otherwise>
</c:choose>
					
				</c:forEach>
				</tbody>
			</table>
			
			<div class="paging_wrap">
			<table style="width: 100%">
			<tr align="center">
				<td colspan="2">
				<ul>
		  			<c:if test="${page.curPage > 1}">
		        		<a class="btn-pagination" href="#" onclick="list('1')">처음</a>
		     		</c:if>
		     			 
		     		<c:if test="${page.curBlock > 1 }">
		        		<a class="btn-pagination" href="#" onclick="list('${page.prevPage}')">이전</a>
		     		</c:if>
		      		<c:forEach var="num" begin="${page.blockStart}" end="${page.blockEnd}">
		        		<c:choose>
		        			<c:when test="${num == page.curPage}">
		            			<div class="selectedPageNum">${num}</div>
							</c:when>
		          			<c:otherwise>
		           				<a class="btn-pagination" href="#" onclick="list('${num}')">${num}</a>
		          			</c:otherwise>
		        		</c:choose>
		      		</c:forEach>
		      		<c:if test="${page.curBlock < page.totBlock }">
		       			<a class="btn-pagination" href="#" onclick="list('${page.nextPage}')">다음</a>      
		      		</c:if>
		      		<c:if test="${page.curPage < page.totPage }">
		        		<a class="btn-pagination" href="#" onclick="list('${page.totPage}')">끝</a>
		      		</c:if>
		      	</ul>
				</td>
			</tr>
			</table>
			</div>
			
			<br>
			<div class="search_wrap">
			<table style="width: 100%">
			<tr align="center">
				<td>
<form name="form1" method="post" action="${path}/board_servlet/search.do?b_type=${b_type}">
<select name="search_option" id="search_option">
	<option value="searchAll" selected="selected">전체검색</option>
	<option value="subject">제목</option>
	<option value="writer">이름</option>
	<option value="content">내용</option>
</select>
<input name="keyword" id="keyword">
<button class="btn-Type4" id="btnSearch">검색</button>
</form>

				</td>
			</tr>
			</table>
			</div>
			
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
