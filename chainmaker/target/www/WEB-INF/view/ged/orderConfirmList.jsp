<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
									
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
							<c:if test="${totalCntDailyOrder eq 0 }">
								<tr>
									<td colspan="13">승인 신청 내역이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${totalCntDailyOrder > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageDailyOrder-1)}" />
								<c:forEach items="${purchaseInfoList}" var="list">
									<tr>
										<td>${list.deli_company}</td>
										<td>${list.purchase_no}</td>
										<td>${list.pro_name}</td>
										<td>${list.purchase_qty}</td>
										<td>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.purchase_price}" /></td>
										<td>${list.name}</td>
										<td><fmt:formatDate value="${list.purchase_date}" pattern="yyyy-MM-dd" /></td>
										
										<td><a class="btnType blue" onclick="fConfirmPurchase('${list.purchase_no}')"><span>승인</span></a></td>
									</tr>
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalCntDailyOrder" name="totalCntDailyOrder" value="${totalCntDailyOrder}"/>