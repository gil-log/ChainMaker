<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					

						    
						
							<c:if test="${modalOrderDepositProcessingDtlTotal eq 0 }">
								<tr>
									<td colspan="4">주문 내역 상세 정보가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${modalOrderDepositProcessingDtlTotal > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageModalOrderDepositProcessingDtl-1)}" />
								<c:forEach items="${modalOrderDepositProcessingDtlList}" var="list">
									<tr>									
										<td>${list.pro_name} (${list.pro_no})</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.order_qty}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pro_price}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.sum_price}"/></td>
									</tr>									
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="modalOrderDepositProcessingDtlTotal" name="modalOrderDepositProcessingDtlTotal" value="${modalOrderDepositProcessingDtlTotal}"/>