<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


				
		<!-- 갯수가 0인 경우  -->
		<c:if test="${totalCnt eq 0 }">
			<tr>
				<td colspan="9">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		

		<!-- 갯수가 있는 경우  -->
		<c:if test="${totalCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
			<c:forEach items="${listModel}" var="list">
				<tr>
				        <td>${nRow + 1}</td>  
						<td>${list.pro_model_name}</td>
						<td><a href="javascript:fUserModal('${list.pro_no}');">${list.pro_no}</a></td>   
					    <td><a href="javascript:fUserModal('${list.pro_no}');">${list.pro_name}</a></td>
						<td>${list.pro_manu_name}</td>
						<td>${list.pro_price}</td>
						<td>${list.deli_company}</td>
						<td>${list.pro_deli_price}</td>
	
					<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				 <c:set var="nRow" value="${nRow + 1}" /> 
			</c:forEach>
		</c:if>
		
		<input type="hidden" id="totalCnt" value="${totalCnt}">
