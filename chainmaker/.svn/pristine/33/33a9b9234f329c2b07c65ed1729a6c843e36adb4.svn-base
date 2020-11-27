<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	
	<c:if test="${modalDeliveryBuyerDtlTotal eq 0 }">
	  <tr>
	    <td colspan="6">데이터가 존재하지 않습니다.</td>
	  </tr>
	</c:if>
	
	
	<c:if test="${modalDeliveryBuyerDtlTotal > 0 }">
	  <c:forEach items="${listDeliveryBuyerDtl}" var="list">
	    <tr>
	      <td>${list.pro_name}
	      (${list.pro_no})</td>
	      <td>${list.ship_qty}</td>
	      <td>${list.ware_no}</td>
	      <td>${list.ware_name}</td>
	      <td>${list.ware_address} ${list.ware_dt_address}</td>
	    </tr>
	  </c:forEach>
	</c:if>
	
	
	<input type="hidden" id="modalDeliveryBuyerDtlTotal" name="modalDeliveryBuyerDtlTotal" value="${modalDeliveryBuyerDtlTotal}" />