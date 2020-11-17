<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="kr.happyjob.chainmaker.scm.model.ProductInfoModel" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
<title>제품정보 관리</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

	// 페이징 설정 
	var userPageSize = 10;    	// 화면에 뿌릴 데이터 수 
	var userPageBlock = 5;		// 블럭으로 잡히는 페이징처리 수
	
	/* onload 이벤트  */
	$(function(){
		// 자유게시판 리스트 뿌리기 함수 
		selectUserList();
		
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
			case 'btnSavePro' : fSaveProduct(); // save 안에 저장,수정
				//alert("저장버튼 클릭!!!이벤트!!");
				break;
			case 'btnDeletePro' : fDeleteProduct();	// 만들자 
				//alert("삭제버튼 클릭!!!이벤트!!");		
				break;
			case 'btnClose' : gfCloseModal();  // 모달닫기 
			selectNoticeList(); // 첫페이지 다시 로딩 
				break;
			case 'btnUpdatePro' : fUpdateUser();  // 수정하기
				break;
			case 'searchBtn' : board_search();  // 검색하기
			break;
			
				
			//case 'commentWrite' : fCommentInsert();   // 댓글--> 답변글로 변경 // 저장 
				//break;
			}
		});
	}
	
	/* 사용자목록 리스트 불러오기  */
	function selectUserList(currentPage){
		
		currentPage = currentPage || 1;   // or		
		
//alert("지금 현재 페이지를 찍어봅시다. " + currentPage);
		
		var param = {
				currentPage : currentPage ,
				pageSize : userPageSize 
		}
		
		var resultCallback = function(data){  // 데이터를 이 함수로 넘깁시다. 
			userListResult(data, currentPage); 
		}
		
		
		callAjax("/scm/productList.do","post","text", true, param, resultCallback);
		
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
	    
		 
	 }
	 
 	 //검색  
	 function board_search(currentPage) {
	      
	      currentPage = currentPage || 1;
	         
	         var sname = $('#sname');
	         var oname = $('#oname');
	         
	         var param = {
	        		 sname : sname.val()
	        	   , oname : oname.val()
	               ,   currentPage : currentPage
	               ,   pageSize : userPageSize
	         }
	         
	         var resultCallback = function(data) {
	        	 userListResult(data, currentPage); 
	         };
	         
	         callAjax("/scm/productList.do", "post", "text", true, param, resultCallback);
	   } 
	 
	
	 
	 /* 회원관리 모달창(팝업) 실행  여기부터 */
	 function fUserModal(pro_no) {
		 //alert("모달");
		 // 신규저장 하기 버튼 클릭시 (값이 null)
		 if(pro_no == null || pro_no==""){
			// Tranjection type 설정
			//alert("넘을 찍어보자!!!!!!" + nt_no);
			
			$("#action").val("I"); // insert 
			frealPopModal(pro_no); //  초기화 
			
			//모달 팝업 모양 오픈! (빈거) _ 있는 함수 쓰는거임. 
			gfModalPop("#user");
			
		 }else{
			// Tranjection type 설정
			$("#action").val("U");  // update
			fdetailModal(pro_no); //번호로 -> 상품 상세 조회 팝업 띄우기
		 }

	 }
	 
	 
	 /*회원정보 상세 조회*/
	 function fdetailModal(pro_no){
		 //alert(" 상세 조회  ");
		 
		 var param = {pro_no : pro_no};
		 var resultCallback2 = function(data){
			 fdetailResult(data);
		 };
		 
		 callAjax("/scm/detailProduct.do", "post", "json", true, param, resultCallback2);
		 //alert(" 상세 조회  22");
		 
	 }
	 
	 /*  공지사항 상세 조회 -> 콜백함수   */
	 function fdetailResult(data){

		 //alert("공지사항 상세 조회  33");
		 if(data.resultMsg == "SUCCESS"){
			 //모달 띄우기 
			 gfModalPop("#user");
			 
			 //alert(data.result);
			// 모달에 정보 넣기 
			frealPopModal(data.result);
		 
		 }else{
			 alert(data.resultMsg);
		 }
	 }
	 
	 /* 팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기  */
	 function frealPopModal(object){
		 
		 if(object == "" || object == null || object == undefined){
			 
			 $("#pro_model_no").val(""); // pro_model_no 되돌리기
			 $("#pro_model_no").attr("readonly", false); // pro_model_no 되돌리기
			 $("#pro_model_no").css("border",""); // pro_model_no 되돌리기

			 $("#pro_no").val(""); // pro_model_no 되돌리기
			 $("#pro_no").attr("readonly", false); // pro_model_no 되돌리기
			 $("#pro_no").css("border",""); // pro_model_no 되돌리기
			 
			 
			 $("#pro_model_name").val("");
			 $("#pro_name").val("");
			 $("#pro_cd").val("");
			 $("#pro_manu_name").val("");
			 $("#pro_price").val("");
			 
			 $("#deli_company").val("");
			 $("#pro_deli_price").val("");
			 $("#pro_detail").val("");
			 $("#thumbnail").val("");
			 $("#tempImg").attr("src", "/images/admin/comm/no_image.png");
			 
			 $("#btnDeletePro").hide(); // 삭제버튼 숨기기
			 $("#btnUpdatePro").hide();
			 $("#btnSavePro").show();
			
			 
		 }else{
			 $("#pro_model_no").val(object.pro_model_no);
			 $("#pro_model_no").attr("readonly", true); // pro_model_no 수정불가 
			 $("#pro_model_no").css("border","none"); // pro_model_no 수정불가 
			 
			 $("#pro_no").val(object.pro_no);
			 $("#pro_no").attr("readonly", true); // pro_no 수정불가 
			 $("#pro_no").css("border","none"); // pro_no 수정불가 
			 
			 $("#pro_model_name").val(object.pro_model_name);
			 $("#pro_name").val(object.pro_name);
			 //$("#pro_cd option:selected").val(object.pro_cd);
			 $("#pro_cd").val(object.pro_cd).change(); 
			 $("#pro_manu_name").val(object.pro_manu_name);
			 $("#pro_price").val(object.pro_price);
			 
			 $("#deli_company").val(object.deli_company);
			 $("#pro_deli_price").val(object.pro_deli_price);
			 $("#pro_detail").val(object.pro_detail);
			 $("#thumbnail").val("");
			 $("#tempImg").attr("src", object.file_fname); // !!!!!!!!여기에 파일 저장 경로 추가하기!!!!!!!
			 
			 $("#btnDeletePro").show(); // 삭제버튼 보이기 
			 $("#btnSavePro").hide();
			 $("#btnUpdatePro").css("display","");
			 //if문써서 로그인 아이디 == 작성자 아이디 일치시  --- 추가하기 
			 //$("#grp_cod").attr("readonly", false);  // false, true(읽기만)로 수정
			
			 
		 }
	 }
	 
	 
	 /* 팝업내 수정, 저장 validation */
	 function fValidatePopup(){
		 var chk = checkNotEmpty(
				 [
					 ["pro_no", "제품번호를 입력해주세요!"],
					 ["pro_name", "제품명을 입력해주세요!"],
					 ["pro_cd", "제품코드를 선택해주세요!"],
					 ["pro_model_no", "모델번호를 입력해주세요!"],
					 ["pro_model_name", "모델명을 입력해주세요!"],
					 ["pro_manu_name", "제조사를 입력해주세요!"],
					 ["pro_price", "제품 가격을 입력해주세요!"],
					 ["deli_company", "납품업체명을 입력해주세요!"],
					 ["pro_deli_price", "납품단가를 입력해주세요!"]
				 ]
		 );
		 
	 
	 	if(!chk){return;}
	 	return true;
	 }
	 
	 /* 제품 등록(저장) */
	 function fSaveProduct(){
		 
		 //alert("저장 함수 타는지!!!!!?? ");
		 // validation 체크 
		 if(!(fValidatePopup())){ return; }
		 
		 var resultCallback3 = function(data){
			 fSaveProductResult(data);
			
		 };
		 
		var frm = document.getElementById("myProduct");
		frm.enctype = 'multipart/form-data';
		var dataWithFile = new FormData(frm);
		 
		 $("#action").val("I");  // insert
		 
		 callAjaxFileUploadSetFormData("/scm/productSave.do", "post", "json", true, dataWithFile, resultCallback3);
	 	// $("#myNotice").serialize() => 직렬화해서 name 값들을 그냥 넘김.
		 
	 }
	 
	 
	 /* 저장 ,수정, 삭제 콜백 함수 처리  */   
	 function fSaveProductResult(data){
		 var currentPage = currentPage || 1; 
		
		 if($("#action").val() != "I"){
			 currentPage = $("#currentPage").val();
		 }
		 
		 if(data.resultMsg == "SUCCESS"){
			 //alert(data.resultMsg);	// 받은 메세지 출력 
			 alert("저장 되었습니다.");
		 }else if(data.resultMsg == "UPDATE") {
			 alert("수정 되었습니다.");
		 }else if(data.resultMsg == "DELETE") {
			 alert("삭제 되었습니다.");
		 }else{
			 alert(data.resultMsg); //실패시 이거 탄다. 
			 alert("실패 했습니다.");
		 }
		 
		 gfCloseModal();	// 모달 닫기
		 selectUserList(currentPage); // 목록조회 함수 다시 출력 
		 frealPopModal();// 입력폼 초기화
	 }
	 
	 /* 회원 등록(수정) */
	 function fUpdateUser(){
		 
		 //alert("수정  함수 타는지!!!!!?? ");
		 // validation 체크 
		 if(!(fValidatePopup())){ return; }
		 
		 var resultCallback3 = function(data){
			 fSaveProductResult(data);
		 };
		 
		 $("#action").val("U");  // update
		 
		 callAjax("/system/userSave.do", "post", "json", true, $("#myUser").serialize(), resultCallback3);
	 	// $("#myQna").serialize() => 직렬화해서 name 값들을 그냥 넘김.
	 	
	 	
	 }
	 
	 /* 회원 1건 삭제 */
	 function fDeleteProduct(){
		 var con = confirm("정말 삭제하겠습니까? \n 삭제시 복구불가합니다."); 
		 if(con){
			 var resultCallback3 = function(data){
				 fSaveProductResult(data);
			 }
			 $("#action").val("D");  // delete
			 callAjax("/scm/productDel.do", "post", "json", true, $("#myProduct").serialize(), resultCallback3);
			 // num만 넘겨도되지만 그냥 귀찮으니깐...^^... 
		 }else{
			 gfCloseModal();	// 모달 닫기
			 selectUserList(currentPage); // 목록조회 함수 다시 출력 
			 frealPopModal();// 입력폼 초기화
		 }
	 }
	 
/* 	 function Optionloop(){
	 
	 	const mySelect = document.querySelector("mySelect");
	 	for(){
	 		var tempOption = document.createElement("option"); 
	 		mySelect.add(opt, null);
	 	}
	 } */



</script>


</head>
<body>
	<!-- ///////////////////// html 페이지  ///////////////////////////// -->

<form id="myProduct" action="" method="">
	
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
							<a href="#" class="btn_nav">기준 정보</a> 
								<span class="btn_nav bold">제품정보 관리</span> 
								<a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>제품정보 관리 </span> <span class="fr"> 
								<c:set var="nullNum" value=""></c:set>
								<a class="btnType blue" href="javascript:fUserModal(${null});" name="modal">
								<span>신규등록</span></a>
							</span>
						</p>
						
					<!--검색창   -->
					<table width="100%" cellpadding="5" cellspacing="0" border="1"
                        align="left"
                        style="border-collapse: collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                           <td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>
                           <td width="50" height="25" style="font-size: 100%; text-align:right;padding-right:25px;">
     	                       <select id="oname" name="oname" style="width:130px;height:27px">
						        <option value="all" disabled selected>검색 조건</option>
						        <option value="all">전체</option>
						        <option value="model_no">모델 번호</option>
						        <option value="pro_nm">제품명</option>
						        <option value="model_nm">모델명</option>
						        <option value="manu_nm">제조사</option>
						      </select>
     	                       <input type="text" style="width: 150px; height: 25px;" id="sname" name="sname">                    
	                           <a href="" class="btnType blue" id="searchBtn" name="btn"><span>검  색</span></a>
                           </td> 
                           
                        </tr>
                     </table> &nbsp;&nbsp;
						
						
						<div class="divUserList">
							<table class="col">
								<caption>caption</caption>
	
								<thead>
									<tr>
									      <th scope="col"></th>
									      <th scope="col">모델 번호</th>
							              <th scope="col">모델명</th>
							              <th scope="col">제품 번호</th>
							              <th scope="col">제품명</th>
							              <th scope="col">제조사</th>
							              <th scope="col">판매가</th>
							              <th scope="col">납품 업체</th>
							              <th scope="col">납품가</th>
							              
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

		
					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

	<!-- 회원관리 모달 -->
		<div id="user" class="layerPop layerType2" style="width: 1000px; height: auto;">
		<input type="hidden" id="loginID" name="loginID"> <!-- 수정시 필요한 num 값을 넘김  -->
           <dl>
			<dt>
				<strong>제품정보 관리</strong>
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
							<th scope="row">제품 번호 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" maxlength="15" name="pro_no" id="pro_no" /></td>
													
						</tr>
						<tr>
							<th scope="row">모델 번호 <span class="font_red">*</span></th>
							<td><input type="text" maxlength="15" name="pro_model_no" id="pro_model_no"/></td>
							
							<th scope="row">제품 코드 <span class="font_red">*</span></th>
							<td>  
							<select name="pro_cd" id="pro_cd" style="width:129px; height:16.25px">
							<!--model or session에서 넘어온 데이터 자바스크립트에서 뿌리기 11/12 21:21 note -->
								<c:forEach var="tempCdlist" items="${cdListObj}">
						         	<option value="${tempCdlist.detail_code}">${tempCdlist.detail_name}</option>
						        </c:forEach>
							</select>
							<!--<input type="text" maxlength="15" name="pro_cd" id="pro_cd" >--></td>	
						</tr>					
						<tr>
							<th scope="row">제품명 <span class="font_red">*</span></th>
							<td><input type="text" maxlength="15" name="pro_name" id="pro_name" ></td>
							
							<th scope="row">모델명 <span class="font_red">*</span></th>
							<td><input type="text" maxlength="15" name="pro_model_name" id="pro_model_name" /></td>
						</tr>
						<tr>
							<th scope="row">제조사 <span class="font_red">*</span></th>
							<td><input type="text" maxlength="15" name="pro_manu_name" id="pro_manu_name" /></td>
							
							<th scope="row">제품 가격 <span class="font_red">*</span></th>
							<td><input type="text" maxlength="10" name="pro_price" id="pro_price" onkeydown="fFilterNumber(event)" ></td>							
						</tr>
						<tr>
							<th scope="row">납품 업체 <span class="font_red">*</span></th>
							<td><input type="text" maxlength="15" name="deli_company" id="deli_company" /></td>
							
							<th scope="row">납품 단가 <span class="font_red">*</span></th>
							<td><input type="text" maxlength="10" name="pro_deli_price" id="pro_deli_price" onkeydown="fFilterNumber(event)" ></td>							
						</tr>
						
						<tr>
							
							<th scope="row">상세 정보</th>
							<td colspan="3">
							<textarea id="pro_detail" maxlength="500" name="pro_detail" style="height:130px;outline:none;resize:none;" placeholder="여기에 상세정보를 적어주세요.(500자 이내)"></textarea>
							</td>
								
						</tr>		

						
						<tr>
		                    <th scope="row">대표 이미지</th>
		                    <td class="thumb">
		                        <span> 
								<input name="thumbnail" type="file" id="thumbnail" accept="image/* " required>
		
										<!-- 파일 미리보기 스크립트 영역 -->
								       <script>
								       var file = document.querySelector('#thumbnail');
										
								       file.onchange = function () { 
								           var fileList = file.files ;
								           
								           // 읽기
								           var reader = new FileReader();
								           reader.readAsDataURL(fileList [0]);
								           //로드 한 후
								           reader.onload = function  () {
								               //로컬 이미지를 보여주기
								               
								               //썸네일 이미지 생성
								               var tempImage = new Image(); //drawImage 메서드에 넣기 위해 이미지 객체화
								               tempImage.src = reader.result; //data-uri를 이미지 객체에 주입
								               tempImage.onload = function() {
								                   //리사이즈를 위해 캔버스 객체 생성
								                   var canvas = document.createElement('canvas');
								                   var canvasContext = canvas.getContext("2d");
								                   
								                   //캔버스 크기 설정
								                   canvas.width = 400; //가로 400px
								                   canvas.height = 400; //세로 400px
								                   
								                   
								                   //이미지를 캔버스에 그리기
								                   canvasContext.drawImage(this, 0, 0, 400, 400);
								                   //캔버스에 그린 이미지를 다시 data-uri 형태로 변환
								                   var dataURI = canvas.toDataURL("image/jpeg");
								                   
								                   //썸네일 이미지 보여주기
								                   document.querySelector('#tempImg').src = dataURI;
								               };
								           }; 
								       };
		                            </script>
		                            <!-- 파일 미리보기 스크립트 영역 끝 -->
		                            </span>
								 </td>
								 <td colspan="2" style="text-align:center;">
								 	<img id="tempImg" style="object-fit: cover;" src="/images/admin/comm/no_image.png" alt="제품사진미리보기">
								 </td>
                	</tr>		
						
					</tbody>
					
				</table>
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnUpdatePro" name="btn" style="display:none"><span>수정</span></a> 
					<a href="" class="btnType blue" id="btnDeletePro" name="btn" ><span>삭제</span></a> 
					<a href="" class="btnType blue" id="btnSavePro" name="btn"><span>저장</span></a>			
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
		    </dd>
          </dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
     </div>

	

</form>

</body>
</html>