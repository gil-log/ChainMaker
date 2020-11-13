<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
// 그룹코드 페이징 설정
var pageSizeProductList = 5;
var pageBlockSizeProductList = 5;

// 상세코드 페이징 설정
var pageSizeProductList = 5;
var pageBlockSizeProductList = 10;

var pageSizeComnGrpCod = 5;
var pageBlockSizeComnGrpCod = 5;

// 상세코드 페이징 설정
var pageSizeComnDtlCod = 5;
var pageBlockSizeComnDtlCod = 10;


$(function() {
	// 그룹코드 조회
	fListProductList();
});

/** 그룹코드 조회 */
function fListProductList(currentPage) {
	
	currentPage = currentPage || 1;
	
	console.log("currentPage : " + currentPage);
	
	var param = {
				currentPage : currentPage
			,	pageSize : pageSizeProductList
	}
	
	var resultCallback = function(data) {
		flistProductListResult(data, currentPage);
	};
	//Ajax실행 방식
	//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
	callAjax("/epc/listProductList.do", "post", "text", true, param, resultCallback);
}
/** 그룹코드 조회 콜백 함수 */
function flistProductListResult(data, currentPage) {
	
	//alert(data);
	console.log(data);
	
	// 기존 목록 삭제
	$('#listProductList').empty();
	
	// 신규 목록 생성
	$("#listProductList").append(data);
	
	// 총 개수 추출
	var totalCntProductList = $("#totalCntProductList").val();
	
	// 페이지 네비게이션 생성
	var paginationHtml = getPaginationHtml(currentPage, totalCntProductList, pageSizeProductList, pageBlockSizeProductList, 'fListProductList');
	console.log("paginationHtml : " + paginationHtml);
	//alert(paginationHtml);
	$("#ProductListPagination").empty().append( paginationHtml );
	
	// 현재 페이지 설정
	$("#currentPageProductList").val(currentPage);
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
								class="btn_nav">주문</a> <span class="btn_nav bold">제품목록
								</span> <a href="#" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle">
							<span>제품 목록</span> <span class="fr"> 
							</span>
						</p>
						
						<div class="divProductListList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">장비번호</th>
										<th scope="col">장비구분</th>
										<th scope="col">모델번호</th>
										<th scope="col">모델명</th>
										<th scope="col">제조사</th>
										<th scope="col">판매가격</th>
									
									</tr>
								</thead>
								<tbody id="listProductList"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="productListPagination"> </div>
	
						
	
						
						

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