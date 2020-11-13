/**
 * 상세코드 부분
 */


/*// 상세코드 페이징 설정
var pageSizeComnDtlCod = 5;
var pageBlockSizeComnDtlCod = 10;*/

/** 상세코드 폼 초기화 */
function fInitFormDtlCod(object) {

  var grpCod = $("#tmpGrpCod").val();
  var grpCodNm = $("#tmpGrpCodNm").val();

  if (object == "" || object == null || object == undefined) {

    $("#dtl_grp_cod").val(grpCod);
    $("#dtl_grp_cod_nm").val(grpCodNm);
    $("#dtl_cod").val("");
    $("#dtl_cod_nm").val("");
    $("#dtl_odr").val("");
    $("#dtl_cod_eplti").val("");
    $("#dtl_tmp_fld_01").val("");
    $("#dtl_tmp_fld_02").val("");
    $("#dtl_tmp_fld_03").val("");
    $("#dtl_tmp_fld_04").val("");
    $("input:radio[name=dtl_use_poa]:input[value='Y']").attr("checked", true);

    $("#dtl_grp_cod").attr("readonly", true);
    $("#dtl_grp_cod").css("background", "#F5F5F5");
    $("#dtl_grp_cod_nm").attr("readonly", true);
    $("#dtl_grp_cod_nm").css("background", "#F5F5F5");
    $("#dtl_cod").attr("readonly", false);
    $("#dtl_cod").css("background", "#FFFFFF");
    $("#btnDeleteDtlCod").hide();
    $("#dtl_cod").focus();

  } else {

    $("#dtl_grp_cod").val(object.grp_cod);
    $("#dtl_grp_cod_nm").val(object.grp_cod_nm);
    $("#dtl_cod").val(object.dtl_cod);
    $("#dtl_cod_nm").val(object.dtl_cod_nm);
    $("#dtl_odr").val(object.odr);
    $("#dtl_cod_eplti").val(object.dtl_cod_eplti);
    $("#dtl_tmp_fld_01").val(object.tmp_fld_01);
    $("#dtl_tmp_fld_02").val(object.tmp_fld_02);
    $("#dtl_tmp_fld_03").val(object.tmp_fld_03);
    $("#dtl_tmp_fld_04").val(object.tmp_fld_04);
    $("input:radio[name=dtl_use_poa]:input[value='" + object.use_poa + "']").attr("checked", true);

    $("#dtl_grp_cod").attr("readonly", true);
    $("#dtl_grp_cod").css("background", "#F5F5F5");
    $("#dtl_grp_cod_nm").attr("readonly", true);
    $("#dtl_grp_cod_nm").css("background", "#F5F5F5");
    $("#dtl_cod").attr("readonly", true);
    $("#dtl_cod").css("background", "#F5F5F5");
    $("#btnDeleteDtlCod").show();
    $("#dtl_cod_nm").focus();
  }
}

/** 상세코드 저장 validation */
function fValidateDtlCod() {

  var chk = checkNotEmpty(
    [
      ["dtl_grp_cod", "그룹 코드를 선택해 주세요."]
      , ["dtl_cod", "상세 코드를 입력해 주세요."]
      , ["dtl_cod_nm", "상세 코드 명을 입력해 주세요"]
      , ["dtl_cod_eplti", "상세 코드 설명을 입력해 주세요."]
      , ["dtl_odr", "상세 코드 설명을 입력해 주세요."]
    ]
  );

  if (!chk) {
    return;
  }

  return true;
}

/** 상세코드 모달 실행 */
function fPopModalComnDtlCod(grp_cod, dtl_cod) {

  // 신규 저장
  if (dtl_cod == null || dtl_cod == "") {

    if ($("#tmpGrpCod").val() == "") {
      alert("그룹 코드를 선택해 주세요.");
      return;
    }

    // Tranjection type 설정
    $("#action").val("I");

    // 상세코드 폼 초기화
    fInitFormDtlCod();

    // 모달 팝업
    gfModalPop("#layer2");

    // 수정 저장
  } else {

    // Tranjection type 설정
    $("#action").val("U");

    // 상세코드 단건 조회
    fSelectDtlCod(grp_cod, dtl_cod);
  }
}


/** 상세코드 목록 조회 */
function fListComnDtlCod(currentPage, grp_cod, grp_cod_nm) {

  currentPage = currentPage || 1;

  // 그룹코드 정보 설정
  $("#tmpGrpCod").val(grp_cod);
  $("#tmpGrpCodNm").val(grp_cod_nm);

  var param = {
    grp_cod: grp_cod
    , currentPage: currentPage
    , pageSize: pageSizeDailyOrder
  }

  var resultCallback = function(data) {
    flistDtlCodResult(data, currentPage);
  };

  callAjax("/system/listComnDtlCod.do", "post", "text", true, param, resultCallback);
}


/** 상세코드 조회 콜백 함수 */
function flistDtlCodResult(data, currentPage) {

  // 기존 목록 삭제
  $('#listComnDtlCod').empty();

  var $data = $($(data).html());

  // 신규 목록 생성
  var $listComnDtlCod = $data.find("#listComnDtlCod");
  $("#listComnDtlCod").append($listComnDtlCod.children());

  // 총 개수 추출
  var $totalCntComnDtlCod = $data.find("#totalCntComnDtlCod");
  var totalCntComnDtlCod = $totalCntComnDtlCod.text();

  // 페이지 네비게이션 생성
  var grp_cod = $("#tmpGrpCod").val();
  var grp_cod_nm = $("#tmpGrpCodNm").val();
  var paginationHtml = getPaginationHtml(currentPage, totalCntComnDtlCod, pageSizeDailyOrder, pageBlockSizeComnDtlCod, 'fListComnDtlCod', [grp_cod]);
  $("#comnDtlCodPagination").empty().append(paginationHtml);

  // 현재 페이지 설정
  $("#currentPageComnDtlCod").val(currentPage);
}


/** 상세코드 단건 조회 */
function fSelectDtlCod(grp_cod, dtl_cod) {

  var param = {
    grp_cod: grp_cod
    , dtl_cod: dtl_cod
  };

  var resultCallback = function(data) {
    fSelectDtlCodResult(data);
  };

  callAjax("/system/selectComnDtlCod.do", "post", "json", true, param, resultCallback);
}


/** 상세코드 단건 조회 콜백 함수*/
function fSelectDtlCodResult(data) {

  if (data.result == "SUCCESS") {

    // 모달 팝업
    gfModalPop("#layer2");

    // 그룹코드 폼 데이터 설정
    fInitFormDtlCod(data.comnDtlCodModel);

  } else {
    alert(data.resultMsg);
  }
}


/** 상세코드 저장 */
function fSaveDtlCod() {

  // vaildation 체크
  if (!fValidateDtlCod()) {
    return;
  }

  var resultCallback = function(data) {
    fSaveDtlCodResult(data);
  };

  callAjax("/system/saveComnDtlCod.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
}


/** 상세코드 저장 콜백 함수 */
function fSaveDtlCodResult(data) {

  // 목록 조회 페이지 번호
  var currentPage = "1";
  if ($("#action").val() != "I") {
    currentPage = $("#currentPageComnDtlCod").val();
  }

  if (data.result == "SUCCESS") {

    // 응답 메시지 출력
    alert(data.resultMsg);

    // 모달 닫기
    gfCloseModal();

    // 목록 조회
    var grp_cod = $("#tmpGrpCod").val();
    var grp_cod_nm = $("#tmpGrpCodNm").val();
    fListComnDtlCod(currentPage, grp_cod, grp_cod_nm);

  } else {
    // 오류 응답 메시지 출력
    alert(data.resultMsg);
  }

  // 입력폼 초기화
  fInitFormDtlCod();
}


/** 상세코드 삭제 */
function fDeleteDtlCod() {

  var resultCallback = function(data) {
    fDeleteDtlCodResult(data);
  };

  callAjax("/system/deleteComnDtlCod.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
}


/** 상세코드 삭제 콜백 함수 */
function fDeleteDtlCodResult(data) {

  var currentPage = $("#currentPageComnDtlCod").val();

  if (data.result == "SUCCESS") {

    // 응답 메시지 출력
    alert(data.resultMsg);

    // 모달 닫기
    gfCloseModal();

    // 그룹코드 목록 조회
    var grp_cod = $("#tmpGrpCod").val();
    var grp_cod_nm = $("#tmpGrpCodNm").val();
    fListComnDtlCod(currentPage, grp_cod, grp_cod_nm);

  } else {
    alert(data.resultMsg);
  }
}