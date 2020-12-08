<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- 빌립담당 -->

		<!-- 갯수가 0인 경우  -->
		<c:if test="${totalCnt eq 0 }">
			<tr>
				<td colspan="6">1:1문의가 존재하지 않습니다.</td>
			</tr>
		</c:if>
		
		
		<!-- 갯수가 있는 경우  -->
		<c:if test="${totalCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
			<c:forEach items="${listInquiry}" var="list">
				<tr>
					<td>${list.row_num}</td>
					<td>${list.category_name}</td>
					<td><a href="javascript:fInquiryModal('${list.inq_no}','${list.loginID}');">${list.inq_title}</td>
					<td>${list.inq_regdate }</td>
					<td>${list.answer_name }</td>
		
					<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				<!-- 
						 <c:set var="nRow" value="${nRow + 1}" />  -->
			</c:forEach>
										
		</c:if>
		
		
		<input type="hidden" id="totalCnt" value="${totalCnt}">
		<!-- 이거 중간에 있으면 table 안먹힘  -->
