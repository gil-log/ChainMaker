<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					
							<c:if test="${totalCntProductList eq 0 }">
								<tr>
									<td colspan="9">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
					
							
								<c:if test="${totalCntProductList > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageProductList-1)}" />
								<c:forEach items="${listProductListModel}" var="list">
									<tr>
										<td><a href = "javascript:fPopModalProductList('${list.pro_num}');">${list.pro_num}</a></td>
										<td>${list.pro_cod}</td>
										<td>${list.pro_cod_nam}</td>
										<td>${list.pro_manu_nm}</td>
										<td>${list.pro_prc}</td>
										
									</tr>
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalCntProductList" name="totalCntProductList" value="${totalCntProductList}"/>