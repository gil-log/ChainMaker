<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					

						    
						
							<c:if test="${orderDepositProcessingTotal eq 0 }">
								<tr>
									<td colspan="7">주문 내역이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${orderDepositProcessingTotal > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageOrderDepositProcessingList-1)}" />
								<c:forEach items="${listOrderDepositProcessing}" var="list">
									<tr onclick="javascript:rowClickEvent('${list.order_no}','${list.deposit_cd}')">										
										<td>${list.order_no}</td>
										<td>${list.user_company}</td>
										<td>
										<fmt:formatDate value="${list.order_mod_date}" pattern="yyyy-MM-dd"/>										
										</td>
										<c:if test="${list.deposit_cd eq 1}">
											<td style="color: tomato; font-weight: bold;">입금 확인</td>										
										</c:if>	
										<c:if test="${list.deposit_cd eq 0}">
											<td style="color: skyblue; font-weight: bold;">미입금</td>										
										</c:if>	
									</tr>									
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="orderDepositProcessingTotal" name="orderDepositProcessingTotal" value="${orderDepositProcessingTotal}"/>