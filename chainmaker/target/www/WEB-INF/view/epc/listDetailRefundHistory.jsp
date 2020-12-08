<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


		
	<c:if test="${totalRefundHistoryDetail eq 0 }">
							<tr>
								<td colspan="9">데이터가 존재하지 않습니다.</td>
							</tr>

						</c:if>

						<c:if test="${totalRefundHistoryDetail > 0}">
						<c:set var="nRow" value="${pageSize*(currentPageRefundHistoryDetail-1)}" />
					



						<c:forEach items="${detailRefundHistoryDTO}" var="list">
						
								<tr>
									<td>${list.refund_no}</td>
									<td>${list.order_no}</td>
									<td>${list.pro_name}</td>
									<td>${list.pro_no}</td>
									<td>${list.refund_qty}</td>
									<td><fmt:formatDate value="${list.refund_date}" pattern="yyyy-MM-dd" /></td>
									<td>${list.refund_note}</td>
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
									<td><fmt:formatNumber value="${list.pro_price}" pattern="#,###"/>원</td>
								</tr>

							</c:forEach>

						</c:if>
						
						
						<input type="hidden" id="totalRefundHistoryDetail" name="totalRefundHistoryDetail" value="${totalRefundHistoryDetail}"/>

						
						