<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					

						    
						
							<c:if test="${returnPurchaseTotal eq 0 }">
								<tr>
									<td colspan="7">반품 내역이 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${returnPurchaseTotal > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageReturnPurchaseList-1)}" />
								<c:forEach items="${listReturnPurchase}" var="list">
									<tr onclick="javascript:rowClickEvent('${list.refund_no}', '${list.refund_cd}')">										
										<td>${list.refund_no}</td>
										<td>${list.deli_company}</td>
										<td>
										<fmt:formatDate value="${list.refund_date}" pattern="yyyy-MM-dd"/>										
										</td>
										<c:if test="${list.refund_cd == 0}">
											<td style="color: skyblue;font-weight: bold;">지시서 발송 대기</td>	
										</c:if>
										<c:if test="${list.refund_cd == 1}">											
											<td style="color: green;font-weight: bold;">입금대기</td>
											<%-- <td>
												<a class="btnType3 color1" id="depositeConfirm" href="javascript:confirmBtnClickEvent(${list.refund_no});"><span>확인</span></a>
											</td> --%>
										</c:if>
										<c:if test="${list.refund_cd == 2}">
											<td style="color: tomato;font-weight: bold;">입금완료</td>
										</c:if>										
									</tr>									
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="returnPurchaseTotal" name="returnPurchaseTotal" value="${returnPurchaseTotal}"/>