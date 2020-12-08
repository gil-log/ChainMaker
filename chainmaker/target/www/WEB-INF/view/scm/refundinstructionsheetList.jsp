<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				
		<!-- 갯수가 0인 경우  -->
		<c:if test="${totalCnt eq 0 }">
			<tr>
				<td colspan="6">반품지시서가 없습니다.</td>
			</tr>
		</c:if>
		
		<!-- 갯수가 있는 경우  -->
		<c:if test="${totalCnt > 0 }">		
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
			<c:forEach items="${refundInsList}" var="list">
				<tr>			
						<td>${list.refund_no}</td>
						<c:choose>
						<c:when test="${list.order_date ne null}">
						<td>${list.order_date}</td>
						</c:when>
						<c:when test="${list.purchase_date ne null}">
						<td>${list.purchase_date}</td>
						</c:when>
						<c:otherwise>
						<td></td>
						</c:otherwise>	
						</c:choose>						
						<td>${list.pro_name}</td>
						<td>${list.refund_qty}</td>		
						<td>${list.pro_price * list.refund_qty}</td>
						<c:choose>
						<c:when test="${list.order_no > 0}">
						<td>주문반품</td>
						</c:when>
						<c:when test="${list.purchase_no > 0}">
						<td>발주반품</td>
						</c:when>	
						<c:otherwise>
						<td></td>
						</c:otherwise>					
						</c:choose>
						<c:choose>
						<c:when test="${list.refund_confirm_cd > 1}">
						<td>승인</td>
						</c:when>
						<c:when test="${list.purchase_cd > 0}">
						<td>승인</td>
						</c:when>
						<c:otherwise>
						<td>미승인</td>
						</c:otherwise>
						</c:choose>
					<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				 <c:set var="nRow" value="${nRow + 1}" /> 
			</c:forEach>
		</c:if>
		
		<input type="hidden" id="totalCnt" value="${totalCnt}">
		<!-- 이거 중간에 있으면 table 안먹힘  -->

