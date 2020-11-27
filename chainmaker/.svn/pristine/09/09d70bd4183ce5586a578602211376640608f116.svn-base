<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Chain Maker</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
</script>
<script src="${CTX_PATH}/js/view/epc/refundRequest/refundRequest.js"></script>

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

	<div id="productDetails"></div>

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
							<a href="#" class="btn_set home">메인으로</a> <a href="#"
								class="btn_nav">거래내역</a> <span class="btn_nav bold">일별 수주
								내역</span> <a href="../scm/dailyOrderHistory.do" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>반품 신청</span> <span class="fr"> 
							</span>
						</p>
						<p class="conTitle">
							
								<label >모델명      </label> 
								<input type="text" style="text-align: center; width:30%; margin-left: 1%">
								
								
								<label style="margin-left: 25%">구매일자      </label> 
								<input class="datetype" style="margin-left: 1%" type="text" name = "date" id="startDate">
							
								<input class="datetype" type="text" name = "date" id="endDate">
						
						</p>
						
						<p class="conTitle">
							<span>주문 내역</span> <span class="fr"> 
							</span>
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
								</colgroup>

								<thead>
									<tr>
										<th scope="col">주문 번호</th>
										<th scope="col">주문 제품</th>
										<th scope="col">총 수량</th>
										<th scope="col">결제 금액</th>
										<th scope="col">구매 일자</th>
										<th scope="col">배송 일자</th>
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
							
							<div class="paging">
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
	<div id="deliDirection" class="layerPop layerType2"
		style="width: 900px;">
		<dl>
			<dt>
				<strong>배송 지시서 작성</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->

				<table class="col">
					<caption>caption</caption>
					<colgroup>
						<col width="8%">
						<col width="14%">
						<col width="10%">
						<col width="18%">
						<col width="6%">
						<col width="8%">
						<col width="6%">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">주문 번호</th>
							<th scope="col">주문 일자</th>
							<th scope="col">고객기업명</th>
							<th scope="col">주문제품명</th>
							<th scope="col">주문 개수</th>
<!-- 							<th scope="col">배송 담당자</th>
							<th scope="col">입금여부</th> -->
						</tr>
					</thead>
					<tbody>

						<tr>
							<td><a type="text" class="inputTxt p100" name="order_no"
								id="order_no" readonly="readonly" /></a></td>
							<td id="order_date"></td>
							<td id="user_company"></td>
							<td id="pro_name"></td>
							<td id="order_qty"></td>
<!-- 							<td id="name"></td>
							<td id="order_cd"></td> -->
						</tr>
					</tbody>
				</table>

				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="15%">
						<col width="5%">
						<col width="10%">
						<col width="15%">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">창고 선택</th>
							<td><select style="width: 160px" id="ware_name_option"
								name="ware_name_option"
								onchange="fSelectedOptions(this.options[this.selectedIndex].value, ware_name_option)">
							</select></td>

							<th scope="row">재고 개수 <span class="font_red"></span></th>
							<td><input type="text" class="inputTxt p100"
							id="pro_ware_qty_upper" readonly="readonly" /></td>
							<th scope="row">주문 개수 <span class="font_red"></span></th>
							<td><input type="text" class="inputTxt p100"
							id="order_qty_upper" /></td>
							<td>
							<a href="javascript:faddShppingBtn();"
							 class="btnType blue"><span>추가</span></a>
							</td>
						</tr>

					</tbody>
				</table>
				
				<table class="col" id ="shippingDiretionTable">
					<caption>caption</caption>
					<colgroup>
					
						<col width="3%">
						<col width="12%">
						<col width="12%">
						<col width="16%">
						<col width="3%">
						<col width="8%">
						<col width="3%">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">창고번호</th>
							<th scope="col">창고명</th>
							<th scope="col">제품번호</th>
							<th scope="col">제품명</th>
							<th scope="col">수주 개수</th>
							<th scope="col">배송 담당자</th>
							<th scope="col">비고</th>
						</tr>
					</thead>
					<tbody id="shipping_tbody">

						<tr>
							<td id="ware_name"></td>
							<td id="pro_name_bottom"></td>
							<!-- <td id="pro_ware_qty"></td> -->
							<td id="ship_manager_name">
							<td id="ship_qty"></td>
							<td></td>
						</tr>



					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="shippingDoneBtn" name="btn"><span>반품신청</span></a>
					<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

</body>
</html>