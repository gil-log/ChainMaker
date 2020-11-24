<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${purchaseOrderListTotal eq 0 }">
  <tr>
    <td colspan="9">데이터가 존재하지 않습니다.</td>
  </tr>
</c:if>
<c:if test="${purchaseOrderListTotal > 0 }">
  <c:forEach items="${listWHInfo}" var="list">
    <tr onclick="">
      <td>${list.ware_no}</td>
      <td><a href="" id="dtlModifyBtn" name="btn" >${list.ware_name}</a></td>
      <td>${list.name}</td>
      <td>${list.user_email}</td>
      <td>${list.user_tel1}</td>
      <td>${list.ware_zipcode}</td>
      <td>${list.ware_address}</td>
    </tr>
  </c:forEach>
</c:if>
<input type="hidden" id="purchaseOrderListTotal" name="purchaseOrderListTotal" value="${purchaseOrderListTotal}" />