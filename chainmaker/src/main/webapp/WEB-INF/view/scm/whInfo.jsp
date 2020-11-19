<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>창고 정보 관리</title>
<!-- common Include -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- 주소찾기  -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" charset="utf-8" src="${CTX_PATH}/js/popFindZipCode.js"></script>
<script>
  //  테이블 페이징 설정
  const pageSizeWHInfo = 5;
  const pageBlockSizeWHInfo = 5;

  // 등록모달, 수정모달 구분자
  const init = "init";
  const modify = "modify";

  const produce = "produce";
  const update = "update";
  const del = "delete";

  //  페이지로드 작동 메서드
  $(document).ready(function() {

    //  창고별 제품 목록 조회    
    whInfoList();

  });

  // 창고 정보 등록
  function whInfoControl(action) {
    console.log(action);

    if (!fValidateWhInfo()) {
      return;
    }

    let param;
    let resultCallBack;
    const url = "/scm/whinfo";

    switch (action) {
    case "produce":
      param = {
      action : action,
      ware_no : 13,
      ware_cd : $("#address").val().substr(0,2),
      ware_name : $("#ware_name").val(),
      ware_address : $("#address").val(),
      ware_dt_address : $("#dt_address").val(),
      ware_zipcode : $("#zipcode").val(),
      loginID : $("#selectMng option:selected").val()
      };
      resultCallBack = function(data) {
        const result = data.result;
        const resultMsg = data.resultMsg
        console.log(result);
        alert(resultMsg);
        location.href = "";
      };
      break;

    case "update":
      param = {
      action : action,
      ware_no : $("#ware_no").val(),
      ware_cd : $("#address").val().substr(0,2),
      ware_name : $("#ware_name").val(),
      ware_address : $("#address").val(),
      ware_dt_address : $("#dt_address").val(),
      ware_zipcode : $("#zipcode").val(),
      loginID : $("#selectMng option:selected").val()
      };
      resultCallBack = function(data) {
        const result = data.result;
        const resultMsg = data.resultMsg
        console.log(result);
        alert(resultMsg);
        location.href = "";
      };
      break;

    case "delete":
      param = {
      action : action,
      ware_no : $("#ware_no").val()
      };
      resultCallBack = function(data) {
        const result = data.result;
        const resultMsg = data.resultMsg
        console.log(result);
        alert(resultMsg);
        location.href = "";
      };
      break;
      
    default:
      alert("잘못된 접근 입니다.");
      location.href = "";
    }
    callAjax(url, "post", "json", true, param, resultCallBack);
  }

  /** 창고 정보 null check */
  function fValidateWhInfo() {

    const chk = checkNotEmpty([ 
      [ "ware_name", "창고 명을 입력해 주세요." ], 
      [ "zipcode", "우편 번호를 입력해 주세요." ], 
      [ "address", "주소를 입력해 주세요." ], 
      [ "dt_address", "상세 주소를 입력해 주세요." ]
      ]);
    if (!chk) {
      return;
    }
    return true;
  }

  // 우편번호 api
  function execDaumPostcode(q) {
    new daum.Postcode({
      oncomplete : function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        let addr = ''; // 주소 변수
        let extraAddr = ''; // 참고항목 변수

        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
          addr = data.roadAddress;
        } 
        else { // 사용자가 지번 주소를 선택했을 경우(J)
          addr = data.jibunAddress;
        }

        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
        if (data.userSelectedType === 'R') {
          // 법정동명이 있을 경우 추가한다. (법정리는 제외)
          // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
          if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
            extraAddr += data.bname;
          }
          // 건물명이 있고, 공동주택일 경우 추가한다.
          if (data.buildingName !== '' && data.apartment === 'Y') {
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('zipcode').value = data.zonecode;
        document.getElementById("address").value = addr;
        // 커서를 상세주소 필드로 이동한다.
        document.getElementById("address").focus();
      }
    }).open({
      q : q
    });
  }
</script>
<script src="${CTX_PATH}/js/view/scm/whInfo/whInfoList.js"></script>
<script src="${CTX_PATH}/js/view/scm/whInfo/whInfoModal.js"></script>
</head>
<body>
  <form id="myForm" action="" method="" onsubmit="return false">
    <input type="hidden">
    <div id="whInfoData"></div>
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
                  <select id="searchKey" name="searchKey" style="width: 80px;">
                    <option value="all" id="option1" selected>전체</option>
                    <option value="ware_name" id="option2">창고 명</option>
                    <option value="ware_address" id="option3">창고 위치</option>
                  </select> <input type="text" id="searchWord" name="searchWord" placeholder="" style="height: 28px;"> 
                  <a class="btnType blue" onclick="whInfoList()" onkeydown="enterKey()" name="search"><span id="searchEnter">검 색</span></a>
                </span>
              </p>
              <!-- 창고 등록 버튼 영역 -->
              <div style="padding-bottom: 10px; display: flex; justify-content: flex-end;">
                <a href="javascript:whInitModal(init)" class="btnType blue" id="initBtn" name="btn"><span>신규 등록</span></a>
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
    <jsp:include page="/WEB-INF/view/scm/whInfoModal.jsp"></jsp:include>
  </form>
</body>
</html>