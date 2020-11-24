<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					

						    
						
							<c:if test="${returnOrderTotal eq 0 }">
								<tr>
									<td colspan="7">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${returnOrderTotal > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageReturnOrderList-1)}" />
								<c:forEach items="${listReturnOrder}" var="list">
									<tr onclick="javascript:rowClickEvent(${list.refund_no})">										
										<td>${list.refund_no}</td>
										<td>${list.deli_company}</td>
										<td>${list.pro_name}</td>
										<td>${list.refund_qty}</td>
										<td>
										<fmt:formatDate value="${list.refund_date}" pattern="yyyy-MM-dd"/>										
										</td>
										<c:if test="${list.refund_cd == 0}">											
											<td>
												<a class="btnType3 color1" id="depositeConfirm" href="javascript:confirmBtnClickEvent(${list.refund_no});"><span>확인</span></a>
											</td>
										</c:if>
										<c:if test="${list.refund_cd == 1}">
											<td style="color: skyblue;font-weight: bold;">입금완료</td>
										</c:if>										
									</tr>									
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="returnOrderTotal" name="returnOrderTotal" value="${returnOrderTotal}"/>