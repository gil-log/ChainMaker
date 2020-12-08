<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
									
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
							<c:if test="${totalCntDailyOrder eq 0 }">
								<tr>
									<td colspan="13">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${totalCntDailyOrder > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageDailyOrder-1)}" />
								<c:forEach items="${listDailyOrder}" var="list">
									<tr>
										<td><a href="javascript:fListComnDtlCod(1, '${list.order_no}', '${list.order_no}')">${list.order_no}</a></td>
										<td><fmt:formatDate value="${list.order_date}" pattern="yyyy-MM-dd" /></td>
										<td>${list.user_company }</td>
										<td>${list.pro_name}</td>
										<td>${list.pro_ware_qty}</td>
										<td>${list.pro_price}</td>
										<td>${list.order_qty}</td>
										<td>
										${list.pro_price*1 * list.order_qty*1}
										</td>
										<c:if test="${list.order_cd eq 'order'}">
											<td>주문</td>
										</c:if>
										<c:if test="${list.order_cd eq 'refund'}">
											<td>반품</td>
										</c:if>
										<td>
										<fmt:formatDate value="${list.order_expdate}" pattern="yyyy-MM-dd" />
										</td>
										<c:if test="${list.deposit_cd eq  0}">
											<td>미입금</td>
											<td><a class="btnType3 color2" href="javascript:fNotDepositPopUp();"><span>배송</span></a></td>
											<td><a class="btnType3 color1" href="javascript:fPopModalPurchaseDirection('${list.pro_no}');"><span>발주</span></a></td>
										</c:if>
										<c:if test="${list.deposit_cd eq  1}">
											<td>입금</td>
											
											<c:if test="${list.pro_ware_qty >= list.order_qty}">
												<td><a class="btnType3 color2" href="javascript:fPopModalDeliDirection('${list.order_no}','${list.pro_no}');"><span>배송</span></a></td>
											</c:if>
											<c:if test="${list.pro_ware_qty < list.order_qty}">
												<td><a class="btnType3 color2" href="javascript:fNoneWareQtyPopUp();"><span>배송</span></a></td>
											</c:if>
											
											<td><a class="btnType3 color1" href="javascript:fPopModalPurchaseDirection('${list.pro_no}');"><span>발주</span></a></td>
										</c:if>
									</tr>
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalCntDailyOrder" name="totalCntDailyOrder" value="${totalCntDailyOrder}"/>