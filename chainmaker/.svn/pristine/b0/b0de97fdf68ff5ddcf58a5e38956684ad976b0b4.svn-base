<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- 갯수가 0인 경우  -->
<c:if test="${totalCnt eq 0 }">
	<tr>
		<td colspan="9">데이터가 존재하지 않습니다.</td>
	</tr>
</c:if>


<!-- 갯수가 있는 경우  -->
<c:if test="${totalCnt > 0 }">
	<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
	<c:forEach items="${refundList}" var="list">
		<tr>
			<td>${list.user_company}</td>
			<td>${list.refund_no}</td>
			<td>${list.refund_date}</td>
			<td>${list.pro_no}</td>
			<td>${list.pro_name}</td>
			<td>${list.order_qty}</td>
			<td>${list.refund_qty}</td>
			<td><fmt:formatNumber value="${list.total_price}" pattern="#,###,###"/> 원</td>
			<td><a href="javascript:RDocModal('${list.refund_no}', '${list.pro_no}', '${list.ware_no}')"
				class="btnType blue" name="btn"><span>열기</span></a></td>
			<%-- <fmt:formatNumber value="${list.total_price}" pattern="#,###,###"/> 원--%>
			<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
		</tr>
		<!-- c set 이거 하면 1,3,5,7이런식으로 나온다. refundconfirm 에서는 이게 들어가야 1111, 이렇게 안뜬다. -->
		<!--  <c:set var="nRow" value="${nRow + 1}" />  -->
	</c:forEach>

</c:if>


<input type="hidden" id="totalCnt" value="${totalCnt}">  <!-- 이거 중간에 있으면 table 안먹힘  -->