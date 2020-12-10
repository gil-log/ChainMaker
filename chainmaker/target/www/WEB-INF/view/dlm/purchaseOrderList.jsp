<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Chain Maker :: 발주/반품 처리</title>
<!-- common Include -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<c:if test="${sessionScope.userType ne 'B'}">
  <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<script src="${CTX_PATH}/js/view/dlm/global/callJsAndInitBtnEvent.js"></script>
<script src="${CTX_PATH}/js/view/dlm/control/purchaseAndRefundControl.js"></script>
<script src="${CTX_PATH}/js/view/dlm/orderList/purchaseListAndDatePicker.js"></script>
<script src="${CTX_PATH}/js/view/dlm/check/allCheckAndValidation.js"></script>
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
                <a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
                <a href="#" class="btn_nav">제품 발주/반품</a>
                <span class="btn_nav bold">발주/반품 처리</span>
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
                  <thead>
                    <tr>
                      <th scope="col">No.</th>
                      <th scope="col">업체 명</th>
                      <th scope="col">총 액</th>
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
              <div class="paging_area" id="listPurchaseOrderPagination"></div>
              <p class="conTitle mt50">
                <span>발주 지시서 상세 내역</span>
                <span class="fr"></span>
              </p>
              <!-- 하단 테이블 영역 -->
              <div class="divPurchaseOrderDtlList" id="divPurchaseOrderDtlList">
                <table class="col">
                  <colgroup>
                    <col width="3%">
                    <col width="5%">
                    <col width="10%">
                    <col width="7%">
                    <col width="12%">
                    <col width="8%">
                    <col width="20%">
                    <col width="5%">
                    <col width="8%">
                    <col width="9%">
                    <col width="7%">
                  </colgroup>
                  <thead>
                    <tr>
                      <th scope="col"><input type="checkbox" id="chk_all" onclick="allCheckAble()" /></th>
                      <th scope="col">번호</th>
                      <th scope="col">모델 번호</th>
                      <th scope="col">장비 구분</th>
                      <th scope="col">모델 명</th>
                      <th scope="col">제조사</th>
                      <th scope="col">발주 날짜</th>
                      <th scope="col">개수</th>
                      <th scope="col">처리 개수</th>
                      <th scope="col">판매 가격</th>
                      <th scope="col">창고 번호</th>
                    </tr>
                  </thead>
                  <!-- 하단테이블 DB 데이터 출력 영역 -->
                  <tbody id="listPurchaseOrderDtl">
                    <!-- 배송 지시서 상세 내역 영역 -->
                  </tbody>
                </table>
              </div>
              <!-- 하단테이블 Pagenation 영역 -->
              <div class="paging_area" id="listPurchaseOrderDtlPagination"></div>
              <!-- 버튼 영역 -->
              <div class="btn_areaC mt30" id="btnBox" style="margin-bottom: 30px;">
                <a href="" class="btnType grey" id="btnRefundOrder" name="btn">
                  <span>반품 처리</span>
                </a>
                <a href="" class="btnType blue" id="btnPurchaseOrder" name="btn">
                  <span>입고 처리</span>
                </a>
              </div>
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
    <%-- <jsp:include page="/WEB-INF/view/dlm/refundModal.jsp"></jsp:include> --%>
  </form>
</body>
</html>