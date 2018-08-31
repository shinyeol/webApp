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
	
	<script type="text/javascript">
		function changeImg(num) {
			var btn_img1 = document.getElementById("btn_img1");
			var btn_img2 = document.getElementById("btn_img2");
			var btn_img3 = document.getElementById("btn_img3");
			
			if(num == 1) {
				btn_img1.style.opacity = "1";
				btn_img2.style.opacity = "0";
				btn_img3.style.opacity = "0";
			} else if(num == 2) {
				btn_img2.style.opacity = "1";
				btn_img3.style.opacity = "0";
			} else {
				btn_img3.style.opacity = "1";
			}
		}
		
		function change_amount() {
			var amount = document.getElementById("amount").value;
			var price = document.getElementById("price").value;
			var totPrice = price * amount;
			document.getElementById("totPrice").innerHTML = totPrice;
		}
		
		function cartCheck() {
			var amount = document.getElementById("amount").value;
			
			if(amount != 0) {
				document.form1.action="${path}/cart_servlet/insert.do";
				document.form1.submit();
			}else {
				alert("수량을 선택해주세요.");
				document.form1.amount.focus();
				return;
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


			<div id="product_view-container" style="margin-top: 50px;">
				<div class="ctrl04" style="display: none;">
					<a href="#" id="rolling_prev04"></a>
					<a href="#" id="rolling_next04"></a>
				</div>
				
				<ul class="product_view-slider">
			 	 	<li id="btn_img1" style="z-index: 24; display: list-item; opacity: 1;">
			 	 		<img src="${path}/images/${dto.p_img_main}">
			 	 	</li>
			 	 	<li id="btn_img2" style="z-index: 25; display: list-item; opacity: 0;">
			 	 		<img src="${path}/images/${dto.p_img1}">
			 	 	</li>
			 	 	<li id="btn_img3" style="z-index: 26; display: list-item; opacity: 0;">
			 	 		<img src="${path}/images/${dto.p_img2}">
			 	 	</li>
				</ul>
				
				<div id="product_view-pager">
			 	 	<a id="btn-img_1" onclick="changeImg(1)">
			 	 		<img src="${path}/images/${dto.p_img_main}">
			 	 	</a>
					<a id="btn-img_2" onclick="changeImg(2)">
						<img src="${path}/images/${dto.p_img1}">
					</a>
					<a id="btn-img_3" onclick="changeImg(3)">
						<img src="${path}/images/${dto.p_img2}">
					</a>					
				</div>
			</div>

			<div id="detail_info_wrap">
				<h2>[${dto.p_option2}]&nbsp;${dto.p_name} ${dto.p_size}</h2>
				<ul id="detail_info01">
					<li>
						<table class="table_detail">
						    <colgroup>
							    <col width="38%">
							    <col width="62%">
						    </colgroup>
				       		<tbody>
								<tr>
									<td>상품번호</td>
									<td>${dto.p_idx}</td>
								</tr>
								<tr>
									<td>용량/수량/크기</td>
									<td>${dto.p_size}</td>
								</tr>
								<tr>
									<td>생산자,수입자</td>
									<td>오라클컴퍼니</td>
								</tr>
								<tr>
									<td>원산지</td>
									<td>${dto.p_country_of_origin}</td>
								</tr>
								<tr>
									<td>생산년도</td>
									<td>${dto.p_product_date}</td>
								</tr>
								<tr>
									<td>상품구성</td>
									<td>${dto.p_name} ${dto.p_size}</td>
								</tr>
				        	</tbody>
			       		 </table>
					</li>
					
					<li>
					<form name="form1" method="post">
						<table class="table_detail">
						    <colgroup>
							    <col width="38%">
							    <col width="62%">
						    </colgroup>
						    
							<tbody>
								<tr>
									<td>포인트</td>
									<td>
										<span class="txt_type24">${dto.p_point}p</span>
									</td>
								</tr>
								<tr>
									<td>판매가</td>
									<td>
										<span style="text-decoration:line-through;" class="txt_type24">
											<fmt:formatNumber value="${dto.p_price}" pattern="###,###,###원"></fmt:formatNumber>
										</span>
									</td>
								</tr>								
								<tr>
									<td>회원가</td>
									<td>
										<span class="txt_type14">
											<fmt:formatNumber value="${dto.p_price-(dto.p_price*0.05)}" pattern="###,###,###원"></fmt:formatNumber>
										</span>&nbsp;<span class="txt_type14">(5% 할인)</span>
									</td>
								</tr>											
								<tr style="background-color:#f9f9f9;">
									<td><span class="txt_type60">주문 수량</span></td>
									<td>
										<div class="count_box2">
											<select name="amount" id="amount" onchange="change_amount()">
												<option value="0" selected="selected">수량을 선택해주세요.</option>
												<c:forEach begin="1" end="10" var="i">
													<option value="${i}">${i}</option>
												</c:forEach>
											</select>
										</div>
	
									</td>
								</tr>
								<tr style="background-color:#f9f9f9;">
									<td style="height:32px;"><span class="txt_type60">주문 금액</span></td>
									<td>
										<div class="result">
											<span class="txt_price txt_bold"><strong><span id="totPrice"></span></strong>원</span>
										</div>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<div class="margin_top_30">
											<input type="hidden" name="p_idx" value="${dto.p_idx}">
											<input type="hidden" name="p_type" value="${dto.p_type}">
											<input type="hidden" name="c_img" value="${dto.p_img_main}">
											<input type="hidden" name="p_option2" value="${dto.p_option2}">
											<input type="hidden" name="p_name" value="${dto.p_name}">
											<input type="hidden" name="p_size" value="${dto.p_size}">
											<input type="hidden" name="price" id="price" value="${dto.p_price}">
									        
									        <input class="btn-Type5" type="button" value="장바구니 담기" onclick="cartCheck()"> 
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						</form>
					</li>
				</ul>
				
				
				
				<div id="detail_info02"></div>
					
			</div>

			


						
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