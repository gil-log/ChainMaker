<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DeliveryBuyer</title>

<!-- common Include -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script>
//페이징 설정
var pageSizeDeliveryBuyer=10;
var pageBlockSizeDeliveryBuyer=10;

var pageSizeModalDeliveryBuyerDtl=5;
var pageBlockSizeModalDeliveryBuyerDtl=5;

var currentOrderNum;

//페이지 로드시 실행 (Onload Event)
$(document).ready(function(){
	//구매담당자_발주 지시서 목록 조회
	deliveryBuyerList();
	
	//데이트피커 활성화       
	setDatePicker();
});

function setDatePicker(){
	$.datepicker.setDefaults($.datepicker.regional['ko']); 
    $( "#startdate" ).datepicker({
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
             $("#enddate").datepicker( "option", "minDate", selectedDate );
             
             var endDate = $("#enddate").val();
         }    
    });
    $( "#enddate" ).datepicker({
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
             $("#startdate").datepicker( "option", "maxDate", selectedDate );
             
             var startDate = $("#startdate").val();
         } 	    
    }); 
    
    $("#startdate").datepicker('setDate', 'today');
    $("#enddate").datepicker('setDate', 'today');
}

//구매담당자_발주 지시서 목록 조회 & 검색
function searchDeliveryBuyerList(currentPage){		
	currentPage=currentPage || 1;
	
	var searchKey=document.getElementById("searchKey").value;
	var searchWord=document.getElementById("searchWord").value;
	
	var startDate=$("#startdate").val();
	var endDate=$("#enddate").val();
       //alert(typeof startDate+" => "+startDate+"\n"+typeof endDate+" => "+endDate);
	
	var param={
			currentPage:currentPage,
			pageSize:pageSizeDeliveryBuyer,
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
		deliveryBuyerListResult(data, currentPage);
	}
	callAjax("/dlm/deliveryBuyerList.do", "post", "text", true, param, resultCallbackSearch);
}
//구매담당자_발주 지시서 목록 조회
function deliveryBuyerList(currentPage){
	currentPage=currentPage || 1;
	
	var searchKey=document.getElementById("searchKey").value;
	var searchWord=document.getElementById("searchWord").value;
	
	//console.log("searchKey : "+searchKey+", searchWord : "+searchWord)
	
	var param={
			currentPage:currentPage,
			pageSize:pageSizeDeliveryBuyer,
			searchKey:searchKey,
			searchWord:searchWord		
	}
	
	var resultCallback=function(data){
		deliveryBuyerListResult(data, currentPage);
	}
	callAjax("/dlm/deliveryBuyerList.do", "post", "text", true, param, resultCallback);
}
//구매담당자_발주 지시서 목록 조회 콜백
function deliveryBuyerListResult(data, currentPage){
	console.log(data);
	
	//기존 목록 삭제 및 가져온 정보 넣기
	$("#listDeliveryBuyer").empty();
	$("#listDeliveryBuyer").append(data);
	
	//구매담당자_발주 지시서 목록 조회 카운트
	var deliveryBuyerTotal=$("#deliveryBuyerTotal").val();	
	// 페이지 네비게이션 생성
	var paginationHtml = getPaginationHtml(currentPage, deliveryBuyerTotal, pageSizeDeliveryBuyer, pageBlockSizeDeliveryBuyer, "deliveryBuyerList");
	$("#deliveryBuyerPagination").empty().append(paginationHtml);
	
	$("#currentPageDeliveryBuyer").val(currentPage);
}


//구매담당자_발주 지시서 단건 조회
function deliveryBuyerSelect(order_no){
	
	var param={
			order_no:order_no
	}
	
	var resultCallback=function(data){
		deliveryBuyerSelectResult(data);
	}
	callAjax("/dlm/deliveryBuyerSelect.do", "post", "json", true, param, resultCallback);
}
//구매담당자_발주 지시서 단건 조회 콜백
function deliveryBuyerSelectResult(data){
	console.log("data.deliveryBuyerModel : "+data.deliveryBuyerModel);
	console.log("data.deliveryBuyerModel.order_no : "+data.deliveryBuyerModel.order_no);
	
 	switch(data.deliveryBuyerModel.ship_cd){
	case "waiting":
		$("#btnSendConfirm").click(function(e){
			e.preventDefault();			
			$("#btnSendConfirm").attr("href", sendDeliveryBuyerDirection(data.deliveryBuyerModel.order_no));	
		})
		break;
	case "loading":
		$("#btnSendConfirm").click(function(e){
			e.preventDefault();			
			$("#btnSendConfirm").attr("href", sendDeliveryBuyerDirection(data.deliveryBuyerModel.order_no));
		})
		break;
	}
	//모달 팝업
	gfModalPop("#layer1");
	//모달 초기화 및 정보 넣기 함수 호출
	setDeliveryBuyerModal(data.deliveryBuyerModel);		
}
//구매담당자_발주 지시서 단건 조회_상세 리스트 
function deliveryBuyerDtlList(order_no, currentPage){
	currentPage=currentPage || 1;
	
	var param={
			order_no:order_no,
			currentPage:currentPage,
			pageSize:pageSizeModalDeliveryBuyerDtl
	}
	
	var resultCallback=function(data){
		deliveryBuyerDtlListResult(data, currentPage);
	}
	callAjax("/dlm/deliveryBuyerDtlList.do", "post", "text", true, param, resultCallback);
}
//구매담당자_발주 지시서 단건 조회_상세 리스트 콜백
function deliveryBuyerDtlListResult(data, currentPage){
	//console.log(data);
	
	//기존 목록 삭제 및 가져온 정보 넣기
	$("#listModalDeliveryBuyerDtl").empty();
	$("#listModalDeliveryBuyerDtl").append(data);
	
	//구매담당자_발주 지시서 목록 조회 카운트
	var modalDeliveryBuyerDtlTotal=$("#modalDeliveryBuyerDtlTotal").val();
	
	// 페이지 네비게이션 생성
	/* var paginationHtml = getPaginationHtml(currentPage, modalPurchaseDtlTotal, pageSizeModalPurchaseDtl, pageBlockSizeModalPurchaseDtl, "purchaseDtlList");
	$("#ModalPurchaseDtlPagination").empty().append(paginationHtml);
	
	$("#currentPageModalPurchaseDtl").val(currentPage); */		
}

//확인버튼 클릭 이벤트
function rowClickEvent(order_no, ship_cd){
	console.log(order_no, ship_cd);
	
	if(ship_cd === "waiting"){
		$("#btnSendConfirm").show();
		$("#btnSendWord").text("배송지시서 전송");
	}else if(ship_cd === "loading"){
		$("#btnSendConfirm").show();
		$("#btnSendWord").text("배송완료 처리");		
	}else if(ship_cd === "complete"){
		$("#btnSendConfirm").hide();
	}

	//구매담당자_발주 지시서 단건 조회 함수 호출
	deliveryBuyerSelect(order_no);	
	deliveryBuyerDtlList(order_no);	
}
//모달 초기화 및 정보 넣기
function setDeliveryBuyerModal(object) {
	if( object == "" || object == null || object == undefined) {			
		$("#order_no").val("");
		$("#user_company").val("");
		$("#user_address").val("");	
		
	} else {					
		$("#order_no").val(object.order_no);
		$("#user_company").val(object.user_company);
		$("#user_address").val(object.user_address+" "+object.user_dt_address);		
		currentOrderNum=object.order_no;	
	}	
}

//배송지시서 전송 및 출고 처리 & 창고 재고수량 변경
function sendDeliveryBuyerDirection(order_no){	
	//currentPage=currentPage || 1;
	console.log("sendDeliveryBuyerDirection(order_no) : "+order_no);
	var param={
			order_no:order_no,
			//currentPage:currentPage,
			//pageSize:pageSizeModalDeliveryBuyerDtl
	}
	
	var resultCallback=function(data){
		sendDeliveryBuyerDirectionResult(data/* , currentPage */);
	}
	
	callAjax("/dlm/sendDelivery.do", "post", "text", true, param, resultCallback);
}
function sendDeliveryBuyerDirectionResult(data){
	alert("배송상태 변경 : "+data);
	//모달 팝업
	gfCloseModal();	
	
	deliveryBuyerList();
}

//배송지시서 전송 및 출고 처리 & 창고 재고수량 변경
function finalChangeDeliveryStatus(order_no){	
	//currentPage=currentPage || 1;
	
	var param={
			order_no:order_no,
			//currentPage:currentPage,
			//pageSize:pageSizeModalDeliveryBuyerDtl
	}
	
	var resultCallback=function(data){
		finalChangeDeliveryStatusResult(data/* , currentPage */);
	}
	
	callAjax("/dlm/finalChangeDeliveryStatus.do", "post", "text", true, param, resultCallback);
}
function finalChangeDeliveryStatusResult(data){
	alert("배송상태 변경 : "+data);
	//모달 팝업
	gfCloseModal();	
	
	deliveryBuyerList();
}
</script>
</head>
<body>
	<form id="myForm" action=""  method="">
		<input type="hidden" name="currentPageDeliveryBuyer" id="currentPageDeliveryBuyer" value="">
		<input type="hidden" name="currentPageDeliveryBuyerDtlList" id="currentPageDeliveryBuyerDtlList" value="">
		<input type="hidden" id="userEmail" name="userEmail" value=""/>
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
									class="btn_nav">기업고객</a> <span class="btn_nav bold">배송 지시서 목록</span> <a href="/dlm/deliveryBuyer.do" class="btn_set refresh">새로고침</a>
							</p>
							
							<!-- 검색 영역 -->
							<p class="search">
							
							</p>							
							<p class="conTitle" id="searchArea">
							<span>배송 지시서 목록_배송담당자</span>
								 <span class="fr"> 
									<select id="searchKey" name="searchKey" style="width: 80px;">
									    <option value="all" id="option1" selected="selected">검색 조건</option>
										<option value="user_company" id="option2">구매회사</option>										
										<option value="ware_name" id="option3">출발 창고지</option>
									</select> 
									<input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요." style="height: 28px;"> 
										<input type="text" id="startdate" name="startdate" placeholder="시작일 선택" style="height: 28px;width: 80px"></input>
										<input type="text" id="enddate" name="enddate" placeholder="종료일 선택" style="height: 28px;width: 80px"></input>
										<a class="btnType blue" href="javascript:searchDeliveryBuyerList()" onkeydown="enterKey()" name="search">
										<span id="searchEnter">검색</span></a>			
								</span>
							</p>
							
							<!-- 테이블 영역 -->
							<div class="divDeliveryBuyer" id="divDeliveryBuyer">
								<table class="col">
									<colgroup>
										<col width="5%">
										<col width="8%">
										<col width="8%">
										<col width="5%">
										<col width="6%">
										<col width="6%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">주문번호</th>
											<th scope="col">주문고객</th>
											<th scope="col">배송희망일</th>
											<th scope="col">배송 담당자</th>
											<th scope="col">출발 창고지</th>
											<th scope="col">배송상태</th>
										</tr>
									</thead>
									
									<!--  -->
									<tbody id="listDeliveryBuyer">
									</tbody>									
								</table>
							</div>	<!-- .divDeliveryBuyerList 종료 -->
							
							<!-- 테이블 페이지 네비게이션 영역 -->
							<div class="pagingArea" id="deliveryBuyerPagination"></div>							
						</div>
					</li>
				</ul>
			</div>
		</div>	
		
		<!-- Modal 시작 -->
		<div id="layer1" class="layerPop layerType2" style="width: 900px;">
		<dl>
			<dt>
				<strong>배송 지시서</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row mt20">
					<caption>caption</caption>
					<colgroup>
						<col width="40px">
						<col width="40px">
						<col width="40px">
						<col width="60px">
						<col width="60px">
						<col width="150px">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">주문번호</th>
							<td><input type="text" class="inputTxt p100" name="order_no" id="order_no" readonly="readonly"/></td>
							<th scope="row">주문고객</th>
							<td><input type="text" class="inputTxt p100" name="user_company" id="user_company" readonly="readonly"/></td>
							<th scope="row">주문고객주소</th>
							<td><input type="text" class="inputTxt p100" name="user_address" id="user_address" readonly="readonly"/></td>
						</tr>
					</tbody>
				</table>
				<table class="row mt20" id="modalDeliveryBuyerDtlList">
					<colgroup>
						<col width="6%">
						<col width="4%">
						<col width="4%">
						<col width="8%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr style="background-color: silver;">
							<th scope="row" style="font-weight: bold;">제품</th>
							<th scope="row" style="font-weight: bold;">수량</th>
							<th scope="row" style="font-weight: bold;">창고번호</th>
							<th scope="row" style="font-weight: bold;">창고이름</th>
							<th scope="row" style="font-weight: bold;">창고주소</th>
						</tr>
					</thead>
					<tbody id="listModalDeliveryBuyerDtl">					
					</tbody>	
				</table>
				<!-- 테이블 페이지 네비게이션 영역 -->
				<div class="pagingArea" id="modalDeliveryBuyerDtlPagination"></div>	

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSendConfirm" name="btn"><span id="btnSendWord">ggg</span></a>
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