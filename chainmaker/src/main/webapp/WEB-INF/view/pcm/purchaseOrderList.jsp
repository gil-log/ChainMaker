<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
					

						    
						
							<c:if test="${purchaseOrderTotal eq 0 }">
								<tr>
									<td colspan="7">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${purchaseOrderTotal > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPagePurchaseOrderList-1)}" />
								<c:forEach items="${listPurchaseOrder}" var="list">
									<tr>										
										<td>${list.purchase_no}</td>
										<td>${list.deli_company}</td>
										<td>${list.pro_name}</td>
										<td>${list.purchase_qty}</td>
										<td>
										<fmt:formatDate value="${list.purchase_date}" pattern="yyyy-MM-dd"/>										
										</td>
										<c:if test="${list.purchase_cd == 1}">
											<td>승인</td>
											<td>
												<a class="btnType3 color1" id="depositeConfirm" href="javascript:confirmBtnClickEvent('${list.purchase_no}');"><span>확인</span></a>
											</td>
										</c:if>
										<c:if test="${list.purchase_cd == 0}">
											<td>미승인</td>
											<td> </td>
										</c:if>
										
									</tr>									
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="purchaseOrderTotal" name="purchaseOrderTotal" value="${purchaseOrderTotal}"/>