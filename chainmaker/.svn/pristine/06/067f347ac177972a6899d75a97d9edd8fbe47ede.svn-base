<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					

						    
						
							<c:if test="${deliveryBuyerTotal eq 0 }">
								<tr>
									<td colspan="7">배송지시서가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${deliveryBuyerTotal > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageDeliveryBuyerList-1)}" />
								<c:forEach items="${listDeliveryBuyer}" var="list">
									<tr onclick="javascript:rowClickEvent('${list.order_no}', '${list.ship_cd}')">										
										<td>${list.order_no}</td>
										<td>${list.user_company}</td>
										<td>
										<fmt:formatDate value="${list.order_expdate}" pattern="yyyy-MM-dd"/>										
										</td>
										<td>${list.ship_manager}</td>
										<td>${list.ware_name}</td>
										<c:if test="${list.ship_cd == 'waiting'}">
											<td style="color: skyblue;font-weight: bold;">배송 준비중</td>
										</c:if>
										<c:if test="${list.ship_cd == 'loading'}">
											<td style="color: green;font-weight: bold;">배송중</td>
										</c:if>
										<c:if test="${list.ship_cd == 'complete'}">
											<td style="color: red;font-weight: bold;">배송완료</td>
										</c:if>										
									</tr>									
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="deliveryBuyerTotal" name="deliveryBuyerTotal" value="${deliveryBuyerTotal}"/>