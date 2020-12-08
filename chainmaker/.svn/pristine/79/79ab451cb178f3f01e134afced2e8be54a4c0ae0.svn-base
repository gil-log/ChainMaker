<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
	<c:if test="${modalDeliveryBuyerDtlTotal eq 0 }">
	  <tr>
	    <td colspan="6">상세 내역이 존재하지 않습니다.</td>
	  </tr>
	</c:if>
	
	
	<c:if test="${modalDeliveryBuyerDtlTotal > 0 }">
	  <c:forEach items="${listDeliveryBuyerDtl}" var="list">
	    <tr style="text-align: center;">
	      <td>${list.pro_name}
	      (${list.pro_no})</td>
	      <td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.ship_qty}"/></td>
	      <td>${list.ware_no}</td>
	      <td>${list.ware_name}</td>
	      <td>${list.ware_address} ${list.ware_dt_address}</td>
	    </tr>
	  </c:forEach>
	</c:if>
	
	
	<input type="hidden" id="modalDeliveryBuyerDtlTotal" name="modalDeliveryBuyerDtlTotal" value="${modalDeliveryBuyerDtlTotal}" />