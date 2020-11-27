<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<title>자유게시판</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- include libraries(jQuery, bootstrap) -->

<!-- <link
	href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-lite.js"></script> -->

<script type="text/javascript">
	// 페이징 설정 
	var noticePageSize = 10; // 화면에 뿌릴 데이터 수 
	var noticePageBlock = 5; // 블럭으로 잡히는 페이징처리 수

	/* onload 이벤트  */
	$(function() {
		// 자유게시판 리스트 뿌리기 함수 
		selectNoticeList();

		// 버튼 이벤트 등록 (저장, 수정, 삭제, 모달창 닫기)
		fButtonClickEvent();
	});
	
	// 날짜 변한 함수  
 	function getFormatDate(date){
	    var year = date.getFullYear();              //yyyy
	    var month = (1 + date.getMonth());          //M
	    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
	    var day = date.getDate();                   //d
	    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
	    return  year + '-' + month + '-' + day;       //'-' 추가하여 yyyy-mm-dd 형태 생성 가능
	} 
	
	// 검색날짜 기본값 설정 from_date = 3달전 , to_date = 오늘날짜
 	$(document).ready(function() { 		
 	  document.getElementById('to_date').value = new Date().toISOString().substring(0, 10);
	  var from_date = new Date;
	  from_date.setMonth(from_date.getMonth()-3);
	  document.getElementById('from_date').value = from_date.toISOString().substring(0, 10);
	  //searchBtn.click();

 	})
 	

 /*	   	function enterkey() {
        if (window.event.keyCode == 13) {
 
             // 엔터키가 눌렸을 때 실행할 내용
        	board_search();
        }*/


 	
	/* 버튼 이벤트 등록 - 저장, 수정, 삭제  */
	function fButtonClickEvent() {
		$('a[name=btn]').click(function(e) {
			e.preventDefault(); // ?? 

			var btnId = $(this).attr('id');

			//alert("btnId : " + btnId);

			switch (btnId) {
			case 'btnSaveNotice':
				fSaveNotice(); // save 안에 저장,수정
				//alert("저장버튼 클릭!!!이벤트!!");
				break;
			case 'btnDeleteNotice':
				fDeleteNotice(); // 만들자 
				//alert("삭제버튼 클릭!!!이벤트!!");		
				break;
			case 'btnClose':
				gfCloseModal(); // 모달닫기 
				selectNoticeList(); // 첫페이지 다시 로딩 
				break;
			case 'btnUpdateNotice':
				fUpdateNotice(); // 수정하기
				break;
			case 'searchBtn':
				board_search(); // 검색하기
				break;

			//case 'commentWrite' : fCommentInsert();   // 댓글--> 답변글로 변경 // 저장 
			//break;
			}
		});
	}

	/* 공지사항 리스트 불러오기  */
	function selectNoticeList(currentPage) {

		currentPage = currentPage || 1; // or		

		//alert("지금 현재 페이지를 찍어봅시다. " + currentPage);

		var param = {
			currentPage : currentPage,
			pageSize : noticePageSize
		}

		var resultCallback = function(data) { // 데이터를 이 함수로 넘깁시다. 
			noticeListResult(data, currentPage);
		}

		callAjax("/scm/noticeList.do", "post", "text", true, param,
				resultCallback);

	}

	/* callAjax 공통 common.js 에서 퍼옴  -> 이렇게 생긴 함수입니다.  
	
	function fOnloadImg(param){
		var resultCallback = function(data) {
			fOnloadImgResult(data);
		};
		callAjax("/image/selectImgSize.do", "post", "json", false, param, resultCallback);
	 } */

	/* 공지사항 리스트 data를 콜백함수를 통해 뿌려봅시당   */
	function noticeListResult(data, currentPage) {

		// 일단 기존 목록을 삭제합니다. (변경시 재부팅 용)
		$("#noticeList").empty();
		//alert("데이터!!! " + data);
		//console.log("data !!!! " +  data);

		//var $data = $( $(data).html() ); // data의 .html()통해서 html구문을 끌어온다.
		//alert("데이터 찍어보자!!!! " +  $data); // object

		$("#noticeList").append(data);

		// 리스트의 총 개수를 추출합니다. 
		//var totalCnt = $data.find("#totalCnt").text();
		var totalCnt = $("#totalCnt").val(); // qnaRealList() 에서보낸값 
		//alert("totalCnt 찍어봄!! " + totalCnt);

		// * 페이지 네비게이션 생성 (만들어져있는 함수를 사용한다 -common.js)
		// function getPaginationHtml(currentPage, totalCount, pageRow, blockPage, pageFunc, exParams)
		// 파라미터를 참조합시다. 
		var list = $("#tmpList").val();
		//var listnum = $("#tmpListNum").val();
		var pagingnavi = getPaginationHtml(currentPage, totalCnt,
				noticePageSize, noticePageBlock, 'selectNoticeList', [ list ]);

		console.log("pagingnavi : " + pagingnavi);
		// 비운다음에 다시 append 
		$("#pagingnavi").empty().append(pagingnavi); // 위에꺼를 첨부합니다. 

		// 현재 페이지 설정 
		$("#currentPage").val(currentPage);

	}

	//검색  
	function board_search(currentPage) {

		currentPage = currentPage || 1;

		var sname = $('#sname');
		var searchKey = document.getElementById("searchKey");
		var oname = searchKey.options[searchKey.selectedIndex].value;
		
		var from_date = $('#from_date');
		var to_date = $('#to_date');
		
	
		var param = {
			sname : sname.val(),
			oname : oname,
			from_date : from_date.val(),
			to_date : to_date.val(),
			currentPage : currentPage,
			pageSize : noticePageSize
		}

		var resultCallback = function(data) {
			noticeListResult(data, currentPage);
		};

		callAjax("/scm/noticeList.do", "post", "text", true, param,
				resultCallback);
	}

	/* 공지사항 모달창(팝업) 실행  */
	function fNoticeModal(notice_no) {

		// 신규저장 하기 버튼 클릭시 (값이 null)
		if (notice_no == null || notice_no == "") {
			// Tranjection type 설정
			//alert("넘을 찍어보자!!!!!!" + notice_no);

			$("#action").val("I"); // insert 
			/* $("#notice_no").val(""); */
			frealPopModal(notice_no); // 공지사항 초기화 
			
			//모달 팝업 모양 오픈! (빈거) _ 있는 함수 쓰는거임. 
			
			gfModalPop("#notice");
			
			var d= new Date();
			d = getFormatDate(d);
			$("#notice_moddate").val(d);
			$("#notice_moddate").attr("readonly", true);
 
		} else {
			// Tranjection type 설정
			$("#action").val("U"); // update
			fdetailModal(notice_no); //번호로 -> 공지사항 상세 조회 팝업 띄우기
		}

	}

	/*공지사항 상세 조회*/
	function fdetailModal(notice_no) {
		//alert("공지사항 상세 조회  ");

		var param = {
			notice_no : notice_no
		};
		var resultCallback2 = function(data) {
			fdetailResult(data);
		};

		callAjax("/scm/detailNoticeList.do", "post", "json", true, param,
				resultCallback2);
		//alert("공지사항 상세 조회  22");
	}

	/*  공지사항 상세 조회 -> 콜백함수   */
	function fdetailResult(data) {

		//alert("공지사항 상세 조회  33");
		if (data.resultMsg == "SUCCESS") {
			//모달 띄우기 
			gfModalPop("#notice");

			// 모달에 정보 넣기 
			frealPopModal(data.result);

		} else {
			alert(data.resultMsg);
		}
	}

	/* 팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기  */
	function frealPopModal(object) {

		if (object == "" || object == null || object == undefined) {
			var writer = $("#swriter").val();
			//var Now = new Date();

			$("#loginID").val(writer);
			$("#loginID").attr("readonly", true);

			$("#write_date").val();
			

			$("#notice_title").val("");
			$("#notice_content").val("");
/* 			//summernote는 따로 리셋해준다.
			$('#notice_content').summernote('reset'); */

			$("#btnDeleteNotice").hide(); // 삭제버튼 숨기기
			$("#btnUpdateNotice").hide();
			$("#btnSaveNotice").show();

		} else {

			//alert("숫자찍어보세 : " + object.wno);// 페이징 처리가 제대로 안되서 
			$("#loginID").val(object.loginID);
			$("#loginID").attr("readonly", true); // 작성자 수정불가 
	
			
			

			$("#notice_moddate").val(object.notice_moddate);
			$("#notice_moddate").attr("readonly", true); // 처음 작성된 날짜 수정불가 

			$("#notice_title").val(object.notice_title);
			$("#notice_content").val(object.notice_content);


			$("#notice_no").val(object.notice_no); // 중요한 num 값도 숨겨서 받아온다. 

			$("#btnDeleteNotice").show(); // 삭제버튼 보이기 
			$("#btnSaveNotice").hide();
			$("#btnUpdateNotice").css("display", "");
			//if문써서 로그인 아이디 == 작성자 아이디 일치시  --- 추가하기 
			//$("#grp_cod").attr("readonly", false);  // false, true(읽기만)로 수정

		}
	}

	/* 팝업내 수정, 저장 validation */
	function fValidatePopup() {
		var chk = checkNotEmpty([ [ "subject", "제목을 입력해주세요!" ],
				[ "content", "내용을 입력해주세요!" ] ]);

		if (!chk) {
			return;
		}
		return true;
	}

	/* 공지사항 등록(저장) */
	function fSaveNotice() {

		//alert("저장 함수 타는지!!!!!?? ");
		// validation 체크 
		if (!(fValidatePopup())) {
			return;
		}

		var resultCallback3 = function(data) {
			fSaveNoticeResult(data);
		};

		$("#action").val("I"); // insert
		var frm = document.getElementById("myNotice");
		frm.enctype = 'multipart/form-data';
		var dataWithFile = new FormData(frm);	
		alert(dataWithFile);
		callAjaxFileUploadSetFormData("/scm/noticeSave.do", "post", "json", true, dataWithFile, resultCallback3);

		// $("#myNotice").serialize() => 직렬화해서 name 값들을 그냥 넘김.
	}

	/* 저장 ,수정, 삭제 콜백 함수 처리  */
	function fSaveNoticeResult(data) {
		var currentPage = currentPage || 1;

		if ($("#action").val() != "I") {
			currentPage = $("#currentPage").val();
		}

		if (data.resultMsg == "SUCCESS") {
			//alert(data.resultMsg);	// 받은 메세지 출력 
			alert("저장 되었습니다.");
		} else if (data.resultMsg == "UPDATE") {
			alert("수정 되었습니다.");
		} else if (data.resultMsg == "DELETE") {
			alert("삭제 되었습니다.");
		} else {
			alert(data.resultMsg); //실패시 이거 탄다. 
			alert("실패 했습니다.");
		}

		gfCloseModal(); // 모달 닫기
		selectNoticeList(currentPage); // 목록조회 함수 다시 출력 
		frealPopModal();// 입력폼 초기화
	}

	/* 공지사항 등록(수정) */
	function fUpdateNotice() {

		//alert("수정  함수 타는지!!!!!?? ");
		// validation 체크 
		if (!(fValidatePopup())) {
			return;
		}

		var resultCallback3 = function(data) {
			fSaveNoticeResult(data);
		};

		$("#action").val("U"); // update

		callAjax("/scm/noticeSave.do", "post", "json", true, $("#myNotice")
				.serialize(), resultCallback3);
		// $("#myQna").serialize() => 직렬화해서 name 값들을 그냥 넘김.
	}

	/* 공지사항 게시판 1건 삭제 */
	function fDeleteNotice() {
		var con = confirm("정말 삭제하겠습니까? \n 삭제시 복구불가합니다.");
		if (con) {
			var resultCallback3 = function(data) {
				fSaveNoticeResult(data);
			}
			$("#action").val("D"); // delete
			callAjax("/scm/noticeSave.do", "post", "json", true, $(
					"#myNotice").serialize(), resultCallback3);
			// num만 넘겨도되지만 그냥 귀찮으니깐...^^... 
		} else {
			gfCloseModal(); // 모달 닫기
			selectNoticeList(currentPage); // 목록조회 함수 다시 출력 
			frealPopModal();// 입력폼 초기화
		}
	}

/* 	$(document).ready(function() {
		$('#notice_content').summernote({
			toolbar: [
                      ['fontsize', ['fontsize']],
			          ['style', ['bold', 'italic', 'underline']],
			          ['font', ['strikethrough']],
			          ['color', ['color']],
			          ['para', ['paragraph']],
			          ['insert', ['hr']],
			          ['table', ['table']],			          
			        ],
			minHeight : 370,
			width : 450,
			maxHeight : null,
			focus : true,
			lang : 'ko-KR',
			disableResizeEditor : true

		})
	}) */
</script>

</head>
<body>
	<!-- ///////////////////// html 페이지  ///////////////////////////// -->

	<form id="myNotice" action="" method="">
		
		<input type="hidden" id="currentPage" value="1">
		<!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
		<input type="hidden" id="tmpList" value="">
		<!-- ★ 이거뭐임??? -->
		<input type="hidden" id="tmpListNum" value="">
		<!-- 스크립트에서 값을 설정해서 넘길거임 / 임시 리스트 넘버 -->
		<input type="hidden" name="action" id="action" value=""> <input
			type="hidden" id="swriter" value="${writer}">
		<!-- 작성자 session에서 java에서 넘어온값 -->


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
								<a href="#" class="btn_set home">메인으로</a> 
								<a href="#"	class="btn_nav">시스템 관리</a> <span class="btn_nav bold">공지사항</span>
								<a href="#" class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
								<span>공지 사항 </span> <span class="fr"> <c:set
										var="nullNum" value=""></c:set> <a class="btnType blue"
									href="javascript:fNoticeModal(${nullNum});" name="modal"><span>신규등록</span></a>
								</span>
							</p>

							<!--검색창  -->
							<span class="fr"> 
							<td width="50" height="25" style="font-size: 100%">작성일</td>
									<td width="50" height="25" style="font-size: 100%"><input
										type="date" style="width: 120px" id="from_date"
										name="from_date"></td>
									<td width="50" height="25" style="font-size: 100%"><input
										type="date" style="width: 120px" id="to_date" name="to_date"></td>
									<td width="110" height="60" style="font-size: 120%">
							<select id="searchKey" name="searchKey" style="width: 80px; height: 30px;" v-model="searchKey">
									<option value="all" selected>전체</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
							</select> 
						    <!-- enter입력하면 검색실행   -->
							<input type="text" style="width: 160px; height: 30px;" id="sname" name="sname" onkeypress="if( event.keyCode == 13 ){board_search();}">  
							<a href="" class="btnType blue" id="searchBtn" name="btn" ><span>검  색</span></a>
							</span><div class="container" style="margin-top: 60px">

							<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="50px">
										<col width="200px">
										<col width="60px">
										<col width="60px">										
										<col width="50px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">공지 번호</th>
											<th scope="col">공지 제목</th>
											<th scope="col">공지 날짜</th>											
											<th scope="col">작성자</th>
											<th scope="col">조회수</th>

										</tr>
									</thead>
									<tbody id="noticeList"></tbody>
								</table>

								<!-- 페이징 처리  -->
								<div class="paging_area" id="pagingnavi">
									<div class="paging">
										<a class="first" href="javascript:selectNoticeList(1)"> <span
											class="hidden">맨앞</span></a> <a class="pre"
											href="javascript:selectNoticeList(1)"> <span
											class="hidden">이전</span></a> <strong>1</strong> <a
											href="javascript:selectNoticeList(2)">2</a> <a
											href="javascript:selectNoticeList(3)">3</a> <a
											href="javascript:selectNoticeList(4)">4</a> <a
											href="javascript:selectNoticeList(5)">5</a> <a class="next"
											href="javascript:selectNoticeList(5)"> <span
											class="hidden">다음</span></a> <a class="last"
											href="javascript:selectNoticeList(5)"> <span
											class="hidden">맨뒤</span></a>
									</div>
								</div>

							</div>


						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>


		<!-- 모달팝업 -->
		<div id="notice" class="layerPop layerType2" style="width: 600px;">
			
			<!-- 수정시 필요한 num 값을 넘김  -->

			<dl>
				<dt>
					<strong>공지사항</strong>
				</dt>
				<dd class="content">
					<!-- s : 여기에 내용입력 -->
					<table class="row">
						<caption>caption</caption>
						<input type="hidden" id="notice_no" name="notice_no" >

						<tbody>
							<tr>
								<th scope="row">제목 <span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="notice_title" id="notice_title" /></td>
							</tr>
							<tr>
								<th scope="row">작성자 </th>
								<td><input type="text" class="inputTxt p100" name="loginID"
									id="loginID"  /></td>
							</tr>
							<tr>
								<th scope="row">작성일 </th>
								<td><input type="text" class="inputTxt p100" name="notice_moddate"
									id="notice_moddate"  /></td>
							</tr>													
							<tr>
								<th scope="row">내용</th>
								<td colspan="3"><textarea class="inputTxt p100"
										name="notice_content" id="notice_content"></textarea></td>
							</tr>
							<tr>
								<th scope="row">파일</th>
								<td colspan="3"><input type="file" id="file"/></td>
							</tr>
						</tbody>
					</table>

					<!-- e : 여기에 내용입력 -->

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSaveNotice" name="btn"><span>저장</span></a>
						<a href="" class="btnType blue" id="btnUpdateNotice" name="btn"
							style="display: none"><span>수정</span></a> <a href=""
							class="btnType blue" id="btnDeleteNotice" name="btn"><span>삭제</span></a>
						<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
					</div>
				</dd>

			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>




	</form>

</body>
</html>
