<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title> 고객/문의 관리  </title>
<!-- 빌립담당 -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<c:if test="${sessionScope.userType ne 'C'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>

<script type="text/javascript">

	// 페이징 설정 
	var userPageSize = 10;    	// 화면에 뿌릴 데이터 수 
	var userPageBlock = 5;		// 블럭으로 잡히는 페이징처리 수
	
	/* onload 이벤트  */
	$(function(){
		// 모든 문의 뿌리기
		selectInquiryList();
		
		// 버튼 이벤트 등록 (저장, 수정, 삭제, 모달창 닫기)
		fButtonClickEvent();
		
	});
	
	/* 버튼 이벤트 등록 - 저장, 수정, 삭제  */
	function fButtonClickEvent(){
		$('a[name=btn]').click(function(e){
			e.preventDefault();   // ?? 
					
			var btnId = $(this).attr('id');
			
			//swal("btnId : " + btnId);
			
			switch(btnId){
				case 'btnDeleteInquiry' : fDeleteInquiry();	// 삭제 
					//swal("삭제버튼");		
					break;
				case 'btnClose' :
				case 'btnClose2': gfCloseModal();  // 모달닫기 
					break;
				case 'btnUpdateInquiry' : fUpdateInquiry();  // 수정하기
					break;
				case 'btnInsertInquiry' : fInsertInquiry();
					break;
			}
		});
	}
	
	
	/* 사용자목록 리스트 불러오기  */
	function selectInquiryList(currentPage){
		
		currentPage = currentPage || 1;   // or		
		
	//swal("지금 현재 페이지를 찍어봅시다. " + currentPage);
	
		
	
		var param = {
				currentPage : currentPage ,
				pageSize : userPageSize
		}
		
		var resultCallback = function(data){  // 데이터를 이 함수로 넘깁시다. 
			inquiryListResult(data, currentPage); 
		}
		
		
		callAjax("/epc/InquiryList.do","post","text", true, param, resultCallback);
		
	}
	

	 /* 공지사항 리스트 data를 콜백함수를 통해 뿌려봅시당   */
	 function inquiryListResult(data, currentPage){
		 
		 // 일단 기존 목록을 삭제합니다. (변경시 재부팅 용)
		 $("#inquiryList").empty();
		 //swal("데이터!!! " + data);
		 console.log("data !!!! " +  data);
		 
		 //var $data = $( $(data).html() ); // data의 .html()통해서 html구문을 끌어온다.
		 //swal("데이터 찍어보자!!!! " +  $data); // object
		 
		 $("#inquiryList").append(data);
	
		 
		 // 리스트의 총 개수를 추출합니다. 
		 //var totalCnt = $data.find("#totalCnt").text();
	     var totalCnt = $("#totalCnt").val();  // qnaRealList() 에서보낸값 
	     //swal("totalCnt 찍어봄!! " + totalCnt);
		 
		 // * 페이지 네비게이션 생성 (만들어져있는 함수를 사용한다 -common.js)
		 // function getPaginationHtml(currentPage, totalCount, pageRow, blockPage, pageFunc, exParams)
		 // 파라미터를 참조합시다. 
		 
		 
	     var list = $("#tmpList").val();
	     
		 //var listnum = $("#tmpListNum").val();
	     var pagingnavi = getPaginationHtml(currentPage, totalCnt, userPageSize, userPageBlock, 'selectInquiryList',[list]);
		 
	     
	     console.log("pagingnavi : " + pagingnavi);
		 // 비운다음에 다시 append 
	     $("#pagingnavi").empty().append(pagingnavi); // 위에꺼를 첨부합니다. 
		 
		 // 현재 페이지 설정 
	    $("#currentPage").val(currentPage);

	 }
	 
	 
	/* 문의관리 모달창(팝업) 실행  여기부터 */
	function fInquiryModal(inq_no, loginID) {
		//swal("모달");
		// 신규저장 하기 버튼 클릭시 (값이 null)
		if (inq_no == null || inq_no == "") {
			// Tranjection type 설정
			//swal("새롭게 등록할때 타는 곳");
			$("#action").val("I"); // insert 
			frealPopModal(loginID); //  초기화 

			//모달 팝업 모양 오픈! (빈거) _ 있는 함수 쓰는거임. 
			gfModalPop("#user");

		} else {
			// Tranjection type 설정
			
			//swal("아이디를 찍어보자!!!!!!" + loginID);
			//swal("글번호를 찍어보자!!!!!!" + inq_no);
			
			$("#action").val("U"); // update
			fdetailModal(inq_no); //번호로 글띄우기
		}

	}

	/*문의정보 상세 조회*/
	function fdetailModal(inq_no) {
		//swal(" 상세 조회  ");

		var param = {
			inq_no : inq_no
		};
		var resultCallback2 = function(data) {
			fdetailResult(data);
		};

		callAjax("/epc/detailInquiry.do", "post", "json", true, param,
				resultCallback2);
		//swal(" 상세 조회  22");

	}

	/* 문의정보 상세조회 -> 콜백함수   */
	function fdetailResult(data) {

		//swal("문의정보 상세조회  33");
		if (data.resultMsg == "SUCCESS") {
			//모달 띄우기 
			gfModalPop("#user");

			//swal(data.result);
			// 모달에 정보 넣기 
			frealPopModal(data.result);

		} else {
			swal(data.resultMsg);
		}
	}

	/* 팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기  */
	function frealPopModal(object) {

		if (object == "" || object == null || object == undefined) {

			$("#writer").val($("#loginID").val());
			$("#writer").attr("readonly", true); // loginID 수정불가 
			
			$("#title").val("");
			$("#inquiry_content").val("");
	
			$("#btnUpdateInquiry").hide();
			$("#btnDeleteInquiry").hide();
			$("#btnInsertInquiry").show();
			$("#btnClose").hide();
			$("#btnClose2").show();
			$("#answerDiv").hide();
			
			

		} else {
			
			$("#writer").val(object.loginID);
			$("#writer").attr("readonly", true); // loginID 수정불가 
			
			$("#title").val(object.inq_title);
			$("#inquiry_content").val(object.inq_content);
			$("#inq_no").val(object.inq_no)
			//swal(object.inq_regdate);
			$("#inq_regdate").val(object.inq_regdate);
			//답변이 있을때 없을때 모달창 다르게
			if(object.ans_content == "" || object.ans_content == null || object.ans_content == undefined){
				//swal("답변 없을때!!!!!");
				$("#answerDiv").hide();
			}else{
				//swal("답변 있을때!!!!!");
				$("#answer_content").val(object.ans_content);
				$("#answer_title").val(object.ans_title);
				$("#answerDiv").show();
			}
			
			
			//swal(object.category_cd);
			$('#selectCategory').val(object.category_cd).prop("selected",true); // select 박스 맞게 매칭
			
			$("#btnUpdateInquiry").show();
			$("#btnDeleteInquiry").show();
			$("#btnInsertInquiry").hide();
			$("#btnClose").show();
			$("#btnClose2").hide();
			
			
			//if문써서 로그인 아이디 == 작성자 아이디 일치시  --- 추가하기 
			//$("#grp_cod").attr("readonly", false);  // false, true(읽기만)로 수정

		}
	}

	/* 팝업내 수정, 저장 validation */
	function fValidatePopup() {
		
		var chk = checkNotEmpty([[ "title", "제목을 입력해주세요!" ]
		,[ "inquiry_content", "내용을 입력해주세요!" ]]
		);
		
		if (!chk) {
			return;
		}
		return true;
	}

	/* 저장 ,수정, 삭제 콜백 함수 처리  */
	function fSaveInquiryResult(data) {
		var currentPage = currentPage || 1;

		if ($("#action").val() != "I") {
			currentPage = $("#currentPage").val();
		}

		if (data.resultMsg == "SUCCESS") {
			//swal(data.resultMsg);	// 받은 메세지 출력 
			swal("등록 되었습니다.");
		} else if (data.resultMsg == "UPDATE") {
			swal("수정 되었습니다.");
		} else if (data.resultMsg == "DELETE") {
			swal("삭제 되었습니다.");
		}else {
			swal(data.resultMsg); //실패시 이거 탄다. 
			swal("실패 했습니다.");
		}

		gfCloseModal(); // 모달 닫기
		selectInquiryList(currentPage); // 목록조회 함수 다시 출력 
		frealPopModal();// 입력폼 초기화
	}
	
	// 문의 등록 함수
	function fInsertInquiry(){
		//swal("등록  함수 타는지!!!!!?? ");
		if (!(fValidatePopup())) {
			return;
		}
		var resultCallback3 = function(data) {
			fSaveInquiryResult(data);
		};

		$("#action").val("I"); // update

		callAjax("/epc/inquirySave.do", "post", "json", true, $("#myUser")
				.serialize(), resultCallback3);
		
	}

	/* 문의 수정(수정) */
	function fUpdateInquiry() {

		//swal("수정  함수 타는지!!!!!?? ");
		// validation 체크 
		if (!(fValidatePopup())) {
			return;
		}

		var resultCallback3 = function(data) {
			fSaveInquiryResult(data);
		};

		$("#action").val("U"); // update

		callAjax("/epc/inquirySave.do", "post", "json", true, $("#myUser")
				.serialize(), resultCallback3);
		// $("#myQna").serialize() => 직렬화해서 name 값들을 그냥 넘김.

	}

	/* 문의 1건 삭제 */
	function fDeleteInquiry() {
		var con = confirm("정말 삭제하겠습니까? \n 삭제시 복구불가합니다.");
		if (con) {
			var resultCallback3 = function(data) {
				fSaveInquiryResult(data);
			}
			$("#action").val("D"); // delete
			callAjax("/epc/inquirySave.do", "post", "json", true, $("#myUser").serialize(), resultCallback3);

		} else {
			gfCloseModal(); // 모달 닫기
			selectInquiryList(currentPage); // 목록조회 함수 다시 출력 
			frealPopModal();// 입력폼 초기화
		}
	}
	
</script>

<style>

</style>

</head>
<body>
	<!-- ///////////////////// html 페이지  ///////////////////////////// -->

<form id="myUser" action="" method="">
	
	<input type="hidden" id="currentPage" value="1">  <!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
	<input type="hidden" id="tmpList" value=""> <!-- ★ 이거뭐임??? -->
	<input type="hidden" id="tmpListNum" value=""> <!-- 스크립트에서 값을 설정해서 넘길거임 / 임시 리스트 넘버 -->
	<input type="hidden" name="action" id="action" value="">
	<input type="hidden" id="loginID" value="${loginId}">
	 <!-- <input type="hidden" id="swriter" value="${writer}"> 작성자 session에서 java에서 넘어온값 -->

	<div id="wrap_area">

		<h2 class="hidden">header 영역</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<!-- lnb 영역 --> 
					<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<!-- contents -->
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">

						<p class="Location">
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> 
							<a href="#" class="btn_nav">고객 센터</a> 
								<span class="btn_nav bold">1:1 질의</span> 
								<a href="top.location='javascript:location.reload()'" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span> 나의 문의 내역</span> 
							<!--검색창   -->
							<span class="fr">
								<a class="btnType blue" href="javascript:fInquiryModal(${null});" name="modal">
								<span>문의하기</span></a>
								
							</span>
							</p>
		
						
						<div class="divUserList">
							<table class="col">
								<caption>caption</caption>
								
									<colgroup>
									    <col width="10%">
										<col width="15%">
										<col width="50%">
										<col width="10%">
										<col width="15%">
									</colgroup>
	
	
								<thead>
									<tr>
									      <th scope="col">번호</th>
							              <th scope="col">카테고리</th>
							              <th scope="col">제목</th>
							              <th scope="col">문의일</th>
							              <th scope="col">답변 상태</th>
									</tr>
								</thead>
								<tbody id="inquiryList"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingnavi">
								<div class="paging">
									<a class="first" href="javascript:selectInquiryList(1)">
									<span class="hidden">맨앞</span></a>
									<a class="pre" href="javascript:selectInquiryList(1)">
									<span class="hidden">이전</span></a>
									<strong>1</strong> 
									<a href="javascript:selectInquiryList(2)">2</a> 
									<a href="javascript:selectInquiryList(3)">3</a> 
									<a href="javascript:selectInquiryList(4)">4</a>
									<a href="javascript:selectInquiryList(5)">5</a>
									<a class="next" href="javascript:selectInquiryList(5)">
									<span class="hidden">다음</span></a>
									<a class="last" href="javascript:selectInquiryList(5)">
									<span class="hidden">맨뒤</span></a>
								</div>
							</div>
											
						</div>
 						&nbsp;&nbsp;
								<span class="fr"> 
								<c:set var="nullNum" value=""></c:set>
								</span>
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 문의 모달 -->
		<div id="user" class="layerPop layerType2" style="width: 1000px; display: table;">
           <dl>
			<dt>
				<strong>1:1문의</strong>
			</dt>
			<dd class="content">
		
				<table class="row">
					<caption>caption</caption>
					<input type="hidden" name="inq_no" id="inq_no" >
					<input type="hidden" name="inq_regdate" id="inq_regdate">
					<tbody>
						<tr>
							<th scope="row" style="width:70px;">제목 <span class="font_red">*</span></th>
							<td><input type="text" name="title" id="title" style="height:20px;" size="40"/></td>
							
							<th scope="row" style="width:55px;">카테고리 <span class="font_red">*</span></th>
							<td style="width:10%;">
							<div id="categoryDiv">
								<select id="selectCategory" name="selectCategory">
									<c:forEach items="${listCategory}" var="list">
										<option id ="optionCategory" value="${list.detail_code}" name="optionCategory"><c:out value="${list.category_name}"/>
										</option>
									</c:forEach>
								</select>
							</div>
							</td>
							
							<th style="width:40px;" scope="row" >작성자</th>
							<td style="width:10%;"><input type="text" name="writer" id="writer" style="border:none; outline:none;"/></td>
						</tr>
						
						<tr>
							<th scope="row">내용<span class="font_red">*</span></th>
							<td colspan="5">
								<textarea name="inquiry_content" id="inquiry_content" style="height:200px; resize:none;" maxlength="100"></textarea>					
							</td>							
						</tr>
					</tbody>
				</table>
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnInsertInquiry" name="btn"><span>등록</span></a> 
					<a href="" class="btnType blue" id="btnUpdateInquiry" name="btn"><span>수정</span></a> 
					<a href="" class="btnType blue" id="btnDeleteInquiry" name="btn" ><span>삭제</span></a>
					<a href=""	class="btnType gray"  id="btnClose2" name="btn"><span>취소</span></a>
				</div>
				<br />
				<div id="answerDiv">
					<table class="row">
						<caption>caption</caption>
	
						<tbody>
							<tr>
								<th scope="row" style="width:70px;">답변 제목<span class="font_red">*</span></th>
								<td colspan="5">
									<input type="text" name="answer_title" id="answer_title" style="height:20px;" size="100" readonly/>						
								</td>							
							</tr>
							<tr>
								<th scope="row" style="width:70px;">답변 내용<span class="font_red">*</span></th>
								<td colspan="5">
									<textarea rows="10" name="answer_content" id="answer_content" readonly style="height:200px; resize:none;" ></textarea>						
								</td>							
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btn_areaC mt30">		
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
		    </dd>
          </dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
     </div>

	

</form>

</body>
</html>
