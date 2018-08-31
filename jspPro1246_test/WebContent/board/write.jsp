<%@ include file="../include/session_check.jsp" %>
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
		$("#btnSave").click(function() {
			var writer = $("#writer");
			var subject = $("#subject");
			var passwd = $("#passwd");
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
			}if(passwd.val() == "") {
				alert("비밀번호를 입력하세요");
				passwd.focus();
				return;
			}if(subject.val() == "") {
				alert("제목을 입력하세요");
				email.focus();
				return;		
			}
			document.form1.submit();
		});
		
		$("#btnCancel").click(function(){
			location.href="${path}/board_servlet/list.do?b_type=${b_type}";
		});
		$("#btnList").click(function(){
			location.href="${path}/board_servlet/list.do?b_type=${b_type}";
		});
	});
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
			
		<form name="form1" method="post" action="${path}/board_servlet/insert.do" enctype="multipart/form-data">
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
								<c:when test="${b_type == 'news'}">
									공지사항|뉴스
									<input class="write-input" type="hidden" id="b_type" name="b_type" value="${b_type}">
								</c:when>
								<c:when test="${b_type == 'product'}">
									상품관련
									<input class="write-input" type="hidden" id="b_type" name="b_type" value="${b_type}">
								</c:when>
								<c:when test="${b_type == 'order'}">
									주문관련
									<input class="write-input" type="hidden" id="b_type" name="b_type" value="${b_type}">
								</c:when>
								<c:otherwise>
									자유게시판
									<input class="write-input" type="hidden" id="b_type" name="b_type" value="${b_type}">
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<input type="text" name="writer" id="writer" class="write-input" readonly="readonly" value="${sessionScope.id}">
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
							<input type="file" name="file1" class="write-input">
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>
							<input type="text" name="subject" id="subject" class="write-input">
						</td>
					</tr>
					<tr>
						<th colspan="2">본문</th>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="26" cols="100%" name="content" id="content"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div id="border-bottom-btn-wapper">
								<input class="btn-Type1" type="button" value="취소" id="btnCancel">
								<input class="btn-Type1" type="button" value="확인" id="btnSave">
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