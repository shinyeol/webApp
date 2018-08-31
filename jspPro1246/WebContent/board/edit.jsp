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
	$(function() {
		$("#btnList").click(function(){
	        location.href="${path}/board_servlet/list.do?b_type=${dto.b_type}";
	     });
	});
	
	function boardUpdate() {
		var form1 = $("#form1");
		var num = $("#num");
		var writer = $("#writer");
		var subject = $("#subject");
		var passwd = $("#passwd");
		var content = $("#content");
		var file1 = $("#file1");
		var b_type = $("#b_type").val();
		
		if(b_type == "") {
			alert("게시판 분류를 선택하세요.");
			$("#b_type").focus();
			return;
		}
		if(writer.val() == "") {
			alert("이름을 입력하세요");
			writer.focus();
			return;
		} if(subject.val() == "") {
			alert("제목을 입력하세요");
			email.focus();
			return;		
		} if(passwd.val() == ""){
			alert("비밀번호를 입력하세요");
			passwd.focus();
			return;
		}
		document.form1.action="${path}/board_servlet/update.do";
		document.form1.enctype="multipart/form-data";
		document.form1.submit();
	}
	
	function boardDelete() {
		if(confirm("삭제하시겠습니까?")) {
			document.form1.action = "${path}/board_servlet/delete.do?b_type=${b_type}";
			document.form1.submit();
		}
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
		<a href="#" class="btn-Type4" id="btnList">목&nbsp;&nbsp;록</a>
			
		<form name="form1" method="post">
		<table class="table-board">
				<colgroup>
					<col width="150px">
					<col width="*">
				</colgroup>
				<tbody>
					<tr>
						<th>게시판</th>
						<td style="font-weight: bold; text-align: left;">
							<c:choose>
								<c:when test="${dto.b_type == 'news'}">
									공지사항|뉴스
									<input class="write-input" type="hidden" id="b_type" name="b_type" value="${dto.b_type}">
								</c:when>
								<c:when test="${dto.b_type == 'product'}">
									상품관련
									<input class="write-input" type="hidden" id="b_type" name="b_type" value="${dto.b_type}">
								</c:when>
								<c:when test="${dto.b_type == 'order'}">
									주문관련
									<input class="write-input" type="hidden" id="b_type" name="b_type" value="${dto.b_type}">
								</c:when>
								<c:otherwise>
									자유게시판
									<input class="write-input" type="hidden" id="b_type" name="b_type" value="${dto.b_type}">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" name="writer" id="writer" readonly="readonly" class="write-input" value="${dto.writer }">
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" name="passwd" id="passwd" class="write-input">
						</td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td>
							<c:if test="${dto.filesize > 0 }">
								${dto.filename } (${dto.filesize / 1024} KB)
								<input type="checkbox" name="fileDel">첨부파일삭제<br>
							</c:if>
							<c:if test="${dto.filesize == 0 }">
								<input type="file" name="file1">
							</c:if>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="subject" id="subject" class="write-input" value="${dto.subject }">
						</td>
					</tr>
					<tr>
						<th colspan="2">본문</th>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="26" cols="100%" name="content" id="content">${dto.content }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="border-bottom-btn-wapper">
								<input type="hidden" name="num" value="${dto.num }">
								<input class="btn-Type5" type="button" value="취소" onclick="location.href='${path}/board_servlet/list.do?b_type=${dto.b_type}'">
								<input class="btn-Type5" id="btnUpdate" type="button" value="수정" onclick="boardUpdate()">
								<input class="btn-Type5" id="btnDelete" type="button" value="삭제" onclick="boardDelete()">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			</form>
		
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