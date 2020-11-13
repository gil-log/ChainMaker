
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>JobKorea</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<link rel="stylesheet" type="text/css"
	href="${CTX_PATH}/css/admin/login.css" />

<!-- 우편번호 조회 -->

<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" charset="utf-8"
	src="${CTX_PATH}/js/popFindZipCode.js"></script>

<script type="text/javascript" src="${CTX_PATH}/js/login_pub.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#confirm").hide();
		$("#loginRegister").hide();
		$("#loginEmail").hide();
		$("#loginPwd").hide();
		

		/* $("#btn_prelogin").click(function() {
			$("#EMP_ID").val("admin");
			$("#EMP_PWD").val("admin");
			fLoginProc();
		});

		$("#btn_prelogin1").click(function() {
			$("#EMP_ID").val("1234");
			$("#EMP_PWD").val("1234");
			fLoginProc();
		});

		$("#btn_prelogin2").click(function() {
			$("#EMP_ID").val("DigitalOne");
			$("#EMP_PWD").val("DigitalOne");
			fLoginProc();
		}); */

	});
	/* OnLoad Event */
	$(function() {
		// 쿠키값을 가져온다.
		var cookie_user_id = getCookie('EMP_ID');
		if (cookie_user_id != "") {
			$("#EMP_ID").val(cookie_user_id);
			$("#cb_saveId").attr("checked", true);
		}

		$("#EMP_ID").focus();

	});

	/* 회원가입 모달창 실행 */
	function fRegister() {

		// 모달 팝업
		gfModalPop("#layer1");
	}

	/* 아이디/비밀번호 찾기 모달창 실행 */
	function findIdPwd() {

		// 모달 팝업
		gfModalPop("#layer2");
	}

	/* 회원가입  신규등록*/
	function fPopModalLsmCod(loginId) {
		var frm = $("#RegisterForm");
		if (loginId == null || loginId == "") {
			frm.find("input[name=action]").val("I");

			gfModalPop("#layer1");
		}
	}

	/* 회원 가입 저장 콜백함수 */
	function fSaveRegister(data) {

		if (data.result == "SUCCESS") {
			alert(data.resultMsg);
			gfCloseModal();
		} else {
			alert(data.resultMsg);
			return false;
		}
	}
	
	/* 회원가입 validation */
	function RegisterVal(){
		var rgname = $('#registerName').val();
		var rgid = $('#registerId').val();
		var rgpwd = $('#registerPwd').val();
		var rgpwdok = $('#registerPwdOk').val();
		var lgadr = $('#loginaddr').val();
		var lgadr1 = $('#loginaddr1').val();
		var dtadr = $('#detailaddr').val();
		var rgemail = $('#registerEmail').val();
		
		if(rgname.length < 1){
			alert("이름을 입력하세요.");
			$('#registerName').focus();
			return false;
		}
		
		if(rgid.length < 1){
			alert("아이디를 입력하세요.");
			$('#registerId').focus();
			return false;
		}
		
		if(rgpwd.length < 1){
			alert("비밀번호를 입력하세요.");
			$('#registerPwd').focus();
			return false;
		}
		
		if(rgpwdok.length < 1){
			alert("비밀번호 확인을 입력하세요.");
			$('#registerPwdOk').focus();
			return false;
		}
		
		if(rgpwd != rgpwdok){
			alert("비밀번호가 맞지 않습니다.");
			return false;
		}
		
		if(lgadr.length < 1){
			alert("주소를 입력하세요.");
			$('#loginaddr').focus();
			return false;
		}
		
		if(lgadr1.length < 1){
			alert("상세주소를 입력하세요.");
			$('#loginaddr1').focus();
			return false;
		}
		
		if(dtadr.length < 1){
			alert("우편번호를 입력하세요.");
			$('#detailaddr').focus();
			return false;
		}
		
		if(rgemail.length < 1){
			alert("이메일을 입력하세요.");
			$('#registerEmail').focus();
			return false;
		}
		return true;
		
	}

	/* 회원가입  완료*/
	function CompleteRegister() {
		
		var param = $("#RegisterForm").serialize();

		/* validation 체크 */
		if(!RegisterVal()){
			return;
		}
		
		var resultCallback = function(data) {
			fSaveRegister(data);
		}
		
	
		callAjax("/register.do", "post", "json", true, param, resultCallback);

	}
	

	// 우편번호 api
	function execDaumPostcode(q) {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
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
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('detailaddr').value = data.zonecode;
				document.getElementById("loginaddr").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("loginaddr1").focus();
			}
		}).open({
			q : q
		});
	}

	/** 로그인 ID  체크 */
	function fCheckLgnId() {

		// validation 체크
		var lgn_id = $("#signForm").find("#lgn_id").val();
		if (lgn_id == "") {
			alert("아이디를 입력하세요.");
			$("#signForm").find("#lgn_id").focus();
			return;
		}

		if (!fChkId(lgn_id)) { //아이디 정규식 체크
			alert("아이디는 영문, 숫자를 포함한 7자리 이상 20자리 미만 입니다.");
			return;
		}

		// 로그인 아이디 조회
		var param = {
			lgn_id : lgn_id
		};
		var resultCallback = function(data) {
			fCheckLgnIdResult(data);
		};
		callAjax("/system/selectUsrMgr.do", "post", "json", true, param,
				resultCallback);
	}

	/** 로그인 ID 중복 체크 콜백 함수 */
	function fCheckLgnIdResult(data) {
		if (data.result == "SUCCESS") {
			$("#signForm").find("#idCheckFlag").val(data.isPossible);
			$("#signForm").find("#pwd").focus();
		}
	}

	/* 로그인 validation */
	function fValidateLogin() {

		var chk = checkNotEmpty([ [ "EMP_ID", "아이디를 입력해 주세요." ],
				[ "EMP_PWD", "비밀번호를 입력해 주세요." ] ]);

		if (!chk) {
			return;
		}

		return true;
	}

	/* 로그인 */
	function fLoginProc() {
		if ($("#cb_saveId").is(":checked")) { // 저장 체크시
			saveCookie('EMP_ID', $("#EMP_ID").val(), 7);
		} else { // 체크 해제시는 공백
			saveCookie('EMP_ID', "", 7);
		}

		// vaildation 체크
		if (!fValidateLogin()) {
			return;
		}

		var resultCallback = function(data) {
			fLoginProcResult(data);
		};

		callAjax("/loginProc.do", "post", "json", true, $("#myForm")
				.serialize(), resultCallback);
	}

	/* 로그인 결과 */
	function fLoginProcResult(data) {

		var lhost = data.serverName;

		if (data.result == "SUCCESS") {
			location.href = "${CTX_PATH}/dashboard/dashboard.do";
		} else {

			$("<div style='text-align:center;'>" + data.resultMsg + "</div>")
					.dialog({
						modal : true,
						resizable : false,
						buttons : [ {
							text : "확인",
							click : function() {
								$(this).dialog("close");
								$("#EMP_ID").val("");
								$("#EMP_PWD").val("");
								$("#EMP_ID").focus();
							}
						} ]
					});
			$(".ui-dialog-titlebar").hide();
		}
	}

	/*이메일 기능  (아이디 있는지 없는지 체크)*/
	function SendEmail() {
		var data = {
			"email" : $("#emailText").val(),
			"data-code" : $("#emailText").attr("data-code")
		};

		$.ajax({
			url : "/registerFindId.do",
			type : "post",
			dataType : "json",
			async : false,
			data : data,
			success : function(flag) {
				if (flag != '1') {
					alert("해당 이메일로 인증번호를 전송하였습니다.");
					$("#authNumId").val(flag);
					$("#confirm").show();
				} else if (flag == '1') {
					alert("존재하지 않는 이메일 입니다.");
				} else if (flag.length < 1) {
					alert("이메일을 입력해주세요.");
				}
			}
		});
	}

	/* 이메일 기능 (비밀번호 기능)*/
	function SendPwdEmail() {
		
		var data = {
			email : $("#emailPwdText").val(),
			loginId : $("#emailIdText").val(),
			"data-code" : $("#emailPwdText").attr("data-code")

		};
		
		console.log(data);
		
		
		
		$.ajax({
			url : "/registerFindPwd.do",
			type : "post",
			dataType : "json",
			async : false,
			data : data,
			success : function(flag) {
				
				
				if (flag != '1') {
					alert("해당 이메일로 임시 비밀번호를 전송하였습니다.");
					$("#authNumPwd").val(flag);
					$("#loginPwd").show();
				} else if (flag.length < 1) {
					alert("이메일을 입력해주세요.");
				} else if (flag == '1') {
					alert("이메일이 틀렸습니다.");
				}
				pwdCheck();
			}
		});
	}
	
	function pwdCheck(){
		var email = $("#emailPwdText");
		
		if(email.length < 1){
			alert("이메일을 입력해주세요.");
		}
	}

	/* 이메일 인증 */
	function SendComplete() {
		var inputNum = $("#emailNum").val();
		var emailNum = $("#authNumId").val();
		if (inputNum.length < 1) {
			alert("인증번호를 입력해주세요.");
			return false;
		} else if (emailNum != inputNum) {
			alert("인증번호가 틀렸습니다.");
			return false;
		} else if (emailNum == inputNum) {
			alert("인증 되었습니다.");
			$("#authNumId").val('');

			// 아이디 메일 전송 함수호출
			findId();
		}
	}

	/* 이메일 비밀번호 인증 */
	function SendCompletePwd() {
		var inputPwd = $("#emailPwdNum").val();
		var emailPwdNum = $("#authNumPwd").val();
		if (inputPwd.length < 1) {
			alert("비밀번호를 입력해주세요.");
			return false;
		} else if (emailPwdNum != inputPwd) {
			alert("비밀번호가 틀렸습니다.");
			return false;
		} else if (emailPwdNum == inputPwd) {
			alert("비밀번호가 맞습니다.");
			$("#authNumPwd").val('');

			// 비밀번호 호출하는 함수
			findPwd();
		}
	}
	/* 아이디 뜨게 하는 */
	var findId = function() {
		var data = {
			"email" : $("#emailText").val()
		};
		$.ajax({
			url : '/findRegisterId.do',
			type : 'post',
			data : data,
			dataType : 'text',
			async : false,
			success : function(data) {
				// 모달 or span 
				alert("귀하의 아이디는 : " + data + "입니다");
				gfCloseModal();
			}
		});
	}

	/* 비밀번호 뜨게 하는 창 */
	var findPwd = function() {
		var data = {
			"loginId" : $("#emailIdText").val(),
			"email" : $("#emailPwdText").val()
		};
		$.ajax({
			url : '/findRegisterPwd.do',
			type : 'post',
			data : data,
			dataType : 'text',
			async : false,
			success : function(data) {
				alert("귀하의 비밀번호는 : " + data + "입니다");
				gfCloseModal();
			}
		});
	}
	/* 비밀번호 찾기 아이디 체크 */
	  function CheckIdRegister(){
		var inputid = $("#emailIdText").val();
		var ckId = $("#ckIdcheck").val();
			if(inputid.length < 1){
				alert("가입하신 아이디를 입력해주세요.");
				return false;
			}else if(ckId != inputid){
				alert("가입하신 아이디가 맞지 않습니다.");
				return false;
			}else if(ckId == inputid){
				alert("가입하신 아이디가 맞습니다.");
				$("#ckIdcheck").val("");
				
				// 비번찾기에서 아이디 체크하는 창 (알림창)
				RegisterIdCheck();
			}
	}  
	
	/* 비밀번호 찾기에서 아이디 체크하는 창(가입된 아이디가 알람창으로) */
	function RegisterIdCheck(){
		var loginid = $("#emailIdText").val();

		
		var data = {
				"loginId" :loginid
		};
		console.log(data);
		
		$.ajax({
			url : "/registerIdCheck.do",
			type : "post",
			dataType : "json",
			async : false,
			data : data,
			success : function(data){
				if(loginid.length < 1){
					alert("아이디를 입력해주세요.");
				}
			
				else if (data.cnt > 0){
					
					alert("아이디가 존재합니다.");
				}else{
					alert("아이디가 존재하지 않습니다.");
				}
				
			}
			
		});
	}
	/* 아이디 찾기 버튼 클릭 이벤트 */
	function fSelectId() {

		gfModalPop("#layer2");
		$("#registerEmailId").show();
		$("#loginRegister").hide();
		$("#loginEmail").hide();
		$("#loginPwd").hide();

	}

	/* 비밀번호 찾기 버튼 클릭 이벤트 */
	function fSelectPwd() {

		$("#registerEmailId").hide();
		$("#confirm").hide();
		$("#loginRegister").show();
		$("#loginEmail").show();
		$("#loginPwd").hide();
		gfModalPop("#layer2");
	}

	/* 아이디 찾기 메일 인증하기 버튼 클릭 이벤트 */
	function fSelectIdOk() {
		$("#emailOk").on("click", function() {
			alert("인증이 완료 되었습니다.")
		});
	}

	/** ID 조회 */
	function fSelectData() {
		var resultCallback = function(data) {
			fSelectDataResult(data);
		};
		callAjax("/registerFindId.do", "post", "json", true, $("#modalForm")
				.serialize(), resultCallback);
	}

	/** PW 조회 */
	function fSelectDataPw() {
		var resultCallback = function(data) {
			fSelectDataResultPw(data);
		};

		callAjax("/registerFindPwd.do", "post", "json", true, $("#modalForm2")
				.serialize(), resultCallback);
	}

	/** pw 저장 */
	function fSaveData() {

		var resultCallback = function(data) {
			fSaveDataResult(data);
		};

		callAjax("/updateFindPw.do", "post", "json", true, $("#modalForm2")
				.serialize(), resultCallback);
	}

	/** 데이터 저장 콜백 함수 */
	function fSaveDataResult(data) {
		if (data.result == "SUCCESS") {
			// 응답 메시지 출력
			alert(data.resultMsg);
			location.href = "/login.do";
		} else {
			// 오류 응답 메시지 출력
			alert(data.resultMsg);
		}
	}
</script>
</head>
<body>
	<form id="myForm" action="" method="post">
		<div id="background_board">
			<div class="login_form" align="center">

				<fieldset>
					<legend>로그인</legend>
					<p class="id">
						<label for="user_id">아이디</label> <input type="text" id="EMP_ID"
							name="lgn_Id" placeholder="아이디"
							onkeypress="if(event.keyCode==13) {fLoginProc(); return false;}"
							style="ime-mode: inactive;" />
					</p>
					<p class="pw">
						<label for="user_pwd">비밀번호</label> <input type="password"
							id="EMP_PWD" name="pwd" placeholder="비밀번호"
							onfocus="this.placeholder=''; return true"
							onkeypress="if(event.keyCode==13) {fLoginProc(); return false;}" />
					</p>
					<p class="member_info" style="font-size: 15px">
						<input type="checkbox" id="cb_saveId" name=""
							onkeypress="if(event.keyCode==13) {fLoginProc(); return false;}">
						<span class="id_save">ID저장</span> <br>
					</p>
					<a class="btn_login" href="javascript:fLoginProc();" id="btn_login"><strong>Login</strong></a>
					<br>
					<!--  <button type="" id="btn_copjoin" onclick="location.href='/cop/officeReg.do' " style="background: none;font-size:110%;border: 0px;color: gray "><strong>[기업회원가입]</strong></button> -->
					<!--   <a class="btn_copjoin" href="#" ><strong>[기업회원가입]</strong></a>	 -->
					<a href="javascript:fLoginProc();" id="btn_prelogin"><strong>[관리자로그인]</strong></a>
					<a href="javascript:fLoginProc();" id="btn_prelogin2"><strong>[학생로그인]</strong></a>
					<a href="javascript:fPopModalLsmCod();" id="RegisterBtn"
						name="modal"><strong>[회원가입]</strong></a> <a
						href="javascript:findIdPwd();"><strong>[아이디/비밀번호 찾기]</strong></a>
				</fieldset>
			</div>
		</div>
	</form>
	<!-- 모달팝업 -->

	<form id="RegisterForm" action="" method="post">
		<input type="hidden" name="action" id="action" value="">
		<div id="layer1" class="layerPop layerType2" style="width: 600px;">
			<dl>
				<dt>
					<strong>회원 가입</strong>
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
								<th scope="row">이름<span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100" name="name"
									id="registerName" /></td>
								<th scope="row">아이디 <span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100" name="loginId"
									id="registerId" /></td>
							</tr>
							<tr>
								<th scope="row">비밀번호 <span class="font_red">*</span></th>
								<td colspan="3"><input type="password"
									class="inputTxt p100" name="password" id="registerPwd" /></td>
							</tr>
							<tr>
								<th scope="row">비밀번호 확인<span class="font_red">*</span></th>
								<td colspan="3"><input type="password"
									class="inputTxt p100" name="password1" id="registerPwdOk" /></td>
							</tr>
							<tr>
								<th scope="row">주소<span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="user_addr" id="loginaddr" /></td>
							</tr>
							<tr>
								<th scope="row">상세주소<span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="addr_detail" id="loginaddr1" /></td>


							</tr>
							<tr>
								<th scope="row">우편번호<span class="font_red">*</span></th>
								<td colspan="2"><input type="text" class="inputTxt p100"
									name="user_post" id="detailaddr" /></td>
								<input type="button" value="우편번호 찾기"
									onclick="execDaumPostcode()"
									style="position: relative; width: 130px; height: 20px; left: 400px; top: 236px;" />
							</tr>
							<tr>
								<th scope="row">이메일<span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									name="user_email" id="registerEmail" /></td>
							</tr>
							<input type="hidden" name="user_type" value="S" />

						</tbody>
					</table>


					<div class="btn_areaC mt30">
						<a href="javascript:CompleteRegister();" class="btnType blue"
							id="RegisterCom" name="btn"> <span>회원가입 완료</span></a> <a href=""
							class="btnType gray" id="btnCloseLsmCod" name="btn"><span>취소</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>
	</form>

	<!-- 아이디 비밀번호 찾기 모달 -->
	<form id="sendForm" action="" method="post">
		<input type="hidden" name="authNumId" id="authNumId" value="" /> 
		<input type="hidden" name="authNumPwd" id="authNumPwd" value="" />
		<input type="hidden" name="ckIdcheck" id="ckIdcheck" value=""/>
		<div id="layer2" class="layerPop layerType2" style="width: 750px;">
			<dl>
				<dt>
					<strong>아이디/비밀번호 찾기</strong>
				</dt>
				<dd>
					<div class="btn_areaC mt30">
						<a href="javascript:fSelectId();" class="btnType gray" id="findId"><span>아이디
								찾기</span></a> <a href="javascript:fSelectPwd();" class="btnType gray"
							id="findPwd"><span>비밀번호 찾기</span></a>
					</div>
				</dd>
				<dd class="content">

					<!-- 아이디/비밀번호 찾기 폼 -->
					<table class="row" id="findForm">
						<tbody>
							<tr>
								<td id="registerEmailId"><input type="text" id="emailText"
									data-code="I" placeholder="가입하신 이메일을 입력하세요" size="30"
									style="height: 30px;" /> <a href="javascript:SendEmail();"
									class="btnType blue" id="findIdSubmit"><span>이메일 전송</span></a></td>

								<td id="confirm"><input type="text" id="emailNum"
									placeholder="전송된 인증번호를 입력하세요" size="30" style="height: 30px;" />
									<a href="javascript:SendComplete();" class="btnType blue"
									id="sendMail"><span>인증하기</span></a></td>
							</tr>
						</tbody>
					</table>

					<table class="row" id="findPwdForm">
						<tbody>
							<tr>
								<td id="loginRegister"><input type="text" id="emailIdText"
									placeholder="가입하신 아이디를 입력하세요" size="30" style="height: 30px;" />
									<a href="javascript:RegisterIdCheck();" class="btnType blue" id=""><span>아이디 체크</span></a></td>

								<td id="loginEmail"><input type="text" id="emailPwdText"
									data-code="P" placeholder="가입하신 이메일을 입력하세요" size="30"
									style="height: 30px;" /> <a href="javascript:SendPwdEmail();"
									class="btnType blue" id=""><span>이메일 전송</span></a></td>

								<td id="loginPwd"><input type="text" id="emailPwdNum"
									data-code="P" placeholder="전송된 비밀번호를 입력하세요" size="30"
									style="height: 30px;" /> <a
									href="javascript:SendCompletePwd();" class="btnType blue"
									id="emailOk"><span>인증하기</span></a></td>
							</tr>
						</tbody>
					</table>

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="RegisterCom" name="btn"> <span>완료</span></a>
						<a href="" class="btnType gray" id="btnCloseLsmCod" name="btn"><span>취소</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">닫기</span></a>
		</div>
	</form>
</body>
</html>