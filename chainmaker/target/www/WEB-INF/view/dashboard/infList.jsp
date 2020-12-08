<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>					
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
						   
							<c:if test="${totalCntlistInf eq 0 }">
								<tr>
									<td colspan="4">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${totalCntlistInf > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
								<c:forEach items="${listInf}" var="list">
									<tr>
										<td>${totalCntlistInf - nRow}</td>
										<td><a href="javascript:fPopModalInf('${list.notice_no}')">${list.notice_title}</a></td>
										<td>${list.notice_regdate}</td>
										<td>${list.loginID}</td>
									</tr>
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalCntlistInf" name="totalCntlistInf" value ="${totalCntlistInf}"/>