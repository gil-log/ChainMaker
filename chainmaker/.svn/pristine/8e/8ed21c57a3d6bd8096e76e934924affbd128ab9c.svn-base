<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Chain Maker :: 배송 지시서</title>
<c:if test="${sessionScope.userType ne 'A'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
</script>
<script src="${CTX_PATH}/js/view/scm/shippingDirection/shippingDirection.js"></script>

<!-- 엑셀 다운로드 -->
<script src="${CTX_PATH}/js/table2excel/jquery.table2excel.js"></script>

	<style>
 		input[name=date].datetype{
 			padding:4px 2px 5px 25px; width:95px; border:1px solid #CACACA;
      font-size:11px; color:#666; 
      background:url('http://cfile23.uf.tistory.com/image/26100D4F5864C76827F535') no-repeat 2px 2px; background-size:15px
    } 
    
	</style>
	
</head>
<body>
	<input type="hidden" id="currentPageDailyOrder" value="1">
	<input type="hidden" id="currentPageComnDtlCod" value="1">
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
								class="btn_nav">작업지시서</a> <span class="btn_nav bold">배송 지시서</span> <a href="../scm/shippingDirection.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>배송 지시서</span> <span class="fr"> 
							</span>
							
							<label style="margin-left: 67%"><input type="checkbox" id="shippingDoneCheck" value="refund"> 배송 미완료 목록 조회</label>
							<img src='/images/excel/excel.png' style="height: 30px; width: 30px; margin-left:2%;" onclick="fExcelDownload('shippingDirectionTable');">
						</p>
						<div class="divComGrpCodList">
							<table class="col" id="shippingDirectionTable">
								<caption>caption</caption>
								<colgroup>
									<col width="5%">
									<col width="8%">
									<col width="10%">
									<col width="8%">
									<col width="5%">
									<col width="8%">
									<col width="5%">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">주문 번호</th>
										<th scope="col">주문 제품</th>
										<th scope="col">주문 일자</th>
										<th scope="col">고객 기업</th>
										<th scope="col">주문 개수</th>
										<th scope="col">배송 희망 일자</th>
										<th scope="col">배송 상태</th>
									</tr>
								</thead>
								<tbody id="orderList"></tbody>
							</table>
						</div>
						<div class="paging_area" id="orderListPagination"></div>


					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3> <jsp:include
						page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 모달팝업 -->
	<div id="shippingDirection" class="layerPop layerType2"
		style="width: 900px;">
		<dl>
			<dt>
				<strong>배송 지시서</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				
				<table class="col" id ="refundDiretionTable">
					<caption>caption</caption>
					<colgroup>
					
						<col width="8%">
						<col width="6%">
						<col width="8%">
						<col width="8%">
						<col width="6%">
						<col width="10%">
						<col width="7%">
						<col width="6%">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">주문 일자</th>
							<th scope="col">주문 번호</th>
							<th scope="col">주문 기업</th>
							<th scope="col">주문 제품</th>
							<th scope="col">주문 수량</th>
							<th scope="col">배정 창고</th>
							<th scope="col">배송 담당자</th>
							<th scope="col">입금 여부</th>
						</tr>
					</thead>
					<tbody id="shipping_tbody">

					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType gray" id="btnClose" name="btn"><span>닫기</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

</body>
</html>