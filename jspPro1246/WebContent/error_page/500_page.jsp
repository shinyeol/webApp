<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name=viewport content="initial-scale=1, minimum-scale=1, width=device-width">
<title>Error 500 !</title>
<style>
* { margin:0;padding:0 }
html,code {font:15px/22px arial,sans-serif} 
html{background:#fff;color:#222;padding:15px}
body{
	margin:7% auto 0;max-width:390px;min-height:180px;padding:30px 0 15px
}
* > body{
	background:url(//www.google.com/images/errors/robot.png) 100% 5px no-repeat;
	padding-right:205px
}
p{margin:11px 0 22px;overflow:hidden}
ins{color:#777;text-decoration:none}
a img{border:0}
@media screen and (max-width:772px){
	body{background:none;margin-top:0;max-width:none;padding-right:0}
}

#logo {	text-align: center; }
#logo h1 span {color: #BCCE98;}
#logo{display:inline-block;height:54px;width:150px}
#logo a:ACTIVE {text-decoration: none;color: darkgreen;}
#logo a:LINK {text-decoration: none;color: darkgreen;}
#logo a:VISITED {text-decoration: none;color: darkgreen;}
#logo a:HOVER {text-decoration: none;color: darkgreen;}
</style>
</head>
<script type="text/javascript">
function goHome() {
	location.href = "http://localhost:8088/project_goCamping/webProject/m/main.jsp";
}
function goBack() {
	location.href="javascript:history.back()";
}
</script>
<body>
<div id="logo">
	<h1><a href="http://localhost:8088/project_goCamping/webProject/m/main.jsp">Go<span>Camping</span></a></h1>
</div>

  <p><b>500 - Internal Server Error
 </b> <ins> That’s an error.</ins>
  <p> 현재 서비스에 일시적인 오류가 발생했습니다. </p>
  <ins>요청하신 모듈을 찾을 수 없습니다.<br> 사이트 관리자에게 모듈 점검 요청바랍니다.</ins><br>
  <ins>이용에 불편을 드린 점 진심으로 사과 드리며,<br> 고객 여러분의 양해 부탁드립니다.</ins><br><br>
  <p> 관련 문의사항은 고객센터에 문의해주시면<br> 친절히 안내드리겠습니다. 감사합니다. </p>
  
  <button onclick="goBack()">뒤로가기</button>
  <button style="visibility: hidden;" >새로고침</button>
  <button onclick="goHome()">홈페이지</button>
  
</body>
</html>