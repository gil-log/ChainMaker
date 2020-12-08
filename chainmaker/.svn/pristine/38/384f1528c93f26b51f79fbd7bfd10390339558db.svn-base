<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
									
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


							<c:if test="${totalCntDailyOrder eq 0 }">
								<tr>
									<td colspan="13">거래 내역이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							<c:if test="${totalCntDailyOrder > 0 }">
								<c:forEach items="${companySalesDTODetailList}" var="list">
									<tr>
										<td>${list.user_company}</td>
										<td>${list.pro_name}</td>
										
										<td>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.sales_price}" />
										</td>
										<td>${list.order_date}</td>
										<td>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.profit_price}" />
										</td>
									</tr>
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalCntDailyOrder" name="totalCntDailyOrder" value="${totalCntDailyOrder}"/>