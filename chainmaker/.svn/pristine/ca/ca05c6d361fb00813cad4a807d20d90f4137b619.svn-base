<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
									
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

								<c:forEach items="${orderDetailDTOList}" var="list">
									<tr>
										<td><input type="checkbox" id="${list.pro_no}CheckBox" name="refundCheck" onchange="fCheckBox('${list.pro_no}', '${list.order_qty}', '${list.pro_price}');"></td>
										<td>${list.order_no}</td>
										<td>${list.pro_no}</td>
										<td>${list.pro_cd}</td>
										<td>${list.pro_name}</td>
										<td>${list.pro_manu_name}</td>
										<td>${list.order_qty}</td>
										<td>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pro_price*1 * list.order_qty*1}" />
										
										</td>
										<td><input type="number" style="width: 70%"class="${list.pro_no}" onchange="frefundAmount('${list.pro_no}', '${list.pro_price}');" value="0"></td>
										<td>0</td>
									</tr>
								</c:forEach>