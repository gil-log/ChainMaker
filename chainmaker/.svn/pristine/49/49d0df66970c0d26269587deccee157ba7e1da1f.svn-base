<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>purchaseOrderList</title>

<!-- common Include -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script>

	//페이징 설정
	var pageSizePurchaseOrder=5;
	var pageBlockSizePurchaseOrder=10;
	
	//페이지 로드시 실행 (Onload Event)
	$(function(){
		
		//구매담당자_발주 지시서 목록 조회
		purchaseOrderList();
		
	});
		
	//구매담당자_발주 지시서 목록 조회
	function purchaseOrderList(currentPage){
		currentPage=currentPage || 1;
		
		var param={
				currentPage:currentPage,
				pageSize:pageSizePurchaseOrder
		}
		
		var resultCallback=function(data){
			purchaseOrderListResult(data, currentPage);
		}
		callAjax("/pcm/purchaseOrderList.do", "post", "text", true, param, purchaseOrderListResult);
	}
	//구매담당자_발주 지시서 목록 조회 콜백
	function purchaseOrderListResult(data, currentPage){
		console.log(data);
		
		//기존 목록 삭제 및 가져온 정보 넣기
		$("#listPurchaseOrder").empty();
		$("#listPurchaseOrder").append(data);
		
		//구매담당자_발주 지시서 목록 조회 카운트
		var purchaseOrderTotal=$(purchaseOrderTotal).val();
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, purchaseOrderTotal, pageSizePurchaseOrder, pageBlockSizePurchaseOrder, "purchaseOrderList");
		$("#PurchaseOrderPagination").empty().append( paginationHtml );
	}
	
	//구매담당자_발주 지시서 목록 단건 조회
	
	
	//Modal 팝업
	function popModalPurchaseOrder(){
		gfModalPop("#layer1");
	}

</script>
</head>
<body>
	<form id="myForm" action=""  method="">
		<input type="hidden" name="currentPagePurchaseOrder" id="currentPagePurchaseOrder" value="">
		
		<div id="wrap_area">
			
			<!-- header Include -->
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
			
			<div id="container">
				<ul>
					<li class="lnb">
					
						<!-- lnb Include -->
						<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
						
					</li>
					<li class="content">
						<div class="content">
							<!-- 메뉴 경로 영역 -->
							<p class="Location">
								<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <a href="#"
									class="btn_nav">제품 발주/반품</a> <span class="btn_nav bold">발주 지시서 목록</span> <a href="#" class="btn_set refresh">새로고침</a>
							</p>
							
							<!-- 검색 영역 -->
							<p class="search">
							
							</p>							
							<p class="conTitle" id="searchArea">
								 <span class="fr"> 
									<select id="searchKey" name="searchKey" style="width: 80px;" v-model="searchKey">
									    <option value="all" id="option1" selected="selected">전체</option>
										<option value="ware_nm" id="option2">업체</option>
										<option value="ware_nm" id="option3">제품</option>
										<option value="ware_nm" id="option4">미승인</option>
										<option value="pro_nm" id="option5">승인</option>
									</select> 
									<input type="text" id="searchWord" name="searchWord" v-model="searchWord"
										placeholder="" style="height: 28px;"> 
										<a class="btnType blue" href="javascript:fListcourse()"
										onkeydown="enterKey()" name="search"><span id="searchEnter">검색</span></a>			
								</span>
							</p>
							
							<!-- 테이블 영역 -->
							<div class="divPurchaseOrder" id="divPurchaseOrder">
								<table class="col">
									<colgroup>
										<col width="10%">
										<col width="15%">
										<col width="15%">
										<col width="10%">
										<col width="15%">
										<col width="10%">
										<col width="10%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">발주번호</th>
											<th scope="col">발주회사</th>
											<th scope="col">발주제품</th>
											<th scope="col">발주수량</th>
											<th scope="col">발주날짜</th>
											<th scope="col">임원승인여부</th>
											<th scope="col">입금확인</th>
										</tr>
									</thead>
									
									<!--  -->
									<tbody id="listPurchaseOrder">
									
									</tbody>									
								</table>
							</div>	<!-- .divPurchaseOrderList 종료 -->
							
							<!-- 테이블 페이지 네비게이션 영역 -->
							<div class="pagingArea" id="PurchaseOrderPagination"></div>							
						</div>
					</li>
				</ul>
			</div>
		</div>	
		
		<!-- Modal 시작 -->
		<div id="layer1" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>발주 지시서</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="70px">
						<col width="140px">
						<col width="70px">
						<col width="140px">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">발주번호</th>
							<td><input type="text" class="inputTxt p100" v-model="title" name="title" id="title" readonly="readonly"/></td>
							<th scope="row">발주회사</th>
							<td><input type="text" class="inputTxt p100" v-model="title" name="title" id="title" readonly="readonly"/></td>
						</tr>
				</table>
				<table class="row mt20">
					<caption>caption</caption>
					<colgroup>
						<col width="60px">
						<col width="90px">
						<col width="70px">
						<col width="90px">
						<col width="70px">
						<col width="50px">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">제품명</th>
							<td ><input type="text" class="inputTxt p100" v-model="title" name="title" id="title" readonly="readonly"/></td>
							<th scope="row">제품번호</th>
							<td ><input type="text" class="inputTxt p100" v-model="title" name="title" id="title" readonly="readonly"/></td>
							<th scope="row">제품수량</th>
							<td ><input type="text" class="inputTxt p100" v-model="title" name="title" id="title" readonly="readonly"/></td>
						</tr>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveCourse" name="btn"><span>발주 지시서 전송</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href=""	class="btnType gray"  id="btnCloseCourse" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>	
	<!-- Modal 종료 -->		
			
	</form>	
</body>
</html>