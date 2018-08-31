<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       
<ul>
<c:forEach var="dto" items="${list}">
	<li>
		<div class="product-list-ea">
			<div class="image">
				<a href="${path}/product_servlet/productView.do?p_type=${dto.p_type}&p_idx=${dto.p_idx}">
					<img src="${path}/images/${dto.p_img_main}">
				</a>
			</div>
			
			<ul class="icons">
				<li class="point">${dto.p_point}p</li>
			</ul>
			
			<div class="title">
				<a href="${path}/product_servlet/productView.do?p_type=${dto.p_type}&p_idx=${dto.p_idx}">
					[${dto.p_option2}]&nbsp;${dto.p_name}&nbsp;${dto.p_option3}
				</a>
			</div>
			
			<div class="price">
				<span class="current_price">\ 
					<fmt:formatNumber value="${dto.p_price}" pattern="###,###,###,###원"></fmt:formatNumber>
				</span>
				<input type="hidden" name="enuri_price" value="${dto.p_price}">
			</div>
		</div>
	</li>
</c:forEach>
</ul>
