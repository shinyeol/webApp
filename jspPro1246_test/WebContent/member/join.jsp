<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커피는 자바빈스</title>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">

function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var fullAddr = ''; // 최종 주소 변수
            var extraAddr = ''; // 조합형 주소 변수
            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                fullAddr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                fullAddr = data.jibunAddress;
            }
            // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용
            document.getElementById('addr').value = fullAddr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById('addrDetail').focus();
        }
    }).open();
}

function embiCheckId() {
	var id = $("#id").val();

	if(id == "") {
		alert("아이디를 입력해주세요.");
		document.form_login.id.focus();
		return;
	}
	var regId = /^[a-z0-9][a-z0-9]{4,19}$/;
	if (!regId.test(id)) {
		alert("유효하지 않은 아이디입니다.");
		document.joinForm.id.focus();
		return;
	}
	window.name = "parentForm";
	window.open("${path}/member/embiCheckId.jsp?id="+id, "chkForm", "width=600px, height=400px, top=300px, left=650px, resizable = no, scrollbars = no");
}

function checkingEssenAndChoi() {
	var checkBoth = document.joinForm.checkBoth;
	var checkBoxEss = document.joinForm.checkBoxEss;
	var checkBoxChoi = document.joinForm.checkBoxChoi;
   
	if(checkBoth.checked==true) {
		checkBoxEss.checked = true;
		checkBoxChoi.checked = true;
	}else {
		checkBoxEss.checked = false;
		checkBoxChoi.checked = false;
	}
}

function inputIdChk(){
	document.joinForm.idDuplication.value ="idUncheck";
}

function doJoin() {
	var checkBoxEss = document.joinForm.checkBoxEss;
	var id = document.joinForm.id.value;
	var email = document.joinForm.email.value;
	var passwd = document.joinForm.passwd.value;
	var passwdAgain = document.joinForm.passwdAgain.value;
	var name = document.joinForm.name.value;
	var sex = document.joinForm.sex.value;
	var birth = document.joinForm.birth.value;
	var hp = document.joinForm.hp.value;
	var addr = document.joinForm.addr.value;
	var addrDetail = document.joinForm.addrDetail.value;
	var zip = document.joinForm.zip.value;
	
	if(checkBoxEss.checked==false) {
		alert("필수약관에 동의해주세요.");
		document.joinForm.checkBoxEss.focus();
		return;
    }
	if(id == "") {
		alert("아이디를 입력해주세요.");
		document.joinForm.id.focus();
		return;
	}
	if(joinForm.idDuplication.value != "idCheck"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	if(email == "") {
		alert("이메일을 입력해주세요.");
		document.joinForm.email.focus();
		return;
	}
	if(passwd == "") {
		alert("비밀번호를 입력해주세요.");
		document.joinForm.passwd.focus();
		return;
	}
	if(passwdAgain == "") {
		alert("비밀번호를 한 번 더 입력해주세요.");
		document.joinForm.passwdAgain.focus();
		return;
	}
	if(name == "") {
		alert("이름을 입력해주세요.");
		document.joinForm.name.focus();
		return;
	}
	if(hp == "") {
		alert("휴대전화 번호를 입력해주세요.");
		document.joinForm.hp.focus();
		return;
	}   
	if(sex == "") {
		alert("성별을 선택해주세요.");
		document.joinForm.sex.focus();
		return;
    }
	if(birth == "") {
		alert("생년월일을 입력해주세요.");
		document.joinForm.birth.focus();
		return;
    }
	if(addr == "") {
		alert("주소를 입력해주세요.");
		document.joinForm.addr.focus();
		return;
    }
	if(addrDetail == "") {
		alert("상세 주소를 입력해주세요.");
		document.joinForm.addrDetail.focus();
		return;
	}
	if(zip == "") {
		alert("우편번호를 입력해주세요.");
		document.joinForm.zip.focus();
		return;
	}
	var regId = /^[a-z0-9][a-z0-9]{4,19}$/;
	if (!regId.test(id)) {
		alert("유효하지 않은 아이디입니다.");
		document.joinForm.id.focus();
		return;
	}   
	var regEmail = /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
	if (!regEmail.test(email)) {
		alert("유효하지 않은 이메일입니다.");
		document.joinForm.email.focus();
		return;
	}
	var regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
	if (!regPw.test(passwd)) {
        alert("유효하지 않은 비밀번호입니다.");
        document.joinForm.passwd.focus();
        return;
	}
   if(passwd!=passwdAgain) {
		alert("비밀번호 불일치");
		document.joinForm.passwdAgain.focus();
		return;
	}
	var regname = /^[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{3,10}$/;
	if (!regname.test(name)) {
		alert("유효하지 않은 이름입니다.");
		document.joinForm.name.focus();
		return;
	}
	var reghp = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
	if (!reghp.test(hp)) {
		alert("유효하지 않은 번호입니다.");
		document.joinForm.hp.focus();
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
   
	var birth = document.joinForm.birth.value;
	if(getToday() < birth) {
		alert("혹시 미래에서 오신 그 분?");
		document.joinForm.birth.focus();
		return;
	}
	document.joinForm.action="${path}/member_servlet/joinCheck.do";
	document.joinForm.submit();
}

function checkId() {
	var transTextColor = document.getElementById("idConfirmArea");
	var id = document.joinForm.id.value;
	var regId = /^[a-z0-9][a-z0-9]{4,19}$/;
	   
	if (!regId.test(id)) {
		transTextColor.style.color = "red";
		document.getElementById("idConfirmArea").innerHTML = " 영문/숫자 포함 4자 이상 12자 이내로 작성해주세요.";
		document.joinForm.id.focus();
		return;
	}else {
		transTextColor.style.color = "green";
		document.getElementById("idConfirmArea").innerHTML = " 유효한 아이디입니다.";
	}
	
	
}

function checkEmail() {
	var transTextColor = document.getElementById("emailConfirmArea");
	var email = document.joinForm.email.value;
	var regEmail = /^[a-z0-9]{2,}@[a-z0-9]{2,}\.[a-z]{2,}$/;
   
	if (!regEmail.test(email)) {
		transTextColor.style.color = "red";
		document.getElementById("emailConfirmArea").innerHTML = " 유효하지 않은 이메일입니다.";
		document.joinForm.email.focus();
		return;
	}else {
		transTextColor.style.color = "green";
		document.getElementById("emailConfirmArea").innerHTML = " 유효한 이메일입니다.";
	}
}

function checkPasswd() {
	var transTextColor = document.getElementById("passwdConfirmArea");
	var passwd = document.joinForm.passwd.value;
	var regPw = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
	
	if (!regPw.test(passwd)) {
		transTextColor.style.color = "red";
		document.getElementById("passwdConfirmArea").innerHTML = " 8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
		document.joinForm.passwd.focus();
		return;
	}else {
		transTextColor.style.color = "green";
 		document.getElementById("passwdConfirmArea").innerHTML = " 유효한 비밀번호입니다.";
	}
}

function checkpasswdAgain() {
	var transTextColor = document.getElementById("passwdAgainConfirmArea");
	var passwd = document.joinForm.passwd.value;
	var passwdAgain = document.joinForm.passwdAgain.value;
   
	if(passwd!=passwdAgain) {
		transTextColor.style.color = "red";
		document.getElementById("passwdAgainConfirmArea").innerHTML = " 비밀번호 불일치";
		document.joinForm.passwdAgain.focus();
		return;
	} else {
		transTextColor.style.color = "green";
		document.getElementById("passwdAgainConfirmArea").innerHTML = " 비밀번호 일치";
	}
}

function checkName() {
	var transTextColor = document.getElementById("nameConfirmArea");
	var name = document.joinForm.name.value;
	var regname = /^[가-힣ㄱ-ㅎㅏ-ㅣ\x20]{3,10}$/;

	if (!regname.test(name)) {
		transTextColor.style.color = "red";
		document.getElementById("nameConfirmArea").innerHTML = " 유효하지 않은 이름입니다.";
		document.joinForm.name.focus();
		return;
	}else {
		transTextColor.style.color = "green";
		document.getElementById("nameConfirmArea").innerHTML = " 유효한 이름입니다.";
	}
}

function checkHp() {
	var transTextColor = document.getElementById("hpConfirmArea");
	var hp = document.joinForm.hp.value;
	var reghp = /^[0-9]{3}-[0-9]{3,4}-[0-9]{4}$/;
   
	if (!reghp.test(hp)) {
		transTextColor.style.color = "red";
		document.getElementById("hpConfirmArea").innerHTML = " 유효하지 않은 번호입니다.";
		document.joinForm.hp.focus();
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
   
	var birth = document.joinForm.birth.value;
	if(getToday() < birth) {
		transTextColor.style.color = "red";
		document.getElementById("birthConfirmArea").innerHTML = " 혹시 미래에서 오신 그 분?";
		document.joinForm.birth.focus();
		return;
	}else {
		transTextColor.style.color = "green";
		document.getElementById("birthConfirmArea").innerHTML = " 유효한 생년월일입니다.";
	}
}

function back() {
	location.href="${path}/main/index.jsp";
}
</script>
</head>

<body>
   <div id="page">
   
	<%@ include file="../main/menu.jsp" %>
      
      <div id="content">
         <div id="content-inner">
            <div class="content-join">
            
      <br>
      <form name="joinForm" method="post">
      <div class="div-checkbox">
         <label for="checkBoth" style="font-size: 15px;font-weight: bold;">이용약관, 개인정보 수집 및 이용, 프로모션 안내 메일 수신(선택)에 모두 동의합니다.</label>
         <input type="checkbox" name="checkBoth" id="checkBoth" onchange="checkingEssenAndChoi()">
      </div>
      
      <div id="termsAndConditions">
      <br><strong>여러분 환영합니다.</strong>
      <br><br>
      자바빈즈 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 자바빈즈 서비스의 이용과 관련하여 자바빈즈 서비스를 제공하는 자바빈즈 주식회사(이하 ‘자바빈즈’)와 이를 이용하는 자바빈즈 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 자바빈즈 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 
      <br>자바빈즈 서비스를 이용하시거나 자바빈즈 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다. 
      <br><br>         
      <strong>다양한 자바빈즈 서비스를 즐겨보세요.</strong>
      <br><br>회원으로 가입하시면 자바빈즈 서비스를 보다 편리하게 이용할 수 있습니다.         <br>여러분은 본 약관을 읽고 동의하신 후 회원 가입을 신청하실 수 있으며, 자바빈즈는 이에 대한 승낙을 통해 회원 가입 절차를 완료하고 여러분께 자바빈즈 서비스 이용 계정(이하 ‘계정’)을 부여합니다. 계정이란 회원이 자바빈즈 서비스에 로그인한 이후 이용하는 각종 서비스 이용 이력을 회원 별로 관리하기 위해 설정한 회원 식별 단위를 말합니다. 회원은 자신의 계정을 통해 좀더 다양한 자바빈즈 서비스를 보다 편리하게 이용할 수 있습니다. 이와 관련한 상세한 내용은 계정 운영정책 및 고객센터 내 자바빈즈 회원가입 방법 등에서 확인해 주세요. 
      <br><br>
      <strong>여러분이 제공한 콘텐츠를 소중히 다룰 것입니다.</strong>
      <br><br>
      자바빈즈는 여러분의 생각과 감정이 표현된 콘텐츠를 소중히 보호할 것을 약속 드립니다. 여러분이 제작하여 게재한 게시물에 대한 지식재산권 등의 권리는 당연히 여러분에게 있습니다. 
      <br>한편, 자바빈즈 서비스를 통해 여러분이 게재한 게시물을 적법하게 제공하려면 해당 콘텐츠에 대한 저장, 복제, 수정, 공중 송신, 전시, 배포, 2차적 저작물 작성(단, 번역에 한함) 등의 이용 권한(기한과 지역 제한에 정함이 없으며, 별도 대가 지급이 없는 라이선스)이 필요합니다.
      게시물 게재로 여러분은 자바빈즈에게 그러한 권한을 부여하게 되므로, 여러분은 이에 필요한 권리를 보유하고 있어야 합니다. 
      <br>자바빈즈는 여러분이 부여해 주신 콘텐츠 이용 권한을 저작권법 등 관련 법령에서 정하는 바에 따라 자바빈즈 서비스 내 노출, 서비스 홍보를 위한 활용, 서비스 운영, 개선 및 새로운 서비스 개발을 위한 연구, 웹 접근성 등 법률상 의무 준수, 외부 사이트에서의 검색, 수집 및 링크 허용을 위해서만 제한적으로 행사할 것입니다.
      만약, 그 밖의 목적을 위해 부득이 여러분의 콘텐츠를 이용하고자 할 경우엔 사전에 여러분께 설명을 드리고 동의를 받도록 하겠습니다. 
      <br>또한 여러분이 제공한 소중한 콘텐츠는 자바빈즈 서비스를 개선하고 새로운 자바빈즈 서비스를 제공하기 위해 인공지능 분야 기술 등의 연구 개발 목적으로 자바빈즈 및 자바빈즈 계열사에서 사용될 수 있습니다. 자바빈즈는 지속적인 연구 개발을 통해 여러분께 좀 더 편리하고 유용한 서비스를 제공해 드릴 수 있도록 최선을 다하겠습니다. 
      <br>자바빈즈는 여러분이 자신이 제공한 콘텐츠에 대한 자바빈즈 또는 다른 이용자들의 이용 또는 접근을 보다 쉽게 관리할 수 있도록 다양한 수단을 제공하기 위해 노력하고 있습니다. 여러분은 자바빈즈 서비스 내에 콘텐츠 삭제, 비공개 등의 관리기능이 제공되는 경우 이를 통해 직접 타인의 이용 또는 접근을 통제할 수 있고, 고객센터를 통해서도 콘텐츠의 삭제, 비공개, 검색결과 제외 등의 조치를 요청할 수 있습니다.
      다만, 일부 자바빈즈 서비스의 경우 삭제, 비공개 등의 처리가 어려울 수 있으며, 이러한 내용은 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등에서 확인해 주시길 부탁 드립니다. 
      <br><br>
      <strong>여러분의 개인정보를 소중히 보호합니다.</strong>
      <br><br>자바빈즈는 서비스의 원활한 제공을 위하여 회원이 동의한 목적과 범위 내에서만 개인정보를 수집∙이용하며, 개인정보 보호 관련 법령에 따라 안전하게 관리합니다. 자바빈즈가 이용자 및 회원에 대해 관련 개인정보를 안전하게 처리하기 위하여 기울이는 노력이나 기타 상세한 사항은 개인정보 처리방침에서 확인하실 수 있습니다. 
      <br>자바빈즈는 여러분이 서비스를 이용하기 위해 일정 기간 동안 로그인 혹은 접속한 기록이 없는 경우, 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 사전에 안내해 드린 후 여러분의 정보를 파기하거나 분리 보관할 수 있으며, 만약 이로 인해 서비스 제공을 위해 필수적인 정보가 부족해질 경우 부득이 관련 서비스 이용계약을 해지할 수 있습니다. 
      <br><br>
      <strong>타인의 권리를 존중해 주세요.</strong>
      <br><br>여러분이 무심코 게재한 게시물로 인해 타인의 저작권이 침해되거나 명예훼손 등 권리 침해가 발생할 수 있습니다. 자바빈즈는 이에 대한 문제 해결을 위해 ‘정보통신망 이용촉진 및 정보보호 등에 관한 법률’ 및 ‘저작권법’ 등을 근거로 권리침해 주장자의 요청에 따른 게시물 게시중단, 원 게시자의 이의신청에 따른 해당 게시물 게시 재개 등을 내용으로 하는 게시중단요청서비스를 운영하고 있습니다. 보다 상세한 내용 및 절차는 고객센터 내 게시중단요청서비스 소개를 참고해 주세요. 
      <br>한편, 자바빈즈 서비스를 통해 타인의 콘텐츠를 이용한다고 하여 여러분이 해당 콘텐츠에 대한 지식재산권을 보유하게 되는 것은 아닙니다. 여러분이 해당 콘텐츠를 자유롭게 이용하기 위해서는 그 이용이 저작권법 등 관련 법률에 따라 허용되는 범위 내에 있거나, 해당 콘텐츠의 지식재산권자로부터 별도의 이용 허락을 받아야 하므로 각별한 주의가 필요합니다. 
      <br>자바빈즈는 여러분이 자바빈즈 서비스를 마음껏 이용할 수 있도록 여러분께 자바빈즈 서비스에 수반되는 관련 소프트웨어 사용에 관한 이용 권한을 부여합니다. 이 경우 여러분의 자유로운 이용은 자바빈즈가 제시하는 이용 조건에 부합하는 범위 내에서만 허용되고, 이러한 권한은 양도가 불가능하며, 비독점적 조건 및 법적고지가 적용된다는 점을 유의해 주세요. 
      <br><br>
      <strong>자바빈즈에서 제공하는 다양한 포인트를 요긴하게 활용해 보세요.</strong>
      <br><br>자바빈즈는 여러분이 자바빈즈 서비스를 효율적으로 이용할 수 있도록 포인트를 부여하고 있습니다. 포인트는 여러분의 일정한 자바빈즈 서비스 이용과 연동하여 자바빈즈가 임의로 책정하거나 조정하여 지급하는 일정한 계산 단위를 갖는 서비스 상의 가상 데이터를 말합니다. 포인트는 재산적 가치가 없기 때문에 금전으로 환불 또는 전환할 수 없지만, 포인트의 많고 적음에 따라 여러분의 자바빈즈 서비스 이용에 영향을 주는 경우가 있으므로 경우에 따라 적절히 활용해 보세요. 
      <br>자바빈즈는 자바빈즈 서비스의 효율적 이용을 지원하거나 서비스 운영을 개선하기 위해 필요한 경우 사전에 여러분께 안내 드린 후 부득이 포인트의 일부 또는 전부를 조정할 수 있습니다. 그리고 포인트는 자바빈즈가 정한 기간에 따라 주기적으로 소멸할 수도 있으니 포인트가 부여되는 자바빈즈 서비스 이용 시 유의해 주시기 바랍니다. 
      <br><br>
      <strong>자바빈즈 서비스 이용과 관련하여 몇 가지 주의사항이 있습니다.</strong>
      <br><br>자바빈즈는 본 약관의 범위 내에서 게시물 운영정책, 각 개별 서비스에서의 약관 또는 운영정책, 각 서비스 상의 안내, 공지사항, 고객센터 도움말 등을 두어, 여러분에게 안정적이고 원활한 서비스 이용이 가능하도록 지원하고 있습니다. 각 세부 정책에는 여러분이 참고할 수 있도록 보다 구체적인 유의사항을 포함하고 있으니, 본 약관 본문 및 구성 페이지 상의 링크 등을 통해 이를 확인해 주시기 바랍니다. 
      <br><br>
      <strong>부득이 서비스 이용을 제한할 경우 합리적인 절차를 준수합니다.</strong>
      <br><br>자바빈즈는 다양한 정보와 의견이 담긴 여러분의 콘텐츠를 소중히 다룰 것을 약속 드립니다만, 여러분이 게재한 게시물이 관련 법령, 본 약관, 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등에 위배되는 경우, 부득이 이를 비공개 또는 삭제 처리하거나 게재를 거부할 수 있습니다. 다만, 이것이 자바빈즈가 모든 콘텐츠를 검토할 의무가 있다는 것을 의미하지는 않습니다. 
      <br>또한 여러분이 관련 법령, 본 약관, 계정 및 게시물 운영정책, 각 개별 서비스에서의 약관, 운영정책 등을 준수하지 않을 경우, 자바빈즈는 여러분의 관련 행위 내용을 확인할 수 있으며, 그 확인 결과에 따라 자바빈즈 서비스 이용에 대한 주의를 당부하거나, 자바빈즈 서비스 이용을 일부 또는 전부, 일시 또는 영구히 정지시키는 등 그 이용을 제한할 수 있습니다. 한편, 이러한 이용 제한에도 불구하고 더 이상 자바빈즈 서비스 이용계약의 온전한 유지를 기대하기 어려운 경우엔 부득이 여러분과의 이용계약을 해지할 수 있습니다. 
      <br>부득이 여러분의 서비스 이용을 제한해야 할 경우 명백한 법령 위반이나 타인의 권리침해로서 긴급한 위험 또는 피해 차단이 요구되는 사안 외에는 위와 같은 단계적 서비스 이용제한 원칙을 준수 하겠습니다. 명백한 법령 위반 등을 이유로 부득이 서비스 이용을 즉시 영구 정지시키는 경우 서비스 이용을 통해 획득한 포인트 및 기타 혜택 등은 모두 소멸되고 이에 대해 별도로 보상하지 않으므로 유의해 주시기 바랍니다. 서비스 이용 제한의 조건, 세부 내용 등은 계정 운영정책 및 각 개별 서비스에서의 운영정책을 참고하시기 바랍니다. 
      <br><br>
      <strong>자바빈즈의 잘못은 자바빈즈가 책임집니다.</strong>
      <br><br>자바빈즈는 여러분이 자바빈즈 서비스를 이용함에 있어 자바빈즈의 고의 또는 과실로 인하여 손해를 입게 될 경우 관련 법령에 따라 여러분의 손해를 배상합니다. 다만, 천재지변 또는 이에 준하는 불가항력으로 인하여 자바빈즈가 서비스를 제공할 수 없거나 이용자의 고의 또는 과실로 인하여 서비스를 이용할 수 없어 발생한 손해에 대해서 자바빈즈는 책임을 부담하지 않습니다. 
      <br>그리고 자바빈즈가 손해배상책임을 부담하는 경우에도 통상적으로 예견이 불가능하거나 특별한 사정으로 인한 특별 손해 또는 간접 손해, 기타 징벌적 손해에 대해서는 관련 법령에 특별한 규정이 없는 한 책임을 부담하지 않습니다. 
      <br>한편, 자바빈즈 서비스를 매개로 한 여러분과 다른 회원 간 또는 여러분과 비회원 간의 의견 교환, 거래 등에서 발생한 손해나 여러분이 서비스 상에 게재된 타인의 게시물 등의 콘텐츠를 신뢰함으로써 발생한 손해에 대해서도 자바빈즈는 특별한 사정이 없는 한 이에 대해 책임을 부담하지 않습니다. 
      <br><br>
      <strong>언제든지 자바빈즈 서비스 이용계약을 해지하실 수 있습니다.</strong>
      <br><br>자바빈즈에게는 참 안타까운 일입니다만, 회원은 언제든지 자바빈즈 서비스 이용계약 해지를 신청하여 회원에서 탈퇴할 수 있으며, 이 경우 자바빈즈는 관련 법령 등이 정하는 바에 따라 이를 지체 없이 처리하겠습니다. 
      <br>자바빈즈 서비스 이용계약이 해지되면, 관련 법령 및 개인정보처리방침에 따라 자바빈즈가 해당 회원의 정보를 보유할 수 있는 경우를 제외하고, 해당 회원 계정에 부속된 게시물 일체를 포함한 회원의 모든 데이터는 소멸됨과 동시에 복구할 수 없게 됩니다. 다만, 이 경우에도 다른 회원이 별도로 담아갔거나 스크랩한 게시물과 공용 게시판에 등록한 댓글 등의 게시물은 삭제되지 않으므로 반드시 해지 신청 이전에 삭제하신 후 탈퇴하시기 바랍니다. 
      <br><br>
      <strong>일부 자바빈즈 서비스에는 광고가 포함되어 있습니다.</strong>
      <br><br>
      여러분이 다양한 자바빈즈 서비스를 이용하다 보면 간혹 일부 개별 서비스에 광고가 포함된 경우가 있습니다. 자바빈즈 서비스를 이용하면서 발생할 수 있는 데이터 통신요금은 가입하신 통신사업자와의 이용계약에 따라 여러분이 부담하며, 포함된 광고 열람으로 인해 추가적으로 발생하는 비용 역시 여러분이 부담합니다. 
      <br>원하는 자바빈즈 서비스를 이용하기 위해 원하지 않는 광고를 봐야 하는 경우가 있습니다. 이는 여러분에게 제공하는 다양한 자바빈즈 서비스를 원칙적으로 무료로 제공할 수 있게 해주는 데 기여하며, 더 나아가 자바빈즈가 연구 개발에 투자하여 더 나은 서비스를 제공할 수 있는 기반이 됩니다. 최근 타사의 일부 서비스들이 광고 없는 서비스 이용을 강조하며 주된 서비스를 유료로 제공하고 있는 관행이 이를 뒷받침합니다.  
      <br>자바빈즈는 여러분의 본의 아닌 불편이나 부담이 최소화될 수 있는 방법에 대해 항상 고민하고 개선해 나가겠습니다. 
      <br><br>
      <strong>서비스 중단 또는 변경 시 꼭 알려드리겠습니다.</strong>
      <br><br>자바빈즈는 연중 무휴, 1일 24시간 안정적으로 서비스를 제공하기 위해 최선을 다하고 있습니다만, 컴퓨터, 서버 등 정보통신설비의 보수점검, 교체 또는 고장, 통신두절 등 운영상 상당한 이유가 있는 경우 부득이 서비스의 전부 또는 일부를 중단할 수 있습니다. 
      <br>한편, 자바빈즈는 서비스 운영 또는 개선을 위해 상당한 필요성이 있는 경우 서비스의 전부 또는 일부를 수정, 변경 또는 종료할 수 있습니다. 무료로 제공되는 서비스의 전부 또는 일부를 수정, 변경 또는 종료하게 된 경우 관련 법령에 특별한 규정이 없는 한 별도의 보상을 하지 않습니다. 
      <br>이 경우 자바빈즈는 예측 가능한 경우 상당기간 전에 이를 안내하며, 만약 예측 불가능한 경우라면 사후 지체 없이 상세히 설명하고 안내 드리겠습니다. 또한 서비스 중단의 경우에는 여러분 자신의 콘텐츠를 백업할 수 있도록 합리적이고 충분한 기회를 제공하도록 하겠습니다. 
      <br>주요 사항을 잘 안내하고 여러분의 소중한 의견에 귀 기울이겠습니다.
      <br>자바빈즈는 서비스 이용에 필요한 주요사항을 적시에 잘 안내해 드릴 수 있도록 힘쓰겠습니다. 회원에게 통지를 하는 경우 전자메일, 서비스 내 알림 또는 기타 적절한 전자적 수단을 통해 개별적으로 알려 드릴 것이며, 다만 회원 전체에 대한 통지가 필요할 경우엔 7일 이상 www.naver.com을 비롯한 자바빈즈 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱) 초기 화면 또는 공지사항 등에 관련 내용을 게시하도록 하겠습니다. 
      <br>자바빈즈는 여러분의 소중한 의견에 귀 기울이겠습니다. 여러분은 언제든지 고객센터를 통해 서비스 이용과 관련된 의견이나 개선사항을 전달할 수 있으며, 자바빈즈는 합리적 범위 내에서 가능한 그 처리과정 및 결과를 여러분께 전달할 수 있도록 하겠습니다. 
      <br>여러분이 쉽게 알 수 있도록 약관 및 운영정책을 게시하며 사전 공지 후 개정합니다.
      <br>자바빈즈는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며, 사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는 최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다. 
      <br>자바빈즈는 변경된 약관을 게시한 날로부터 효력이 발생되는 날까지 약관 변경에 대한 여러분의 의견을 기다립니다. 위 기간이 지나도록 여러분의 의견이 자바빈즈에 접수되지 않으면, 여러분이 변경된 약관에 따라 서비스를 이용하는 데에 동의하는 것으로 간주됩니다. 자바빈즈로서는 매우 안타까운 일이지만, 여러분이 변경된 약관에 동의하지 않는 경우 변경된 약관의 적용을 받는 해당 서비스의 제공이 더 이상 불가능하게 될 수 있습니다. 
      <br>자바빈즈 서비스에는 기본적으로 본 약관이 적용됩니다만, 부득이 각 개별 서비스의 고유한 특성을 반영하기 위해 본 약관 외 별도의 약관, 운영정책이 추가로 적용될 때가 있습니다. 따라서 별도의 약관, 운영정책에서 그 개별 서비스 제공에 관하여 본 약관, 계정 및 게시물 운영정책과 다르게 정한 경우에는 별도의 약관, 운영정책이 우선하여 적용됩니다. 이러한 내용은 각각의 개별 서비스 초기 화면에서 확인해 주시기 바랍니다. 
      <br>본 약관은 한국어를 정본으로 합니다. 본 약관 또는 자바빈즈 서비스와 관련된 여러분과 자바빈즈와의 관계에는 대한민국의 법령이 적용됩니다. 그리고 본 약관 또는 자바빈즈 서비스와 관련하여 여러분과 자바빈즈 사이에 분쟁이 발생할 경우, 그 분쟁의 처리는 대한민국 '민사소송법'에서 정한 절차를 따릅니다. 
		공지 일자: 2018년 3월 30일
      	적용 일자: 2018년 5월 1일
      <br><br>
      <strong>자바빈즈 서비스와 관련하여 궁금하신 사항이 있으시면 고객센터(대표번호: 1855 – 9999/ 평일 09:00~18:00)로 문의 주시기 바랍니다.</strong> 
      </div>
      <br>
      <div class="div-checkbox">
         <label for="checkBoxEss">자바빈즈 이용약관 동의(필수)</label>
         <input type="checkbox" name="checkBoxEss" id="checkBoxEss">
      </div>
      <div class="div-checkbox">
         <label for="checkBoxChoi">이벤트 등 프로모션 알림 메일 수신(선택)</label>
         <input type="checkbox" name="checkBoxChoi" id="checkBoxChoi">
      </div>
      <br><br>
      
      <button style="margin-left: 0px;" class="btn-Type4" type="button" onclick="embiCheckId()">아이디 중복체크</button>
      
      <table class="table-join">
      <tr>
         <td>
            <div class="input-td">
            <input class="input-join" type="text" name="id" id="id" onchange="checkId()" onkeydown="inputIdChk()" placeholder="아이디 (영문/숫자 포함 4자 이상 12자 이내)">
            <input type="hidden" name="idDuplication" value="idUncheck" >
            <br><span class="confirmArea" id="idConfirmArea"> </span>
            </div><br>
         </td>
         <td>
            <div class="input-td">
            <input class="input-join" type="email" name="email" id="email" onchange="checkEmail()" placeholder="이메일">
            <br><span class="confirmArea" id="emailConfirmArea"> </span>
            </div><br>
         </td>
      </tr>
      <tr>
         <td>
            <div class="input-td">
            <input class="input-join" type="password" name="passwd" id="passwd" onchange="checkPasswd()" placeholder="비밀번호 (대문자/특수기호/숫자 포함 8자 이상 16자 이내)">
            <br><span class="confirmArea" id="passwdConfirmArea"> </span>
            </div><br>
         </td>
         <td>
            <div class="input-td">
            <input class="input-join" type="password" name="passwdAgain" id="passwdAgain" onchange="checkpasswdAgain()" placeholder="비밀번호 확인">
            <br><span class="confirmArea" id="passwdAgainConfirmArea"> </span>
            </div><br>
         </td>
      </tr>         
      <tr>
         <td>
            <div class="input-td">
            <input class="input-join" type="text" name="name" id="name" onchange="checkName()" placeholder="이름(한글만)">
            <br><span class="confirmArea" id="nameConfirmArea"> </span>
            </div><br>
         </td>
         <td>
            <div class="input-td">
            <input class="input-join" type="tel" name="hp" id="hp" onchange="checkHp()" title="###-####-####" placeholder="휴대전화번호 (ex ###-####-####)">
            <br><span class="confirmArea" id="hpConfirmArea"> </span>
            </div><br>
         </td>
      </tr>         
      <tr>
         <td>
            <div class="tr-radio-birthday">
				<label for="male">남성</label> 
            	<input type="radio" name="sex" id="male" value="male">
            	<label for="female">여성</label> 
            	<input type="radio" name="sex" id="female" value="female">
            </div><br>
         </td>
         <td>
            <div class="tr-radio-birthday">
            <label for="fbirthday"> 생년월일</label> 
            <input type="date" name="birth" id="birth" value="2000-01-01" onchange="checkBirth()">
            <span class="confirmArea" id="birthConfirmArea"> </span>
            </div><br>
         </td>
      </tr>               
      <tr>
         <td>
            <div class="input-td">
            	<input class="input-join" type="text" name="addr" id="addr" placeholder="주소 (ex 서울시 강동구)">
            </div><br>
         </td>
         <td>
            <div class="input-td">
            	<input class="btn-Type4" style="margin-top: 0px; width: 80px;height: 45px;" type="button" onclick="execDaumPostcode()" value="주소 검색">
            </div><br>
         </td>
      </tr>         
      <tr>
         <td>
            <div class="input-td">
	            <input class="input-join" type="text" name="zip" id="zip" placeholder="새우편번호 5자리">
	            <span class="confirmArea" id="zipConfirmArea"> </span>
            </div><br>
         </td>
      	<td>
            <div class="input-td">
            	<input class="input-join" type="text" name="addrDetail" id="addrDetail" placeholder="상세주소 (ex 현대코아 3층 )">
            </div><br>
         </td>
      </tr>         
      <tr>
         <td colspan="2">
            <br><br><br>
            <input class="btn-Type1" type="button" value="취소" onclick="back()">
            <input class="btn-Type1" id="btnSubmit" type="button" value="가입하기" onclick="doJoin()">
         </td>
      </tr>      
      </table>
   </form>
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