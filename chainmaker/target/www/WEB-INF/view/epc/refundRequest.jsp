<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Chain Maker :: 주문 현황 / 반품 신청</title>

<c:if test="${sessionScope.userType ne 'C'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>


<link rel="stylesheet" href="${CTX_PATH}/css/chosen/chosen.css">
<script src="${CTX_PATH}/js/chosen/chosen.jquery.js"></script>

<script src="${CTX_PATH}/js/view/epc/refundRequest/refundRequest.js"></script>

	<style>
 		input[name=date].datetype{
 			padding:4px 2px 5px 25px; width:95px; border:1px solid #CACACA;
      font-size:11px; color:#666; 
      background:url('http://cfile23.uf.tistory.com/image/26100D4F5864C76827F535') no-repeat 2px 2px; background-size:15px
    } 
    
    .chosen-container.chosen-container-single {
    width: 180px !important; /* or any value that fits your needs */
}
	</style>
	
</head>
<body>
	
	<input type="hidden" id="datePickerClieckedFlag" value="0">

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
								class="btn_nav">현황</a> <span class="btn_nav bold">주문 현황 / 반품 신청</span> <a href="../epc/refundrequest.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>주문 현황 / 반품 신청</span> <span class="fr"> 
							</span>
						</p>
						
						<p class="conTitle">
							<span>주문 내역</span> <span class="fr"> 
							</span>
							
								<label style="margin-left: 3%">모델명      </label> 
								<input type="text" style="text-align: center; height:35%;  width:30%; margin-left: 1%" id='model_name_searchbar'>
								
								
								<label style="margin-left: 5%">구매일자      </label> 
								<input class="datetype" style="margin-left: 1%" type="text" name = "date" id="startDate" readonly="readonly">
							
								<input class="datetype" type="text" name = "date" id="endDate" readonly="readonly">
								
								<a href="" class="btnType blue" id="searchBtn" name="btn" style="margin-left: 2%"><span>검색</span></a>
						</p>
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="5%">
									<col width="20%">
									<col width="5%">
									<col width="10%">
									<col width="15%">
									<col width="15%">
									<col width="10%">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">주문 번호</th>
										<th scope="col">주문 제품</th>
										<th scope="col">총 수량</th>
										<th scope="col">결제 금액</th>
										<th scope="col">구매 일자</th>
										<th scope="col">배송 일자</th>
										<th scope="col">주문 현황</th>
									</tr>
								</thead>
								<tbody id="orderList"></tbody>
							</table>
						</div>
						<div class="paging_area" id="orderListPagination"></div>


						<p class="conTitle">
							<span>상세 내역</span> <span class="fr"> 
							</span>
						</p>
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="5%">
									<col width="7%">
									<col width="10%">
									<col width="8%">
									<col width="12%">
									<col width="8%">
									<col width="8%">
									<col width="7%">
									<col width="8%">
									<col width="7%">
								</colgroup>

								<thead>
									<tr>
										<th scope="col">체크</th>
										<th scope="col">주문 번호</th>
										<th scope="col">제품 번호</th>
										<th scope="col">제품 구분</th>
										<th scope="col">제품 명</th>
										<th scope="col">제조사</th>
										<th scope="col">주문 수량</th>
										<th scope="col">결제 금액</th>
										<th scope="col">환불 수량</th>
										<th scope="col">환불 금액</th>
									</tr>
								</thead>
								<tbody id="orderDetailList"></tbody>
							</table>
							
							<div class="btn_areaC mt30" style="margin-bottom: 30px;">
							<a href="javascript:faddRefundBtn();" class="btnType blue"><span>반품 요청</span></a>
							 </div>
						</div>
						
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3> <jsp:include
						page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 모달팝업 -->
	<div id="refundDirection" class="layerPop layerType2"
		style="width: 900px;">
		<dl>
			<dt>
				<strong>반품 지시서 작성</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				
				<table class="col" id ="refundDiretionTable">
					<caption>caption</caption>
					<colgroup>
					
						<col width="4%">
						<col width="12%">
						<col width="12%">
						<col width="8%">
						<col width="16%">
						<col width="10%">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">주문 번호</th>
							<th scope="col">반품 제품 번호</th>
							<th scope="col">반품 제품명</th>
							<th scope="col">반품 수량</th>
							<th scope="col">반품 사유</th>
							<th scope="col">환불 예정 금액</th>
						</tr>
					</thead>
					<tbody id="refund_tbody">

					</tbody>
				</table>
				<div class="btn_areaC mt30">
				
					<a ><span style = " font-size:1.3em; ">환불 계좌 정보 : </span></a>
					<a id="refundBankInfo" style = " font-size:1.5em;"></a>
				</div>
				
				<div class="btn_areaC mt30">
				
					<a ><span style = " font-size:1.3em; ">수거 예정 지역 : </span></a>
					<a id="refundAddressInfo" style = " font-size:1.5em;"></a>
				</div>
				
				<div class="btn_areaC mt30">
				
					<a ><span style = " font-size:2em; ">환불 예정 금액 : </span></a>
					<a id="refundDirectionTotalPrice" style = " font-size:1.5em;"></a>
				</div>



				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="refundDoneBtn" name="btn"><span>반품신청</span></a>
					<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

</body>
</html>