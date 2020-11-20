<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<title> 반품 신청 목록 </title>
<!-- 혜원담당 12p-->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

	// 페이징 설정 
	var refundPageSize = 5;    	// 화면에 뿌릴 데이터 수 
	var refundPageBlock = 3;		// 하단에 블럭으로 잡히는 페이징처리 수  
	
			
	/* onload 이벤트  */
	$(function(){
		// 반품 리스트 뿌리기 함수 
		fSelectRefundList();  
		// 버튼 이벤트 등록 
		fButtonClickEvent();
	
	});
	
// 날짜 변한 함수    //notice 에서 가져왔는데 필요한가??
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
	
	
	

	/* 버튼 이벤트 모음 
	1.검색 2.반품지시서열기 
	3-모달창 내에 저장4.임원승인5.닫기] 
	6.기업고객용 창고저장 */
	function fButtonClickEvent(){
		$('a[name=btn]').click(function(e){
			e.preventDefault();   // ?? 
					
			var btnId = $(this).attr('id');			
			//alert("btnId : " + btnId);
			
			switch(btnId){
			
				case 'btnSearch' : btnSearch(); // 검색버튼 
					break;

				case 'btnSaveUpdate' : btnSaveUpdate();	// 모달 창 내에 _저장
					break;
				
				case 'btnGoToCeoModal' : btnGoToCeoModal();	// 모달 창 내에 _임원승인
					break;
				
				case 'btnClose' : gfCloseModal();  // 모달닫기 
						selectNoticeList(); // 첫페이지 다시 로딩 
					break;
				
				case 'btnSaveWareOfRefund' : btnSaveWareOfRefund();  // 기업고객 모달 창 내에 _창고저장 
					break;

			}
		});
	}
	
	
	/* 반품 목록 전체 리스트 불러오기  */
	function fSelectRefundList(currentPage){
		
		currentPage = currentPage || 1;   	

		 /* 검색 조건(넘어가야 할 것) 이 없다! 전체 목록 다 보이는거니까!  */
		var searchCompany = $('#searchCompany').val();
		var searchKey = $('#searchKey').val();
		var sname = $('#sname').val();
		var from_date = $('#from_date').val();
		var to_date = $('#to_date').val();	
	
		console.log("searchCompany : " + searchCompany);
		console.log("searchKey : " + searchKey);
		console.log("sname : " + sname);
		console.log("from_date : " + from_date);
		console.log("to_date : " + to_date);
		
		var param = {
				currentPage : currentPage ,
				pageSize : refundPageSize 				
		}
		
		var resultCallback = function(data){ 
			
			refundListResult(data, currentPage);  
		}
		
		
		callAjax("/scm/refundList.do","post","text", true, param, resultCallback);
		
	}
	
	

	 /* 반품 리스트 data를 콜백함수를 통해 뿌려봅시당   */
	 function refundListResult(data, currentPage){

		 $("#RefundList").empty();    
		 console.log("data !!!! " +  data);
	 
		 $("#RefundList").append(data);		 

	    var totalCnt = $("#totalCnt").val();  
	     
 		var list = $("#tmpList").val();

	    var pagingnavi = getPaginationHtml(currentPage, totalCnt, refundPageSize, refundPageBlock, 'fSelectRefundList',[list]);
		 
	    console.log("pagingnavi : " + pagingnavi);
		 
	    $("#pagingnavi").empty().append(pagingnavi); //  // 비운다음에 다시 append 위에꺼를 첨부합니다. 

	    $("#currentPage").val(currentPage);
	    
	 }
	 
 	 //버튼1 - 검색버튼    /* 위에 페이지 뿌리는것 함수 그대로 가져다쓴다! 위에것을 바꿔야하나??  */
	function btnSearch() { 
 		
		currentPage = currentPage || 1;  
	
				 /* 검색 조건(넘어가야 할 것) */
				var searchCompany = $('#searchCompany').val();
				var searchKey = $('#searchKey').val();
				var sname = $('#sname').val();
				var from_date = $('#from_date').val();
				var to_date = $('#to_date').val();	
			
				console.log("searchCompany : " + searchCompany);
				console.log("searchKey : " + searchKey);
				console.log("sname : " + sname);
				console.log("from_date : " + from_date);
				console.log("to_date : " + to_date);
				
				
				var param = {
						searchCompany : searchCompany,
						searchKey : searchKey,
						sname : sname,
						from_date : from_date,
						to_date : to_date,
						currentPage : currentPage ,
						pageSize : refundPageSize 				
				}
				
				var resultCallback = function(data){  
					
					refundListResult(data, currentPage);  
				}
				
				callAjax("/scm/selectedRefundList.do","post","text", true, param, resultCallback);
 	 }



/* 모달창(반품지시서) 띄우기 여기부터,
반품지시서 클릭하면 반품테이블에서 화면 조회해서 반품지시서에 뿌려야함 */
	function showRefundDocModal(refund_no){
		
			//모달 팝업 모양 오픈! (빈거) _ 팀장님이 만들어 놓으신 함수 쓰는거임. 
			gfModalPop("#refundDoc");
	
 	}
 	
/* 반품지시서 저장/수정 버튼 누르면 */
	function btnSaveUpdate() {

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
	
 	
 	


	/*회원정보 상세 조회*/
	function fdetailModal(loginID) {
		//alert(" 상세 조회  ");

		var param = {
			loginID : loginID
		};
		var resultCallback2 = function(data) {
			fdetailResult(data);
		};

		callAjax("/scm/detailrefund.do", "post", "json", true, param,
				resultCallback2);
		//alert(" 상세 조회  22");

	}

	/*  공지사항 상세 조회 -> 콜백함수   */
	/* function fdetailResult(data) {

		//alert("공지사항 상세 조회  33");
		if (data.resultMsg == "SUCCESS") {
			//모달 띄우기 
			gfModalPop("#refund");

			//alert(data.result);
			// 모달에 정보 넣기 
			frealPopModal(data.result);

		} else {
			alert(data.resultMsg);
		}
	} */

	/* ------------모달팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기 ------------- */
	
	
	 function btnPopUpModal(refund_no){
		
	}
	
	
	
	
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
					$("#chaDiv").hide();
					$("#selectChaDiv").show(); 
					$('#instaff').show();
					$('#outstaff').hide();
				} else {
					$('#instaff').hide();
					$('#outstaff').show();
					$("#selectChaDiv").hide();
				}
			});
			$("#chaDiv").hide(); // 담당업무 text박스 숨기기
			$("#btnDeleteUser").hide(); // 삭제버튼 숨기기
			$("#btnUpdateUser").hide();
			$("#btnSaveUser").show();

		} else {
			//alert(object.email_cop);
			//alert("숫자찍어보세 : " + object.wno);// 페이징 처리가 제대로 안되서
			
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
			
			var div_cd = object.div_cd.toString();
			alert(div_cd);

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
			
			
			
			$("#zipcode").val(object.user_zipcode);
			$("#address").val(object.user_address);
			$("#dt_address").val(object.user_dt_address);
			$("#btnDeleteUser").show(); // 삭제버튼 보이기 
			$("#btnSaveUser").hide();
			$("#btnUpdateUser").css("display", "");
			//if문써서 로그인 아이디 == 작성자 아이디 일치시  --- 추가하기 
			//$("#grp_cod").attr("readonly", false);  // false, true(읽기만)로 수정

		}
	}

	/* 팝업내 수정, 저장 validation */
	/* function fValidatePopup() {
		
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
	} */

	
	

	/* 저장 ,수정, 삭제 콜백 함수 처리  */
	/* function fSaveUserResult(data) {
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
		fSelectRefundList(currentPage); // 목록조회 함수 다시 출력 
		frealPopModal();// 입력폼 초기화
	}
 */
	/* 회원 등록(수정) */
	/* function fUpdateUser() {

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

	} */

	/* 회원 1건 삭제 */
	/* function fDeleteUser() {
		var con = confirm("정말 삭제하겠습니까? \n 삭제시 복구불가합니다.");
		if (con) {
			var resultCallback3 = function(data) {
				fSaveUserResult(data);
			}
			$("#action").val("D"); // delete
			callAjax("/scm/userSave.do", "post", "json", true, $("#myUser")
					.serialize(), resultCallback3);
			// num만 넘겨도되지만 그냥 귀찮으니깐...^^... 
		} else {
			gfCloseModal(); // 모달 닫기
			fSelectRefundListt(currentPage); // 목록조회 함수 다시 출력 
			frealPopModal();// 입력폼 초기화
		}
	} */
	
	/* 버튼7 창고지정 */
	function btnSaveWareOfRefund(){
		
		
	}
	
	

	
	
</script>

<style>
select
{
	background-color: white;
}
</style>

</head>
<body>
<!-- html 페이지 -->

<form id="refund action="" method="">
	<!-- ??? -->
	<input type="hidden" id="currentPage" value="1">  <!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
	<input type="hidden" id="tmpList" value=""> <!--?????이거뭐임??? -->
	<input type="hidden" id="tmpListNum" value=""> <!-- ?????스크립트에서 값을 설정해서 넘길거임 / 임시 리스트 넘버 -->
	<input type="hidden" name="action" id="action" value="">  <!-- ????? -->

	<div id="wrap_area">

		<h2 class="hidden">header 영역</h2>
		<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

		<h2 class="hidden">컨텐츠 영역</h2>
		<div id="container">
			<ul>
				<li class="lnb">
					<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
				</li>
				<li class="contents">
					<h3 class="hidden">contents 영역</h3> <!-- content -->
					<div class="content">

						<p class="Location">
							<a href="#" class="btn_set home">메인으로</a>  <!-- **나중에 채우기    -->
							<a href="#" class="btn_nav">거래 내역</a> 
								<span class="btn_nav bold">반품 신청 목록</span> <br>
								<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle"  id="searcharea">
							<span>반품 신청 목록 </span> 
							
							<span class="fr">
							<!-- <label><input type="checkbox" id="delcheck" name="delcheck" value="del"> 삭제된 정보 표시</label>  -->
							<select id="searchCompany" name="searchCompany" style="width: 80px;" v-model="searchKey">
									<option value="company_all" selected="selected">기업 전체</option>
									<option value="company_order" >기업 고객</option>
									<option value="company_purchase" >납품 기업</option>								
							</select> 
							
							<select id="searchKaEy" name="searchKey" style="width: 80px;" v-model="searchKey">
									<option value="refund_all" selected="selected">반품 전체</option>
									<option value="refund_no">반품 코드 번호</option>
									<option value="pro_no">제품 번호</option>
									<option value="pro_name" >제품명</option>								
							</select> 
			
							<input type="text" style="width: 160px; height: 30px;" id="sname" name="sname"> 
							 
							<!-- 데이터피커 -->							
							<input type="date" style="width: 120px" id="from_date" name="from_date">                         
                            <input type="date" style="width: 120px" id="to_date" name="to_date">
							
							<a href="" class="btnType blue" id="searchBtn" name="btn"><span>검색</span></a>
							</span>
						</p>
		
						
						<div class="div"> <!-- 화면에뿌려줄 목록 -->
							<table class="col">
								<caption>caption</caption>
	
								<thead>
									<tr>
									      <th scope="col">순서</th>
							              <th scope="col">반품 코드</th>
							              <th scope="col">기업 분류</th>
							              <th scope="col">기업 이름</th>
							              <th scope="col">제품 번호</th>
							              <th scope="col">제품 이름</th>
							              <th scope="col">반품 신청일</th>
							              <th scope="col">반품 수량</th>
							              <th scope="col">총 금액</th>		
							              <th scope="col">반품지시서</th>							              
									</tr>
								</thead>
								<tbody id="RefundList"></tbody>   <!-- 여기서 refundList.jsp 불러와서 바디에 뿌림. -->
							</table>
							
							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingnavi">
								<div class="paging">
									<a class="first" href="javascript:fSelectRefundList(1)">
									<span class="hidden">맨앞</span></a>
									<a class="pre" href="javascript:selectUserList(1)">
									<span class="hidden">이전</span></a>
									<strong>1</strong> 
									<a href="javascript:selectRefundList(2)">2</a> 
									<a href="javascript:selectRefundList(3)">3</a> 
									<a href="javascript:selectRefundList(4)">4</a>
									<a href="javascript:selectRefundList(5)">5</a>
									<a class="next" href="javascript:selectRefundListt(5)">
									<span class="hidden">다음</span></a>
									<a class="last" href="javascript:fSelectRefundList(5)">
									<span class="hidden">맨뒤</span></a>
								</div>
							</div>
											
						</div>
 						
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 반품지시서  모달 -->
	<div id="refundDoc" class="layerPop layerType2" style="width: 1000px; height: auto;">
		<input type="hidden" id="refund_no" name="modal"> <!-- 수정시 필요한 refund_no 값을 넘김  -->
           <dl>
			<dt>
				<strong>반품 지시서</strong>
			</dt>
			<dd class="content">
					<!-- 기업고객 모달창!  -->
				<table class="col">
					<caption>모달창첫줄</caption>
					<colgroup>
						<col width="10%">
						<col width="12%">
						<col width="10%">
						<col width="6%">
					</colgroup>

		
					<thead>
						<tr>
							<th scope="col">반품 코드 </th>
							<th scope="col">반품 신청일</th>
							<th scope="col">기업분류</th>
							<th scope="col">기업명</th>
						</tr>
					</thead>
					<tbody>
					<tr>
							<td id=""><input type="text" name="refund_no" id="refund_no" value = ""/></td>
							<td id=""><input type="text" name="refund_date" id="refund_date" value = ""/></td>  <!-- 나중에 데이트피커로 바꿔야 -->
							<td id=""><input type="text" name="type_company" id="type_company" value = ""/></td>
							<td id=""><input type="text" name="company_name" id="company_name" value = ""/></td>
							</tr>
					</tbody>
				</table>
				
				<table class="col">
					<caption>모달창둘째줄</caption>
					<colgroup>
						<col width="10%">
						<col width="12%">
						<col width="10%">
						<col width="6%">
					</colgroup>

					<thead>
						<tr>
							<th scope="col">제품 번호 </th>
							<th scope="col">제품명</th>
							<th scope="col">반품수량</th>
							<th scope="col">총 금액</th>
						</tr>
					</thead>
					<tbody>
					<tr>
							<td id=""><input type="text" name="pro_no" id="pro_no" value = ""/></td>
							<td id=""><input type="text" name="pro_name" id="pro_name" value = ""/></td>  
							<td id=""><input type="text" name="refund_qty" id="refund_qty" value = ""/></td>
							<td id=""><input type="text" name="total_price" id="total_price" value = ""/></td>
							</tr>
					</tbody>
				</table>
				
				<table class="col">
					<caption>모달창반품사유</caption>
					<colgroup>
						<col width="100%">						
					</colgroup>

					<thead>
						<tr>
							<th scope="col">반품사유</th>
						</tr>
					</thead>
					<tbody>
							<tr>
								<td id=""><input type="text" name="refund_note"
									id="refund_note" value="" /></td>
							</tr>
						</tbody>
				</table>
				
				<table class="row">
					<caption>선택박스</caption>
					<colgroup>
						<col width="15%">
						<col width="5%">
						<col width="10%">
						<col width="15%">
					</colgroup>

					<tbody>
						<tr>
							<th scope="row">창고 선택</th>
							<td><select style="width: 200px" id="pur_ware_name_option"
								name="pur_ware_name_option"
								onchange="fPurchaseSelectedOptions(this.options[this.selectedIndex].value, pur_ware_name_option)">
							</select></td>

							<th scope="row">재고 개수 <span class="font_red"></span></th>
							<td><input type="text" class="inputTxt p100"
							id="pur_pro_ware_qty_upper" readonly="readonly" /></td>
													
							<td><a href="javascript:btnSaveWareOfRefund();"
							 class="btnType blue"><span>창고지정</span></a>
							</td>
						</tr>

					</tbody>
				</table>
				

			
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveRd" name="btn"><span>저장</span></a>			
					<a href="" class="btnType blue" id="btnUpdateRd" name="btn" ><span>승인요청</span></a> 
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
		    </dd>
          </dl>
		<a href="" class="closePop"><span class="hidden">창닫기</span></a>
     </div>

	

</form>

</body>
</html>
  