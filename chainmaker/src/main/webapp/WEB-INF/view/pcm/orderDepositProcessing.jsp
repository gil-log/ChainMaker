<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>OrderDepositProcessing</title>

<!-- common Include -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script>
 //페이징 설정
var pageSizeOrderDepositProcessing=10;
var pageBlockSizeOrderDepositProcessing=10;

var pageSizeModalOrderDepositProcessingDtl=5;
var pageBlockSizeModalOrderDepositProcessingDtl=5;

var currentOrderNum;

//페이지 로드시 실행 (Onload Event)
$(document).ready(function(){
	
	//구매담당자_발주 지시서 목록 조회
	orderDepositProcessingList();
	
	//데이트피커 활성화       
	setDatePicker();
});

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

//구매담당자_발주 지시서 목록 조회 & 검색
function searchOrderDepositProcessingList(currentPage){		
	currentPage=currentPage || 1;
	
	var searchKey=document.getElementById("searchKey").value;
	var searchWord=document.getElementById("searchWord").value;
	
	var startDate=$("#startDate").val();
	var endDate=$("#endDate").val();
       //alert(typeof startDate+" => "+startDate+"\n"+typeof endDate+" => "+endDate);
	
	var param={
			currentPage:currentPage,
			pageSize:pageSizeOrderDepositProcessing,
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
		orderDepositProcessingListResult(data, currentPage);
	}
	callAjax("/pcm/orderDepositProcessingList.do", "post", "text", true, param, resultCallbackSearch);
}
//구매담당자_발주 지시서 목록 조회
function orderDepositProcessingList(currentPage){
	currentPage=currentPage || 1;
	
	var searchKey=document.getElementById("searchKey").value;
	var searchWord=document.getElementById("searchWord").value;
	
	//console.log("searchKey : "+searchKey+", searchWord : "+searchWord)
	
	var param={
			currentPage:currentPage,
			pageSize:pageSizeOrderDepositProcessing,
			searchKey:searchKey,
			searchWord:searchWord		
	}
	
	var resultCallback=function(data){
		orderDepositProcessingListResult(data, currentPage);
	}
	callAjax("/pcm/orderDepositProcessingList.do", "post", "text", true, param, resultCallback);
}
//구매담당자_발주 지시서 목록 조회 콜백
function orderDepositProcessingListResult(data, currentPage){
	console.log(data);
	
	//기존 목록 삭제 및 가져온 정보 넣기
	$("#listOrderDepositProcessing").empty();
	$("#listOrderDepositProcessing").append(data);
	
	//구매담당자_발주 지시서 목록 조회 카운트
	var orderDepositProcessingTotal=$("#orderDepositProcessingTotal").val();
	
	console.log("currentPage : "+currentPage
					+", orderDepositProcessingTotal : "+orderDepositProcessingTotal
					+", pageSizeOrderDepositProcessing : "+pageSizeOrderDepositProcessing
					+", pageBlockSizeOrderDepositProcessing : "+pageBlockSizeOrderDepositProcessing);
	
	// 페이지 네비게이션 생성
	var paginationHtml = getPaginationHtml(currentPage, orderDepositProcessingTotal, pageSizeOrderDepositProcessing, pageBlockSizeOrderDepositProcessing, "orderDepositProcessingList");
	$("#orderDepositProcessingPagination").empty().append(paginationHtml);
	
	$("#currentPageOrderDepositProcessing").val(currentPage);
}


//구매담당자_발주 지시서 단건 조회
function orderDepositProcessingSelect(order_no){
	
	var param={
			order_no:order_no
	}
	
	var resultCallback=function(data){
		orderDepositProcessingSelectResult(data);
	}
	callAjax("/pcm/orderDepositProcessingSelect.do", "post", "json", true, param, resultCallback);
}
//구매담당자_발주 지시서 단건 조회 콜백
function orderDepositProcessingSelectResult(data){
	console.log("data.orderDepositProcessingModel : "+data.orderDepositProcessingModel);
	
	//모달 팝업
	gfModalPop("#layer1");
	//모달 초기화 및 정보 넣기 함수 호출
	setOrderDepositProcessingModal(data.orderDepositProcessingModel);		
}
 
//구매담당자_발주 지시서 단건 조회_상세 리스트 
function orderDepositProcessingDtlList(order_no, currentPage){
	currentPage=currentPage || 1;
	
	var param={
			order_no:order_no,
			currentPage:currentPage,
			pageSize:pageSizeModalOrderDepositProcessingDtl
	}
	
	var resultCallback=function(data){
		orderDepositProcessingDtlListResult(data, currentPage);
	}
	callAjax("/pcm/modalOrderDepositProcessingDtl.do", "post", "text", true, param, resultCallback);
}
//구매담당자_발주 지시서 단건 조회_상세 리스트 콜백
function orderDepositProcessingDtlListResult(data, currentPage){
	//console.log(data);
	
	//기존 목록 삭제 및 가져온 정보 넣기
	$("#listModalOrderDepositProcessingDtl").empty();
	$("#listModalOrderDepositProcessingDtl").append(data);
	
	//구매담당자_발주 지시서 목록 조회 카운트
	var modalOrderDepositProcessingDtlTotal=$("#modalOrderDepositProcessingDtlTotal").val();	
}

//확인버튼 클릭 이벤트
function rowClickEvent(order_no){	
	//구매담당자_발주 지시서 단건 조회 함수 호출
	orderDepositProcessingSelect(order_no);	
	orderDepositProcessingDtlList(order_no);
}
//모달 초기화 및 정보 넣기
function setOrderDepositProcessingModal(object) {
	if( object == "" || object == null || object == undefined) {			
		$("#order_no").val("");
		$("#user_company").val("");
		$("#total_price").val("");
		$("#bank_account").val("");		
		
	} else {					
		$("#order_no").val(object.order_no);
		$("#user_company").val(object.user_company);
		$("#total_price").val(object.total_price);
		$("#bank_account").val(object.user_bank+"  /  "+object.user_account);	
		currentOrderNum=object.order_no;	
	}	
}

function confirmDeposit(){	
	
	var param={
			order_no:currentOrderNum
	}
	
	var resultCallback=function(data){
		confirmDepositResult(data);
	}
	
	callAjax("confirmDeposit.do", "post", "text", true, param, resultCallback);
}

function confirmDepositResult(data){
	alert(data);
	//모달 팝업
	gfCloseModal();		
	
	orderDepositProcessingList();
}

</script>
</head>
<body>
	<form id="myForm" action=""  method="">
		<input type="hidden" name="currentPageOrderDepositProcessingOrder" id="currentPageOrderDepositProcessingOrder" value="">
		<input type="hidden" name="currentPageModalOrderDepositProcessingDtl" id="currentPageModalOrderDepositProcessingDtl" value="">
		<input type="hidden" id="deliCompanyEmail" name="deliCompanyEmail" value=""/>
		<input type="hidden" id="currentOrderNum" name="currentOrderNum" value=""/>
		
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
									class="btn_nav">기업고객</a> <span class="btn_nav bold">주문내역관리</span> <a href="/pcm/orderDepositProcessing.do" class="btn_set refresh">새로고침</a>
							</p>
							
							<!-- 검색 영역 -->
							<p class="search">
							
							</p>							
							<p class="conTitle" id="searchArea">
							<span>구매담당자_기업고객_주문내역</span>
								 <span class="fr"> 
									<select id="searchKey" name="searchKey" style="width: 80px;">
									    <option value="all" id="option1" selected="selected">검색 조건</option>
										<option value="deli_company" id="option2">주문신청고객</option>
										<option value="pro_name" id="option3">제품 명</option>										
									</select> 
									<input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요." style="height: 28px;"> 
										<input type="text" id="startDate" name="startDate" placeholder="시작일 선택" style="height: 28px;width: 80px"></input>
										<input type="text" id="endDate" name="endDate" placeholder="종료일 선택" style="height: 28px;width: 80px"></input>
										<a class="btnType blue" href="javascript:searchOrderDepositProcessingList()" onkeydown="enterKey()" name="search">
										<span id="searchEnter">검색</span></a>			
								</span>
							</p>
							
							<!-- 테이블 영역 -->
							<div class="divOrderDepositProcessingOrder" id="divOrderDepositProcessingOrder">
								<table class="col">
									<colgroup>
										<col width="2%">
										<col width="6%">
										<col width="8%">
										<col width="4%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">주문번호</th>
											<th scope="col">주문신청고객</th>
											<th scope="col">주문날짜</th>
											<th scope="col">입금확인</th>
										</tr>
									</thead>
									
									<!-- 상단 테이블 정보 출력 -->
									<tbody id="listOrderDepositProcessing">
									</tbody>									
								</table>
							</div>	<!-- .divOrderDepositProcessingOrderList 종료 -->
							
							<!-- 테이블 페이지 네비게이션 영역 -->
							<div class="pagingArea" id="orderDepositProcessingPagination"></div>							
						</div>
					</li>
				</ul>
			</div>
		</div>	
		
		<!-- Modal 시작 -->
		<div id="layer1" class="layerPop layerType2" style="width: 900px;">
		<dl>
			<dt>
				<strong>주문고객 입금 확인</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="50px">
						<col width="40px">
						<col width="50px">
						<col width="60px">
						<col width="50px">
						<col width="60px">
						<col width="70px">
						<col width="120px">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">주문번호</th>
							<td><input type="text" class="inputTxt p100" name="order_no" id="order_no" readonly="readonly"/></td>
							<th scope="row">주문고객</th>
							<td><input type="text" class="inputTxt p100" name="user_company" id="user_company" readonly="readonly"/></td>
							<th scope="row">주문총액</th>
							<td><input type="text" class="inputTxt p100" name="total_price" id="total_price" readonly="readonly"/></td>
							<th scope="row">은행/계좌번호</th>
							<td><input type="text" class="inputTxt p100" name="bank_account" id="bank_account" readonly="readonly"/></td>
						</tr>
					</tbody>
				</table>
				<table class="row mt20" id="modalOrderDepositProcessingDtlList">
					<colgroup>
						<col width="8%">
						<col width="5%">
						<col width="6%">
						<col width="7%">
					</colgroup>
					<thead>
						<tr style="background-color: silver;">
							<th scope="row" style="font-weight: bold;">제품</th>
							<th scope="row" style="font-weight: bold;">수량</th>
							<th scope="row" style="font-weight: bold;">가격</th>
							<th scope="row" style="font-weight: bold;">합계</th>
						</tr>
					</thead>
					<tbody id="listModalOrderDepositProcessingDtl">					
					</tbody>	
				</table>
				<!-- 테이블 페이지 네비게이션 영역 -->
				<div class="pagingArea" id="ModalOrderDepositProcessingDtlPagination"></div>	

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="javascript:confirmDeposit()" class="btnType blue" id="btnDepositConfirm" name="btn"><span>입금 확인</span></a>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:gfCloseModal()" class="btnType gray" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>	
	<!-- Modal 종료 -->		
			
	</form>	
</body>
</html>