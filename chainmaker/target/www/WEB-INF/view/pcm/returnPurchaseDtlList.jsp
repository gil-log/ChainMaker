<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					

						    
						
							<c:if test="${modalReturnPurchaseDtlTotal eq 0 }">
								<tr>
									<td colspan="7">반품 내역 상세 정보가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${modalReturnPurchaseDtlTotal > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageModalReturnPurchaseDtl-1)}" />
								<c:forEach items="${modalReturnPurchaseDtlList}" var="list">
									<tr style="text-align: center;">										
										<td>${list.pro_name}
										(${list.pro_no})</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.refund_qty}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pro_deli_price}"/></td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.sum_price}"/></td>
										<td>${list.ware_no}</td>
										<td>${list.ware_name}</td>									
										<td>${list.ware_address} ${list.ware_dt_address}</td>					
									</tr>									
								<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>							
							</c:if>
							
							<input type="hidden" id="modalReturnPurchaseDtlTotal" name="modalReturnPurchaseDtlTotal" value="${modalReturnPurchaseDtlTotal}"/>
							