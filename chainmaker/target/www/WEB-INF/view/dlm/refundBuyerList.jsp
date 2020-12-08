<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
									
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
							<c:if test="${totalCntDailyOrder eq 0 }">
								<tr>
									<td colspan="13">반품 내역이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${totalCntDailyOrder > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageDailyOrder-1)}" />
								<c:forEach items="${EPCRefundInfoList}" var="list">
									<tr onclick="fSelectTR('${list.refund_no}');">
										<td>${list.refund_no}</td>
										<td>${list.user_company}</td>
										<td>${list.pro_name}</td>
										<td>${list.refund_qty}</td>
										<td><fmt:formatDate value="${list.refund_date}" pattern="yyyy-MM-dd" /></td>
										<td>${list.ware_name }</td>
									</tr>
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalCntDailyOrder" name="totalCntDailyOrder" value="${totalCntDailyOrder}"/>