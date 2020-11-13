<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ChainMaker 제품 목록</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">

// 그룹코드 페이징 설정
var pageSizeProductList = 5;
var pageBlockSizeProductList = 5;




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
// 검색 기능
function board_search(currentPage) {
    
    var sname = $('#sname');
    var searchKey = document.getElementById("searchKey");
	var oname = searchKey.options[searchKey.selectedIndex].value;
	
	currentPage = currentPage || 1;
	
	console.log("currentPage : " + currentPage);     
	
    var param = {
    		  sname : sname.val()
    	  ,	  oname : oname
          ,   currentPage : currentPage
          ,   pageSize : pageSizeProductList
    }
    
    var resultCallback = function(data) {
    	flistProductListResult(data, currentPage); 
    };
    
    callAjax("/epc/listProductList.do", "post", "text", true, param, resultCallback);
    
} 

/** 그룹코드 모달 실행 */
function fPopModalProductList(pro_num) {
	gfModalPop("#layer1");
	// 신규 저장
	
}


</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageProductList" value="1">
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
						
					<!--검색창   -->
					
                     
						<p class="conTitle">
							<span>제품 목록</span> <span class="fr"> 
							</span>
						</p>
						
						<table width="100%" cellpadding="5" cellspacing="0" border="1"
                        align="left"
                        style="border-collapse: collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                           <td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>
                           <td width="50" height="25" style="font-size: 100%; text-align:right;padding-right:25px;">
     	                       <select id="searchKey" name="searchKey" style="width: 150px;" v-model="searchKey">
									<option value="pro_cod_num" >그룹코드</option>
									<option value="" >그룹코드명</option>
							   </select> 
     	                       <select style="width:130px;">
						        <option value="" disabled selected>제조사선택</option>
						        <option value="1">전체</option>
						        <option value="2">모델 번호</option>
						        <option value="3">제조사</option>
						        
						      </select>
     	                       <input type="text" style="width: 150px; height: 25px;" id="sname" name="sname">                    
	                           <a href="javascript:board_search();" class="btnType blue" name="btn"><span>검  색</span></a>
                           </td> 
                           
                        </tr>
                     </table> &nbsp;&nbsp;
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
	
						<div class="paging_area"  id="ProductListPagination"></div>
	
						
	
						
						

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

<div id="layer1" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>그룹코드 관리</strong>
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
							<th scope="row">그룹 코드 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="grp_cod" id="grp_cod" /></td>
							<th scope="row">그룹 코드 명 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="grp_cod_nm" id="grp_cod_nm" /></td>
						</tr>
						<tr>
							<th scope="row">코드 설명 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name="grp_cod_eplti" id="grp_cod_eplti" /></td>
						</tr>
				
						<tr>
							<th scope="row">사용 유무 <span class="font_red">*</span></th>
							<td colspan="3"><input type="radio" id="radio1-1"
								name="grp_use_poa" id="grp_use_poa_1" value='Y' /> <label for="radio1-1">사용</label>
								&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" id="radio1-2"
								name="grp_use_poa" id="grp_use_poa_2" value="N" /> <label for="radio1-2">미사용</label></td>
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveGrpCod" name="btn"><span>저장</span></a> 
					<a href="" class="btnType blue" id="btnDeleteGrpCod" name="btn"><span>삭제</span></a> 
					<a href=""	class="btnType gray"  id="btnCloseGrpCod" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

</form>
</body>
</html>