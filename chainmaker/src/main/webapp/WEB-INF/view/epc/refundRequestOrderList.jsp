<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
									
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
							<c:if test="${totalCntDailyOrder eq 0 }">
								<tr>
									<td colspan="13">주문 내역이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${totalCntDailyOrder > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageDailyOrder-1)}" />
								<c:forEach items="${orderListWithQtyAndDate}" var="list">
									<tr onclick="fSelectTR('${list.order_no}');">
										<td>${list.order_no}</td>
										<td>${list.pro_name}</td>
										<td>${list.order_total_qty}</td>
										<td>${list.amount_payment}</td>
										<td><fmt:formatDate value="${list.order_date}" pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${list.order_expdate}" pattern="yyyy-MM-dd" /></td>
									</tr>
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalCntDailyOrder" name="totalCntDailyOrder" value="${totalCntDailyOrder}"/>