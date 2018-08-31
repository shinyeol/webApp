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
			$("#btnUpdate").click(function() {
				var id = document.form1.id.value;
				var email = document.form1.email.value;
				var passwd = document.form1.passwd.value;
				var name = document.form1.name.value;
				var sex = document.form1.sex.value;
				var birth = document.form1.birth.value;
				var hp = document.form1.hp.value;
				var addr = document.form1.addr.value;
				var addrDetail = document.form1.addrDetail.value;
				var zip = document.form1.zip.value;
			   
				if(email == "") {
					alert("이메일을 입력해주세요.");
					document.form1.email.focus();
					return;
				}
				if(passwd == "") {
					alert("비밀번호를 입력해주세요.");
					document.form1.passwd.focus();
					return;
				}
				if(name == "") {
					alert("이름을 입력해주세요.");
					document.form1.name.focus();
					return;
				}
				if(hp == "") {
					alert("휴대전화 번호를 입력해주세요.");
					document.form1.hp.focus();
					return;
				}   
				if(sex == "") {
					alert("성별을 선택해주세요.");
					document.form1.sex.focus();
					return;
			    }
				if(birth == "") {
					alert("생년월일을 입력해주세요.");
					document.form1.birth.focus();
					return;
			    }
				if(addr == "") {
					alert("주소를 입력해주세요.");
					document.form1.addr.focus();
					return;
			    }
				if(addrDetail == "") {
					alert("상세 주소를 입력해주세요.");
					document.form1.addrDetail.focus();
					return;
				}
				if(zip == "") {
					alert("우편번호를 입력해주세요.");
					document.form1.zip.focus();
					return;
				}  
				var regEmail = /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
				if (!regEmail.test(email)) {
					alert("유효하지 않은 이메일입니다.");
					document.form1.email.focus();
					return;
				}
				var regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
				if (!regPw.test(passwd)) {
			        alert("유효하지 않은 비밀번호입니다.");
			        document.form1.passwd.focus();
			        return;
				}
				var regname = /^[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{3,10}$/;
				if (!regname.test(name)) {
					alert("유효하지 않은 이름입니다.");
					document.form1.name.focus();
					return;
				}
				var reghp = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
				if (!reghp.test(hp)) {
					alert("유효하지 않은 번호입니다.");
					document.form1.hp.focus();
					return;
				}
	
				function getToday() {
					var today = new Date();
					var year = today.getFullYear();
					var month = today.getMonth()+1;
					var day = today.getDate();
				          
					if(month<10) month = "0"+month;
					if(day<10) day = "0"+day;
				         
					var today = year+"-"+month+"-"+day;
					return today;
				}
				   
				var birth = document.form1.birth.value;
				if(getToday() < birth) {
					alert("혹시 미래에서 오신 그 분?");
					document.form1.birth.focus();
					return;
				}
					
				if(confirm("수정하시겠습니까?")) {
					document.form1.action="${path}/member_servlet/member_update.do";
					document.form1.submit();
				}
			});
			
			$("#btnDelete").click(function() {
				if(confirm("탈퇴하시겠습니까?")) {
					document.form1.action="${path}/member_servlet/withdraw.do";
					document.form1.submit();
				}
			});
			
			$("#btnList").click(function() {
				location.href="${path}/member_servlet/myPage.do";
			});
		});
	</script>
	
	<script>
	function checkId() {
		var transTextColor = document.getElementById("idConfirmArea");
		var id = document.form1.id.value;
		var regId = /^[a-z0-9][a-z0-9]{4,19}$/;
		   
		if (!regId.test(id)) {
			transTextColor.style.color = "red";
			document.getElementById("idConfirmArea").innerHTML = " 유효하지 않은 아이디입니다.";
			document.form1.id.focus();
			return;
		}else {
			transTextColor.style.color = "green";
			document.getElementById("idConfirmArea").innerHTML = " 유효한 아이디입니다.";
		}
	}

	function checkEmail() {
		var transTextColor = document.getElementById("emailConfirmArea");
		var email = document.form1.email.value;
		var regEmail = /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
	   
		if (!regEmail.test(email)) {
			transTextColor.style.color = "red";
			document.getElementById("emailConfirmArea").innerHTML = " 유효하지 않은 이메일입니다.";
			document.form1.email.focus();
			return;
		}else {
			transTextColor.style.color = "green";
			document.getElementById("emailConfirmArea").innerHTML = " 유효한 이메일입니다.";
		}
	}

	function checkPasswd() {
		var transTextColor = document.getElementById("passwdConfirmArea");
		var passwd = document.form1.passwd.value;
		var regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
		
		if (!regPw.test(passwd)) {
			transTextColor.style.color = "red";
			document.getElementById("passwdConfirmArea").innerHTML = " 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
			document.form1.passwd.focus();
			return;
		}else {
			transTextColor.style.color = "green";
	 		document.getElementById("passwdConfirmArea").innerHTML = " 유효한 비밀번호입니다.";
		}
	}

	function checkpasswdAgain() {
		var transTextColor = document.getElementById("passwdAgainConfirmArea");
		var passwd = document.form1.passwd.value;
		var passwdAgain = document.form1.passwdAgain.value;
	   
		if(passwd!=passwdAgain) {
			transTextColor.style.color = "red";
			document.getElementById("passwdAgainConfirmArea").innerHTML = " 비밀번호 불일치";
			document.form1.passwdAgain.focus();
			return;
		} else {
			transTextColor.style.color = "green";
			document.getElementById("passwdAgainConfirmArea").innerHTML = " 비밀번호 일치";
		}
	}

	function checkName() {
		var transTextColor = document.getElementById("nameConfirmArea");
		var name = document.form1.name.value;
		var regname = /^[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{3,10}$/;

		if (!regname.test(name)) {
			transTextColor.style.color = "red";
			document.getElementById("nameConfirmArea").innerHTML = " 유효하지 않은 이름입니다.";
			document.form1.name.focus();
			return;
		}else {
			transTextColor.style.color = "green";
			document.getElementById("nameConfirmArea").innerHTML = " 유효한 이름입니다.";
		}
	}

	function checkHp() {
		var transTextColor = document.getElementById("hpConfirmArea");
		var hp = document.form1.hp.value;
		var reghp = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
	   
		if (!reghp.test(hp)) {
			transTextColor.style.color = "red";
			document.getElementById("hpConfirmArea").innerHTML = " 유효하지 않은 번호입니다.";
			document.form1.hp.focus();
			return;
		}else {
			transTextColor.style.color = "green";
			document.getElementById("hpConfirmArea").innerHTML = " 유효한 번호입니다.";
		}
	}

	function checkBirth() {
		var transTextColor = document.getElementById("birthConfirmArea");
	   
		function getToday() {
			var today = new Date();
			var year = today.getFullYear();
			var month = today.getMonth()+1;
			var day = today.getDate();
	          
			if(month<10) month = "0"+month;
			if(day<10) day = "0"+day;
	          
			var today = year+"-"+month+"-"+day;
			return today;
			}
	   
		var birth = document.form1.birth.value;
		if(getToday() < birth) {
			transTextColor.style.color = "red";
			document.getElementById("birthConfirmArea").innerHTML = " 혹시 미래에서 오신 그 분?";
			document.form1.birth.focus();
			return;
		}else {
			transTextColor.style.color = "green";
			document.getElementById("birthConfirmArea").innerHTML = " 유효한 생년월일입니다.";
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
			<div class="table-wrap-header">
				<h2 class="table-wrap-title" id="free_bulletin_board">회원정보 수정</h2>
			</div>
			
<form name="form1" method="post">
	 <table class="table-myinfo">
      <tr>
         <td>
            <div class="input-td">
            	<input width="300px" class="input-myinfo1" type="text" name="id" id="id" readonly="readonly" value="${sessionScope.id}">
            <br>
            </div><br>
         </td>
         <td>
            <div class="input-td">
            <input class="input-myinfo2" type="password" name="passwd" id="passwd" onchange="checkPasswd()" 
            	placeholder="비밀번호 (대문자/특수기호/숫자 포함 8자 이상 16자 이내)">
            <br><span class="confirmArea" id="passwdConfirmArea"> </span>
            </div><br>
		</td>
	</tr>
	<tr>
		<td>
            <div class="input-td">
            <input class="input-myinfo1" type="text" name="name" id="name" onchange="checkName()" 
            	placeholder="이름(한글만)" value="${sessionScope.name}">
            <br><span class="confirmArea" id="nameConfirmArea"> </span>
            </div><br>
		</td>
		<td>
            <div class="input-td">
            <input class="input-myinfo2" type="email" name="email" id="email" onchange="checkEmail()" 
            	placeholder="이메일(abc@def.com)" value="${sessionScope.email}">   
            <br><span class="confirmArea" id="emailConfirmArea"> </span>
            </div><br>
		</td>
	</tr>                 
	<tr>
         <td>
            <div class="tr-radio-birthday" style="width: 300px;">   
         	<c:if test="${sessionScope.sex == '남성'}">
				<label for="male">남성</label>
				<input type="radio" name="sex" id="male" value="male" checked="checked">
				<label for="female">여성</label>
				<input type="radio" name="sex" id="female" value="female">
			</c:if>
				
			<c:if test="${sessionScope.sex == '여성'}">
				<label for="male">남성</label>
				<input type="radio" name="sex" id="male" value="male">
				<label for="female">여성</label>
				<input type="radio" name="sex" id="female" value="female" checked="checked">
			</c:if>
            </div><br><br>
         </td>
         <td>
            <div class="tr-radio-birthday" style="width: 420px;">
            	<label for="fbirthday"> 생년월일</label> 
            	<input style="width: 300px;" type="date" name="birth" id="birth" onchange="checkBirth()" value="${sessionScope.birth}">
            	<br><span class="confirmArea" id="birthConfirmArea"> </span>
            </div><br><br>
         </td>
      </tr>              
      <tr>
		<td>
            <div class="input-td">
            <input class="input-myinfo1" type="tel" name="hp" id="hp" onchange="checkHp()" 
				placeholder="휴대전화번호 (ex ###-####-####)" value="${sessionScope.hp}">
            <br><span class="confirmArea" id="hpConfirmArea"> </span>
            </div><br>
		</td>
         <td>
            <div class="input-td">
            <input class="input-myinfo2" type="text" name="addr" id="addr" placeholder="주소 (ex 서울시 강동구)" 
            	value="${sessionScope.addr}">
            </div><br>
         </td>
      </tr>         
      <tr>
         <td>
            <div class="input-td">
            <input class="input-myinfo1" type="text" name="zip" id="zip" placeholder="새우편번호 5자리"
            	value="${sessionScope.zip}">
            <span class="confirmArea" id="zipConfirmArea"> </span>
            </div><br>
         </td>
         <td>
            <div class="input-td">
            <input class="input-myinfo2" type="text" name="addrDetail" id="addrDetail" 
            	placeholder="상세주소 (ex 천호대로 1095 현대코아 3층 )" value="${sessionScope.addrDetail}">
            </div><br>
         </td>
	</tr>
	<tr>
		<td>
			광고수신여부 |
			<c:if test="${sessionScope.agreeAd == 'y'}">
				<label for="agree">동의</label>
				<input type="radio" name="agreeAd" id="agree" value="y" checked="checked">
				<label for="disagree">거부</label>
				<input type="radio" name="agreeAd" id="disagree" value="n">
			</c:if>
				
			<c:if test="${sessionScope.agreeAd == 'n'}">
				<label for="agree">동의</label>
				<input type="radio" name="agreeAd" id="agree" value="y">
				<label for="disagree">거부</label>
				<input type="radio" name="agreeAd" id="disagree" value="n" checked="checked">
			</c:if>			
		</td>
		<td>
			가입일자 | <fmt:formatDate value="${sessionScope.join_date}" pattern="yyyy년 MM월 dd일"/>
		</td>
			
	</tr>       
	<tr>
		<td colspan="2">
			<br><br><br>
				<button class="btn-Type3" style="float: none;" type="button" id="btnList">목록</button>
		    	<button class="btn-Type3" style="float: none;" type="button" id="btnUpdate">수정</button>
		    	<button class="btn-Type3" style="float: none;" type="button" id="btnDelete">탈퇴</button>
		</td>
	</tr>   
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
