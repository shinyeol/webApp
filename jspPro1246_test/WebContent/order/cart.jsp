<%@ include file="../include/session_check.jsp" %>
<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>커피는 자바빈스</title>
	
</head>
<body>
   <div id="page">
   
	<%@ include file="../main/menu.jsp" %>
      
      <div id="content">
         <div id="content-inner">
            <div class="content-login">
            	<div id="content_wrap02">
	
		<div class="order_process_wrap">
			<div class="order_process_img">
				<img class="" src="../images/icon_cart.png">
			</div>
			<h2>장바구니</h2>
			<div>
                <span id="step_cart" style="background: #977a5b; color: white; font-weight: bold;">1. 장바구니</span> >
                <span id="step_payment">2. 주문서작성/결제</span> >
                <span id="step_cart">3. 주문완료</span>
            </div>
		</div>
		
		<!-- 장바구니 내역 시작 -->
		<h2 class="sub_title1">장바구니 상품</h2>
		
		<table class="table-cart">
			<colgroup>
				<col width="10%">
				<col width="30%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
				<col width="15%">
			</colgroup>
			
<c:choose>
	<c:when test="${map.count == 0 }">
		<h2 id="cartIsEmpty">장바구니가 비었습니다.</h2>
	</c:when>
	<c:otherwise>	
			<tbody>
			<tr>
				<th></th>
				<th>상품정보</th>
				<th>회원가</th>
				<th>수량</th>
				<th>주문금액</th>
				<th></th>
			</tr>
		<c:forEach var="dto" items="${dto}">
			<tr align="center">
				<td>
					<img src="${path}/images/${dto.c_img}" style="width:90px;height:90px;">
				</td>
				<td class="txt_left">
					<a href="${path}/product_servlet/productView.do?p_type=${dto.p_type}&p_idx=${dto.p_idx}">${dto.p_name}</a><br>	
				</td>
				
				<td>
<%-- 					<span style="text-decoration:line-through;">
					 	<fmt:formatNumber value="${dto.money}" pattern="###,###,###원"></fmt:formatNumber></span><br>
					<span class="txt_type70"> --%>
						<fmt:formatNumber value="${dto.money}" pattern="###,###,###원"></fmt:formatNumber>
						<input type="hidden" name="show_sale_price" id="show_sale_price" value="${dto.money}">
				</td>
				<td>
					<div class="count_box_cart">
						<form name="form_cart" id="form_cart" method="post" action="${path}/cart_servlet/update.do">
						<input type="number" min="1" max="10" name="amount" id="amount" value="${dto.amount}" style="width: 40px;">
						<input type="hidden" name="c_idx" value="${dto.c_idx}">
						<br><button type="submit" class="btn-Type4">수량 변경</button>
						</form>
					</div>
				</td>
				<td>
					<span class="txt_type80"><span id="showTotSaleCost_1">
						<fmt:formatNumber value="${dto.money}" pattern="###,###,###"></fmt:formatNumber>
					</span>원</span>
				</td>
				<td>
					<a href="#" class="btn-Type4" style="margin: 3px;">바로주문</a>
					<a onclick="return confirm('장바구니에서 삭제하시겠습니까?')" href="${path}/cart_servlet/delete.do?c_idx=${dto.c_idx}" id="btnDelete" class="btn-Type4" style="margin: 3px;">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</c:otherwise>
</c:choose>

			</tbody>
		</table>
		
<c:if test="${map.count != 0 }">	
		<ul class="total_order_wrap">
			<li>
				<p>상품금액</p><p></p>
				<h2><span id="goodsTotCost">
					<fmt:formatNumber value="${map.sumMoney}" pattern="###,###,###원"></fmt:formatNumber>
				</span></h2>
				<input type="hidden" name="goods_sum_price" id="goods_sum_price" value="${map.sumMoney}">
			</li>
			<li><h2> + </h2></li>
			<li>
				<p>배송비</p><p></p>
				<h2><span id="shippingShow">
					<fmt:formatNumber value="${map.fee}" pattern="###,###,###원"></fmt:formatNumber>
				</span></h2>
				<input type="hidden" name="deli_price" id="deli_price" value="${map.fee}">
			</li>
			<li><h2> = </h2></li>
			<li>
				<p>결제예정금액</p><p></p>
				<h2><span id="payTotCost" class="txt_red1">
					<fmt:formatNumber value="${map.sum}" pattern="###,###,###원"></fmt:formatNumber>
				</span></h2>
				<input type="hidden" name="total_price" id="total_price" value="${map.sum}">
			</li>
			<li>
				<a href="javascript:cartToOrder('cart');" id="btnOrder" class="btn-Type3">전체상품 주문하기</a>
			</li>	
		</ul>
		
		<ul class="sub_copy01 margin_top_50">
			
			<li>
				<span class="txt_type70">·&nbsp;30,000원 이상 주문 시, 무료배송 (제주도 및 도서산간지역 추가 비용없이 배송)</span><br>
			</li>
		</ul>
		
		<!--장바구니 전체구매 시작-->
		<form name="cartToOrder" id="cartToOrder" method="post">
			<input type="hidden" name="orderDiv">
		</form>
		<!--장바구니 전체구매 끝-->
		
		<!--바로주문 처리 시작-->
		<form name="directToOrder" id="directToOrder" method="post">
			<input type="hidden" name="orderDiv">
			<input type="hidden" name="directNum">
			<input type="hidden" name="orderOption">
		</form>
		<!--바로주문 처리 끝-->
</c:if>			
		
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