<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko" >
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>오클라인</title>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript" src="${CTX_PATH}/js/map.js"></script>
<script type="text/javascript" src="${CTX_PATH}/js/stringBuffer.js"></script>
<!-- summernote start -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="${CTX_PATH}/js/bootstrap/custom_bootstrap.css" rel="stylesheet">
<script src="${CTX_PATH}/js/bootstrap/bootstrap.js"></script> 
<!-- include summernote css/js-->
<link href="${CTX_PATH}/js/summernote/summernote.css" rel="stylesheet">
<script src="${CTX_PATH}/js/summernote/summernote.js"></script>
<script src="${CTX_PATH}/js/summernote/lang/summernote-ko-KR.js"></script>
<!-- summernote end -->
<script type="text/javascript">

// 페이징 설정
//var pageSize = 5;
var pageBlockSize = 10;
var m_Map = new Map(); // 이미지 파일을 저장하기 위한 map
/** OnLoad event */ 
$(function() {
	
	var viewBbsId = "";
	if ('${param.viewBbsId}' != "" ){
		viewBbsId = "${param.viewBbsId}";
	}
	
	// 조회
	fShowList(1, viewBbsId);
	
	//summernote 에디터 초기화
	$('#summernote').summernote({
		height: 250,   //set editable area's height
		lang: 'ko-KR', //언어선택
		fontNamesIgnoreCheck: ['Arial'],
		disableDragAndDrop: false,
        focus: true,
        callbacks: {
			onImageUpload: function(files, editor, welEditable) {
				for (var i = 0; i < files.length; i++) {
					// 이미지 드래그 엔 드롭 기능 비활성 20171214
					//m_Map.put(i+1, files[i]);
					//$('#summernote').summernote('editor.insertImage', window.URL.createObjectURL(files[i]));
					//'/cmnt/selectCmntBbsPoto.do?bbs_id=1&snm='+(i+1);
				}
			}
		}
	});
	
	// 셀렉트 이벤트 등록
	fRegisterOnchangeEvent();
	
	// datepicker
	$("#bbs_sat_dtt").datepicker({defaultDate: $.datepicker.formatDate('yy.mm.dd', new Date())});
	$("#bbs_end_dtt").datepicker({defaultDate: $.datepicker.formatDate('yy.mm.dd', new Date())});
	$("#pop_sat_dtt").datepicker({defaultDate: $.datepicker.formatDate('yy.mm.dd', new Date())});
	$("#pop_end_dtt").datepicker({defaultDate: $.datepicker.formatDate('yy.mm.dd', new Date())});
});

/** change 이벤트 등록 */
function fRegisterOnchangeEvent() {
	$('#pageSize').change(function() {
		fShowList();
	});
	
	$("#searchInput").keyup(function(e){
		if(e.keyCode == 13){
			doSearch();
		}
	});
	
	$('input[name="bbs_dtt"]').change(function() {
		if($('#bbs_dtt_Y').prop("checked")){
			alert('게시기간 설정시, 게시기간내에만 게시물이 조회됩니다.');
			$('#bbsDdt').show();
		}else{
			$('#bbsDdt').hide();
		}
	});
	
	$('input[name="pop_poa"]').change(function() {
		if($('#pop_poa_Y').prop("checked")){
			$('#popDdt').show();
		}else{
			$('#popDdt').hide();
		}
	});
	
	$('#sae_obj_gbn_cod').change(function() {
		if($(this).val() == 'E'){
			$('#sae_obj_gbn_id').show();
		}else{
			$('#sae_obj_gbn_id').hide();
		}
	});
	
	$('#bbsSatDdt').bind('click', function() {
		$("#bbs_sat_dtt").datepicker("show");
	});

	$('#bbsEndDdt').bind('click', function() {
		$("#bbs_end_dtt").datepicker("show");
	});

	$('#popSatDdt').bind('click', function() {
		$("#pop_sat_dtt").datepicker("show");
	});

	$('#popEndDdt').bind('click', function() {
		$("#pop_end_dtt").datepicker("show");
	});
}

/** 조회 */
function fShowList(currentPage, viewBbsId) {
	
	var cmnt_id = '${param.cmnt_id}';
	$('#cmnt_id').val(cmnt_id);//커뮤니티 ID 세팅
	
	var pageSize = $('#pageSize').val();
	currentPage = currentPage || 1;
	var param = {
				currentPage : currentPage
			,	pageSize : pageSize
	}
	param.cmnt_id = cmnt_id;
	
	if($('#searchInput').val() != ''){
		param.searchInput = $('#searchInput').val();
		param.listSrchOpt = $('#listSrchOpt').val();
	}
	
	var resultCallback = function(data) {
		fShowListResult(data, currentPage, viewBbsId);
	};
	
	callAjax("/cmnt/cmntBbsList.do", "post", "text", true, param, resultCallback);
}


/** 조회 콜백 함수 */
function fShowListResult(data, currentPage, viewBbsId) {
	
	var pageSize = $('#pageSize').val();
	// 기존 목록 삭제
	$('#showList').empty();
	
	var $data = $( $(data).html() );
	// 신규 목록 생성
	var $list = $data.find("#showList");		
	$("#showList").append($list.children());
	
	// 총 개수 추출
	var $totalCnt = $data.find("#totalCnt");
	var totalCnt = $totalCnt.text(); 
	
	// 페이지 네비게이션 생성
	var paginationHtml = getPaginationHtml(currentPage, totalCnt, pageSize, pageBlockSize, 'fShowList');
	$("#pagination").empty().append( paginationHtml );
	
	// 현재 페이지 설정
	$("#currentPageTarget").val(currentPage);
	
	if (viewBbsId != null && viewBbsId != "" && viewBbsId != undefined) {
		fSelectData(viewBbsId, currentPage);	
	}
	
	
}

/** 단건 조회 */
function fSelectData(id,mode) {
	$('#mode').val('2');
	if(mode == '1'){
		$('#mode').val('1'); //조회수를 +1 하기위해 선언함.	
	}
	var param = { bbs_id : id
			, mode : mode};
	var resultCallback = function(data) {
		if(mode == '1'){ //단순 조회
			fSelectDataResult(data);
		}else if(mode == '2'){ //수정을 위한 조회
			fInitForm(data);
		}
	};
	
	callAjax("/cmnt/selectCmntBbs.do", "post", "json", true, param, resultCallback);
}

/** 단건 조회 콜백 함수*/
function fSelectDataResult(data) {
	if (data.result == "SUCCESS") {
		//alert(data.resultMsg);
		var list = data.resultModel;
		//전체 지우고 초기화
		$('tr[name="cnts_tr"]').hide();
		$('div[name="hiddenCnts"]').html("");
		//읽을 내용 불러오기
		$('#'+list.bbs_id+"_cnts").html(list.cnts);
		$('#'+list.bbs_id+"_tr").show();

		//답글,덧글 쓰기권한
		if('${listCmntModel}' != null){
			if('${listCmntModel.rcnt_poa}' == 'Y'){ //답글
				$('a[name="rCnt"]').show();
			}else{
				$('a[name="rCnt"]').hide();
			}
			if('${listCmntModel.cmt_poa}' == 'Y'){ //덧글
				$('a[name="rCmt"]').show();
				$('div[name="listCmt"]').show();
				fListCmtData(list.bbs_id); //덧글 리스트 가져오기
			}else{
				$('a[name="rCmt"]').hide();
				$('div[name="listCmt"]').hide();
			}
		}
	} else {
		alert(data.resultMsg);
	}	
}

/** 폼 초기화 */
function fInitForm(data) {
	if( data == "" || data == null || data == undefined) {
		$("#action").val('I');
		$("#bbs_id").val('');
		$("#vews").val('0');
		$("#wtr_nm").val('${sessionScope.usrNm}');
		$('#bbs_dtt_N').prop("checked", true);
		$('#pop_poa_N').prop("checked", true);
		if($('#hir_bbs_id').val() == ""){
			$('#titl').val('');		
		}
		
		//$('#sae_obj_gbn_cod').val('O');
		//$('#sae_obj_gbn_id').val('');
		$('div[name="cnts"]').val('');
		$('#summernote').summernote('reset');
		$('#bbsDdt').hide();
		$('#popDdt').hide();
		$('#btnDelete').hide();
		
		
		$('#delFile').hide();
		
		
		$('#delThisFile').val('N');
		//업로드 안한 파일은 지운다
		if ($.browser.msie) { // ie 일때 input[type=file] init.
			$("#bnsm_file").replaceWith( $("#bnsm_file").clone(true) ); 
		} else { // other browser 일때 input[type=file] init.
			$("#bnsm_file").val(""); 
		}
		$("#viewBnsmFile").text("");
		$("#hiddenLcnsFile").val("");
		$('#delFile').hide();
	}else{
		var list = data.resultModel;
		$("#action").val('U');
		$("#bbs_id").val(list.bbs_id);
		$("#vews").val(list.vews);
		$("#wtr_nm").val(list.wtr_nm);
		
		if(list.bbs_sat_dtt == "" || list.bbs_sat_dtt == null || list.bbs_sat_dtt == undefined){
			$('#bbs_dtt_N').prop("checked", true);
			$('#bbsDdt').hide();
		}else{
			$('#bbs_dtt_Y').prop("checked", true);
			$('#bbs_sat_dtt').val(list.bbs_sat_dtt);
			$('#bbs_end_dtt').val(list.bbs_end_dtt);
			$('#bbsDdt').show();
			
		}
		if(list.pop_poa == "N"){
			$('#pop_poa_N').prop("checked", true);	
			$('#popDdt').hide();		
		}else{
			$('#pop_poa_Y').prop("checked", true);
			$('#pop_sat_dtt').val(list.pop_sat_dtt);
			$('#pop_end_dtt').val(list.pop_end_dtt);
			$('#popDdt').show();
		}
		
		$('#titl').val(list.titl);
		$('#summernote').summernote('reset');
		$('#summernote').summernote('code', list.cnts);

		$('#sae_obj_gbn_cod').val(list.sae_obj_gbn_cod);
		if(list.sae_obj_gbn_cod == 'E'){
			$('#sae_obj_gbn_id').show();
			$('#sae_obj_gbn_id').val(list.sae_obj_gbn_id);
		}else{
			$('#sae_obj_gbn_id').val('');
		}

		$('#btnDelete').show();
		
		/* 첨부파일 */
		$("#bbs_files").empty();	// 기존 첨부파일 목록 제거
		$("#bbs_file_snm").val("");	// 첨부파일 일련번호
		
		// 첨부파일 설정
		$(list.listBbsCmtAtmtFilModel).each(function(index, cmntBbsAtmtFilModel) {
			var tag = new StringBuffer();
			if (index == 0) tag.append("<br/>"); 
			tag.append("<p id='bbs_file_"+cmntBbsAtmtFilModel.snm+"'>");
            tag.append("<a href=\"javascript:fDownloadBbsAtmtFil('"+cmntBbsAtmtFilModel.bbs_id+"','"+cmntBbsAtmtFilModel.snm+"')\">"+cmntBbsAtmtFilModel.atmt_fil_lgc_fil_nm+"</a> ["+g_fFormatSizeUnits(cmntBbsAtmtFilModel.fil_siz)+"]");
            tag.append("<a href='javascript:fDeleteBbsFile(\""+cmntBbsAtmtFilModel.snm+"\");'>");
            tag.append("<img src='/images/admin/comm/btn_delete.png' width='15' height='15' /></a></p>");
            
			$("#bbs_files").append(tag.toString());
		});
		
	}
	gfModalPopTop('#layer1');
}

/** 신규글쓰기 */
function fWriteForm(){
	$('#hir_bbs_id').val('');
	fInitForm();
}

/** 답글쓰기
 *  id: bbs_id, titl: titl, lvl: lvl, gbn: sae_obj_gbn_cod, ofcId : ofc_id
 */
function fWriteReply(id,titl,lvl,gbn,ofcId){
	$('#hir_bbs_id').val(id);
	$('#lvl').val(lvl);
	$('#titl').val(" [RE:] "+titl);
	$('#sae_obj_gbn_cod').val(gbn);
	//답글달시 공유구분을 원본글쓴이로 기본세팅
	if(gbn == 'E'){
		$('#sae_obj_gbn_id').show();
		$('#sae_obj_gbn_id').val(ofcId);
		//내가 쓴글에 답글을 달씨 공유구분을 전체로 세팅
		if(ofcId == '${sessionScope.ofcId}'){ 
			$('#sae_obj_gbn_cod').val('O');
			$('#sae_obj_gbn_id').hide();
			$('#sae_obj_gbn_id').val("");
		}
	}else{
		$('#sae_obj_gbn_id').hide();
		$('#sae_obj_gbn_id').val("");
	}
	fInitForm();
}

/** 저장 validation */
function fValidate() {

	var chk = checkNotEmpty(
			[
					[ "titl", "제목을 입력해 주세요." ]
			]
	);
	if (!chk) {
		return;
	}
	
	if($('#bbs_dtt_Y').prop("checked")){
		var chk2 = checkNotEmpty(
			[
				[ "bbs_sat_dtt", "시작날짜를 입력해 주세요." ]
				, [ "bbs_end_dtt", "종료날짜를 입력해 주세요." ]
			]
		);
		if (!chk2) {
			return;
		} 
	}
	
	if($('#pop_poa_Y').prop("checked")){
		var chk3 = checkNotEmpty(
			[
				[ "pop_sat_dtt", "시작날짜를 입력해 주세요." ]
				, [ "pop_end_dtt", "종료날짜를 입력해 주세요." ]
			]
		);
		if (!chk3) {
			return;
		} 
	}
	return true;
}

/** 저장 */
function fSaveInfo() {
	// vaildation 체크
	if ( ! fValidate() ) {
		return false;
	}
	
	//시스템 ID 유무로 신규/수정 판단하기
	if($("#action").val() == 'I'){
		if(confirm('저장 하시겠습니까?') == false){
			return;
		}
	}else if($("#action").val() == 'U'){
		if(confirm('변경 내용을 수정 하시겠습니까?') == false){
			return;
		}
	}
	fSaveData();
}

/** 데이터 저장 */
function fSaveData() {
	//summernote 의 내용을 textarea에 담는다.
	var cntsCode = $('#summernote').summernote('code');
	// file form 값 생성
	var frm = document.getElementById("myForm");
	frm.enctype = 'multipart/form-data';
	var fileData = new FormData(frm);
	
	$.each(m_Map.map, function(idx){
		var file = m_Map.get(idx);
		if (file != null && file != "" && file != undefined) {
			// 이미지 드래그 엔 드롭 기능 비활성 20171214
			//fileData.append(idx, file); //file 데이터를 저장
			//var orgImgUrl = window.URL.createObjectURL(file);
			//var imgUrl = '/cmnt/selectCmntBbsPoto.do?bbs_id=1&snm='+idx;
			//cntsCode = cntsCode.replace(orgImgUrl,imgUrl);
		}
	});
	fileData.append("cnts", cntsCode); //치환된 컨텐츠를 form 에 append
	
	fileData.append("empty", "empty");
	var resultCallback = function(data) {
		fSaveDataResult(data);
	};

	callAjaxFileUploadSetFormData("/cmnt/saveCmntBbs.do", "post", "json", true, fileData, resultCallback);
}

/** 데이터 저장 콜백 함수 */
function fSaveDataResult(data) {
	if (data.result == "SUCCESS") {
		// 응답 메시지 출력
		alert(data.resultMsg);
		$("#bbs_files_1").val("");	// 첨부파일
		$("#bbs_file_snm").val("");	// 첨부파일 일련번호
		// 목록 조회
		fShowList();
		gfCloseModal();
	} else {
		// 오류 응답 메시지 출력
		alert(data.resultMsg);
	}
}


/** 게시글 삭제 */
function fDeleteData(id) {
	id = id || $('#bbs_id').val();
	var param = { bbs_id : id};
	
	if(confirm('정말 삭제 하시겠습니까?') == false){
		return;
	}
	
	var resultCallback = function(data) {
		fDeleteDataResult(data);
	};
	
	callAjax("/cmnt/deleteCmntBbs.do", "post", "json", true, param, resultCallback);
}


/** 게시글 삭제 콜백 함수 */
function fDeleteDataResult(data) {
	var currentPage = $("#currentPageTarget").val();
	if (data.result == "SUCCESS") {
		// 응답 메시지 출력
		alert(data.resultMsg);
		// 목록 조회
		fShowList();
		//팝업 닫음
		gfCloseModal();
	} else {
		alert(data.resultMsg);
	}	
}

/** 덧글창 활성화*/
function fWriteComment(){
	if($('div[name="insertCmt"]').css("display") == "none"){
		$('div[name="insertCmt"]').css("display","block");
	}else{
		$('div[name="insertCmt"]').css("display","none");
	}
}

/** 댓글 리스트 조회 */
function fListCmtData(bbs_id) {
	var param = {
			bbs_id : bbs_id
	}
	var resultCallback = function(data) {
		fListCmtDataResult(data);
	};
	callAjax("/cmnt/cmntCmtList.do", "post", "json", true, param, resultCallback);
}


/** 댓글 조회 콜백 함수 */
function fListCmtDataResult(data) {
	var list = data.listModel;
	var str = "";
	if (list.length > 0) {
		$.each(list, function(idx){
			str += "<tr>";
			str += "	<td>"+list[idx].usr_nm+"</td>";
			str += "	<td>";
			str += "		<div class=\"bbsCnts2\">"+list[idx].cmt_cnt+"</div>";
			str += "	</td>";
			str += "	<td>"+list[idx].fst_rgst_dtt+"</td>";
			if('${sessionScope.ofcDvsCod}' == 'M' || '${sessionScope.usrSstId}' == list[idx].usr_sst_id){
				str += "	<td><a class=\"btnType3\" href=\"javascript:fDeleteCmtData('"+list[idx].cmt_id+"','"+list[idx].bbs_id+"');\" style=\"color: #fff\"><span>삭제</span></a></td>";
			}else{
				str += "	<td>-</td>";
			}
			str += "</tr>";
		});
		// 기존 목록 삭제
		$('#'+list[0].bbs_id+'_cmtList').empty();
		// 목록 생성
		$('#'+list[0].bbs_id+'_cmtList').append(str);
	}
}

/** 댓글 저장 */
function fSaveCmtData(bbs_id) {
	var param = {
		bbs_id : bbs_id
		, cmt_cnt : $('#'+bbs_id+'_cmt').val()
	};
	
	var resultCallback = function(data) {
		fSaveCmtDataResult(data,bbs_id);
	};

	callAjax("/cmnt/insertCmntCmt.do", "post", "json", true, param, resultCallback);
}

/** 댓글 저장 콜백 함수 */
function fSaveCmtDataResult(data,bbs_id) {
	if (data.result == "SUCCESS") {
		// 응답 메시지 출력
		alert(data.resultMsg);
		$('#'+bbs_id+'_cmt').val('');
		// 댓글목록 조회
		fListCmtData(bbs_id);
	} else {
		// 오류 응답 메시지 출력
		alert(data.resultMsg);
	}
}

/** 댓글 삭제 */
function fDeleteCmtData(cmt_id,bbs_id) {
	var param = { cmt_id : cmt_id};
	
	if(confirm('정말 삭제 하시겠습니까?') == false){
		return;
	}
	var resultCallback = function(data) {
		fDeleteCmtDataResult(data,bbs_id);
	};
	
	callAjax("/cmnt/deleteCmntCmt.do", "post", "json", true, param, resultCallback);
}

/** 댓글 삭제 콜백 함수 */
function fDeleteCmtDataResult(data,bbs_id) {
	if (data.result == "SUCCESS") {
		// 응답 메시지 출력
		alert(data.resultMsg);
		// 목록 조회
		fListCmtData(bbs_id);
	} else {
		alert(data.resultMsg);
	}	
}

/** 검색 버튼 클릭*/
function doSearch(){
	if($('#searchInput').val() == ""){
		alert("검색어를 입력해 주세요");
		return;
	}
	fShowList();
}

/** 게시글 첨부파일 다운로드 */
function fDownloadBbsAtmtFil(bbs_id, snm) {
	
	var params = "";
	params += "<input type='hidden' name='bbs_id' value='"+ bbs_id +"' />";
	params += "<input type='hidden' name='snm' value='"+ snm +"' />";
	
	jQuery("<form action='/cmnt/downloadBbsAtmtFil.do' method='post'>"+params+"</form>").appendTo('body').submit().remove();
}

/** 게시글 파일 삭제 */
function fDeleteBbsFile(snm) {
	
	var bbs_file_snm = $("#bbs_file_snm").val();
	if (bbs_file_snm != "") bbs_file_snm += ",";
	bbs_file_snm += snm;
	
	$("#bbs_file_snm").val(bbs_file_snm);	// 첨부파일 일련번호
	$("#bbs_file_"+snm).empty();				// 첨부파일 화면 삭제
}


</script>
</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageTarget" value="1">
	<input type="hidden" name="action" id="action" value="">
	<input type="hidden" name="cmnt_id" id="cmnt_id" value="">
	<input type="hidden" name="bbs_id" id="bbs_id" value="">
	<input type="hidden" name="vews" id="vews" value="">
	<input type="hidden" name="hir_bbs_id" id="hir_bbs_id" value="">
	<input type="hidden" name="lvl" id="lvl" value="">
	<input type="hidden" name="bbs_file_snm" id="bbs_file_snm">
	<input type="hidden" name="mode" id="mode" value="">
	<c:set var="ofcDvsCod" value="<%=session.getAttribute(\"ofcDvsCod\").toString()%>" />
<!-- 모달 배경 -->
<div id="mask"></div>

<div id="wrap_area">
	<h2 class="hidden">header 영역</h2>
	<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

	<h2 class="hidden">컨텐츠 영역</h2>
	<div id="container">
    	<ul>
    		<li class="lnb">
				<!-- lnb 영역 --> <jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
			</li>
    		<li class="contents">
				<!-- contents -->
				<h3 class="hidden">contents 영역</h3>
		        <!-- content -->
		        <div class="content">

		            <p class="Location">
		            	<a href="#" class="btn_set home">메인으로</a>
						<a href="#" class="btn_nav">커뮤니티</a>
		            	<span class="btn_nav bold">${listCmntModel.cmnt_nm}</span>
		            	
		            	<a href="#" class="btn_set refresh">새로고침</a>
		            </p>
					<p class="conTitle"><span>${listCmntModel.cmnt_nm}</span></p>
					
					<div class="table_head_area">
					
						<!-- 검색 -->
						<section>
							<div class="listSearch">
								<div class="btn_areaIn">
								
									<form:select path="listSrchOpt" name="listSrchOpt" id="listSrchOpt">
										<form:options items="${listSrchOpt}" itemLabel="dtl_cod_nm"
											itemValue="dtl_cod" />
									</form:select>
									<label class="hidden" for="">검색</label>
									<input type="text" class="inputTxt w150" id="searchInput" name="searchInput" value="" placeholder="검색어 입력"/>
									<a class="searchBtn" href="#" onclick="doSearch();">조회</a>
									<c:if test="${null ne listCmntModel}">
										<c:if test="${listCmntModel.use_poa eq 'Y' && listCmntModel.dlt_poa eq 'N' }">
											<c:if test="${ofcDvsCod eq 'M' || listCmntModel.atrt_dvs_cod eq 'W'}">
												<a href="#" class="btnType blue" onclick="javascript:fWriteForm();"><span>게시글등록</span></a>
											</c:if>
										</c:if>
									</c:if>
								</div>
								
							</div>
						</section>
						<!--// 검색 -->
						
						<p class="list">
							<label for="">Show</label>
							<form:select path="listLstNum" name="pageSize" id="pageSize">
								<form:options items="${listLstNum}" itemLabel="dtl_cod_nm"
									itemValue="dtl_cod" />
							</form:select>
							entries
						</p>
					</div>
					
					<table class="col hover"><!-- table = hover : 오버시 라인색 추가 -->
					<caption>caption</caption>
					<colgroup>
						<col width="7%">
						<col width="*">
						<col width="17%">
						<col width="12%">
						<col width="10%">
					</colgroup>

						<thead>
							<tr>
								<th scope="col">번호</th>
								<th scope="col">제목</th>
								<th scope="col">작성자</th>
								<th scope="col">등록일</th>
								<th scope="col">조회수</th>
							</tr>
						</thead>
						<tbody id="showList">
							<tr>
								<td colspan="5">데이터를 조회할 수 없습니다.</td>
							</tr>
						</tbody>
					</table>
					
					<div class="paging_area"  id="pagination"> </div>
		        </div>
		        <!--// content --> 
		        
		        <h3 class="hidden">풋터 영역</h3>
		        <jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
		        <!--// contents -->
    		</li>
    	</ul>
    </div>
</div>

<!-- 모달팝업 -->
<div id="layer1" class="layerPop layerType1">
	<!-- s : 모달 적용시 여기부터 -->
	<div id="wrap_pop">

		<h1 class="hidden">오클라인</h1>

		<!-- content -->
		<div class="content">
			<p class="conTitle">
				<span>게시글 작성</span>
			</p>
			<div class="scroll" style="max-height: 690px;">
				<div class="dashboard mt10">
					<ul>
						<li style="width: 100%">
							<div class="col">
								<table class="row mt10">
									<caption>caption</caption>

									<colgroup>
										<col width="150px">
										<col width="*">
									</colgroup>

									<tbody>
										<tr>
											<th scope="row">제목 <span class="font_red">*</span></th>
											<td colspan="3">
												<input type="text" class="inputTxt p100" name="titl" id="titl" />
											</td>
										</tr>
										<tr>
											<th scope="row">작성자 <span class="font_red">*</span></th>
											<td colspan="3">
												<input type="text" class="inputTxt p100" name="wtr_nm" id="wtr_nm" />
											</td>
										</tr>
										<tr>
											<th scope="row">내용</th>
											<td colspan="3">
<!-- 											<textarea class="form-control" name="cnts" rows="3" style="display: none;"></textarea> -->
												<div id="summernote"></div>
											</td>
										</tr>
										<tr>
											<th scope="row">첨부파일</th>
											<td colspan="3">
												<input type="file" class="inputTxt p100" name="bbs_files_1" id="bbs_files_1" />
												<div id="bbs_files"></div>
											</td>
										</tr>
										<c:if test="${ofcDvsCod eq 'M'}">
											<tr>
												<th scope="row">게시기간설정 여부</th>
												<td>
													<input type="radio" name="bbs_dtt" id="bbs_dtt_Y" value='Y' /> <label for="radio1-1">사용</label>
													&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="bbs_dtt" id="bbs_dtt_N" value="N" /> <label for="radio1-2">미사용</label>
												</td>
											</tr>
											<tr id="bbsDdt">
												<th scope="row">게시기간 <span class="font_red">*</span></th>
												<td>
													<input type="text" class="inputTxt w150" name="bbs_sat_dtt" id="bbs_sat_dtt" /><a class="btn_icon btn_calendar" id="bbsSatDdt" href="#">게시시작 기간</a>&nbsp;~&nbsp;
													<input type="text" class="inputTxt w150" name="bbs_end_dtt" id="bbs_end_dtt" /><a class="btn_icon btn_calendar" id="bbsEndDdt" href="#">게시종료 기간</a>
												</td>
											</tr>
										</c:if>
										<c:if test="${listCmntModel.cmnt_dvs_cod eq 'I'}">
											<tr>
												<th scope="row">팝업설정 여부</th>
												<td>
													<input type="radio" name="pop_poa" id="pop_poa_Y" value='Y' /> <label for="radio2-1">사용</label>
													&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="radio" name="pop_poa" id="pop_poa_N" value="N" /> <label for="radio2-2">미사용</label>
												</td>
											</tr>
											<tr id="popDdt">
												<th scope="row">팝업기간 <span class="font_red">*</span></th>
												<td>
													<input type="text" class="inputTxt w150" name="pop_sat_dtt" id="pop_sat_dtt" /><a class="btn_icon btn_calendar" id="popSatDdt" href="#">팝업시작 기간</a>&nbsp;~&nbsp; 
													<input type="text" class="inputTxt w150" name="pop_end_dtt" id="pop_end_dtt" /><a class="btn_icon btn_calendar" id="popEndDdt" href="#">팝업종료 기간</a>
												</td>
											</tr>
										</c:if>
										<c:if test="${ofcDvsCod ne 'H'}">
											<tr>
												<th scope="row">공유 대상 <span class="font_red">*</span></th>
												<td colspan="3">
													<label class="hidden" for="">공유 대상</label>
													<form:select path="listSaeObjGbn" name="sae_obj_gbn_cod" id="sae_obj_gbn_cod">
														<form:options items="${listSaeObjGbn}" itemLabel="dtl_cod_nm"
															itemValue="dtl_cod" />
													</form:select>
													&nbsp;&nbsp;&nbsp;&nbsp;
													<label class="hidden" for="">오피스 선택</label>
													<select style="display:none;" name="sae_obj_gbn_id" id="sae_obj_gbn_id">
														<option selected="selected" value="">-- 오피스 선택 --</option>
														<c:forEach items="${listAgncModel}" var="listAgnc">
															<option value="${listAgnc.ofc_id}">${listAgnc.ofc_nm}</option>
														</c:forEach>
													</select>
												</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="btn_areaC mt30">
				<a href="javascript:fSaveInfo();" class="btnType blue" id="btnSave"><span>저장</span></a>
				<a href="javascript:fDeleteData();" class="btnType blue" id="btnDelete"><span>삭제</span></a>
				<a href="javascript:gfCloseModal();" class="btnType gray"><span>취소</span></a>
			</div>
		</div>
		<!--// content -->

	</div>
	<a href="" class="closePop"><span class="hidden">닫기</span></a>
</div>
<!--// 모달팝업 -->

</form>
</body>
</html>