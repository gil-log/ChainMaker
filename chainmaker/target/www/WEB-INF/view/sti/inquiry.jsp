<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>JobKorea</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

	// 1:1문의 페이징 설정
	var pageSizeinquiry = 10;
	var pageBlockSizeinquiry = 5;
	
	
	/** OnLoad event */ 
	$(function() {
	
		// 1:1문의 조회
		fListInquiry();
		
		// 버튼 이벤트 등록
		fRegisterButtonClickEvent();
	});
	

	/** 버튼 이벤트 등록 */
	function fRegisterButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault();

			var btnId = $(this).attr('id');
           
			switch (btnId) {
				case 'btnSaveInquiry' :
					fSaveInquiryAns();
					break;
				case 'btnDeleteInqAns' :
					fDeleteInqAns();
					break;
				case 'btnSaveDtlCod' :
					fSaveDtlCod();
					break;
				case 'btnDeleteDtlCod' :
					fDeleteDtlCod();
					break;
				case 'btnCloseGrpCod' :
				case 'btnCloseDtlCod' :
					gfCloseModal();
					break;
			}
		});
	}
	
	
	/** 1:1문의 조회 */
	function fListInquiry(currentPage) {
		
		currentPage = currentPage || 1;
		
		console.log("currentPage : " + currentPage);
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageSizeinquiry
		}
		
		var resultCallback = function(data) {
			fListInquiryResult(data, currentPage);
		};
		
		//Ajax실행 방식
		//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
		//html로 받을거라 text
		callAjax("/sti/listinquiry.do", "post", "text", true, param, resultCallback);
	}
	
	
	/** 1:1문의 조회 콜백 함수 */
	function fListInquiryResult(data, currentPage) {
				//alert(data);
		console.log(data);		
		
		// 기존 목록 삭제
		$('#listInquiry').empty();
		$("#listInquiry").append(data);
		
		// 총 개수 추출
		var totalCntlistInquiry = $("#totalCntlistInquiry").val();
			
	
		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntlistInquiry, pageSizeinquiry, pageBlockSizeinquiry, 'fListInquiry');
		console.log("paginationHtml : " + paginationHtml);

		$("#listInquiryPagination").empty().append( paginationHtml );

	}
	
	
	/** 1:1문의 모달 실행 */
	function fPopModalInquiry(inq_no) {

		 $("#selectedInqNo").val(inq_no);
		 
		console.log(typeof(inq_no));
		var url = "/sti/inquiryByInqNo.do";
		var param = {
				inq_no : inq_no
		};
		
		var callback = function(data){
			console.log(data);
			$("#inq_cod_nm").val(data.inqNoData.name);
			$("#inq_cod_day").val(data.inqNoData.inq_regdate);
			$("#inq_title").val(data.inqNoData.inq_title);
			$("#inq_content").val(data.inqNoData.inq_content);
			$("#ans_title").val(data.inqNoData.ans_title);
			$("#ans_content").val(data.inqNoData.ans_content);
			
		}
		
		callAjax(url, "get", "json", true, param, callback);
		
		gfModalPop("#inquiryModal");		
		
	}
	
	/* function fInitFormGrpCod(object) {
		$("#grp_cod").focus();
		if( object == "" || object == null || object == undefined) {
			
			$("#grp_cod").val("");
			$("#grp_cod_nm").val("");
			$("#grp_cod_eplti").val("");
			$("#grp_tmp_fld_01").val("");
			$("#grp_tmp_fld_02").val("");
			$("#grp_tmp_fld_03").val("");
			$("input:radio[name=grp_use_poa]:input[value='Y']").attr("checked", true);
			$("#grp_cod").attr("readonly", false);
			$("#grp_cod").css("background", "#FFFFFF");
			$("#grp_cod").focus();
			$("#btnDeleteGrpCod").hide(); 
			
		} else {
			
			$("#grp_cod").val(object.grp_cod);
			$("#grp_cod_nm").val(object.grp_cod_nm);
			$("#grp_cod_eplti").val(object.grp_cod_eplti);
			$("#grp_tmp_fld_01").val(object.tmp_fld_01);
			$("#grp_tmp_fld_02").val(object.tmp_fld_02);
			$("#grp_tmp_fld_03").val(object.tmp_fld_03);
			$("input:radio[name=grp_use_poa]:input[value="+object.use_poa+"]").attr("checked", true);
			$("#grp_cod").attr("readonly", true);
			$("#grp_cod").css("background", "#F5F5F5");
			$("#grp_cod_nm").focus();
			$("#btnDeleteGrpCod").show();
		}
	} */
	

	
	/** 1:1문의 저장 validation */
	/* function fValidateGrpCod() {

		var chk = checkNotEmpty(
				[
						[ "grp_cod", "작성자를 입력해 주세요." ]
					,	[ "grp_cod_nm", "작성일을 입력해 주세요" ]
					,	[ "grp_cod_eplti", "제목을 입력해 주세요." ]
				]
		);

		if (!chk) {
			return;
		}

		return true;
	}
	 */

	
	/** 1:1문의 단건 조회 */
	function fSelectGrpCod(grp_cod) {
		
		var param = { grp_cod : grp_cod };
		
		var resultCallback = function(data) {
			fSelectGrpCodResult(data);
		};
		
		callAjax("/sti/selectComnGrpCod.do", "post", "json", true, param, resultCallback);
	}
	
	
	/** 1:1문의 단건 조회 콜백 함수*/
	function fSelectGrpCodResult(data) {

		if (data.result == "SUCCESS") {

			// 모달 팝업
			gfModalPop("#layer1");
			
			// 1:1문의 폼 데이터 설정
			fInitFormGrpCod(data.comnGrpCodModel);
			
		} else {
			alert(data.resultMsg);
		}	
	}
	
	
	/** 코드 저장 */
	/* function fSaveGrpCod() {

		// vaildation 체크
		if ( ! fValidateGrpCod() ) {
			return;
		}
		
		var resultCallback = function(data) {
			fSaveGrpCodResult(data);
		};
		
		callAjax("/system/saveComnGrpCod.do", "post", "json", true, $("#myForm").serialize(), resultCallback);
	}
	 */
	
	//1:1답변 저장
	function fSaveInquiryAns(){
		
		var select_inq_no = $("#selectedInqNo").val();
		var ans_title = $("#ans_title").val();
		var ans_content = $("#ans_content").val();
		
		var param = {
				ans_title : ans_title,
				ans_content : ans_content,
				inq_no : select_inq_no
		};
		
		var resultCallback = function(data) {
			fSaveAnsByInquiry(data);
		};
		
		callAjax("/sti/inquiryInAns.do", "post", "json", true, param, resultCallback)
		
	}
	
	/** 1:1문의 저장 콜백 함수 */
	function fSaveAnsByInquiry(data) {
		
		// 목록 조회 페이지 번호
		var currentPage = "1";
		if ($("#action").val() != "I") {
			currentPage = $("#currentPageComnGrpCod").val();
		}
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			alert(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 목록 조회
			fListInquiry(currentPage);
			
		} else {
			// 오류 응답 메시지 출력
			alert(data.resultMsg);
		}
		
		// 입력폼 초기화
		$("#ans_title").val("");
		$("#ans_content").val("");
	}

	
	/** 1:1문의 삭제 */
	function fDeleteInqAns() {
		
		var inq_no = $("#selectedInqNo").val();
		
		console.log(inq_no);
		
		var param = {inq_no : inq_no};
		var resultCallback = function(data) {
			fDeleteInqAnsResult(data);
		};
		
		callAjax("/sti/deleteInqAns.do", "post", "json", true, param, resultCallback);
	}
	
	
	/** 1:1문의 삭제 콜백 함수 */
	function fDeleteInqAnsResult(data) {
		
		var currentPage = $("#currentPageComnGrpCod").val();
		
		if (data.result == "SUCCESS") {
			
			// 응답 메시지 출력
			alert(data.resultMsg);
			
			// 모달 닫기
			gfCloseModal();
			
			// 목록 조회
			fListInquiry(currentPage);
			
			
		} else {
			alert(data.resultMsg);
		}	
	}
	
	
	
</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageComnGrpCod" value="1">
	<input type="hidden" id="currentPageComnDtlCod" value="1">
	<input type="hidden" id="tmpGrpCod" value="">
	<input type="hidden" id="tmpGrpCodNm" value="">
	<input type="hidden" name="action" id="action" value="">
	<input type="hidden" id="selectedInqNo" value="">
	
	
	<!-- 모달 배경 -->
	<div id="mask"></div>

	<div id="wrap_area">

		<h2 class="hidden">header 영역</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> <jsp:include
						page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">

						<p class="Location">
							<a href="#" class="btn_set home">메인으로</a> <a href="#"
								class="btn_nav">기준 정보</a> <span class="btn_nav bold">1:1문의
								</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="search"></p>
						<p class="conTitle">
							<span>1:1문의 답변</span> 
							<!-- <span class="fr">
			                  <select id="searchKey" name="searchKey" style="width: 80px;" v-model="searchKey">
			                    <option value="all" id="option1" selected>전체</option>
			                    <option value="ware_name" id="option1">제목</option>
			                    <option value="ware_address" id="option2">내용</option>
			                  </select> <input type="text" id="searchWord" name="searchWord" v-model="searchWord" placeholder="" style="height: 28px;  width: 600px;"> <a class="btnType blue" href="javascript:whInfoFormList()" onkeydown="enterKey()" name="search"><span id="searchEnter">검 색</span></a>
			                </span> -->

						
						</p>
						
						<div class="divComGrpCodList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="5%">
									<col width="45%">
									<col width="20%">
									<col width="15%">
									<col width="15%">
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">작성일</th>
										<th scope="col">작성자</th>
										<th scope="col">답변</th>
									</tr>
								</thead>
								<tbody id="listInquiry">
								</tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="listInquiryPagination"> </div>
	
					</div> <!--// content -->

					</li>
			</ul>
		</div>
	</div>

	<!-- 모달팝업 -->
	<div id="inquiryModal" class="layerPop layerType2" style="width: 900px;">
		<dl>
			<dt>
				<strong>1:1문의</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>
					<colgroup>
						<col width="120px">
						<col width="*">
						<col width="120px">
						<col width="*">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">작성자 </th>
							<td><input type="text" class="inputTxt p100" name="grp_cod" id="inq_cod_nm" readonly/></td>
							<th scope="row">작성일 </th>
							<td><input type="text" class="inputTxt p100" name="grp_cod_nm" id="inq_cod_day" readonly /></td>
						</tr>
						<tr>
							<th scope="row">제목 </th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name="grp_cod_eplti" id="inq_title" maxlength="100"readonly/></td>
						</tr>
						
						<tr>
							<th scope="row"></th>
							<td colspan="3" ><textarea class="inputTxt p100"
							style="height: 200px; word-break : break-all;"
								name="grp_cod_eplti" id="inq_content"readonly></textarea></td>
						</tr>

						<tr>
							<th scope="row">답변제목 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name="ans_title" id="ans_title" maxlength="100"/></td>
						</tr>
						
						<tr>
							<th scope="row">답변내용 <span class="font_red">*</span></th>
							<td colspan="3" ><textarea class="inputTxt p100"
							style="height: 200px; word-break : break-all;"
								name="ans_content" id="ans_content"></textarea></td>
						</tr>
						</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
				    <a href="" class="btnType blue" id="btnSaveInquiry" name="btn"><span>저장</span></a> 
					<a href="" class="btnType blue" id="btnDeleteInqAns" name="btn"><span>삭제</span></a> 
					<a href="" class="btnType gray" id="btnCloseGrpCod" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

</form>
</body>
</html>