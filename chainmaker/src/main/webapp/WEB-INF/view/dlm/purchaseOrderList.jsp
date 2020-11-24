<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<title>PurchaseOrder</title>
<!-- common Include -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script>
  // 상단테이블 페이징 설정
  const pageSizePurchaseOrderList = 5;
  const pageBlockSizePurchaseOrderList = 5;

  // 하단테이블 페이징 설정
  const pageSizePurchaseOrderDtlList = 5;
  const pageBlockSizePurchaseOrderDtlList = 5;

  // 페이지로드 작동 메서드
  $(document).ready(function() {

    // 발주 지시서 목록 가져오기
    purchaseOrderList();

    // 데이트피커 활성화        
    fDatePicker();
  });
  
  
  // 발주 지시서 목록 조회
  function purchaseOrderList(currentPage) {
    currentPage = currentPage || 1;

    const param = {
    currentPage : currentPage,
    pageSize : pageSizePurchaseOrderList,
    searchKey : $("#searchKey").val(),
    searchWord : $("#searchWord").val(),
    startDate : $("#startDate").val(),
    endDate : $("#endDate").val()
    }

    const resultCallback = function(data) {
      purchaseOrderListResult(data, currentPage);
    }

    callAjax("/dlm/purchaseOrderList.do", "get", "text", true, param, resultCallback);
  }
  
  // 발주 지시서 목록 조회 콜백
  function purchaseOrderListResult(data, currentPage) {
    console.log(data);
    
    // 발주 리스트 뿌리기
    $("#listPurchaseOrder").empty().append(data);
    
    // 총 개수 추출
    const purchaseOrderListTotal = $("#purchaseOrderListTotal").val();

    // 페이지 네비게이션 생성
    const paginationHtml = getPaginationHtml(currentPage, purchaseOrderListTotal, pageSizePurchaseOrderList, pageBlockSizePurchaseOrderList, "purchaseOrderList");

    $("#listPurchaseOrderPagination").empty().append(paginationHtml);

    $("#currentPagePurchaseOrderList").val(currentPage);
  }
  
  // 발주 지시서 상세 목록 조회
  function purchaseOrderDtlList(currentPage){
    
    currentPage = currentPage || 1;

    const param = {
    currentPage : currentPage,
    pageSize : pageSizePurchaseOrderDtlList,
    /* searchKey : $("#searchKey").val(),
    searchWord : $("#searchWord").val(),
    startDate : $("#startDate").val(),
    endDate : $("#endDate").val() */
    }
    const resultCallback = function(data) {
      purchaseOrderDtlListResult(data, currentPage);
    }

    callAjax("/dlm/purchaseOrderDtlList.do", "get", "text", true, param, resultCallback);
  }
  
//발주 지시서 목록 조회 콜백
  function purchaseOrderDtlListResult(data, currentPage) {
    console.log(data);
    
    // 발주 리스트 뿌리기
    $("#listPurchaseOrderDtl").empty().append(data);
    
    // 총 개수 추출
    const purchaseOrderListTotal = $("#purchaseOrderListTotal").val();

    // 페이지 네비게이션 생성
    const paginationHtml = getPaginationHtml(currentPage, purchaseOrderListTotal, pageSizePurchaseOrderList, pageBlockSizePurchaseOrderList, "purchaseOrderList");

    $("#listPurchaseOrderPagination").empty().append(paginationHtml);

    $("#currentPagePurchaseOrderList").val(currentPage);
  }
  
  

  // 데이트 피커 함수
  function fDatePicker(){
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
         showAnim: "slide", // 애니메이션을 적용한다.
         dateFormat: "yy-mm-dd",
         maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
         onClose: function( selectedDate ) {    
              // 시작일(startDate) datepicker가 닫힐때
              // 종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
             $("#endDate").datepicker( "option", "minDate", selectedDate );
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
         }    
    }); 
    
    //$("#startDate").datepicker('setDate', 'today');
    //$("#endDate").datepicker('setDate', 'today');
}

  
  
</script>
</head>
<body>
  <form id="myForm" action="" method="">
    <input type="hidden" name="currentPagePurchaseOrderList" id="currentPagePurchaseOrderList" value=""> 
    <input type="hidden" name="currentPagePurchaseOrderDtlList" id="currentPagePurchaseOrderDtlList" value="">
    <div id="wrap_area">
      <!-- header Include -->
      <jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
      <div id="container">
        <ul>
          <li class="lnb">
            <!-- lnb Include --> <jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
          </li>
          <li class="contents">
            <div class="content">
              <!-- 메뉴 경로 영역 -->
              <p class="Location">
                <a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <a href="#" class="btn_nav">기업 고객</a>
                <span class="btn_nav bold">배송 지시서 목록</span>
                <a href="" class="btn_set refresh">새로고침</a>
              </p>
              <!-- 검색 영역 -->
              <p class="search"></p>
              <p class="conTitle" id="searchArea">
                <span>발주 지시서 목록</span>
                <span class="fr">
                  <select id="searchKey" name="searchKey" style="width: 80px;">
                    <option value="all" id="option1" selected="selected">검색 조건</option>
                    <option value="company" id="option2">업체 명</option>
                  </select> 
                  <input type="text" id="searchWord" name="searchWord" placeholder="검색어를 입력해주세요." style="height: 28px;"> 
                  <input type="text" id="startDate" placeholder="시작일 선택" style="height: 28px; width: 80px" readonly="readonly"></input> 
                  <input type="text" id="endDate" placeholder="종료일 선택" style="height: 28px; width: 80px" readonly="readonly"></input> 
                  <a class="btnType blue" href="javascript:purchaseOrderList()" onkeydown="enterKey()" name="search"> 
                  <span id="searchEnter">검색</span>
                  </a>
                </span>
              </p>
              <!-- 상단 테이블 영역 -->
              <div class="divPurchaseOrderList" id="divPurchaseOrderList">
                <table class="col">
                  <colgroup>
                    <col width="5%">
                    <col width="15%">
                    <col width="12%">
                    <col width="10%">
                  <thead>
                    <tr>
                      <th scope="col">No.</th>
                      <th scope="col">업체 명</th>
                      <th scope="col">총 액</th>
                      <th scope="col">발주 처리일</th>
                    </tr>
                  </thead>
                  <!-- 상단테이블 DB데이터 출력 영역 -->
                  <tbody id="listPurchaseOrder">
                        <!-- 검색 결과 출력 영역 -->
                  </tbody>
                </table>
              </div>
              <!-- .divWhInventoryList 종료 -->
              <!-- 상단테이블 페이지 네비게이션 영역 -->
              <div class="pagingArea" id="listPurchaseOrderPagination"></div>
              <p class="conTitle mt50">
                <span>발주 지시서 상세 내역</span>
                <span class="fr"></span>
              </p>
              <!-- 하단 테이블 영역 -->
              <div class="divPurchaseOrderDtlList" id="divPurchaseOrderDtlList">
                <table class="col">
                  <colgroup>
                    <col width="8%">
                    <col width="10%">
                    <col width="10%">
                    <col width="10%">
                    <col width="15%">
                    <col width="15%">
                    <col width="10%">
                  </colgroup>
                  <thead>
                    <tr>
                      <th scope="col">번호</th>
                      <th scope="col">장비 번호</th>
                      <th scope="col">장비 구분</th>
                      <th scope="col">모델 번호</th>
                      <th scope="col">모델 명</th>
                      <th scope="col">제조사</th>
                      <th scope="col">판매 가격</th>
                    </tr>
                  </thead>
                  <!-- 하단테이블 DB 데이터 출력 영역 -->
                  <tbody id="listPurchaseOrderDtl">
                    <!-- 배송 지시서 상세 내역 영역 -->
                  </tbody>
                </table>
              </div>
              <!-- 하단테이블 Pagenation 영역 -->
              <div class="pagingArea" id="listPurchaseOrderDtlPagination"></div>
            </div> <!-- .content 종료 -->
          </li>
          <!-- .content 종료 -->
        </ul>
      </div>
      <!-- #container 종료 -->
      <!-- footer Include -->
      <jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
    </div>
    <!-- #wrap_area 종료 -->
  </form>
</body>
</html>