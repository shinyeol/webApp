<%@ include file="../include/session_check.jsp" %>
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
		function view(id) {
			document.form.id.value = id;
			document.form.submit();
		}
		function list(curPage) {
			location.href="${path}/member_servlet/memberList.do?curPage="+curPage;
		}
	</script>
</head>
<body>
   <div id="page">
   
	<%@ include file="../main/menu.jsp" %>
      
      <div id="content">
         <div id="content-inner">
            <div class="content-login">
      
 				<ul id="table-wrap">			
		<li>
			<div class="table-wrap-header">
				<h2 class="table-wrap-title" id="free_bulletin_board">자바빈즈 회원관리 (회원수 : ${count}명)</h2>
			</div>

			<table class="table-board">
				<tbody>
				<tr>
					<th>가입일자</th>
					<th>아이디</th>
					<th>이름</th>
					<th>생년월일</th>
					<th>성별</th>
					<th>광고 수신 여부</th>
					<th> </th>
				</tr>
				
				<c:forEach var="dto" items="${list}">
				<tr>
					<td>
						<fmt:formatDate value="${dto.join_date}" pattern="yyyy-MM-dd"/>
					</td>
					<td>${dto.id}</td>
					<td>${dto.name}</td>
					<td>${dto.birth}</td>
					<td>${dto.sex}</td>
					<td>${dto.agreeAd}</td>
					<td>
						<button class="btn-Type4" id="btnView" onclick="view('${dto.id}')">상세정보</button>
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			
			<form name="form" method="post" action="${path}/member_servlet/member_view.do">
				<input type="hidden" name="id">
			</form>
	
			<div class="empty_30"></div>
			<div id="isReply"></div>
			<div class="empty_20"></div>
			
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
			
		</li>
	</ul>
            
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

	
 
 	