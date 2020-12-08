<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


		
	
						<c:if test="${totalRefundHistory eq 0 }">
							<tr>
								<td colspan="9">데이터가 존재하지 않습니다.</td>
							</tr>

						</c:if>

						<c:if test="${totalRefundHistory > 0}">
						<c:set var="nRow" value="${pageSize*(currentPageRefundHistory-1)}" />
						<c:forEach items="${selectRefundHistoryModel}" var="list">
						
						
								<tr onclick ="fDetailListRefund(1, '${list.refund_no }','<fmt:formatDate value="${list.refund_date}" pattern="yyyy-MM-dd HH:mm:ss" />' );">
									<td>${list.refund_no}</td>
									<td>${list.order_no}</td>
									<td>${list.pro_name}
									<c:if test="${list.count> 1}" >
										 외 ${list.count-1}개
									</c:if>
									</td>
									<td><fmt:formatDate value="${list.refund_date}" pattern="yyyy-MM-dd" /></td>
									<c:if test="${list.refund_confirm_cd eq '0'}">
										<td>미확인</td>
									</c:if>
									<c:if test="${list.refund_confirm_cd eq '1'}">
										<td>반품 미승인</td>
									</c:if>
									<c:if test="${list.refund_confirm_cd eq '2'}">
										<td>반품 승인</td>
									</c:if>
									<c:if test="${list.refund_confirm_cd eq '3'}">
										<td>수거중</td>
									</c:if>
									<c:if test="${list.refund_confirm_cd eq '4'}">
										<td>수거 완료</td>
									</c:if>
								</tr>
							<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
						</c:if>
						
						
						<input type="hidden" id="totalRefundHistory" name="totalRefundHistory" value="${totalRefundHistory}"/>
						
						