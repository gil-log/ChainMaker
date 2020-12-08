<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					

						    
						
							<c:if test="${refundFinalProcessingTotal eq 0 }">
								<tr>
									<td colspan="7">반품 내역이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${refundFinalProcessingTotal > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageRefundFinalProcessingList-1)}" />
								<c:forEach items="${listRefundFinalProcessing}" var="list">
									<tr onclick="javascript:rowClickEvent('${list.refund_no}','${list.refund_confirm_cd}')">										
										<td>${list.refund_no}</td>
										<td>${list.user_company}</td>
										<td>
										<fmt:formatDate value="${list.refund_date}" pattern="yyyy-MM-dd"/>										
										</td>
										<c:if test="${list.refund_confirm_cd eq 4}">
											<td style="color: tomato; font-weight: bold;">반품 처리 완료</td>										
										</c:if>	
										<c:if test="${list.refund_confirm_cd eq 3}">
											<td style="color: skyblue; font-weight: bold;">반품 처리 대기</td>										
										</c:if>	
									</tr>									
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="refundFinalProcessingTotal" name="refundFinalProcessingTotal" value="${refundFinalProcessingTotal}"/>