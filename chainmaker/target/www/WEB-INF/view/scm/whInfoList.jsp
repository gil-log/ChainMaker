<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.userType ne 'A'}">
  <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<c:if test="${totalcnt eq 0 }">
  <tr>
    <td colspan="9">창고 정보가 없습니다.</td>
  </tr>
</c:if>
<c:if test="${totalcnt > 0 }">
  <c:forEach items="${listWHInfo}" var="list">
    <tr onclick="javascript:whInitModal(modify,${list.ware_no})">
      <td>${list.ware_no}</td>
      <td><a href="javascript:whInitModal(modify,${list.ware_no})" id="modifyBtn" name="btn" >${list.ware_name}</a></td>
      <td>${list.name}</td>
      <td>${list.user_email}</td>
      <td>${list.user_tel1}-${list.user_tel2}-${list.user_tel3}</td>
      <td>${list.ware_zipcode}</td>
      <td>${list.ware_address} ${list.ware_dt_address}</td>
    </tr>
  </c:forEach>
</c:if>
<input type="hidden" id="totalcnt" name="totalcnt" value="${totalcnt}" />