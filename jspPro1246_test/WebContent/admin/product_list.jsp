<%@ include file="../include/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<span style="font-size: 15px; float: right;">상품수 : ${count}개</span>
<table class="table-manage" style="width: 100%">
	<colgroup>
		<col width="5%">
		<col width="10%">
		<col width="5%">
		<col width="35%">
		<col width="10%">
		<col width="10%">
		<col width="25%">
	</colgroup>
	
	<tbody>
		<tr style="align: center; margin-bottom: 20px;">
			<th>번호</th>
			<th>대표사진</th>
			<th>분류</th>
			<th>상품정보</th>
			<th>가격</th>
			<th>출시일</th>
			<th></th>
		</tr>
			
		<c:forEach var="dto" items="${list}">
			<tr align="center">
				<td>
				
				<span>${dto.p_idx}</span>
				</td>
				<td>
					<img src="${path}/images/${dto.p_img_main}" style="width:30px;height:30px;">
				</td>
				<td>
					<c:choose>
						<c:when test="${dto.p_type == 'bean'}">
							<span>원두</span>
						</c:when>
						<c:when test="${dto.p_type == 'machine'}">
							<span>머신</span>
						</c:when>
						<c:when test="${dto.p_type == 'mochaPort'}">
							<span>모카포트</span>
						</c:when>
						<c:when test="${dto.p_type == 'handDrip'}">
							<span>핸드드립</span>
						</c:when>
						<c:when test="${dto.p_type == 'utensils'}">
							<span>관련용품</span>
						</c:when>
					</c:choose>
					
				</td>
				<td>
					<a style="font-size: 14px;" href="${path}/product_servlet/viewEdit.do?p_idx=${dto.p_idx}">
						[${dto.p_option2}]&nbsp;${dto.p_name}&nbsp;${dto.p_option3}
					</a><br>	
				</td>
				<td>
					<fmt:formatNumber value="${dto.p_price}" pattern="###,###,###,###원"></fmt:formatNumber>
				</td>
				<td>
					${dto.p_product_date}
				</td>
				<td>
					<a href="${path}/product_servlet/viewEdit.do?p_idx=${dto.p_idx}" class="btn-Type4" style="margin: 3px;">상세보기/수정</a>
					<a onclick="return confirm('상품을 삭제하시겠습니까?')" href="${path}/product_servlet/delete.do?p_idx=${dto.p_idx}" id="btnDelete" class="btn-Type4" style="margin: 3px;">삭제</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
       
