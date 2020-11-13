<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
					

						    
						
							<c:if test="${totalCntlistInquiry eq 0 }">
								<tr>
									<td colspan="6">데이터가 존재하지 않습니다.</td>
								</tr>
							</c:if>
							
							<c:if test="${totalCntlistInquiry > 0 }">
								<c:set var="nRow" value="${pageSize*(currentPageInquiry-1)}" />
								<c:forEach items="${listInquiry}" var="list">
									<tr>
										<td><a href="javascript:fListComnDtlCod(1, '${list.grp_cod}', '${list.grp_cod_nm}')">${list.inq_no}</a></td>
										<td>${list.inq_title}</td>
										<td>${list.category_cd}</td>
										<td>${list.loginID}</td>
										<td>${list.answer_cd}</td>
										<td>
											<a class="btnType3 color1" href="javascript:fPopModalComnGrpCod('${list.grp_cod}');"><span>수정</span></a>
										</td>
									</tr>									
									<c:set var="nRow" value="${nRow + 1}" />
								</c:forEach>
							</c:if>
							
							<input type="hidden" id="totalCntlistInquiry" name="totalCntlistInquiry" value="${totalCntlistInquiry}"/>