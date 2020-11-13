
/** 일별 수주 내역 조회 */
function fListDailyOrderHistroy(currentPage) {

  currentPage = currentPage || 1;

  console.log("currentPage : " + currentPage);

  var param = {
    currentPage: currentPage
    , pageSize: pageSizeDailyOrder
  }

  var resultCallback = function(data) {
    flistDailyOrderHistroyResult(data, currentPage);
  };
  //Ajax실행 방식
  //callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
  //html로 받을거라 text
  callAjax("/scm/dailyOrderHistory.do/orders/dailyOrder", "post", "text", true, param, resultCallback);
}

/** 일별 수주 내역 조회 콜백 함수 */
function flistDailyOrderHistroyResult(data, currentPage) {

  //alert(data);
  console.log(data);

  // 기존 목록 삭제
  $('#listDailyOrderHistroy').empty();

  var $data = $($(data).html());

  $("#listDailyOrderHistroy").append(data);

  // 총 개수 추출
  var $totalCntDailyOrder = $data.find("#totalCntDailyOrder");
  var totalCntDailyOrder = $totalCntDailyOrder.text();

  // 페이지 네비게이션 생성
  var paginationHtml = getPaginationHtml(currentPage, totalCntDailyOrder, pageSizeDailyOrder, pageBlockSizeDailyOrder, 'fListDailyOrderHistroy');
  console.log("paginationHtml : " + paginationHtml);

  $("#comnGrpCodPagination").empty().append(paginationHtml);

  // 현재 페이지 설정
  $("#currentPageComnGrpCod").val(currentPage);
}


/** 주문 정보 배송 지시서 모달 실행 */
function fPopModalDeliDirection(order_no, pro_no) {

    // Tranjection type 설정
    $("#action").val("U");

    // 주문 번호, 제품 번호 단건 조회
    fSelectOrderNoAndProNo(order_no, pro_no);
  
}


/** 그룹코드 단건 조회 */
function fSelectOrderNoAndProNo(order_no, pro_no) {

  var param = { 
		  order_no : order_no,
		  pro_no : pro_no
		  };

  var resultCallback = function(data) {
	  fSelectOrderNoAndProNoResult(data);
  };
  
  var prefix = "/scm/dailyOrderHistory.do/order/";
  var suffix = "/product/";
  var url = prefix + order_no + suffix + pro_no;

  callAjax(url, "get", "json", true, null, resultCallback);
}



/** 그룹코드 단건 조회 콜백 함수*/
function fSelectOrderNoAndProNoResult(data) {

    // 일별 수주내역 폼 데이터 설정
    fInitFormDeliyDirection(data.orderDetail);

    // 모달 팝업
    gfModalPop("#deliDirection");

}





/** 일별 수주 내역 폼 초기화 */
function fInitFormDeliyDirection(object) {
  $("#order_no").focus();
  if (object == "" || object == null || object == undefined) {

    $("#order_no").val("");
    $("#order_date").val("");
    $("#user_company").val("");
    $("#pro_name").val("");
    $("#pro_ware_qty").val("");
    $("#name").val("");
    $("#order_cd").val("");
    $("#order_no").focus();

  } else {

	    $("#order_no").text(object.order_no);
	    $("#order_date").text(object.order_date);
	    $("#user_company").text(object.user_company);
	    $("#pro_name").text(object.pro_name);
	    $("#order_qty").text(object.order_qty);
	    $("#name").text(object.name);
	    $("#order_cd").text(object.order_cd);
	    $("#order_no").focus();
	    
	    
	    $("#ware_name").text('');
	    $("#pro_ware_qty").text('');

	    $("#pro_name_bottom").text('');
	    
	    
	    
	    
	    
  }
  
  
  // pro_no로 wh정보 가져오기
  fMakeWHInfoDropdownByProNo(object.pro_no);
  
}

function fMakeWHInfoDropdownByProNo(pro_no){

	var prefix = "/scm/dailyOrderHistory.do/warehouse/";
	var url = prefix + pro_no;
	

	var resultCallback = function(data) {
		fMakeWHInfoDropdownByProNoResult(data, 'ware_name_option');
	};
	
	callAjax(url, "get", "json", true, null, resultCallback);
	
}

function fMakeWHInfoDropdownByProNoResult(data, optionId){
	
	
		$("#"+optionId).find("option").remove();
		$("#whInfoData").children().remove();
		
		$("#"+optionId).append("<option value=''> 창고 선택 </option>");
		

		// 해당 제품들 정보 hidden 저장
		$("#whInfoData").find("input").remove();
		
		for (var i=0 ; i<data.whInfoList.length ; i++) {
			var model = data.whInfoList[i];
			$("#"+optionId).append("<option value='"+model.ware_no+"' >"+model.ware_name+"</option>");
			$("#whInfoData").append("<div class='"+model.ware_no+"'"+"id="+model.ware_no+">"+"</div>");
			$("#"+model.ware_no).append("<input type='hidden' class='wb_ware_no' value='"+model.ware_no+"'>");

			$("#"+model.ware_no).append("<input type='hidden' class='wb_ware_name' value='"+model.ware_name+"'>");
			$("#"+model.ware_no).append("<input type='hidden' class='wb_pro_no' value='"+model.pro_no+"'>");
			$("#"+model.ware_no).append("<input type='hidden' class='wb_pro_name' value='"+model.pro_name+"'>");
			$("#"+model.ware_no).append("<input type='hidden' class='wb_name' value='"+model.name+"'>");
			
			$("#"+model.ware_no).append("<input type='hidden' class='wb_pro_ware_qty' value='"+model.pro_ware_qty+"'>");

			/*$("#"+model.ware_no).append("<input type='hidden' class='"+model.ware_no+"'id='ware_no' value='"+model.ware_no+"'>");
			
			$("#"+model.ware_no).append("<input type='hidden' id='"+model.ware_no+"ware_no"+model.pro_no+"pro_no"+"' value='"+model.pro_no+"'>");
			$("#"+model.ware_no).append("<input type='hidden' id='"+model.ware_no+"ware_no"+model.name+"name"+"' value='"+model.name+"'>");
			
			$("#"+model.ware_no).append("<input type='hidden' id='"+model.ware_no+"ware_no"+model.pro_ware_qty+"pro_ware_qty"+"' value='"+model.pro_ware_qty+"'>");
			*/
		}
}

function fSelectedOptions(ware_no, optionId){
	
	var option_ware_no = $("#whInfoData").find('.'+ware_no).children('.wb_ware_no').val();
	var option_ware_name = $("#whInfoData").find('.'+ware_no).children('.wb_ware_name').val();
	var option_pro_no = $("#whInfoData").find('.'+ware_no).children('.wb_pro_no').val();
	var option_pro_name = $("#whInfoData").find('.'+ware_no).children('.wb_pro_name').val();
	var option_name = $("#whInfoData").find('.'+ware_no).children('.wb_name').val();
	var option_pro_ware_qty = $("#whInfoData").find('.'+ware_no).children('.wb_pro_ware_qty').val();
	

    $("#name").text(option_name);

    $("#ware_name").text(option_ware_name);
    $("#pro_name_bottom").text(option_pro_name);
    $("#pro_ware_qty").text(option_pro_ware_qty);
	
}

















/** 그룹코드 저장 validation */
function fValidateGrpCod() {

  var chk = checkNotEmpty(
    [
      ["grp_cod", "그룹 코드를 입력해 주세요."],
      ["grp_cod_nm", "그룹 코드 명을 입력해 주세요"],
      ["grp_cod_eplti", "그룹 코드 설명을 입력해 주세요."]
    ]);
  if (!chk) {
    return;
  }
  return true;
}


/** 그룹코드 저장 */
function fSaveGrpCod() {

  // vaildation 체크
  if (!fValidateGrpCod())  {
    return;
  }

  var resultCallback = function(data) {
    fSaveDailyOrderHistoryResult(data);
  };

  callAjax("/system/saveComnGrpCod.do", "get", "json", true, $("#myForm").serialize(), resultCallback);
}


/** 그룹코드 저장 콜백 함수 */
function fSaveDailyOrderHistoryResult(data) {

  // 목록 조회 페이지 번호
  var currentPage = "1";
  if ($("#action").val() != "I") {
    currentPage = $("#currentPageDailyOrder").val();
  }

  if (data.result == "SUCCESS") {

    // 응답 메시지 출력
    alert(data.resultMsg);

    // 모달 닫기
    gfCloseModal();

    // 목록 조회
    fListDailyOrderHistroy(currentPage);

  } else {
    // 오류 응답 메시지 출력
    alert(data.resultMsg);
  }

  // 입력폼 초기화
  fInitFormDiailyOrderHistory();
}


/** 그룹코드 삭제 */
function fDeleteDailyOrderHistroy() {

  var resultCallback = function(data) {
    fDeleteDailyOrderHistroyResult(data);
  };

  callAjax("/system/deleteComnGrpCod.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
}


/** 그룹코드 삭제 콜백 함수 */
function fDeleteDailyOrderHistroyResult(data) {

  var currentPage = $("#currentPageDailyOrder").val();

  if (data.result == "SUCCESS") {

    // 응답 메시지 출력
    alert(data.resultMsg);

    // 모달 닫기
    gfCloseModal();

    // 일별수주 목록 조회
    fListDailyOrderHistroy(currentPage);

  } else {
    alert(data.resultMsg);
  }
}


