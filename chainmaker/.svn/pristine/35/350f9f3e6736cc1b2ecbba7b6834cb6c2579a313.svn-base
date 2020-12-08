<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
				
		<!-- 갯수가 0인 경우  -->
		<c:if test="${totalCnt eq 0 }">
			<tr>
				<td colspan="6">공지사항이 없습니다.</td>
			</tr>
		</c:if>
		
		<!-- 갯수가 있는 경우  -->
		<c:if test="${totalCnt > 0 }">
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" /> 
			<c:forEach items="${noticeList}" var="list">
				<tr>
					    <td><a href="javascript:fNoticeModal(${list.notice_no});">${list.notice_no}</a></td>
						<td><a href="javascript:fNoticeModal(${list.notice_no});">${list.notice_title}</a></td>
						<!-- 작성일자와 수정일자가 다르면 수정일자를 보여준다.  -->
						<c:choose>
						<c:when test="${list.notice_regdate eq list.notice_moddate}">
						<td>${list.notice_regdate}</td>
						</c:when>
						<c:otherwise>
						<td>${list.notice_moddate}</td>
						</c:otherwise>
						</c:choose>
						<td>${list.loginID}</td>
						<td>${list.notice_hit}</td>						
					<!-- List에 있는 js 함수 호출가능 이거 그대로 가지고 가기 때문에 !!  -->
				</tr>
				 <c:set var="nRow" value="${nRow + 1}" /> 
			</c:forEach>
		</c:if>
		
		<input type="hidden" id="totalCnt" value="${totalCnt}">
		<!-- 이거 중간에 있으면 table 안먹힘  -->

