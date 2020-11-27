<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title> 고객/회원 관리  </title>
<!-- 빌립담당 -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

	// 페이징 설정 
	var userPageSize = 7;    	// 화면에 뿌릴 데이터 수 
	var userPageBlock = 5;		// 블럭으로 잡히는 페이징처리 수
	
	/* onload 이벤트  */
	$(function(){
		// 자유게시판 리스트 뿌리기 함수 
		selectUserList();
		
		// 체크 이벤트 등록 (삭제된 정보 표시)
		checkClickEvent();
		
		// 버튼 이벤트 등록 (저장, 수정, 삭제, 모달창 닫기)
		fButtonClickEvent();
		
	});
	
	/* 버튼 이벤트 등록 - 저장, 수정, 삭제  */
	function fButtonClickEvent(){
		$('a[name=btn]').click(function(e){
			e.preventDefault();   // ?? 
					
			var btnId = $(this).attr('id');
			
			//alert("btnId : " + btnId);
			
			switch(btnId){
			case 'btnSaveUser' : fSaveUser(); // save 안에 저장,수정
				alert("저장버튼~");
				break;
			case 'btnDeleteUser' : fDeleteUser();	// 삭제 
				alert("삭제버튼");		
				break;
			case 'btnClose' : gfCloseModal();  // 모달닫기 
				selectNoticeList(); // 첫페이지 다시 로딩 
				break;
			case 'btnUpdateUser' : fUpdateUser();  // 수정하기
				break;
			case 'searchBtn' : board_search();  // 검색하기
				break;
			case 'btnComebackUser' : fComebackUser(); // 복구
				alert("복구 버튼");
				break;
		
			}
		});
	}
	
	
	/* 사용자목록 리스트 불러오기  */
	function selectUserList(currentPage){
		
		currentPage = currentPage || 1;   // or		
		var sname = $('#sname');
		var searchKey = document.getElementById("searchKey");
		var oname = searchKey.options[searchKey.selectedIndex].value;
		
	//alert("지금 현재 페이지를 찍어봅시다. " + currentPage);
	
		
	if ($("input:checkbox[name=delcheck]").is(":checked") == true) {
		                    //체크가 되어있을때.
		                    console.log('체크되었씁니당.');
		                    var del_cd = "y";
		            } else {
		                    //체크가 안되어있을때.
		    	        	 console.log('체크 해지용.');
		    	        	 var del_cd = "n";
		            }
	
		var param = {
				sname : sname.val(),
				oname : oname,
				currentPage : currentPage ,
				pageSize : userPageSize ,
				del_cd : del_cd.toString()
		}
		
		var resultCallback = function(data){  // 데이터를 이 함수로 넘깁시다. 
			userListResult(data, currentPage); 
		}
		
		
		callAjax("/scm/UserInfoList.do","post","text", true, param, resultCallback);
		
	}
	
	/* callAjax 공통 common.js 에서 퍼옴  -> 이렇게 생긴 함수입니다.  
	
	function fOnloadImg(param){
		var resultCallback = function(data) {
			fOnloadImgResult(data);
		};
		callAjax("/image/selectImgSize.do", "post", "json", false, param, resultCallback);
	 } */
	

	 /* 공지사항 리스트 data를 콜백함수를 통해 뿌려봅시당   */
	 function userListResult(data, currentPage){
		 
		 // 일단 기존 목록을 삭제합니다. (변경시 재부팅 용)
		 $("#userList").empty();
		 //alert("데이터!!! " + data);
		 console.log("data !!!! " +  data);
		 
		 //var $data = $( $(data).html() ); // data의 .html()통해서 html구문을 끌어온다.
		 //alert("데이터 찍어보자!!!! " +  $data); // object
		 
		 $("#userList").append(data);
	
		 
		 // 리스트의 총 개수를 추출합니다. 
		 //var totalCnt = $data.find("#totalCnt").text();
	     var totalCnt = $("#totalCnt").val();  // qnaRealList() 에서보낸값 
	     //alert("totalCnt 찍어봄!! " + totalCnt);
		 
		 // * 페이지 네비게이션 생성 (만들어져있는 함수를 사용한다 -common.js)
		 // function getPaginationHtml(currentPage, totalCount, pageRow, blockPage, pageFunc, exParams)
		 // 파라미터를 참조합시다. 
		 
		 
	     var list = $("#tmpList").val();
	     
		 //var listnum = $("#tmpListNum").val();
	     var pagingnavi = getPaginationHtml(currentPage, totalCnt, userPageSize, userPageBlock, 'selectUserList',[list]);
		 
	     
	     console.log("pagingnavi : " + pagingnavi);
		 // 비운다음에 다시 append 
	     $("#pagingnavi").empty().append(pagingnavi); // 위에꺼를 첨부합니다. 
		 
		 // 현재 페이지 설정 
	    $("#currentPage").val(currentPage);
	    
		 
/* 	    var chaCD = ["SCM담당자", "배송담당자", "구매담당자", "회사임원"]*/
//		$("#selectChaCD").empty(); 
	    
	   
		
/* 		for(var cnt = 0; cnt < data.length; cnt++){
			var option = $("<option>"+chaCD[cnt]+"</option>");
			$("#selectChaCD").append(option);
			
		} */
	     
	     
	 }
	 
 	 //검색  

	function checkClickEvent(currentPage) {

		currentPage = currentPage || 1;

		/*
		var sname = $('#sname');
		var searchKey = document.getElementById("searchKey");
		var oname = searchKey.options[searchKey.selectedIndex].value;
		*/

		/*            if ($("input:checkbox[name=delcheck]").is(":checked") == true) {
		                    //체크가 되어있을때.
		                    console.log('체크되었씁니당.');
		                    var del_cd = 1;
		            } else {
		                    //체크가 안되어있을때.
		    	        	 console.log('체크 해지용.');
		    	        	 var del_cd = 0;
		            }
		            
		         alert('del_cd' + del_cd);
		 */
		$("#delcheck").change(
				function() {
					if ($("#delcheck").is(":checked")) {
						$("#sname").val("");
						var del_cd = "y";
						//alert("체크박스 체크했음!" + del_cd);

						var param = {
							currentPage : currentPage,
							pageSize : userPageSize,
							del_cd : del_cd.toString()
						}

						var resultCallback = function(data) {
							userListResult(data, currentPage);
						};

						callAjax("/scm/UserInfoList.do", "post", "text", true,
								param, resultCallback);

					} else {
						$("#sname").val("");
						var del_cd = "n";
						//alert("체크박스 체크 해제!" + del_cd);

						var param = {
							currentPage : currentPage,
							pageSize : userPageSize,
							del_cd : del_cd.toString()
						}

						var resultCallback = function(data) {
							userListResult(data, currentPage);
						};

						callAjax("/scm/UserInfoList.do", "post", "text", true,
								param, resultCallback);
					}
				});

	}

	function board_search(currentPage) {

		currentPage = currentPage || 1;

		var sname = $('#sname');
		var searchKey = document.getElementById("searchKey");
		var oname = searchKey.options[searchKey.selectedIndex].value;
		
        if ($("input:checkbox[name=delcheck]").is(":checked") == true) {
		                    //체크가 되어있을때.
		                    console.log('체크되었씁니당.');
		                    var del_cd = "y";
		            } else {
		                    //체크가 안되어있을때.
		    	        	 console.log('체크 해지용.');
		    	        	 var del_cd = "n";
		            }
		            
		         alert('del_cd' + del_cd);
		
						var param = {
							sname : sname.val(),
							oname : oname,
							currentPage : currentPage,
							pageSize : userPageSize,
							del_cd : del_cd.toString()
						}

						var resultCallback = function(data) {
							userListResult(data, currentPage);
						};

						callAjax("/scm/UserInfoList.do", "post", "text", true,
								param, resultCallback);

	}
	/* 회원관리 모달창(팝업) 실행  여기부터 */
	function fUserModal(loginID) {
		//alert("모달");
		// 신규저장 하기 버튼 클릭시 (값이 null)
		if (loginID == null || loginID == "") {
			// Tranjection type 설정
			alert("넘을 찍어보자!!!!!!" + loginID);

			$("#action").val("I"); // insert 
			frealPopModal(loginID); //  초기화 

			//모달 팝업 모양 오픈! (빈거) _ 있는 함수 쓰는거임. 
			gfModalPop("#user");

		} else {
			// Tranjection type 설정
			$("#action").val("U"); // update
			fdetailModal(loginID); //번호로 -> 공지사항 상세 조회 팝업 띄우기
		}

	}

	/*회원정보 상세 조회*/
	function fdetailModal(loginID) {
		//alert(" 상세 조회  ");

		var param = {
			loginID : loginID
		};
		var resultCallback2 = function(data) {
			fdetailResult(data);
		};

		callAjax("/scm/detailUser.do", "post", "json", true, param,
				resultCallback2);
		//alert(" 상세 조회  22");

	}

	/* 회원정보 상세조회 -> 콜백함수   */
	function fdetailResult(data) {

		//alert("회원정보 상세조회  33");
		if (data.resultMsg == "SUCCESS") {
			//모달 띄우기 
			gfModalPop("#user");

			//alert(data.result);
			// 모달에 정보 넣기 
			frealPopModal(data.result);

		} else {
			alert(data.resultMsg);
		}
	}

	/* 팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기  */
	function frealPopModal(object) {

		if (object == "" || object == null || object == undefined) {

			$('#checkstaff option').each(function(){
				$(this).prop('disabled', false);
			}); 
	

			$("#rloginID").val("");
			$("#rloginID").attr("readonly", false);

			$("#password").val("");

			$("#name").val("");
			$("#name2").val("");
			$("#email").val("");

			$("#tel1").val("");
			$("#tel2").val("");
			$("#tel3").val("");
			
			
			$("#company").val("");
			$("#chaCD").val("");
			
			$('#instaff').show();
			$('#outstaff').hide();
			
			$("#zipcode").val("");
			$("#address").val("");
			$("#dt_address").val("");
			
			$('#checkstaff').change(function() {
				var state = $('#checkstaff option:selected').val();
				if ( state == 'instaff' ) {
					$("#selectChaDiv").show(); 
					$('#instaff').show();
					$('#outstaff').hide();
				} else {
					$('#instaff').hide();
					$('#outstaff').show();
					$("#selectChaDiv").hide();
				}
			});
			//$("#chaDiv").hide(); // 담당업무 text박스 숨기기
			$("#btnDeleteUser").hide(); // 삭제버튼 숨기기
			$("#btnUpdateUser").hide();
			$("#btnComebackUser").hide();
			$("#btnSaveUser").show();
			$("#duplicate_check").show();
			

		} else {
			//alert(object.email_cop);
			//alert("숫자찍어보세 : " + object.wno);// 페이징 처리가 제대로 안되서
			
			//$("#selectChaCD").empty();
			//$("#selectChaCD").append(object.user_type);

			var div_cd = object.div_cd.toString();
			var del_cd = object.del_cd.toString();
			//alert(div_cd);
			//alert(del_cd);

			if(div_cd === "instaff")
			{
				$('#checkstaff option[value=instaff]').prop('selected', 'selected').change(); // value 에 맞게 option change된다.
				$("#instaff").show();
				$("#outstaff").hide();
				//$('#checkstaff').attr('disabled', 'true'); //disabled <- 비활성화
				$('#checkstaff option[value=outstaff]').prop('disabled', true);
						
				$('#selectChaCD').val(object.user_type).prop("selected",true); // user_type에 맞게 select의 option이 매칭된다.
			}
			if(div_cd === "outstaff")
			{
				$('#checkstaff option[value=outstaff]').prop('selected', 'selected').change();
				$("#instaff").hide();
				$("#outstaff").show();
				//$('#checkstaff').attr('disabled', 'true');
				$('#checkstaff option[value=instaff]').prop('disabled', true);
			}
			

			$("#rloginID").val(object.loginID);
			$("#rloginID").attr("readonly", true); // loginID 수정불가 
			
			$("#password").val(object.password);

			$("#name").val(object.name);
			$("#name2").val(object.name);
			$("#email").val(object.user_email);

			$("#tel1").val(object.user_tel1);
			$("#tel2").val(object.user_tel2);
			$("#tel3").val(object.user_tel3);
			
			
			$("#company").val(object.user_company);
			$("#chaCD").val(object.chaCD_name);
			
			$("#zipcode").val(object.user_zipcode);
			$("#address").val(object.user_address);
			$("#dt_address").val(object.user_dt_address);
	
			// 삭제 안된 계정 볼때 
			if(del_cd === "n"){
				alert("삭제안된 계정입니다.");
				$("#btnDeleteUser").show();
				$("#btnComebackUser").hide();
				$("#btnSaveUser").hide();
				$("#btnUpdateUser").show();
			}
			// 삭제된 계정 볼때
			if(del_cd === "y"){
				alert("삭제된계정입니다.");
				$("#btnDeleteUser").hide();
				$("#btnComebackUser").show();
				$("#btnSaveUser").hide();
				$("#btnUpdateUser").hide();
			}
			
			$("#duplicate_check").hide();
			$("#btnUpdateUser").css("display", "");
			//if문써서 로그인 아이디 == 작성자 아이디 일치시  --- 추가하기 
			//$("#grp_cod").attr("readonly", false);  // false, true(읽기만)로 수정

		}
	}

	/* 팝업내 수정, 저장 validation */
	function fValidatePopup() {
		
		// 내부직원일때 validation
		if($("#checkstaff option:selected").val() == "instaff"){
			alert("내부직원 validation입니다.");
			var chk = checkNotEmpty([ [ "rloginID", "아이디를 입력해주세요!" ]
	        ,[ "password", "비밀번호를 입력해주세요!" ]
			,[ "tel1", "연락처 기입해주세요!" ]
			,[ "tel2", "연락처 기입해주세요!" ]
			,[ "tel3", "연락처 기입해주세요!" ]
			,[ "email", "이메일을 입력해주세요!" ]
			,[ "zipcode", "우편번호를 입력해주세요!" ]
			,[ "address", "주소를 입력해주세요!" ]
			,[ "dt_address", "상세주소 기입해주세요!" ]
			,[ "name", "이름 기입해주세요!" ]]
			);
		}

		// 기업고객일때 validation
		if($("#checkstaff option:selected").val() == "outstaff"){
			alert("기업고객 validation입니다.");
			var chk = checkNotEmpty([ [ "rloginID", "아이디를 입력해주세요!" ]
	        ,[ "password", "비밀번호를 입력해주세요!" ]
			,[ "tel1", "연락처 기입해주세요!" ]
			,[ "tel2", "연락처 기입해주세요!" ]
			,[ "tel3", "연락처 기입해주세요!" ]
			,[ "email", "이메일을 입력해주세요!" ]
			,[ "zipcode", "우편번호를 입력해주세요!" ]
			,[ "address", "주소를 입력해주세요!" ]
			,[ "dt_address", "상세주소 기입해주세요!" ]
			,[ "name2", "담당자명 기입해주세요!" ]
			,[ "company", "회사명 기입해주세요!" ]]
			);
		}
		
		if (!chk) {
			return;
		}
		return true;
	}

	/* 회원 등록(저장) */
	function fSaveUser() {

		//alert("저장 함수 타는지!!!!!?? ");
		// validation 체크 
		if (!(fValidatePopup())) {
			return;
		}

		var resultCallback3 = function(data) {
			alert(data);
			fSaveUserResult(data);

		};

		$("#action").val("I"); // insert

		callAjax("/scm/userSave.do", "post", "json", true, $("#myUser")
				.serialize(), resultCallback3);
		// $("#myNotice").serialize() => 직렬화해서 name 값들을 그냥 넘김.

	}

	/* 저장 ,수정, 삭제 콜백 함수 처리  */
	function fSaveUserResult(data) {
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
		} else if (data.resultMsg == "COMEBACK"){
			alert("복구 되었습니다.");
		}else {
			alert(data.resultMsg); //실패시 이거 탄다. 
			alert("실패 했습니다.");
		}

		gfCloseModal(); // 모달 닫기
		selectUserList(currentPage); // 목록조회 함수 다시 출력 
		frealPopModal();// 입력폼 초기화
	}

	/* 회원 등록(수정) */
	function fUpdateUser() {

		//alert("수정  함수 타는지!!!!!?? ");
		// validation 체크 
		if (!(fValidatePopup())) {
			return;
		}

		var resultCallback3 = function(data) {
			fSaveUserResult(data);
		};

		$("#action").val("U"); // update

		callAjax("/scm/userSave.do", "post", "json", true, $("#myUser")
				.serialize(), resultCallback3);
		// $("#myQna").serialize() => 직렬화해서 name 값들을 그냥 넘김.

	}

	/* 회원 1건 삭제 */
	function fDeleteUser() {
		var con = confirm("정말 삭제하겠습니까? \n 삭제시 복구불가합니다.");
		if (con) {
			var resultCallback3 = function(data) {
				fSaveUserResult(data);
			}
			$("#action").val("D"); // delete
			callAjax("/scm/userSave.do", "post", "json", true, $("#myUser").serialize(), resultCallback3);

		} else {
			gfCloseModal(); // 모달 닫기
			selectUserList(currentPage); // 목록조회 함수 다시 출력 
			frealPopModal();// 입력폼 초기화
		}
	}
	
	/* 회원 1건 복구 */
	function fComebackUser() {
	var con = confirm("복구하시겠습니까? ");
	if (con) {
		var resultCallback3 = function(data) {
			fSaveUserResult(data);
		}
		$("#action").val("C"); // comeback
		callAjax("/scm/userSave.do", "post", "json", true, $("#myUser").serialize(), resultCallback3);

	} else {
		gfCloseModal(); // 모달 닫기
		selectUserList(currentPage); // 목록조회 함수 다시 출력 
		frealPopModal();// 입력폼 초기화
	}
}
	
	// 신규 등록시에 아이디 중복체크 
	function check() {
		var data = {"loginID" : $("#rloginID").val()}
		var success = function(data){
			if(data == 0){
				console.log("아이디 없음");
				alert("사용할 수 있는 아이디입니다.");
			}else{
				console.log("아이디 있음");
				alert("중복된 아이디가 존재합니다.");
				$("#rloginID").val('');  // 빈값으로 만들기
				$("#btnSaveUser").attr("disabled", true) // 저장버튼 잠금
			}
		}		
		callAjax("/scm/check_loginID.do", "post", "json", true, data , success);
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
							<a href="#" class="btn_set home">메인으로</a> 
							<a href="#" class="btn_nav">시스템 관리</a> 
								<span class="btn_nav bold">사용자 관리</span> 
								<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>사용자 관리 </span> 
							<!--검색창   -->
							<span class="fr">
							<label><input type="checkbox" id="approvalCheck" name="approvalCheck" value="approval"> 미승인 유저 표시</label>
							<label><input type="checkbox" id="delcheck" name="delcheck" value="del"> 삭제된 정보 표시</label> 
							<select id="searchKey" name="searchKey" style="width: 80px;" v-model="searchKey">
									<option value="all" selected="selected">전체</option>
									<option value="com_nm" >회사명</option>
									<option value="sta_nm" >직원명</option>
									<option value="man_nm" >담당자명</option>
									<option value="res_nm" >담당업무</option>
							</select> 
								
							<input type="text" style="width: 160px; height: 30px;" id="sname" name="sname">  
							<a href="" class="btnType blue" id="searchBtn" name="btn"><span>검  색</span></a>
							</span>
							</p>
		
						
						<div class="divUserList">
							<table class="col">
								<caption>caption</caption>
	
								<thead>
									<tr>
									      <th scope="col">구분</th>
							              <th scope="col">회사명/성명</th>
							              <th scope="col">담당업무</th>
							              <th scope="col">담당자명</th>
							              <th scope="col">연락처</th>
							              <th scope="col" width="50px">삭제여부</th>
									</tr>
								</thead>
								<tbody id="userList"></tbody>
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingnavi">
								<div class="paging">
									<a class="first" href="javascript:selectUserList(1)">
									<span class="hidden">맨앞</span></a>
									<a class="pre" href="javascript:selectUserList(1)">
									<span class="hidden">이전</span></a>
									<strong>1</strong> 
									<a href="javascript:selectUserList(2)">2</a> 
									<a href="javascript:selectUserList(3)">3</a> 
									<a href="javascript:selectUserList(4)">4</a>
									<a href="javascript:selectUserList(5)">5</a>
									<a class="next" href="javascript:selectUserList(5)">
									<span class="hidden">다음</span></a>
									<a class="last" href="javascript:selectUserList(5)">
									<span class="hidden">맨뒤</span></a>
								</div>
							</div>
											
						</div>
 						&nbsp;&nbsp;
								<span class="fr"> 
								<c:set var="nullNum" value=""></c:set>
								<a class="btnType blue" href="javascript:fUserModal(${null});" name="modal">
								<span>신규등록</span></a>
								</span>
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 회원관리 모달 -->
		<div id="user" class="layerPop layerType2" style="width: 1000px; height: 400px;">
		<input type="hidden" id="loginID" name="loginID"> <!-- 수정시 필요한 num 값을 넘김  -->
           <dl>
			<dt>
				<strong>회원관리</strong>
			</dt>
			<dd class="content">
		
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
							<th scope="row" rowspan="3" >
								<select id="checkstaff" name="checkstaff" style="width: 80px;" v-model="searchKey">
									<option name="instaff" value="instaff" selected="selected">내부직원</option>
									<option name="outstaff" value="outstaff" >기업고객</option>
								</select>
							</th>
							
							<th scope="row" style="width:70px">아이디 <span class="font_red">*</span></th>
							<td><input type="text" name="rloginID" id="rloginID"/>
							<button id="duplicate_check" type="button" onclick="check();">중복체크</button>
							</td>
							
							<th style="width:70px" scope="row">비밀번호<span class="font_red">*</span></th>
							<td><input type="password" name="password" id="password" /></td>
						</tr>
						
						<tr>
							<th scope="row">연락처 <span class="font_red">*</span></th>
							<td>
								<input style="width:50px" type="text" id="tel1" name="tel1">
								-
								<input style="width:50px" type="text" id="tel2" name="tel2">
								-
								<input style="width:50px" type="text" id="tel3" name="tel3" >									
							</td>
							<th scope="row">이메일 </th>
							<td style='width:30%'>
								<input type="text"  name="email" id="email" size="30">
							</td>							
						</tr>
						<tr id="instaff">
							<th scope="row" style="width:70px">직원명<span class="font_red">*</span></th>
							<td><input type="text" name="name" id="name"/></td>
							<th style="width:70px" scope="row">담당업무<span class="font_red">*</span></th>
							<td>
							<div id="chaDiv">
								<select id="selectChaCD" name="selectChaCD">
									<c:forEach items="${listChaCD}" var="list">
										<option id ="optionChaCD" value="${list.user_type}" name="selectChaCD"><c:out value="${list.chaCD_name}"/>
										</option>
									</c:forEach>
								</select>
							</div>
							</td>
						</tr>
						<tr id="outstaff">
							<th scope="row" style="width:70px">회사명<span class="font_red">*</span></th>
							<td><input type="text" name="company" id="company"/></td>
							
							<th style="width:70px" scope="row">담당자명<span class="font_red">*</span></th>
							<td><input type="text" name="name2" id="name2" /></td>
						</tr>
						<tr>
							<th style="width:70px" scope="row">우편번호<span class="font_red">*</span></th>
							<td colspan="4"><input type="text" name="zipcode" id="zipcode"/></td>
						</tr>
						<tr>
							<th style="width:70px" scope="row">주소<span class="font_red">*</span></th>
							<td colspan="4"><input type="text" name="address" id="address" size="100"/></td>
						</tr>
												<tr>
							<th style="width:70px" scope="row">상세주소<span class="font_red">*</span></th>
							<td colspan="4"><input type="text" name="dt_address" id="dt_address" size="100"/></td>
						</tr>
							
					</tbody>
					
				</table>
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnUpdateUser" name="btn" style="display:none"><span>수정</span></a> 
					<a href="" class="btnType blue" id="btnDeleteUser" name="btn" ><span>삭제</span></a>
					<a href="" class="btnType blue" id="btnComebackUser" name="btn" ><span>복구</span></a>  
					<a href="" class="btnType blue" id="btnSaveUser" name="btn"><span>저장</span></a>			
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
		    </dd>
          </dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
     </div>

	

</form>

</body>
</html>
