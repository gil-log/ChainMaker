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
	var pageBlockSizePurchaseOrder=5;
	
	//페이지 로드시 실행 (Onload Event)
	$(document).ready(function(){
		
		//구매담당자_발주 지시서 목록 조회
		purchaseOrderList();
		
		//데이트피커 활성화       
        $("#startDate").datepicker({
        })
        $("#endDate").datepicker({   
        })
	});
	
	//구매담당자_발주 지시서 목록 조회 & 검색
	function searchPurchaseOrderList(currentPage){		
		currentPage=currentPage || 1;
		
		var searchKey=document.getElementById("searchKey").value;
		var searchWord=document.getElementById("searchWord").value;
		
		var startDate=$("#startDate").val();
		var endDate=$("#endDate").val();
        //alert(typeof startDate+" => "+startDate+"\n"+typeof endDate+" => "+endDate);
		
		var param={
				currentPage:currentPage,
				pageSize:pageSizePurchaseOrder,
				searchKey:searchKey,
				searchWord:searchWord,	
				startDate:startDate,
				endDate:endDate
		}
		
		console.log("startDate : "+startDate+", endDate : "+endDate);
		
		if(searchKey === 'all'){
			alert("검색조건을 선택하세요.");	
			if(startDate === ''){
				alert("시작일을 선택하세요.");			
			}
			if(endDate === ''){
				alert("종료일을 선택하세요.");	
			}
		}else{
			if(startDate ==='' && endDate === ''){
				
			}			
			else{		
				if(startDate > endDate){
					alert("종료일을 다시 선택해주세요.");
					endDate.val("");					
				}
			}
		}
		
		var resultCallbackSearch=function(data){
			purchaseOrderListResult(data, currentPage);
		}
		callAjax("/pcm/purchaseOrderList.do", "post", "text", true, param, resultCallbackSearch);
	}
	//구매담당자_발주 지시서 목록 조회
	function purchaseOrderList(currentPage){
		currentPage=currentPage || 1;
		
		var searchKey=document.getElementById("searchKey").value;
		var searchWord=document.getElementById("searchWord").value;
		
		//console.log("searchKey : "+searchKey+", searchWord : "+searchWord)
		
		var param={
				currentPage:currentPage,
				pageSize:pageSizePurchaseOrder,
				searchKey:searchKey,
				searchWord:searchWord		
		}
		
		var resultCallback=function(data){
			purchaseOrderListResult(data, currentPage);
		}
		callAjax("/pcm/purchaseOrderList.do", "post", "text", true, param, resultCallback);
	}
	//구매담당자_발주 지시서 목록 조회 콜백
	function purchaseOrderListResult(data, currentPage){
		console.log(data);
		
		//기존 목록 삭제 및 가져온 정보 넣기
		$("#listPurchaseOrder").empty();
		$("#listPurchaseOrder").append(data);
		
		//구매담당자_발주 지시서 목록 조회 카운트
		var purchaseOrderTotal=$("#purchaseOrderTotal").val();
		
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, purchaseOrderTotal, pageSizePurchaseOrder, pageBlockSizePurchaseOrder, "purchaseOrderList");
		$("#PurchaseOrderPagination").empty().append(paginationHtml);
		
		$("#currentPagePurchaseOrder").val(currentPage);
	}
	
	
	//구매담당자_발주 지시서 단건 조회
	function purchaseOrderSelect(purchase_no){
		
		var param={
				purchase_no:purchase_no
		}
		
		var resultCallback=function(data){
			purchaseOrderSelectResult(data);
		}
		callAjax("/pcm/purchaseOrderSelect.do", "post", "json", true, param, resultCallback);
	}
	//구매담당자_발주 지시서 단건 조회 콜백
	function purchaseOrderSelectResult(data){
		//console.log(data.purchaseOrderModel);
		
		//모달 팝업
		gfModalPop("#layer1");
		//모달 초기화 및 정보 넣기 함수 호출
		setPurchaseModal(data.purchaseOrderModel);		
	}
	//확인버튼 클릭 이벤트
	function confirmBtnClickEvent(purchase_no){	
		//구매담당자_발주 지시서 단건 조회 함수 호출
		purchaseOrderSelect(purchase_no);		
	}
	//모달 초기화 및 정보 넣기
	function setPurchaseModal(object) {
		if( object == "" || object == null || object == undefined) {			
			$("#purchase_no").val("");
			$("#deli_company").val("");
			$("#pro_name").val("");
			$("#pro_no").val("");
			$("#purchase_qty").val("");		
			
		} else {			
			$("#purchase_no").val(object.purchase_no);
			$("#deli_company").val(object.deli_company);
			$("#pro_name").val(object.pro_name);
			$("#pro_no").val(object.pro_no);
			$("#purchase_qty").val(object.purchase_qty);
		}	
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
									class="btn_nav">제품 발주/반품</a> <span class="btn_nav bold">발주 지시서 목록</span> <a href="/pcm/purchaseOrder.do" class="btn_set refresh">새로고침</a>
							</p>
							
							<!-- 검색 영역 -->
							<p class="search">
							
							</p>							
							<p class="conTitle" id="searchArea">
							<span>발주 지시서 목록_구매담당자</span>
								 <span class="fr"> 
									<select id="searchKey" name="searchKey" style="width: 80px;">
									    <option value="all" id="option1" selected="selected">검색 조건</option>
										<option value="deli_company" id="option2">업체 명</option>
										<option value="pro_name" id="option3">제품 명</option>
										<!-- <option value="purchase_cd" id="option4">미승인</option>
										<option value="purchase_cd" id="option5">승인</option> -->
									</select> 
									<input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요." style="height: 28px;"> 
										<input type="text" id="startDate" name="startDate" placeholder="시작일 선택" style="height: 28px;width: 80px" readonly="readonly"></input>
										<input type="text" id="endDate" name="endDate" placeholder="종료일 선택" style="height: 28px;width: 80px" readonly="readonly"></input>
										<a class="btnType blue" href="javascript:searchPurchaseOrderList()" onkeydown="enterKey()" name="search">
										<span id="searchEnter">검색</span></a>			
								</span>
							</p>
							
							<!-- 테이블 영역 -->
							<div class="divPurchaseOrder" id="divPurchaseOrder">
								<table class="col">
									<colgroup>
										<col width="5%">
										<col width="10%">
										<col width="15%">
										<col width="5%">
										<col width="10%">
										<col width="5%">
										<col width="5%">
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
							<td><input type="text" class="inputTxt p100" name="purchase_no" id="purchase_no" readonly="readonly"/></td>
							<th scope="row">발주회사</th>
							<td><input type="text" class="inputTxt p100" name="deli_company" id="deli_company" readonly="readonly"/></td>
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
							<td ><input type="text" class="inputTxt p100" name="pro_name" id="pro_name" readonly="readonly"/></td>
							<th scope="row">제품번호</th>
							<td ><input type="text" class="inputTxt p100" name="pro_no" id="pro_no" readonly="readonly"/></td>
							<th scope="row">제품수량</th>
							<td ><input type="text" class="inputTxt p100" name="purchase_qty" id="purchase_qty" readonly="readonly"/></td>
						</tr>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="javascript:sendPurchaseDirection" class="btnType blue" id="btnSendConfirm" name="btn"><span>발주 지시서 전송</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href=""	class="btnType gray" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>	
	<!-- Modal 종료 -->		
			
	</form>	
</body>
</html>