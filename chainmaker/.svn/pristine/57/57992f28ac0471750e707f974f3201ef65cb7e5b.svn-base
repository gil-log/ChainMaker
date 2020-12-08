<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Chain Maker :: 매출 현황</title>
<c:if test="${sessionScope.userType ne 'E'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
</script>

<!-- 엑셀 다운로드 -->
<script src="${CTX_PATH}/js/table2excel/jquery.table2excel.js"></script>

<script src="${CTX_PATH}/js/view/ged/salesStatus/salesStatus.js"></script>

	<style>
 		input[name=date].datetype{
 			padding:4px 2px 5px 25px; width:95px; border:1px solid #CACACA;
      font-size:11px; color:#666; 
      background:url('http://cfile23.uf.tistory.com/image/26100D4F5864C76827F535') no-repeat 2px 2px; background-size:15px
    } 
	</style>
	
</head>
<body>
	<input type="hidden" id="selectedCompanyName" value="">
	<input type="hidden" id="datePickerClieckedFlag" value="0">
	<input type="hidden" id="currentPageDailyOrder" value="1">
	<input type="hidden" id="currentPageCompanyDetail" value="1">
	<input type="hidden" id="tmpGrpCod" value="">
	<input type="hidden" id="tmpGrpCodNm" value="">
	<input type="hidden" name="action" id="action" value="">

	<div id="refundDetails"></div>

	<!-- 모달 배경 -->
	<div id="mask"></div>

	<div id="wrap_area">

		<h2 class="hidden">header 영역</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

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
					<div class="content">

						<p class="Location">
							<a href="/dashboard/dashboard.do" class="btn_set home">메인으로</a> <a href="#"
								class="btn_nav">매출 현황</a> <span class="btn_nav bold">매출 현황</span> <a href="../ged/salesStatus.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>매출 현황</span> <span class="fr"> 
							</span>
						</p>
						
						<p class="conTitle">
							<span>거래 내역</span> <span class="fr"> 
							</span>
							
								<label style="margin-left: 3%">기업명      </label> 
								<input type="text" style="text-align: center; height:35%;  width:30%; margin-left: 1%" id='model_name_searchbar'>
								
								
								<label style="margin-left: 5%">거래일자      </label> 
								<input class="datetype" style="margin-left: 1%" type="text" name = "date" id="startDate" readonly="readonly">
							
								<input class="datetype" type="text" name = "date" id="endDate" readonly="readonly">
								
								<a href="" class="btnType blue" id="searchBtn" name="btn" style="margin-left: 2%"><span>검색</span></a>
						</p>
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="20%">
									<col width="10%">
									<col width="10%">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">기업 이름</th>
										<th scope="col">매출 금액</th>
										<th scope="col">수익 금액</th>
									</tr>
								</thead>
								<tbody id="orderList"></tbody>
							</table>
						</div>
						<div class="paging_area" id="orderListPagination"></div>


						<p class="conTitle">
							<span>상세 내역</span> <span class="fr"> 
							</span>
							<img src='/images/excel/excel.png' style="height: 50px; width: 50px; margin-left:2%; float:right;" onclick="fExcelDownload('detailProfitTable', '거래 상세 내역');">
						</p>
						<div class="divComGrpCodList">
							<table class="col" id="detailProfitTable">
								<caption>caption</caption>
								<colgroup>
									<col width="10%">
									<col width="10%">
									<col width="8%">
									<col width="8%">
									<col width="8%">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">기업 이름</th>
										<th scope="col">제품 명</th>
										<th scope="col">거래 금액</th>
										<th scope="col">거래 날짜</th>
										<th scope="col">수익 금액</th>
									</tr>
								</thead>
								<tbody id="orderDetailList"></tbody>
							</table>
							
						</div>
						<div class="paging_area" id="companyDetailPagination"></div>
						
						
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3> <jsp:include
						page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>


</body>
</html>