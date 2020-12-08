<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.userType ne 'B'}">
  <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<c:if test="${purchaseOrderDtlListTotal eq 0 }">
  <tr>
    <td colspan="9">발주 상세 내역이 없습니다.</td>
  </tr>
</c:if>
<c:if test="${purchaseOrderDtlListTotal > 0 }">
  <c:forEach items="${listPurchaseOrderDtlInfo}" var="list">
    <tr id="${list.purchase_no}${list.ware_no}">
      <td><input type="checkbox" class="chk" name="chk" onclick="allCheckDisable()"></td>
      <td>${list.purchase_no}</td>
      <td>${list.pro_no}</td>
      <td>${list.detail_name}</td>
      <td>${list.pro_name}</td>
      <td>${list.pro_manu_name}</td>
      <td>${list.purchase_date}</td>
      <td>${list.pro_io_qty}</td>
      <td><input type="number" style="width: 70%" class="${list.purchase_no}${list.ware_no}" value="${list.pro_io_qty}" onchange="checkCount(this)" min="1" max="${list.pro_io_qty}"></td>
      <td>${list.pro_deli_price}</td>
      <td>${list.ware_no}</td>
    </tr>
  </c:forEach>
</c:if>
<input type="hidden" id="purchaseOrderDtlListTotal" name="purchaseOrderDtlListTotal" value="${purchaseOrderDtlListTotal}" />
<input type="hidden" id="deli_no" name="deli_no" value="${listPurchaseOrderDtlInfo[0].deli_no}" />
