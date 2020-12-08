<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title> Chain Maker :: 반품 지시서 관리 </title>

<!-- common Include -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<c:if test="${sessionScope.userType ne 'D'}">
	<c:redirect url="/dashboard/dashboard.do"/>
</c:if>

<script>
//페이징 설정
var pageSizeReturnPurchase=10;
var pageBlockSizeReturnPurchase=10;

var pageSizeModalReturnDtl=5;
var pageBlockSizeModalReturnDtl=5;

var currentRefundNum;

var checkBoxSatus;

//페이지 로드시 실행 (Onload Event)
$(document).ready(function(){
	
	//구매담당자_납품업체_반품 지시서 조회
	returnPurchaseList();
	
	//체크박스 상태 동작 메서드
	checkBoxStatus();
	
	//엔터작동 시 실행 메서드
	$("#searchWord").keypress(function (e) {
        if (e.which == 13){
        	searchReturnPurchaseList();
        }
	});	
	
	//데이트피커 활성화       
	setDatePicker();
});

//데이트피커 초기설정
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

//구매담당자_납품업체_반품 지시서 조회 & 검색
function searchReturnPurchaseList(currentPage){		
	currentPage=currentPage || 1;
	
	var searchKey=document.getElementById("searchKey").value;
	var searchWord=document.getElementById("searchWord").value;
	
	var startDate=$("#startDate").val();
	var endDate=$("#endDate").val();
	
	if ($("#refundStatusCheck").is(":checked")) {
		checkBoxStatus="checked";
	
	}else{		
		checkBoxStatus="unChecked";			
	}
	
	var param={
			currentPage:currentPage,
			pageSize:pageSizeReturnPurchase,
			searchKey:searchKey,
			searchWord:searchWord,	
			startDate:startDate,
			endDate:endDate
	}
		
	var resultCallbackSearch=function(data){
		checkBoxListResult(data, currentPage);
	}
	callAjax("/pcm/returnPurchaseList.do", "post", "text", true, param, resultCallbackSearch);
}

//체크박스에 대한 동작(입금완료 / 미입금)
function checkBoxStatus(currentPage){
	currentPage=currentPage || 1;
	
	var searchKey=document.getElementById("searchKey").value;
	var searchWord=document.getElementById("searchWord").value;	
	
	$("#refundStatusCheck").change(function(){
		if ($("#refundStatusCheck").is(":checked")) {
			checkBoxStatus="checked";
		
		}else{
			checkBoxStatus="unChecked";			
		}
		
		var param={
				currentPage:currentPage,
				pageSize:pageSizeReturnPurchase,
				checkBoxStatus:checkBoxStatus
		}
		
		var resultCallback=function(data){
			checkBoxListResult(data, currentPage);
		}
		callAjax("/pcm/returnPurchaseList.do", "post", "text", true, param, resultCallback);
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
	if ($("#refundStatusCheck").is(":checked")) {
		checkBoxStatus="checked";
	
	}else{
		checkBoxStatus="unChecked";			
	}
	
	var param={
			currentPage:currentPage,
			pageSize:pageSizeReturnPurchase,
			searchKey:searchKey,
			searchWord:searchWord,	
			startDate:startDate,
			endDate:endDate,
			checkBoxStatus:checkBoxStatus
	}
	
	var resultCallback=function(data){
		checkBoxListResult(data, currentPage);
	}
	callAjax("/pcm/returnPurchaseList.do", "post", "text", true, param, resultCallback);	
}

//체크 박스 상태에 따른 화면 출력
function checkBoxListResult(data, currentPage){
	
	//기존 목록 삭제 및 가져온 정보 넣기
	$("#listReturnPurchase").empty();
	$("#listReturnPurchase").append(data);
	
	//구매담당자_발주 지시서 목록 조회 카운트
	var returnPurchaseTotal=$("#returnPurchaseTotal").val();
	
	// 페이지 네비게이션 생성
	var paginationHtml = getPaginationHtml(currentPage, returnPurchaseTotal, pageSizeReturnPurchase, pageBlockSizeReturnPurchase, "checkBoxList");
	$("#returnPurchasePagination").empty().append(paginationHtml);
	
	$("#currentPageReturnPurchase").val(currentPage);
}

//구매담당자_납품업체_반품 지시서 조회
function returnPurchaseList(currentPage){
	currentPage=currentPage || 1;
	
	var param={
			currentPage:currentPage,
			pageSize:pageSizeReturnPurchase,	
	}
	
	var resultCallback=function(data){
		returnPurchaseListResult(data, currentPage);
	}
	callAjax("/pcm/returnPurchaseList.do", "post", "text", true, param, resultCallback);
}

//구매담당자_납품업체_반품 지시서 조회 콜백
function returnPurchaseListResult(data, currentPage){
	
	//기존 목록 삭제 및 가져온 정보 넣기
	$("#listReturnPurchase").empty();
	$("#listReturnPurchase").append(data);
	
	//구매담당자_발주 지시서 목록 조회 카운트
	var returnPurchaseTotal=$("#returnPurchaseTotal").val();
	
	// 페이지 네비게이션 생성
	var paginationHtml = getPaginationHtml(currentPage, returnPurchaseTotal, pageSizeReturnPurchase, pageBlockSizeReturnPurchase, "returnPurchaseList");
	$("#returnPurchasePagination").empty().append(paginationHtml);
	
	$("#currentPageReturnPurchase").val(currentPage);
}


//구매담당자_납품업체_반품 지시서 단건 조회
function returnPurchaseSelect(refund_no){
	
	var param={
			refund_no:refund_no
	}
	
	var resultCallback=function(data){
		returnPurchaseSelectResult(data);
	}
	callAjax("/pcm/returnPurchaseSelect.do", "post", "json", true, param, resultCallback);
}
//구매담당자_납품업체_반품 지시서 단건 조회 콜백
function returnPurchaseSelectResult(data){
	console.log("data.returnPurchaseModel : "+data.returnPurchaseModel);
	console.log("data.returnPurchaseModel.length : "+data.returnPurchaseModel.length);
	console.log("data.returnPurchaseModel.refund_cd : "+data.returnPurchaseModel.refund_cd);
	
	currentRefundNum=data.returnPurchaseModel.refund_no;	
	
	//버튼에 따른 동작 변경
	switch(data.returnPurchaseModel.refund_cd){
		case "0":
			$("#btnSendDirection").on("click", function(e){
				e.preventDefault();
				$("#btnSendDirection").attr("href", sendRefundDirection(data.returnPurchaseModel.refund_no));	
			})
			break;
		case "1":
			$("#btnSendDirection").on("click", function(e){
				e.preventDefault();
				$("#btnSendDirection").attr("href", sendRefundDirection(data.returnPurchaseModel.refund_no));	
			})
			break;
	}
	
	//모달 팝업
	gfModalPop("#layer1");		
	//모달 초기화 및 정보 넣기 함수 호출	
	setReturnPurchaseModal(data.returnPurchaseModel);	
	
}

//확인버튼 클릭 이벤트
function rowClickEvent(refund_no, refund_cd){
	
	if(refund_cd === "0"){
		$("#btnSendDirection").show();
		$("#btnSendDirectionText").text("반품지시서 전송");
	}else if(refund_cd === "1"){
		$("#btnSendDirection").show();
		$("#btnSendDirectionText").text("입금확인 처리");		
	}else if(refund_cd === "2"){
		$("#btnSendDirection").hide();
	}
	
	//구매담당자_납품업체_반품 지시서 단건 조회 함수 호출
	returnPurchaseSelect(refund_no);	
	returnPurchaseDtlList(refund_no);
}
function confirmBtnClickEvent(refund_no){
	confirmRefundPrice(refund_no);
	
	returnPurchaseList();
}

//모달 초기화 및 정보 넣기
function setReturnPurchaseModal(object) {
	if( object == "" || object == null || object == undefined) {			
		$("#refund_no").val("");
		$("#deli_company").val("");		
		$("#deli_name").val("");		
		$("#total_price").val("");	
	} else {					
		$("#refund_no").val(object.refund_no);
		$("#deli_company").val(object.deli_company);
		$("#deli_name").val(object.deli_name);
		$("#total_price").val(numberCommas(object.total_price));	
	}	
}

//구매담당자_납품업체_반품 지시서 상세 조회 
function returnPurchaseDtlList(refund_no, currentPage){
	currentPage=currentPage || 1;
	
	var param={
			refund_no:refund_no,
			currentPage:currentPage,
			pageSize:pageSizeModalReturnDtl
	}
	
	var resultCallback=function(data){
		returnPurchaseDtlListResult(data, currentPage);
	}
	callAjax("/pcm/returnPurchaseDtlList.do", "post", "text", true, param, resultCallback);
}
//구매담당자_납품업체_반품 지시서 상세 조회 콜백
function returnPurchaseDtlListResult(data, currentPage){
	
	//기존 목록 삭제 및 가져온 정보 넣기
	$("#listModalReturnPurchaseDtl").empty();
	$("#listModalReturnPurchaseDtl").append(data);
	
	//구매담당자_납품업체_반품 지시서 상세 조회 카운트
	var modalReturnPurchaseDtlTotal=$("#modalReturnPurchaseDtlTotal").val();
	
	// 페이지 네비게이션 생성
	// var paginationHtml = getPaginationHtml(currentPage, modalPurchaseDtlTotal, pageSizeModalPurchaseDtl, pageBlockSizeModalPurchaseDtl, "purchaseDtlList");
	// $("#ModalPurchaseDtlPagination").empty().append(paginationHtml);
	
	// $("#currentPageModalPurchaseDtl").val(currentPage);	
}

//반품지시서 전송 메서드
function sendRefundDirection(refund_no){
	
	var param={
			refund_no:refund_no
	}
	
	var resultCallback=function(data){
		sendRefundDirectionResult(data);
	}
	
	callAjax("/pcm/sendRefundDirection.do", "post", "json", true, param, resultCallback);
}
function sendRefundDirectionResult(data){
	swal(data.result);
	
	//모달 팝업 닫기
	gfCloseModal();		
	
	returnPurchaseList();
}
/*
//반품 지시서 전송 및 입금확인 처리
function confirmRefundPrice(refund_no){	
	
	var param={
			refund_no:refund_no,
			// currentPage:currentPage,
			pageSize:pageSizeModalReturnDtl
	}
	
	var resultCallback=function(data){
		confirmRefundPriceResult(data /* , currentPage );
	}
	
	callAjax("/pcm/confirmRefundPrice.do", "post", "text", true, param, resultCallback);
}*/

//반품 지시서 전송 및 입금확인 처리 콜백
function confirmRefundPriceResult(data){
	swal(data);
	
	//모달 팝업 닫기
	gfCloseModal();	
	
	returnPurchaseList();
}
//숫자 3자리 콤마 표시
function numberCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
</head>
<body>
	<form id="myForm" action=""  method="">
		<input type="hidden" name="currentPageReturnPurchase" id="currentPageReturnPurchase" value="">
		<input type="hidden" name="currentPageModalReturnDtl" id="currentPageModalReturnDtl" value="">
		<input type="hidden" id="deliCompanyEmail" name="deliCompanyEmail" value=""/>
		<input type="hidden" id="currentRefundNum" name="currentRefundNum" value=""/>
		
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
									class="btn_nav">납품업체</a> <span class="btn_nav bold">반품 지시서 목록</span> <a href="/pcm/returnPurchase.do" class="btn_set refresh">새로고침</a>
							</p>
							
							<!-- 검색 영역 -->
							<p class="search">
							
							</p>							
							<p class="conTitle" id="searchArea">
							<span>반품 지시서 목록_구매담당자</span>
								 <span class="fr"> 
									<select id="searchKey" name="searchKey" style="width: 80px;">
									    <option value="all" id="option1" selected="selected">전체</option>
										<option value="deli_company" id="option2">업체 명</option>
										<option value="pro_name" id="option3">제품 명</option>										
									</select> 
									<input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요." style="height: 28px;"> 
										<input type="text" id="startDate" name="startDate" placeholder="시작일 선택" style="height: 28px;width: 80px" readonly="readonly"></input>
										<input type="text" id="endDate" name="endDate" placeholder="종료일 선택" style="height: 28px;width: 80px" readonly="readonly"></input>
										<a class="btnType blue" href="javascript:searchReturnPurchaseList()" onkeydown="enterKey()" name="search">
										<span id="searchEnter">검색</span></a>			
								</span>
							</p>
							<span class="fr">								
								<input type="checkbox" id="refundStatusCheck"> 미입금 목록 조회
							</span>
							
							<!-- 테이블 영역 -->
							<div class="divReturnPurchase" id="divReturnPurchase">
								<table class="col">
									<colgroup>
										<col width="5%">
										<col width="5%">
										<col width="8%">
										<col width="5%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">반품번호</th>
											<th scope="col">납품업체</th>	
											<th scope="col">반품날짜</th>
											<th scope="col">입금확인</th>
										</tr>
									</thead>
									
									<!--  -->
									<tbody id="listReturnPurchase">
									</tbody>									
								</table>
							</div>	<!-- .divReturnPurchaseList 종료 -->
							
							<!-- 테이블 페이지 네비게이션 영역 -->
							<div class="pagingArea" id="returnPurchasePagination">
							
							</div>																					
						</div><!-- div.content 종료 -->
					</li>	<!-- li.content 종료 -->
				</ul>
			</div>	<!-- div#container 종료 -->
		</div>	<!-- div#wrap_area 종료 -->
		
		<!-- Modal 시작 -->
		<div id="layer1" class="layerPop layerType2" style="width: 900px;">
		<dl>
			<dt>
				<strong>반품 지시서_납품업체</strong>
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
						<col width="40px">
						<col width="60px">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">반품번호</th>
							<td><input style="text-align: center;" type="text" class="inputTxt p100" name="refund_no" id="refund_no" readonly="readonly"/></td>
							<th scope="row">납품업체</th>
							<td><input style="text-align: center;" type="text" class="inputTxt p100" name="deli_company" id="deli_company" readonly="readonly"/></td>
							<th scope="row">담당자</th>
							<td><input style="text-align: center;" type="text" class="inputTxt p100" name="deli_name" id="deli_name" readonly="readonly"/></td>
							<th scope="row">총액</th>
							<td><input style="text-align: center;" type="text" class="inputTxt p100" name="total_price" id="total_price" readonly="readonly"/></td>
						</tr>
					</tbody>
				</table>
				<table class="row mt20" id="modalReturnPurchaseDtlList">
					<colgroup>
						<col width="10%">
						<col width="5%">
						<col width="6%">
						<col width="8%">
						<col width="5%">
						<col width="8%">
						<col width="15%">
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
					<tbody id="listModalReturnPurchaseDtl">					
					</tbody>	
				</table>
				<!-- 테이블 페이지 네비게이션 영역 -->
				<div class="pagingArea" id="ModalPurchaseDtlPagination"></div>
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSendDirection" name="btn"><span id="btnSendDirectionText"></span></a>
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