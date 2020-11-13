<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>SupplierInfo</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript">


/*납품업체 페이징 처리*/
var pageSizeDelivery = 5;
var pageBlockSizeDelivery =5;



//제품정보 페이징 처리
var pageSizeProduct = 5;
var pageBlockSizeProduct = 5;


/*OnLoad event*/
$(function(){
	//납품업체 목록 조회
	fListDelivery();
	
	
	//버튼 이벤트 등록
	fRegisterButtonClickEvent();
});

/** 버튼 이벤트 등록 */
function fRegisterButtonClickEvent() {
	$('a[name=btn]').click(function(e) {
		e.preventDefault();
		
		var btnId = $(this).attr('id');
		
		//alert("btnId : " + btnId);
		
		switch(btnId){
		case 'searchBtn' : board_search();  // 검색하기
		break;
		}
	});

}		

//검색 기능
function board_search(currentPage) {
	
	$('#listProduct').empty();
	
	currentPage = currentPage || 1;
	
	var sname = $('#sname');
	var searchKey = document.getElementById("searchKey");
	var oname = searchKey.options[searchKey.selectedIndex].value;
	
	var param ={
				sname : sname.val()
			,	oname : oname
			,	currentPage : currentPage
			,	pageSize : pageSizeDelivery
	}

	var resultCallback = function(data) {
		flistDeliveryResult(data, currentPage);
		
	};
	
	callAjax("/scm/listDelivery.do", "post", "text", true, param, resultCallback); 
}



/*납품 업체 조회*/
function fListDelivery(currentPage) {
	
	currentPage = currentPage || 1;
	var sname = $('#sname');
	var searchKey = document.getElementById("searchKey");
	var oname = searchKey.options[searchKey.selectedIndex].value;
	
	console.log("currentPage : " + currentPage);
	
	var param = {
			sname : sname.val()
		,	oname : oname
		,	currentPage : currentPage
		,	pageSize : pageSizeDelivery
	}
	
	var resultCallback = function(data) {
		flistDeliveryResult(data, currentPage);
	}
	
	callAjax("/scm/listDelivery.do", "post", "text", true, param, resultCallback);
}



/*납품업체 조회 콜백 함수*/
function flistDeliveryResult(data, currentPage) {
	
	//alert(data);
	console.log(data);
	
	//기존 목록 삭제
	$('#listDelivery').empty();
	
	
	$("#listDelivery").append(data);
	
	// 총 개수 추출
	var totalDelivery = $("#totalDelivery").val();
	
	//페이지 네비게이션 생성
	var paginationHtml = getPaginationHtml(currentPage, totalDelivery, pageSizeDelivery, pageBlockSizeDelivery, 'fListDelivery');

	$("#deliveryPagination").empty().append( paginationHtml );
	//현재 페이지 설정
	
	
	console.log("totalDelivery: " + totalDelivery);
	$("#currentPageDelivery").val(currentPage);
}





	/*제품 목록 조회*/
	function fListProduct(currentPage, deli_company) {
										//납품업체명 매개변수 설정
		currentPage = currentPage || 1;

		$("#tmpdeli_company").val(deli_company);
		
		
		
		var param = {
				deli_company : deli_company //납품업체명 변수설정
			,	currentPage : currentPage
			,	pageSize : pageSizeProduct
			
		}
	
		
		console.log("deli_company : " + deli_company);
		
		var resultCallback = function(data) {
			flistProductResult(data, currentPage);
		};
		
		callAjax("/scm/listProduct.do", "post", "text", true, param, resultCallback);
	}
	
	/*제품목록 조회 콜백 함수*/
	function flistProductResult(data, currentPage) {
					
		//기존 목록 삭제
		$('#listProduct').empty();
		
					
		// 신규 목록 생성

		$("#listProduct").append(data);
		//$("#listProduct").append($listProduct.children());	
		
		// 총 개수 추출
		var totalProduct = $("#totalProduct").val();
	

	
		//페이지 네비게이션 생성
		var deli_company = $("#tmpdeli_company").val();
		var paginationHtml = getPaginationHtml(currentPage, totalProduct, pageSizeProduct, pageBlockSizeProduct, 'fListProduct', [deli_company]);					
		console.log("paginationHtml : " + paginationHtml);
		$("#productPagination").empty().append( paginationHtml );

		console.log("totalProduct: " + totalProduct);
		// 현재 페이지 설정
		$("#currentPageProduct").val(currentPage);
		
	}

	
	
</script>
</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageDelivery" value="1">
	<input type="hidden" id="currentPageProduct" value="1">
	<input type="hidden" id="tmpdeli_company" value="">
	<input type="hidden" name="action" id="action" value="">
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
						class="btn_nav">기준 정보</a> <span class="btn_nav bold">납품 업체
						정보</span> <a href="#" class="btn_set refresh">새로고침</a>
				</p>
				
				<p class="conTitle">
					<span>납품 업체 정보</span>
					<span class="fr"> 
					<select id="searchKey" name="searchKey" style="width: 80px;" v-model="searchKey">
							<option value="del_nm" selected="selected">납품 업체</option>
							<option value="pro_nm" >제품명</option>
					</select> 

					<input type="text" style="width: 160px; height: 30px;" id="sname" name="sname">  
						<a href="" class="btnType blue" id="searchBtn" name="btn"><span>검  색</span></a>
					</span>
				</p>
				
				
				<div class="DeliveryList">
					<table class="col">
						<caption>caption</caption>
						<colgroup>
							<col width="11%">
							<col width="11%">
							<col width="12%">
							<col width="5%">
							<col width="10%">
						</colgroup>

						<thead>
							<tr>
								<th scope="col">납품업체명</th>
								<th scope="col">LOGINID</th>
								<th scope="col">패스워드</th>
								<th scope="col">담당자명</th>
								<th scope="col">담당자 연락처</th>

							</tr>
						</thead>
						<tbody id="listDelivery"></tbody>
					</table>
				</div>

				<div class="paging_area"  id="deliveryPagination"> </div>

				<p class="conTitle mt50">
					<span>제품 정보</span>
				</p>


				<div class="ProductList">
					<table class="col">
						<caption>caption</caption>
						<colgroup>
							<col width="36%">
							<col width="32%">
							<col width="32%">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">제품번호</th>
								<th scope="col">제품명</th>
								<th scope="col">납품단가</th>
							</tr>
						</thead>
						<tbody id="listProduct">
							<tr>
								<td colspan="12">그룹코드를 선택해 주세요.</td>
							</tr>
						</tbody>
					</table>
				</div>
				
				<div class="paging_area"  id="productPagination"> </div>


			</div> <!--// content -->

			<h3 class="hidden">풋터 영역</h3>
				<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>
</form>
</body>
</html>