<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 빌립담당 -->

		<!-- 갯수가 0인 경우  -->
		<c:if test="${totalCnt eq 0 }">
			<tr>
				<td colspan="6">유저가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		
		
		<!-- 갯수가 있는 경우  -->
		<c:if test="${totalCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
			<c:forEach items="${listUser}" var="list">
				<tr>
					<td>${list.divCD_name}
					<c:set var = "company_name" value ="${list.user_company}"/>
					</td>
					<td>${list.loginID}</td>
					<c:if test="${company_name ne null and !company_name.isEmpty()}">
					<td><a href="javascript:fUserModal('${list.loginID}');">${list.user_company}</a></td>
					<td><a href="javascript:fUserModal('${list.loginID}');">${list.chaCD_name}</a></td>
					<td><a href="javascript:fUserModal('${list.loginID}');">${list.name}</a></td>
					</c:if>
					
					<c:if test="${company_name eq null or company_name.isEmpty()}">
					<td><a href="javascript:fUserModal('${list.loginID}');">${list.name}</a></td>
					<td><a href="javascript:fUserModal('${list.loginID}');">${list.chaCD_name}</a></td>
					<td></td>
					</c:if>

					<td>${list.user_tel1} - ${list.user_tel2} - ${list.user_tel3}</td>
					<td>${list.delCD_name}</td>
		
					<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				<!-- 
						 <c:set var="nRow" value="${nRow + 1}" />  -->
			</c:forEach>
										
		</c:if>
		
		
		<input type="hidden" id="totalCnt" value="${totalCnt}">
		<!-- 이거 중간에 있으면 table 안먹힘  -->
