<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title> Chain Maker :: 발주 지시서 관리 </title>

<!-- common Include -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<c:if test="${sessionScope.userType ne 'D'}">
	<c:redirect url="/dashboard/dashboard.do"/>
</c:if>

<script>
//페이징 설정
var pageSizePurchaseOrder=10;
var pageBlockSizePurchaseOrder=10;

var pageSizeModalPurchaseDtl=5;
var pageBlockSizeModalPurchaseDtl=5;

var currentPurchaseNum;

var checkBoxStatus;

//페이지 로드시 실행 (Onload Event)
$(document).ready(function(){
	
	//구매담당자_납품업체_발주 지시서 조회
	purchaseOrderList();
	
	//체크박스 작동 메서드
	checkBoxStatus();
	
	//엔터 작동 시 검색 진행
	$("#searchWord").keypress(function (e) {
        if (e.which == 13){
        	searchPurchaseOrderList();
        }
	});
	
	//데이트피커 활성화       
	setDatePicker();
});

//데이트피커 초기 설정
function setDatePicker(){
	$.datepicker.setDefaults($.datepicker.regional['ko']); 
    $( "#startDate" ).datepicker({
         changeMonth: true, 
         changeYear: true,
         nextText: '다음 달',
         prevText: '이전 달', 
         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         showAnim: "slide", //애니메이션을 적용한다.
         dateFormat: "yy-mm-dd",
         maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
         onClose: function( selectedDate ) {    
              //시작일(startDate) datepicker가 닫힐때
              //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
             $("#endDate").datepicker( "option", "minDate", selectedDate );
             
             var endDate = $("#endDate").val();
         }    
    });
    $( "#endDate" ).datepicker({
         changeMonth: true, 
         changeYear: true,
         nextText: '다음 달',
         prevText: '이전 달', 
         dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
         dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
         monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
         showAnim: "slide", //애니메이션을 적용한다.
         dateFormat: "yy-mm-dd",                    // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
         onClose: function( selectedDate ) {    
             // 종료일(endDate) datepicker가 닫힐때
             // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
             $("#startDate").datepicker( "option", "maxDate", selectedDate );
             
             var startDate = $("#startDate").val();
         } 	    
    }); 
    
    $("#startDate").datepicker('setDate', 'today');
    $("#endDate").datepicker('setDate', 'today');
}

//구매담당자_납품업체_발주 지시서 조회 & 검색
function searchPurchaseOrderList(currentPage){		
	currentPage=currentPage || 1;
	
	var searchKey=document.getElementById("searchKey").value;
	var searchWord=document.getElementById("searchWord").value;
	
	var startDate=$("#startDate").val();
	var endDate=$("#endDate").val();
	
	if ($("#purchaseStatusCheck").is(":checked")) {
		checkBoxStatus="checked";		
	}else{			
		checkBoxStatus="unChecked";
	}
	
	var param={
			currentPage:currentPage,
			pageSize:pageSizePurchaseOrder,
			searchKey:searchKey,
			searchWord:searchWord,	
			startDate:startDate,
			endDate:endDate,
			checkBoxStatus:checkBoxStatus
	}
	
	console.log("startDate : "+startDate+", endDate : "+endDate);
	
	var resultCallbackSearch=function(data){
		checkBoxListResult(data, currentPage);
	}
	callAjax("/pcm/purchaseOrderList.do", "post", "text", true, param, resultCallbackSearch);
}

//체크박스에 대한 동작(입금완료 / 미입금)
function checkBoxStatus(currentPage){
	currentPage=currentPage || 1;
	
	$("#purchaseStatusCheck").change(function(){
		if ($("#purchaseStatusCheck").is(":checked")) {
			checkBoxStatus="checked";		
		}else{			
			checkBoxStatus="unChecked";
		}
		var param={
				currentPage:currentPage,
				pageSize:pageSizePurchaseOrder,
				checkBoxStatus:checkBoxStatus
		}
		
		console.log(param);
		
		var resultCallback=function(data){
			checkBoxListResult(data, currentPage);
		}
		callAjax("/pcm/purchaseOrderList.do", "post", "text", true, param, resultCallback);
	});
}

//체크 박스 상태에 따른 조회 내역 페이지네이션 정보
function checkBoxList(currentPage){	
	currentPage=currentPage || 1;
	
	var searchKey=document.getElementById("searchKey").value;
	var searchWord=document.getElementById("searchWord").value;
	
	var startDate=$("#startDate").val();
	var endDate=$("#endDate").val();
	
	//체크박스 상태에 따라 파라미터 값 변경
	if ($("#purchaseStatusCheck").is(":checked")) {
		checkBoxStatus="checked";
	
	}else{
		checkBoxStatus="unChecked";			
	}
	
	var param={
			currentPage:currentPage,
			pageSize:pageSizePurchaseOrder,
			searchKey:searchKey,
			searchWord:searchWord,	
			startDate:startDate,
			endDate:endDate,
			checkBoxStatus:checkBoxStatus
	}
	
	var resultCallback=function(data){
		checkBoxListResult(data, currentPage);
	}
	callAjax("/pcm/purchaseOrderList.do", "post", "text", true, param, resultCallback);	
}

//체크 박스 상태에 따른 화면 출력
function checkBoxListResult(data, currentPage){
	
	//기존 목록 삭제 및 가져온 정보 넣기
	$("#listPurchaseOrder").empty();
	$("#listPurchaseOrder").append(data);
	
	//구매담당자_납품업체_발주 지시서 조회 카운트
	var purchaseOrderTotal=$("#purchaseOrderTotal").val();
	
	// 페이지 네비게이션 생성
	var paginationHtml = getPaginationHtml(currentPage, purchaseOrderTotal, pageSizePurchaseOrder, pageBlockSizePurchaseOrder, "checkBoxList");
	$("#PurchaseOrderPagination").empty().append(paginationHtml);
	
	$("#currentPagePurchaseOrder").val(currentPage);
}

//구매담당자_납품업체_발주 지시서 조회
function purchaseOrderList(currentPage){
	currentPage=currentPage || 1;
	
	var param={
			currentPage:currentPage,
			pageSize:pageSizePurchaseOrder,
	}
	
	var resultCallback=function(data){
		purchaseOrderListResult(data, currentPage);
	}
	callAjax("/pcm/purchaseOrderList.do", "post", "text", true, param, resultCallback);
}

//구매담당자_납품업체_발주 지시서 조회 콜백
function purchaseOrderListResult(data, currentPage){
	
	//기존 목록 삭제 및 가져온 정보 넣기
	$("#listPurchaseOrder").empty();
	$("#listPurchaseOrder").append(data);
	
	//구매담당자_납품업체_발주 지시서 조회 카운트
	var purchaseOrderTotal=$("#purchaseOrderTotal").val();
	
	// 페이지 네비게이션 생성
	var paginationHtml = getPaginationHtml(currentPage, purchaseOrderTotal, pageSizePurchaseOrder, pageBlockSizePurchaseOrder, "purchaseOrderList");
	$("#PurchaseOrderPagination").empty().append(paginationHtml);
	
	$("#currentPagePurchaseOrder").val(currentPage);
}


//구매담당자_납품업체_발주 지시서 단건 조회
function purchaseOrderSelect(purchase_no){
	
	var param={
			purchase_no:purchase_no
	}
	
	var resultCallback=function(data){
		purchaseOrderSelectResult(data);
	}
	callAjax("/pcm/purchaseOrderSelect.do", "post", "json", true, param, resultCallback);
}

//구매담당자_납품업체_발주 지시서 단건 조회 콜백
function purchaseOrderSelectResult(data){	
	//모달 팝업
	gfModalPop("#layer1");
	//모달 초기화 및 정보 넣기 함수 호출
	setPurchaseModal(data.purchaseOrderModel);		
}

//구매담당자_납품업체_발주 지시서 단건 상세 조회 
function purchaseDtlList(purchase_no, currentPage){
	currentPage=currentPage || 1;
	
	var param={
			purchase_no:purchase_no,
			currentPage:currentPage,
			pageSize:pageSizeModalPurchaseDtl
	}
	
	var resultCallback=function(data){
		purchaseDtlListResult(data, currentPage);
	}
	callAjax("/pcm/modalPurchasedtl.do", "post", "text", true, param, resultCallback);
}
//구매담당자_납품업체_발주 지시서 단건 상세 조회  콜백
function purchaseDtlListResult(data, currentPage){
	console.log(data);
	
	//기존 목록 삭제 및 가져온 정보 넣기
	$("#listModalPurchaseDtl").empty();
	$("#listModalPurchaseDtl").append(data);
	
	//구매담당자_발주 지시서 목록 조회 카운트
	var modalPurchaseDtlTotal=$("#modalPurchaseDtlTotal").val();
	
	// 페이지 네비게이션 생성
	/* var paginationHtml = getPaginationHtml(currentPage, modalPurchaseDtlTotal, pageSizeModalPurchaseDtl, pageBlockSizeModalPurchaseDtl, "purchaseDtlList");
	$("#ModalPurchaseDtlPagination").empty().append(paginationHtml);
	
	$("#currentPageModalPurchaseDtl").val(currentPage); */		
}

//row 및 확인버튼 클릭 이벤트
function confirmBtnClickEvent(purchase_no, purchase_cd){	
	
	if(purchase_cd === "1"){
		$("#btnSendConfirm").show();
	}else{
		$("#btnSendConfirm").hide();		
	}
	
	//구매담당자_발주 지시서 단건 조회 함수 호출
	purchaseOrderSelect(purchase_no);	
	purchaseDtlList(purchase_no);
}

//모달 초기화 및 정보 넣기
function setPurchaseModal(object) {
	if( object == "" || object == null || object == undefined) {			
		$("#purchase_no").val("");
		$("#deli_company").val("");
		$("#purchase_date").val("");
		$("#deli_name").val("");		
		$("#bank_account").val("");		
		$("#total_price").val("");		
		
	} else {					
		$("#purchase_no").val(object.purchase_no);
		$("#deli_company").val(object.deli_company);
		$("#purchase_date").val(object.purchase_date);
		$("#deli_name").val(object.deli_name);		
		$("#bank_account").val(object.deli);
		$("#total_price").val(numberCommas(object.total_price));	
		currentPurchaseNum=object.purchase_no;
		
	}	
}

//지시서 발송 메서드
function sendPurchaseDirection(currentPage){	
	currentPage=currentPage || 1;
	
	var param={
			purchase_no:currentPurchaseNum,
			currentPage:currentPage,
			pageSize:pageSizeModalPurchaseDtl
	}
	
	var resultCallback=function(data){
		sendPurchaseDirectionResult(data, currentPage);
	}
	
	callAjax("sendPurchase.do", "post", "text", true, param, resultCallback);
}

function sendPurchaseDirectionResult(data){
	swal("발주지시서 발송이 완료되었습니다.\n송금상태 변경 : 송금 완료"/* +data */);
	//모달 팝업
	gfCloseModal();		
	
	purchaseOrderList();
}
//숫자 3자리 콤마 표시
function numberCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
</head>
<body>
	<form id="myForm" action=""  method="">
		<input type="hidden" name="currentPagePurchaseOrder" id="currentPagePurchaseOrder" value="">
		<input type="hidden" name="currentPageModalPurchaseDtl" id="currentPageModalPurchaseDtl" value="">
		<input type="hidden" id="deliCompanyEmail" name="deliCompanyEmail" value=""/>
		<input type="hidden" id="currentPurchaseNum" name="currentPurchaseNum" value=""/>
		
		<div id="wrap_area">
			
			<!-- header Include -->
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
			
			<div id="container">
				<ul>
					<li class="lnb">
					
						<!-- lnb Include -->
						<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
						
					</li>
					<li class="contents">
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
									    <option value="all" id="option1" selected="selected">전체</option>
										<option value="deli_company" id="option2">업체 명</option>
										<option value="pro_name" id="option3">제품 명</option>										
									</select> 
									<input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요." style="height: 28px;"> 
										<input type="text" id="startDate" name="startDate" placeholder="시작일 선택" style="height: 28px;width: 80px" readonly="readonly"></input>
										<input type="text" id="endDate" name="endDate" placeholder="종료일 선택" style="height: 28px;width: 80px" readonly="readonly"></input>
										<a class="btnType blue" href="javascript:searchPurchaseOrderList()" onkeydown="enterKey()" name="search">
										<span id="searchEnter">검색</span></a>			
								</span>
							</p>
							<span class="fr">								
								<input type="checkbox" id="purchaseStatusCheck"> 미송금 목록 조회
							</span>	
							
							<!-- 테이블 영역 -->
							<div class="divPurchaseOrder" id="divPurchaseOrder">
								<table class="col">
									<colgroup>
										<col width="5%">
										<col width="8%">
										<col width="8%">
										<col width="6%">
										<col width="5%">
										<col width="5%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">발주번호</th>
											<th scope="col">발주제품</th>
											<th scope="col">발주회사</th>
											<th scope="col">발주날짜</th>
											<th scope="col">임원승인여부</th>
											<th scope="col">송금확인</th>
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
		<div id="layer1" class="layerPop layerType2" style="width: 900px;">
		<dl>
			<dt>
				<strong>발주 지시서</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="50px">
						<col width="40px">
						<col width="40px">
						<col width="50px">
						<col width="40px">
						<col width="60px">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">발주번호</th>
							<td><input style="text-align: center;" type="text" class="inputTxt p100" name="purchase_no" id="purchase_no" readonly="readonly"/></td>
							<th scope="row">회사명</th>
							<td><input style="text-align: center;" type="text" class="inputTxt p100" name="deli_company" id="deli_company" readonly="readonly"/></td>
							<th scope="row">발주날짜</th>
							<td><input style="text-align: center;" type="text" class="inputTxt p100" name="purchase_date" id="purchase_date" readonly="readonly"/></td>
						</tr>
					</tbody>
				</table>
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="50px">
						<col width="40px">
						<col width="40px">
						<col width="60px">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">담당자</th>
							<td><input style="text-align: center;" type="text" class="inputTxt p100" name="deli_name" id="deli_name" readonly="readonly"/></td>
							<th scope="row">총액</th>
							<td><input style="text-align: center;" type="text" class="inputTxt p100" name="total_price" id="total_price" readonly="readonly"/></td>
						</tr>
					</tbody>
				</table>
				<table class="row mt20" id="modalPurchaseDtlList">
					<colgroup>
						<col width="8%">
						<col width="5%">
						<col width="6%">
						<col width="8%">
						<col width="5%">
						<col width="10%">
						<col width="20%">
					</colgroup>
					<thead>
						<tr style="background-color: silver;">
							<th scope="row" style="font-weight: bold;">제품</th>
							<th scope="row" style="font-weight: bold;">수량</th>
							<th scope="row" style="font-weight: bold;">납품금액</th>
							<th scope="row" style="font-weight: bold;">합계금액</th>
							<th scope="row" style="font-weight: bold;">창고번호</th>
							<th scope="row" style="font-weight: bold;">창고이름</th>
							<th scope="row" style="font-weight: bold;">창고주소</th>
						</tr>
					</thead>
					<tbody id="listModalPurchaseDtl">					
					</tbody>	
				</table>
				<!-- 테이블 페이지 네비게이션 영역 -->
				<div class="pagingArea" id="ModalPurchaseDtlPagination"></div>	

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="javascript:sendPurchaseDirection()" class="btnType blue" id="btnSendConfirm" name="btn"><span>발주 지시서 전송</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:gfCloseModal()"	class="btnType gray" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>	
	<!-- Modal 종료 -->		
			
	</form>	
</body>
</html>