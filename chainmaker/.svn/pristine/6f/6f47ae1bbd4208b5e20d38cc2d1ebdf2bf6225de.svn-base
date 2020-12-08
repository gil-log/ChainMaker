<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		
		
	
		
						<c:if test="${totalDelivery eq 0 }">
							<tr>
								<td colspan="9">데이터가 존재하지 않습니다.</td>
							</tr>

						</c:if>

						<c:if test="${totalDelivery > 0}">
						<c:set var="nRow" value="${pageSize*(currentPageDelivery-1)}" />
						<c:forEach items="${listDeliveryModel}" var="list">						
								<tr>
									<td>${list.deli_no }</td>
									<td><a href="javascript:fListProduct(1,  '${list.deli_company}', '${list.deli_no}')">${list.deli_company}</a></td>
									<td>${list.deli_id}</td>
									<td>${list.deli_password}</td>
									<td>${list.deli_name}</td>
									<td>${list.deli_phone}</td>
									<td>${list.deli_email}</td>
									<td>
										<a href="javascript:fPopModalDelivery('${list.deli_no}');" class="btnType3 color1"><span>수정</span></a>
									</td>
								</tr>
							<c:set var="nRow" value="${nRow + 1}" />
							</c:forEach>
						</c:if>
						
						
						<input type="hidden" id="totalDelivery" name="totalDelivery" value="${totalDelivery}"/>
						

					