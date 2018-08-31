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
		function select_pType(p_type) {
			if(p_type == "bean") {
				document.form1.p_option1.options.length = 0;
				document.form1.p_option1.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option1.options[0].value="";
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option3.options[0].value="";
				
				document.form1.p_option1.options[1] = new Option("지역별");
				document.form1.p_option1.options[1].value="bean_local";
				document.form1.p_option1.options[2] = new Option("스페셜");
				document.form1.p_option1.options[2].value="bean_special";
				document.form1.p_option1.options[3] = new Option("블렌딩");
				document.form1.p_option1.options[3].value="bean_blending";
			}
			if(p_type == "machine") {
				document.form1.p_option1.options.length = 0;
				document.form1.p_option1.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option1.options[0].value="";
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option1.options[1] = new Option("에스프레소머신");
				document.form1.p_option1.options[1].value="machine_espresso";
				document.form1.p_option1.options[2] = new Option("전동글라인더");
				document.form1.p_option1.options[2].value="machine_grinder";
			}
			if(p_type == "mochaPort") {
				document.form1.p_option1.options.length = 0;
				document.form1.p_option1.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option1.options[0].value="";
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option1.options[1] = new Option("1컵용");
				document.form1.p_option1.options[1].value="mochaPort_1Cup";
				document.form1.p_option1.options[2] = new Option("2컵용");
				document.form1.p_option1.options[2].value="mochaPort_2Cup";
				document.form1.p_option1.options[3] = new Option("3컵용");
				document.form1.p_option1.options[3].value="mochaPort_3Cup";
				document.form1.p_option1.options[4] = new Option("4컵용");
				document.form1.p_option1.options[4].value="mochaPort_4Cup";
				document.form1.p_option1.options[5] = new Option("6컵용");
				document.form1.p_option1.options[5].value="mochaPort_6Cup";
			}
			if(p_type == "handDrip") {
				document.form1.p_option1.options.length = 0;
				document.form1.p_option1.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option1.options[0].value="";
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option1.options[1] = new Option("드립세트");
				document.form1.p_option1.options[1].value="handDrip_dripSet";
				document.form1.p_option1.options[2] = new Option("핸드밀");
				document.form1.p_option1.options[2].value="handDrip_handmill";
				document.form1.p_option1.options[3] = new Option("사이폰");
				document.form1.p_option1.options[3].value="handDrip_siphon";
				document.form1.p_option1.options[4] = new Option("워터드립");
				document.form1.p_option1.options[4].value="handDrip_waterDrip";
				document.form1.p_option1.options[5] = new Option("에어로프레스");
				document.form1.p_option1.options[5].value="handDrip_aeropress";
				
			}
			if(p_type == "utensils") {
				document.form1.p_option1.options.length = 0;
				document.form1.p_option1.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option1.options[0].value="";
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option1.options[1] = new Option("커피잔");
				document.form1.p_option1.options[1].value="utensils_cup";
				document.form1.p_option1.options[2] = new Option("차");
				document.form1.p_option1.options[2].value="utensils_tea";
				document.form1.p_option1.options[3] = new Option("시럽");
				document.form1.p_option1.options[3].value="utensils_syrup";
				document.form1.p_option1.options[4] = new Option("기타용품");
				document.form1.p_option1.options[4].value="utensils_etc";
			}
			
		}
		
		/* bean 하위 항목 */
		function select_pOption1(p_option1) {
			if(p_option1 == "bean_local") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option3.options[0].value="";
				
				document.form1.p_option2.options[1] = new Option("아프리카");
				document.form1.p_option2.options[1].value="아프리카";
				document.form1.p_option2.options[2] = new Option("아시아");
				document.form1.p_option2.options[2].value="아시아";
				document.form1.p_option2.options[3] = new Option("중남미");
				document.form1.p_option2.options[3].value="중남미";
			}
			if(p_option1 == "bean_special") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option3.options[0].value="";
				
				document.form1.p_option2.options[1] = new Option("스페셜티");
				document.form1.p_option2.options[1].value="스페셜티";
				document.form1.p_option2.options[2] = new Option("세계3대커피");
				document.form1.p_option2.options[2].value="세계3대커피";
				document.form1.p_option2.options[3] = new Option("디카페인");
				document.form1.p_option2.options[3].value="디카페인";
			}
			if(p_option1 == "bean_blending") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option3.options[0].value="";
				
				document.form1.p_option2.options[1] = new Option("에스프레소블렌딩");
				document.form1.p_option2.options[1].value="에스프레소블렌딩";
				document.form1.p_option2.options[2] = new Option("더치블렌딩");
				document.form1.p_option2.options[2].value="더치블렌딩";
				document.form1.p_option2.options[3] = new Option("라떼블렌딩");
				document.form1.p_option2.options[3].value="라떼블렌딩";
			}
		
		/* machine 하위 항목 */
			if(p_option1 == "machine_espresso") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("란실리오");
				document.form1.p_option2.options[1].value="란실리오";
				document.form1.p_option2.options[2] = new Option("페이마");
				document.form1.p_option2.options[2].value="페이마";
				document.form1.p_option2.options[3] = new Option("노바");
				document.form1.p_option2.options[3].value="노바";
				document.form1.p_option2.options[4] = new Option("리마르조코");
				document.form1.p_option2.options[5].value="리마르조코";

			}
			if(p_option1 == "machine_grinder") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("콤팍");
				document.form1.p_option2.options[1].value="콤팍";
				document.form1.p_option2.options[2] = new Option("페이마");
				document.form1.p_option2.options[2].value="페이마";
				document.form1.p_option2.options[3] = new Option("안핌");
				document.form1.p_option2.options[3].value="안핌";
				document.form1.p_option2.options[4] = new Option("후지로얄");
				document.form1.p_option2.options[5].value="후지로얄";
			}
		
		/* mochaPort 하위 항목 */
			if(p_option1 == "mochaPort_1Cup") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("비알레띠");
				document.form1.p_option2.options[1].value="Bialetti";
				document.form1.p_option2.options[2] = new Option("안캅");
				document.form1.p_option2.options[2].value="Ancap";
				document.form1.p_option2.options[3] = new Option("일사");
				document.form1.p_option2.options[3].value="ilsa";
			}
			if(p_option1 == "mochaPort_2Cup") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("비알레띠");
				document.form1.p_option2.options[1].value="Bialetti";
				document.form1.p_option2.options[2] = new Option("안캅");
				document.form1.p_option2.options[2].value="Ancap";
				document.form1.p_option2.options[3] = new Option("일사");
				document.form1.p_option2.options[3].value="ilsa";
			}
			if(p_option1 == "mochaPort_3Cup") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("비알레띠");
				document.form1.p_option2.options[1].value="Bialetti";
				document.form1.p_option2.options[2] = new Option("안캅");
				document.form1.p_option2.options[2].value="Ancap";
				document.form1.p_option2.options[3] = new Option("일사");
				document.form1.p_option2.options[3].value="ilsa";
			}		
			if(p_option1 == "mochaPort_4Cup") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("비알레띠");
				document.form1.p_option2.options[1].value="Bialetti";
				document.form1.p_option2.options[2] = new Option("안캅");
				document.form1.p_option2.options[2].value="Ancap";
				document.form1.p_option2.options[3] = new Option("일사");
				document.form1.p_option2.options[3].value="ilsa";
			}
			if(p_option1 == "mochaPort_6Cup") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("비알레띠");
				document.form1.p_option2.options[1].value="Bialetti";
				document.form1.p_option2.options[2] = new Option("안캅");
				document.form1.p_option2.options[2].value="Ancap";
				document.form1.p_option2.options[3] = new Option("일사");
				document.form1.p_option2.options[3].value="ilsa";
			}					
			
		/* handDrip 하위 항목 */
			if(p_option1 == "handDrip_dripSet") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("케멕스");
				document.form1.p_option2.options[1].value="케멕스";
				document.form1.p_option2.options[2] = new Option("칼리타");
				document.form1.p_option2.options[2].value="칼리타";
				document.form1.p_option2.options[3] = new Option("메리타");
				document.form1.p_option2.options[3].value="메리타";
				document.form1.p_option2.options[4] = new Option("하리오");
				document.form1.p_option2.options[4].value="하리오";
				document.form1.p_option2.options[5] = new Option("고노");
				document.form1.p_option2.options[5].value="고노";
				document.form1.p_option2.options[6] = new Option("누보");
				document.form1.p_option2.options[6].value="누보";
			}
			if(p_option1 == "handDrip_handmill") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("아키라");
				document.form1.p_option2.options[1].value="아키라";
				document.form1.p_option2.options[2] = new Option("칼리타");
				document.form1.p_option2.options[2].value="칼리타";
				document.form1.p_option2.options[3] = new Option("메리타");
				document.form1.p_option2.options[3].value="메리타";
				document.form1.p_option2.options[4] = new Option("하리오");
				document.form1.p_option2.options[4].value="하리오";
				document.form1.p_option2.options[5] = new Option("지센하우스");
				document.form1.p_option2.options[5].value="지센하우스";
			}
			if(p_option1 == "handDrip_siphon") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("하리오");
				document.form1.p_option2.options[1].value="하리오";
				document.form1.p_option2.options[2] = new Option("고노");
				document.form1.p_option2.options[2].value="고노";
				document.form1.p_option2.options[3] = new Option("비엔나 로얄");
				document.form1.p_option2.options[3].value="비엔나 로얄";
			}
			if(p_option1 == "handDrip_waterDrip") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("칼리타");
				document.form1.p_option2.options[1].value="칼리타";
				document.form1.p_option2.options[2] = new Option("커피 오브젝트");
				document.form1.p_option2.options[2].value="커피오브젝트";
				document.form1.p_option2.options[3] = new Option("모이카");
				document.form1.p_option2.options[3].value="모이카";
				document.form1.p_option2.options[4] = new Option("하리오");
				document.form1.p_option2.options[4].value="하리오";
			}
			if(p_option1 == "handDrip_aeropress") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("에어로비");
				document.form1.p_option2.options[1].value="에어로비";
			}			
			if(p_option1 == "utensils_cup") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("컵");
				document.form1.p_option2.options[1].value="컵";
				document.form1.p_option2.options[2] = new Option("텀블러");
				document.form1.p_option2.options[2].value="텀블러";
			}
			if(p_option1 == "utensils_tea") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("홍차");
				document.form1.p_option2.options[1].value="홍차";
				document.form1.p_option2.options[2] = new Option("중국차");
				document.form1.p_option2.options[2].value="중국차";
			}
			if(p_option1 == "utensils_syrup") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("시럽");
				document.form1.p_option2.options[1].value="시럽";
				document.form1.p_option2.options[2] = new Option("설탕");
				document.form1.p_option2.options[2].value="설탕";
			}
			if(p_option1 == "utensils_etc") {
				document.form1.p_option2.options.length = 0;
				document.form1.p_option2.options[0] = new Option("분류를 선택하세요.");
				document.form1.p_option2.options[0].value="";
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("선택 안함");
				document.form1.p_option3.options[0].value="-";
				
				document.form1.p_option2.options[1] = new Option("브러시");
				document.form1.p_option2.options[1].value="브러시";
				document.form1.p_option2.options[2] = new Option("거품기");
				document.form1.p_option2.options[2].value="거품기";
				document.form1.p_option2.options[3] = new Option("기타");
				document.form1.p_option2.options[3].value="기타";
			}
		}
		
		function select_pOption2(p_option2) {
			if(p_option2 == "아프리카") {
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("로스팅 유무 선택");
				
				document.form1.p_option3.options[1] = new Option("생두");
				document.form1.p_option3.options[1].value="생두";
				document.form1.p_option3.options[2] = new Option("볶은원두");
				document.form1.p_option3.options[2].value="볶은원두";
			}
			if(p_option2 == "아시아") {
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("로스팅 유무 선택");
				
				document.form1.p_option3.options[1] = new Option("생두");
				document.form1.p_option3.options[1].value="생두";
				document.form1.p_option3.options[2] = new Option("볶은원두");
				document.form1.p_option3.options[2].value="볶은원두";
			}
			if(p_option2 == "중남미") {
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("로스팅 유무 선택");
				
				document.form1.p_option3.options[1] = new Option("생두");
				document.form1.p_option3.options[1].value="생두";
				document.form1.p_option3.options[2] = new Option("볶은원두");
				document.form1.p_option3.options[2].value="볶은원두";
			}
			if(p_option2 == "스페셜티") {
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("로스팅 유무 선택");
				
				document.form1.p_option3.options[1] = new Option("생두");
				document.form1.p_option3.options[1].value="생두";
				document.form1.p_option3.options[2] = new Option("볶은원두");
				document.form1.p_option3.options[2].value="볶은원두";
			}
			if(p_option2 == "세계3대커피") {
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("로스팅 유무 선택");
				
				document.form1.p_option3.options[1] = new Option("생두");
				document.form1.p_option3.options[1].value="생두";
				document.form1.p_option3.options[2] = new Option("볶은원두");
				document.form1.p_option3.options[2].value="볶은원두";
			}
			if(p_option2 == "디카페인") {
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("로스팅 유무 선택");
				
				document.form1.p_option3.options[1] = new Option("생두");
				document.form1.p_option3.options[1].value="생두";
				document.form1.p_option3.options[2] = new Option("볶은원두");
				document.form1.p_option3.options[2].value="볶은원두";
			}
			if(p_option2 == "에스프레소블렌딩") {
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("로스팅 유무 선택");
				
				document.form1.p_option3.options[1] = new Option("생두");
				document.form1.p_option3.options[1].value="생두";
				document.form1.p_option3.options[2] = new Option("볶은원두");
				document.form1.p_option3.options[2].value="볶은원두";
			}
			if(p_option2 == "더치블렌딩") {
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("로스팅 유무 선택");
				
				document.form1.p_option3.options[1] = new Option("생두");
				document.form1.p_option3.options[1].value="생두";
				document.form1.p_option3.options[2] = new Option("볶은원두");
				document.form1.p_option3.options[2].value="볶은원두";
			}
			if(p_option2 == "라떼블렌딩") {
				document.form1.p_option3.options.length = 0;
				document.form1.p_option3.options[0] = new Option("로스팅 유무 선택");
				
				document.form1.p_option3.options[1] = new Option("생두");
				document.form1.p_option3.options[1].value="생두";
				document.form1.p_option3.options[2] = new Option("볶은원두");
				document.form1.p_option3.options[2].value="볶은원두";
			}
			
		}
	</script>
	
	<script>
	$(function() {
		$("#btnPupdate").click(function() {
			if($("#p_type").val() == "") {
				alert("상품분류를 선택하세요.");
				$("#p_type").focus();
				return;
			} 
			if($("#p_option1").val() == "") {
				alert("옵션1을 선택하세요.");
				$("#p_option1").focus();
				return;
			}
			if($("#p_option2").val() == "") {
				alert("옵션2를 선택하세요.");
				$("#p_option2").focus();
				return;
			}
			if($("#p_country_of_origin").val() == "") {
				alert("원산지를 입력하세요.");
				$("#p_country_of_origin").focus();
				return;
			}
			if($("#p_name").val() == "") {
				alert("상품이름을 입력하세요.");
				$("#p_name").focus();
				return;
			}
			if($("#p_size").val() == "") {
				alert("용량/수량/크기를 입력하세요.");
				$("#p_size").focus();
				return;
			}
			if($("#p_price").val() == "") {
				alert("판매가격을 입력하세요.");
				$("#p_price").focus();
				return;
			}
			if($("#p_point").val() == "") {
				alert("포인트를 입력하세요.");
				$("#p_point").focus();
				return;
			}
			document.form1.submit();
		});
		
	});
	</script>
</head>

<body>
	<div id="page">
   
	<%@ include file="../main/menu.jsp" %>
	
		<div id="content">
			<div id="content-inner">
				<div class="content-login">
				
				<div class="content-beans-topImg">
					<h2>상품수정 페이지 </h2>
				</div>
				
			<div id="table-write-wrap">
			<form name="form1" method="post" action="${path}/product_servlet/pUpdate.do" enctype="multipart/form-data">
				<ul id="detail_info01" style="margin: 0px; width: 100%;">
					<li>
						<table class="table_detail" style="width: 480px;">
						    <colgroup>
							    <col width="38%">
							    <col width="62%">
						    </colgroup>
				       		<tbody>
								<tr>
									<td>상품분류(필수)</td>
									<td>
										<select name="p_type" id="p_type" onchange="select_pType(this.value)">
											<option value="">분류를 선택하세요.</option>
											<option value="bean">원두</option>
											<option value="machine">머신</option>
											<option value="mochaPort">모카포트</option>
											<option value="handDrip">핸드드립</option>
											<option value="utensils">관련용품</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>1차분류(필수)</td>
									<td>
										<select name="p_option1" id="p_option1" onchange="select_pOption1(this.value)">
										<option value="">분류를 선택하세요.</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>2차분류(필수)</td>
									<td>
										<select name="p_option2" id="p_option2" onchange="select_pOption2(this.value)">
										<option value="">분류를 선택하세요.</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>로스팅 여부(선택)</td>
									<td>
										<select name="p_option3" id="p_option3">
										<option value="-">선택 안 함</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>원산지(필수)</td>
									<td>
										<input name="p_country_of_origin" id="p_country_of_origin" value="${dto.p_country_of_origin}">
									</td>
								</tr>
								<tr>
									<td>상품명(필수)</td>
									<td>
										<input name="p_name" id="p_name" value="${dto.p_name}">
									</td>
								</tr>
				        	</tbody>
			       		 </table>
					</li>
					
					<li>
						<table class="table_detail" style="width: 480px; margin: 0px;">
						    <colgroup>
							    <col width="38%">
							    <col width="62%">
						    </colgroup>
							<tbody>
								<tr>
									<td>용량/수량/크기(필수)</td>
									<td>
										<input name="p_size" id="p_size" value="${dto.p_size}">
									</td>
								</tr>
								<tr>
									<td>판매가(필수)</td>
									<td>
										<input name="p_price" id="p_price" value="${dto.p_price}">
									</td>
								</tr>
								<tr>
									<td>포인트(필수)</td>
									<td>
										<input name="p_point" id="p_point" value="${dto.p_point}">
									</td>
								</tr>																		
								<tr>
									<td>생산년도</td>
									<td>
										<input name="p_product_date" id="p_product_date" value="${dto.p_product_date}" placeholder="YY년 MM월">
									</td>
								</tr>
								<tr>
									<td>생산자,수입자</td>
									<td>오라클컴퍼니</td>
								</tr>
								<tr>
									
								</tr>
								<tr>
									
								</tr>
							</tbody>
						</table>
					</li>
				</ul>
				
				<ul>
					<li>
						<table style="width: 100%;">
							<tr style="text-align: center;">
									<td>
										<div>
											<img src="${path}/images/${dto.p_img_main}" width="100px" height="100px;"><br>
											<input type="file" name="p_img_main" id="p_img_main"><br>
											메인 이미지(필수)
										</div>
									</td>
									
									<td>
										<div>
											<img src="${path}/images/${dto.p_img1}" width="100px" height="100px;"><br>
											<input type="file" name="p_img1" id="p_img1"><br>
											세부 이미지1(필수)
										</div>
									</td>
									
									<td>
										<div>
											<img src="${path}/images/${dto.p_img2}" width="100px" height="100px;"><br>
											<input type="file" name="p_img2" id="p_img2"><br>
											세부 이미지2(필수)
										</div>
									</td>
							</tr>
						</table>
					</li>
				</ul>
				
				<ul>
					<li>
						<table style="width: 100%;">
							<tr>
								<td style="text-align: center;">
									<div>
										<input type="hidden" id="p_idx" name="p_idx" value="${dto.p_idx}">
										<input class="btn-Type5" type="button" value="목록" 
											onclick="location.href='${path}/product_servlet/productManage.do'">
										<input class="btn-Type5" type="button" value="수정" id="btnPupdate"> 
									</div>
								</td>
							</tr>
						</table>
					</li>
				</ul>
				</form>
				
				<div id="detail_info02"></div>
					
			</div>

			


						
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