<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창고 정보 관리</title>
<!-- common Include -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script>
   //테이블 페이징 설정
  const pageSizeWHInfo = 5;
  const pageBlockSizeWHInfo = 5;

  //페이지로드 작동 메서드
  $(document).ready(function() {

    //창고별 제품 목록 조회    
    whInfoList();
  });

  //창고별 재고 조회
  function whInfoList(currentPage) {
    currentPage = currentPage || 1;
    
    //select태그에서 selected된 태그의 value 받아오기.
    const s = document.getElementById("searchKey");
    const searchKey = s.options[s.selectedIndex].value;
    const searchWord = document.getElementById("searchWord").value;
    
    const param = {
    currentPage : currentPage,
    pageSize : pageSizeWHInfo,
    searchKey : searchKey,
    searchWord : searchWord
    }

    const resultCallback = function(data) {
      whInfoListResult(data, currentPage);
    }

    callAjax("/scm/wh", "get", "text", true, param, resultCallback);
  }

  //창고 조회 콜백
  function whInfoListResult(data, currentPage) {

    //alert(data);

    var $data = $($(data).html());
    console.log(data);
    
    // 기존 목록 삭제
    $('#listWHInfo').empty();

    // 받아온 목록 추가
    $("#listWHInfo").append(data);

    // 총 개수 추출
  
    const totalcnt = $("#totalcnt").val();
    console.log("totalcnt : " + totalcnt);

    // 페이지 네비게이션 생성
    const paginationHtml = getPaginationHtml(currentPage, totalcnt, pageSizeWHInfo, pageBlockSizeWHInfo, 'whInfoList');
    console.log("paginationHtml : " + paginationHtml);

    $("#WHInfoPagination").empty().append(paginationHtml);

    // 현재 페이지 설정
    $("#WHInfoPagination").val(currentPage);
  }
</script>
</head>
<body>
  <form id="myForm" action="" method="" onsubmit="return false">
    <input type="hidden">
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
                <a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <a href="#" class="btn_nav">거래내역</a>
                <span class="btn_nav bold">창고 정보 관리</span>
                <a href="#" class="btn_set refresh">새로고침</a>
              </p>
              <!-- 검색 영역 -->
              <p class="search"></p>
              <p class="conTitle" id="searcharea">
                <span>창고 정보 관리</span>
                <span class="fr">
                  <select id="searchKey" name="searchKey" style="width: 80px;" v-model="searchKey">
                    <option value="all" id="option1" selected>전체</option>
                    <option value="ware_name" id="option1">창고 명</option>
                    <option value="ware_address" id="option2">창고 위치</option>
                  </select> <input type="text" id="searchWord" name="searchWord" v-model="searchWord" placeholder="" style="height: 28px;"> <a class="btnType blue" href="javascript:whInfoList()" onkeydown="enterKey()" name="search"><span id="searchEnter">검 색</span></a>
                </span>
              </p>
              <!-- 창고 등록 버튼 영역 -->
              <div style="padding-bottom: 10px; display: flex; justify-content: flex-end;">
                <a href="#" class="btnType blue" id="initBtn" name="btn"><span>신규 등록</span></a>
              </div>
              <!-- 상단 테이블 영역 -->
              <div class="divWHInfoList" id="divWHInfoList">
                <table class="col">
                  <colgroup>
                    <col width="7%">
                    <col width="10%">
                    <col width="10%">
                    <col width="18%">
                    <col width="13%">
                    <col width="7%">
                    <col width="35%">
                  </colgroup>
                  <thead>
                    <tr>
                      <th scope="col">창고 코드</th>
                      <th scope="col">창고 명</th>
                      <th scope="col">담당자</th>
                      <th scope="col">이메일</th>
                      <th scope="col">전화 번호</th>
                      <th scope="col">우편 번호</th>
                      <th scope="col">창고 위치</th>
                    </tr>
                  </thead>
                  <!-- 상단테이블 DB데이터 출력 영역 -->
                  <tbody id="listWHInfo">
                  <!-- 검색 결과 출력 영역 -->
                  </tbody>
                </table>
              </div>
              <!-- .divWHInfoList 종료 -->
              <div class="paging_area" id="WHInfoPagination"></div>
            </div> <!-- .content 종료 -->
          </li>
          <!-- .contents 종료 -->
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