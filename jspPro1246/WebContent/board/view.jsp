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
      comment_list();
      $("#btn_commentSave").click(function() {
         if($("#writer").val()=="") {
            alert("이름을 입력하세요");
            writer.focus();
            return;
         }
         if($("#comment_passwd").val()=="") {
             alert("비밀번호를 입력하세요");
             comment_passwd.focus();
             return;
          }
         if($("#comment_content").val()=="") {
 			alert("내용을 입력하세요");
 			comment_content.focus();
 			return;
 		} 
         comment_add();
      });
      
      $("#btnList").click(function() {
         location.href="${path}/board_servlet/list.do?b_type=${dto.b_type}";
      });
      $("#btnReply").click(function() {
         document.form1.action="${path}/board_servlet/reply.do";
         document.form1.submit();
      });
   });
   
	function comment_list() {
		$.ajax({
			type: "post",
			url: "${path}/board_servlet/commentList.do",
			data: "num=${dto.num}",
			success: function(result) {
				$("#commentList").html(result);
			}
		}); 
	}
   
   function comment_add() {
      var param = "board_num=${dto.num}&writer="
      +$("#writer").val()+"&passwd="+$("#comment_passwd").val()+
      "&content="+$("#comment_content").val();
      $.ajax({
         type: "post",
         url: "${path}/board_servlet/comment_add.do",
         data: param,
         success: function(result) {
            $("#writer").val("");
            $("#comment_passwd").val("");
            $("#comment_content").val("");
            comment_list();
         }
      });
   }
   </script>
   
<c:if test="${param.comment_message == 'error' }">
	<script>
		alert("댓글 비밀번호가 일치하지 않습니다.");
	</script>
</c:if>
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

      <form name="form1" method="post" action="${path}/board_servlet/passwd_check.do?b_type=${b_type}">
      <table class="table-board">
         <colgroup>
            <col width="10%">
            <col width="13%">
            <col width="42%">
            <col width="13%">
            <col width="12%;">
            <col width="10%">
         </colgroup>
         <tbody>
            <tr>
               <td>번호</td>
               <td>이름</td>
               <td>제목</td>
               <td>날짜</td>
               <td>첨부</td>
               <td>조회수</td>
            </tr>
            
            <tr>
               <td>${dto.num }</td>
               <td>${dto.writer }</td>
               <td>${dto.subject }</td>
               <td>${dto.reg_date }</td>
               <td>
                  <c:if test="${dto.filesize > 0 }">
                     <a href="${path }/board_servlet/download.do?num=${dto.num}">
                     	<img title="${dto.filename }( ${dto.filesize } bytes )" class="icon-download" alt="" src="../images/file.png">
                     </a>
                  </c:if>
               </td>
               <td>${dto.readcount }</td>
            </tr>
            <tr>
               <td class="board-content-wrap" colspan="6">
                  <div id="board-content">${dto.content }</div>
               </td>
            </tr>
            <tr>
				<td colspan="4">
                  <div id="border-bottom-btn-wapper">
					<input type="hidden" name="num" value="${dto.num }">
					<input style="height: 30px; width: 120px;float: right;" placeholder="비밀번호" type="password" name="passwd" id="passwd" class="write-input">
                  </div>
               </td>
               <td colspan="2">
                  <div id="border-bottom-btn-wapper">
                     <input class="btn-Type4" type="submit" id="btnEdit" value="수정 / 삭제">
                  </div>
               </td>
            </tr>
            <tr>
            	<td colspan="6" style="text-align: right;">
                     <c:if test="${param.message == 'error' }">
						<br><span style="color: red;">비밀번호를 정확히 입력해주세요.</span>
					</c:if>            		
            	</td>
            </tr>
            <tr>
               <td colspan="6">
                  <div id="border-bottom-btn-wapper">
                     <input class="btn-Type4" type="button" id="btnReply" value="답변">
                  </div>
               </td>
            </tr>
            
<!-- 댓글 시작 -->
            <tr>
               <td colspan="6">
                  <div class="board_content_reply_wrap">
                     <div id="commentList"></div>
                  </div>
               </td>
            </tr>
         </tbody>
      </table>
      </form>

      <div class="empty_50"></div>
         
      <table class="table_type06">
         <tr>
			<td>
				<input id="writer" placeholder="id" readonly="readonly" value="${sessionScope.id}"> 
				<input id="comment_passwd" type="password" placeholder="비밀번호"> 
				<button class="btn-Type2" id="btn_commentSave" type="button">확인</button>
            </td>
         </tr>
         <tr>
            <td>
               <textarea rows="7" cols="100%" id="comment_content" placeholder="내용을 입력하세요."></textarea>
            </td>
         </tr>
      </table>
         
      <div class="empty_50"></div>
<!-- 댓글 끝 -->

         
<!-- 게시글 보기 하단 목록 시작 -->
      <div class="empty_20"></div>
         
      <div class="paging_wrap">
         
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