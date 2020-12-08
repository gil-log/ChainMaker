<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Chain Maker</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<!-- D3 -->
<style>
//
click-able rows
	.clickable-rows {tbody tr td { cursor:pointer;
	
}

.el-table__expanded-cell {
	cursor: default;
}
}
</style>
<script type="text/javascript">
        var pageSizeinf  = 3;
        var pageBlockSizeinquiry  = 10;

		/* onload 이벤트  */
		$(function(){
			
			// 공지사항 조회
			fListInf();
			
			// 버튼 이벤트 등록
			fRegisterButtonClickEvent();
		});
		
		
		/** 버튼 이벤트 등록 */
		function fRegisterButtonClickEvent() {
			$('a[name=btnInfo]').click(function(e) {
				e.preventDefault();

				var btnId = $(this).attr('id');
				switch (btnId) {
					case 'btnCloseGrpCod' :
					case 'btnCloseDtlCod' :
					gfCloseModal();
					break;
			}
		});
	}
				
				
		/** 1:1문의 조회 */
		function fListInf(currentPage) {
			
			currentPage = currentPage || 1;
			
			console.log("currentPage : " + currentPage);
			
			var param = {
						currentPage : currentPage
					,	pageSize : pageSizeinf
			}
			
			var resultCallback = function(data) {
				fListInfResult(data, currentPage);
			};
			
			//Ajax실행 방식
			//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
			//html로 받을거라 text
			callAjax("/inf/listinf.do", "post", "text", true, param, resultCallback);
		}
		
		
		/** 1:1문의 조회 콜백 함수 */
		function fListInfResult(data, currentPage) {
					//alert(data);
			console.log(data);		
			
			// 기존 목록 삭제
			$('#listInf').empty();
			$("#listInf").append(data);
			
			// 총 개수 추출
			var totalCntlistInf = $("#totalCntlistInf").val();
				
		
			// 페이지 네비게이션 생성
			var paginationHtml = getPaginationHtml(currentPage, totalCntlistInf, pageSizeinf, pageBlockSizeinquiry, 'fListInf');
			console.log("paginationHtml : " + paginationHtml);
		
			$("#listInfPagination").empty().append( paginationHtml );
		
		}
		
		/** 1:1문의 모달 실행 */
		function fPopModalInf(notice_no) {

			 $("#selectedInfNo").val(notice_no);
			 
			console.log(typeof(notice_no));
			console.log(notice_no);
			var url = "/inf/infByInfNo.do";
			var param = {
					notice_no : notice_no
			};
			
			var callback = function(data){
				console.log(data);
				$("#inf_title").val(data.infNoData.notice_title);
				$("#inf_content").val(data.infNoData.notice_content);
				$("#filedown").empty().append("<a href='javascript:filedown("+notice_no + ")'>" + data.result2.file_ofname + "</a>");
			}
			
			callAjax(url, "get", "json", true, param, callback);

			gfModalPop("#infModal");		
			
		}
		
		// 첨부파일 다운
		function filedown(notice_no){
	 	 	var params = "";
			params += "<input type='hidden' name='notice_no' value='"+ notice_no +"' />"; 	
			jQuery("<form action='/scm/fileDown.do' method='post'>"+params+"</form>").appendTo('body').submit().remove(); 			
		}


</script>

</head>
<body>
<form id="myForm" action=""  method="">
<input type="hidden" id="selectedInfNo" value="">
	<!-- 모달 배경 -->
	<div id="mask"></div>

	<div id="wrap_area">

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> <jsp:include
						page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
	
					<div class="content" style="margin-bottom:20px;">

						<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">메인</span> <a href="../dashboard/dashboard.do"
								class="btn_set refresh">새로고침</a>
						</p>
						<c:choose>
   					 	<c:when test="${sessionScope.userType eq 'A'}">
							<jsp:include
							page="/WEB-INF/view/dashboard/dashboardScm.jsp"></jsp:include>
    					</c:when>
    					
    					<c:when test="${sessionScope.userType eq 'B'}">
							<jsp:include
							page="/WEB-INF/view/dashboard/dashboardDlm.jsp"></jsp:include>
    					</c:when>
    					
    					<c:when test="${sessionScope.userType eq 'C'}">
							<jsp:include
							page="/WEB-INF/view/dashboard/dashboardEpc.jsp"></jsp:include>
    					</c:when>
    					
    					<c:when test="${sessionScope.userType eq 'D'}">
							<jsp:include
							page="/WEB-INF/view/dashboard/dashboardPcm.jsp"></jsp:include>
    					</c:when>
    					
    					<c:otherwise>
							<jsp:include
							page="/WEB-INF/view/dashboard/dashboardGed.jsp"></jsp:include>
    					</c:otherwise>
					</c:choose>
						<p class="conTitle" style="margin-bottom: 1%;">
							<span>공지 사항</span> <span class="fr"> 
							</span>
						</p>
						
             <div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
								   <col width="5%">
									<col width="70%">
									<col width="10%">
									<col width="5%">
								</colgroup>
	
								<thead>
									<tr>
									    <th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성일</th>
										<th scope="col">작성자</th>
									</tr>
								</thead>
								<tbody id="listInf">
								</tbody>
							</table>
						</div>
										   
					   <div class="paging_area"  id="listInfPagination"> </div>
					   
					</div> <!--// content -->

					</li>
			</ul>
		</div>
	</div>
					
					<div id="infModal" class="layerPop layerType2" style="width: 900px;">
				
						
		<dl>
			<dt>
				<strong>1:1문의</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="*">
						<col width="120px">
						<col width="*">
					</colgroup>
					
					<tbody>
					
					<tr>
							<th scope="row">제목 </th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name="grp_cod_eplti" id="inf_title" maxlength="100"readonly/></td>
						</tr>
						
						<tr>
							<th scope="row">내용</th>
							<td colspan="3" ><textarea class="inputTxt p100"
							style="height: 200px; word-break : break-all;"
								name="grp_cod_eplti" id="inf_content"readonly></textarea></td>
						</tr>
						<tr>
							<th scope="row">첨부 파일 </th>
							<td>
								<div id="filedown"></div>
							</td>
						</tr>
				</tbody>
		</table>
				<div class="btn_areaC mt30">
					<a href="" class="btnType gray" id="btnCloseGrpCod" name="btnInfo"><span>취소</span></a>
				</div>
		</dl>
		</div>
                        <!-- 꾸밀수 있는 거 2 -->
               <!--          <div>
	                        <template id="searcharea2">
	                             <div class="input-group date" style="width:150px;">
	                                      <input id="indate" name="indate" type="text" class="form-control" v-model="date" />
	                                     <span class="input-group-addon">asdf<i class="fa fa-calendar"></i></span>
	                            </div>                            
	                       </template>
                       </div>

						꾸밀수 있는 거 3
						<div>
							<template id="searcharea2">
							<div class="input-group date" style="width: 150px;">
								<input id="indate" name="indate" type="text"
									class="form-control" v-model="date" /> <span
									class="input-group-addon">iiiii<i class="fa fa-calendar"></i></span>
							</div>
							</template>
						</div>

					</div>
			
		</div>
	</div>

	 -->
</form>
</body>
</html>