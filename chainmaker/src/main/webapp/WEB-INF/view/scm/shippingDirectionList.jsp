<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
									
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
							<c:if test="${totalCntDailyOrder eq 0 }">
								<tr>
									<td colspan="13">배송 지시서가  존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${totalCntDailyOrder > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageDailyOrder-1)}" />
								<c:forEach items="${shippingDirectionList}" var="list">
									<tr onclick="fSelectTR('${list.order_no}');">
										<td>${list.order_no}</td>
										<td>${list.pro_name}</td>
										<td><fmt:formatDate value="${list.order_date}" pattern="yyyy-MM-dd" /></td>
										<td>${list.user_company}</td>
										<td>${list.ship_total_qty}</td>
										<td><fmt:formatDate value="${list.order_expdate}" pattern="yyyy-MM-dd" /></td>
										
										<c:if test="${list.ship_cd eq 'waiting'}">
											<td>배송대기</td>
										</c:if>
										<c:if test="${list.ship_cd eq 'loading'}">
											<td>배송 중</td>
										</c:if>
										<c:if test="${list.ship_cd eq 'complete'}">
											<td>배송 완료</td>
										</c:if>
										
									</tr>
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalCntDailyOrder" name="totalCntDailyOrder" value="${totalCntDailyOrder}"/>