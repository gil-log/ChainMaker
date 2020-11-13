<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="cutil" uri="tld/CommonUtil.tld"%>
<jsp:useBean id="toDay" class="java.util.Date" />
<fmt:formatDate value="${toDay}" pattern="yyyy.MM.dd" var="toDay" />
<div class="divEmpty">
	<div class="hiddenData">
		<span id="totalCnt">${totalCnt}</span>
	</div>
	<table class="col hover"><!-- table = hover : 오버시 라인색 추가 -->
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">조회수</th>
			</tr>
		</thead>
		<tbody id="showList">
			<c:if test="${totalCnt eq 0 }">
				<tr>
					<td colspan="5">데이터가 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<c:set var="nRow" value="${pageSize*(currentPage-1)}" />
			<c:set var="usrSstId" value="<%=session.getAttribute(\"usrSstId\").toString()%>" />
			<c:set var="ofcDvsCod" value="<%=session.getAttribute(\"ofcDvsCod\").toString()%>" />
			<c:forEach items="${listModel}" var="list">
				<tr>
					<td>${totalCnt - nRow}</td>
					<td style="text-align:left;">
						<c:forEach var="a" begin="1" end="${list.lvl}" step="1">
							&emsp;
						</c:forEach>
						<c:if test="${list.bbs_id ne list.hir_bbs_id }">
							└
						</c:if>
						<c:choose>
							<c:when test="${list.dlt_poa eq 'Y' }">
								삭제된 게시물입니다.
							</c:when>
							<c:otherwise>
								<a href="javascript:fSelectData('${list.bbs_id}','1');">${list.titl}</a>
							</c:otherwise>
						</c:choose>
					</td>
					<td>${list.wtr_nm}</td>
					<fmt:parseDate var="dateString" value="${list.write_date}" pattern="yyyyMMddHHmmss" />
					<fmt:formatDate value="${dateString}" pattern="yyyy.MM.dd" var="fstenlmdtt" />
					<fmt:formatDate value="${dateString}" pattern="HH:mm:ss" var="fstenlmdtt2" />
					<c:if test="${toDay > fstenlmdtt}">
						<td>${fstenlmdtt}</td>
					</c:if>
					<c:if test="${toDay <= fstenlmdtt}">
						<td>${fstenlmdtt2}</td>
					</c:if>
					<td>${list.vews}</td>
				</tr>
				
				<!--글내용 -->
				<tr id="${list.bbs_id}_tr" name="cnts_tr" style="display:none;">
					<td></td>
					<td colspan="4">
						<table class="col hover">
							<colgroup>
								<col width="10%">
								<col width="*">
							</colgroup>
							<tbody>
								<tr>
									<td>내용</td>
									<td><div class="bbsCnts" name="hiddenCnts" id="${list.bbs_id}_cnts" ></div></td>
								</tr>
								<tr>
									<td>첨부파일</td>
									<td style="text-align:left;">
										<c:forEach items="${list.listBbsCmtAtmtFilModel}" var="listFile">
											<p><a href="javascript:fDownloadBbsAtmtFil('${listFile.bbs_id}','${listFile.snm}')">${listFile.atmt_fil_lgc_fil_nm}</a> [${cutil:changeFileFormat(listFile.fil_siz)}]</p>
										</c:forEach>
									</td>
								</tr>
							</tbody>
						</table>
						
						<div style="text-align:right;padding-top: 10px;">
							<a class="btnType3 color1" name="rCmt" href="javascript:fWriteComment();"><span>덧글쓰기</span></a>
							<a class="btnType3 color2" name="rCnt" href="javascript:fWriteReply('${list.hir_bbs_id}','${list.titl}','${list.lvl}','${list.sae_obj_gbn_cod}','${list.ofc_id}');"><span>답글</span></a>
							<%if(session.getAttribute("ofcDvsCod").toString().equals("M")){ %>
								<a class="btnType3 color1" href="javascript:fSelectData('${list.bbs_id}','2');"><span>수정</span></a>
								<a class="btnType3" href="javascript:fDeleteData('${list.bbs_id}');" style="color: #fff"><span>삭제</span></a>
							<%}else{ %>
							<c:if test="${usrSstId eq list.usr_sst_id}">
								<a class="btnType3 color1" href="javascript:fSelectData('${list.bbs_id}','2');"><span>수정</span></a>
								<a class="btnType3" href="javascript:fDeleteData('${list.bbs_id}');" style="color: #fff"><span>삭제</span></a>
							</c:if>
							<%} %>
						</div>
						<div name="insertCmt" style="text-align:left;padding-top: 10px;display:none;">
							<textarea id="${list.bbs_id}_cmt" name="cmt_cnt" rows="2" onKeyUp="javascript:fChkByte(this,'500','${list.bbs_id}_byteInfo');" style="height:50px;resize:none;width:85%;padding:5px;"></textarea>
							<a class="btnType3 color3" href="javascript:fSaveCmtData('${list.bbs_id}');"><span>댓글등록</span></a>
							<span id="${list.bbs_id}_byteInfo">0</span>/500Byte
						</div>
						<div name="listCmt" style="text-align:left;padding-top: 10px;">
							<table class="col hover">
								<colgroup>
									<col width="10%">
									<col width="*">
									<col width="10%">
									<col width="5%">
								</colgroup>
								<tbody id="${list.bbs_id}_cmtList">
								</tbody>
							</table>
						</div>
					</td>
				</tr>
				<c:set var="nRow" value="${nRow + 1}" />
			</c:forEach>
		</tbody>
	</table>
</div>