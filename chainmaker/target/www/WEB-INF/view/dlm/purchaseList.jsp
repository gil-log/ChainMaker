<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.userType ne 'B'}">
  <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<c:if test="${purchaseOrderListTotal eq 0 }">
  <tr>
    <td colspan="9">발주 정보가 없습니다.</td>
  </tr>
</c:if>
<c:if test="${purchaseOrderListTotal > 0 }">
  <c:forEach items="${listPurchaseOrderInfo}" var="list">
    <tr onclick="purchaseOrderDtlList(0,${list.deli_no})">
      <td>${list.deli_no}</td>
      <td><a href="javascript:purchaseOrderDtlList(0,${list.deli_no})" id="modifyBtn" name="btn">${list.deli_company}</a></td>
      <td>${list.total_price}</td>
    </tr>
  </c:forEach>
</c:if>
<input type="hidden" id="purchaseOrderListTotal" name="purchaseOrderListTotal" value="${purchaseOrderListTotal}" />