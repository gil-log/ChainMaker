<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>refundBuyer</title>

<!-- common Include -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script>
	//상단테이블 페이징 설정
	var pageSizeRefundBuyerList = 5;
	var pageBlockSizeRefundBuyerList = 10;
	
	//하단테이블 페이징 설정
	var pageSizeRefundBuyerDtlList = 5;
	var pageBlockSizeRefundBuyerDtlList = 10;
	
	//Vue.js 사용 변수 설정
	var searchvm;
	var refundBuyerListvm;
	var refundBuyerDtlListvm;
	
	//페이지로드 작동 메서드
	$(document).ready(function(){
		
		init();
		
		//창고별 제품 목록 조회		
		whInventoryList();
		
		//데이트피커 활성화        
        $("#startDate").datepicker({
        })
        $("#endDate").datepicker({        	
        	minDate:-1
        })
	});
	
	function init(){
		
		searchvm = new Vue({
			el:"#searchArea",
			data:{
				searchKey:'all',
				searchWord:'',
				startDate:'',
				endDate:''
			}
		})
		
		refundBuyerListvm = new Vue({
			el:"#divRefundBuyerList",
			components:{	
				"bootstrap-table":BootstrapTable
			},
			data:{
				items:[],
				ware_name:'',
				pro_name:'',
				ware_no:'',
				pro_no:'',
			},
			methods:{
				rowClick:function(row){
					
					//알람 삭제 예정
					//alert("sub 그리드 연결~!");
					
					var tdArr = new Array();
					
					//클릭된 row (#divWHInventoryList > <tr>)
					var tr=$(row);
					var td=tr.children();
					
					td.each(function(i){
						tdArr.push(td.eq(i).text());
					});
					console.log("tdArr[0] : " + tdArr[0]);					
					console.log("tdArr[1] : " + tdArr[1]);					
					console.log("tdArr[2] : " + tdArr[2]);					
					console.log("tdArr[3] : " + tdArr[3]);					
					console.log("tdArr[4] : " + tdArr[4]);					
					console.log("tdArr[5] : " + tdArr[5]);					
					console.log("tdArr[6] : " + tdArr[6]);					
					
					//this.ware_no = tdArr[0];
					
					whProductList();
				}
			}
		});
		
		refundBuyerDtlListvm = new Vue({
			el:"#divRefundBuyerDtlList",
			components:{	
				"bootstrap-table":BootstrapTable
			},
			data:{
				items:[]				
			}
		});
	}
	
	//창고별 재고 조회
	function refundBuyerList(currentPage){
		currentPage=currentPage || 1;
		
		/* console.log("currentPage : " + currentPage + "\npageSizeWHInventory : " + pageSizeWHInventory 
				+ "\nsearchvm.searchKey : " + searchvm.searchKey + "\nsearchvm.searchWord : " + searchvm.searchWord); */
		
		var param={
				currentPage : currentPage,
				pageSize : pageSizeWHInventory,
				searchKey : searchvm.searchKey,
				searchWord : searchvm.searchWord,
				startDate : searchvm.startDate,
				endDate : searchvm.endDate
		}
		
		var resultCallback = function(data){
			refundBuyerListResult(data, currentPage);			
		}
		
		callAjax("/dlm/refundBuyerList.do", "post", "json", true, param, resultCallback);
	}
	//창고별 재고 조회 콜백
	function refundBuyerListResult(data, currentPage){
		//console.log(data);
		
		refundBuyerListvm.items=[];
		refundBuyerListvm.items=data.listrefundBuyer;
		
		//총 개수 추출
		var refundBuyerListTotal=data.refundBuyerListTotal;
		
		//페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, refundBuyerListTotal, pageSizeRefundBuyerList, pageBlockSizeRefundBuyerList, "refundBuyerList");
		
		$("#listRefundBuyerPagination").empty().append( paginationHtml );
		
		$("#currentPageRefundBuyerList").val(currentPage);		
	}
	
	
	
	//제품별 입출고 내역 (특정 창고의 특정 제품 입출고 내역)
	function refundBuyerDtlList(currentPage){
		currentPage=currentPage || 1;
		
		//알람 삭제 예정
		//alert("ware_name : " + whInventoryvm.ware_name + "\npro_name : " + whInventoryvm.pro_name + "\n서브그리드 작동 확인");
		
		var param={
				currentPage : currentPage,
				pageSize : pageSizeRefundBuyerDtlList,	
				ware_name : whInventoryvm.ware_name,
				pro_name : whInventoryvm.pro_name,
				ware_no :  whInventoryvm.ware_no,
				pro_no : whInventoryvm.pro_no
		}
		//alert("param : " + param + "\nparam 진행 확인");
		
		var resultCallback = function(data){
			refundBuyerDtlListResult(data, currentPage);
		}
		
		callAjax("/dlm/refundBuyerDtlList.do", "post", "json", true, param, resultCallback);
	}
	//제품별 입출고 내역 (특정 창고의 특정 제품 입출고 내역) 콜백
	function refundBuyerDtlListResult(data, currentPage){
		
		whproductvm.items=[];
		whproductvm.items=data.refundBuyerDtlList;
		
		//총 개수 추출
		var refundBuyerDtlListTotal=data.refundBuyerDtlListTotal;
		//페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, refundBuyerDtlListTotal, pageSizeRefundBuyerDtlList, pageBlockSizeRefundBuyerDtlList, "refundBuyerDtlList");
		
		$("#listRefundBuyerDtlListPagination").empty().append( paginationHtml );
		
		$("#currentPageRefundBuyerDtlList").val(currentPage);
	} 
</script>

</head>
<body>	
	<form id="myForm" action=""  method="">
		<input type="hidden" name="currentPageRefundBuyerList" id="currentPageRefundBuyerList" value="">
		<input type="hidden" name="currentPageRefundBuyerDtlList" id="currentPageRefundBuyerDtlList" value="">
		
		<div id="wrap_area">
		
			<!-- header Include -->
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>
			
			<div id="container">
				<ul>
					<li class="lnb">
					
						<!-- lnb Include --> 
						<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include>
						
					</li>
					<li class="contents">						
						<div class="content">
							
							<!-- 메뉴 경로 영역 -->
							<p class="Location">
								<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <a href="#"
									class="btn_nav">기업 고객</a> <span class="btn_nav bold">반품 지시서 목록</span> <a href="/dlm/refundBuyer.do" class="btn_set refresh">새로고침</a>
							</p>
							
							<!-- 검색 영역 -->
							<p class="search">
	
							</p>
							<p class="conTitle" id="searchArea">
								 <span>기업고객_반품 지시서 목록_배송담당자</span>
								 <span class="fr"> 
									<select id="searchKey" name="searchKey" style="width: 80px;" v-model="searchKey">
									    <option value="all" id="option1" selected="selected" >검색 조건</option>
										<option value="user_company" id="option2">업체 명</option>
									</select> 
									<input type="text" id="searchWord" name="searchWord" v-model="searchWord" placeholder="검색어를 입력해주세요." style="height: 28px;"> 
									<input type="text" id="startDate" placeholder="시작일 선택" style="height: 28px;width: 80px" readonly="readonly"></input>
									<input type="text" id="endDate" placeholder="종료일 선택" style="height: 28px;width: 80px" readonly="readonly"></input>
									<a class="btnType blue" href="javascript:whInventoryList()"onkeydown="enterKey()" name="search">
									<span id="searchEnter">검색</span>
									</a>			
								</span>
							</p>
							
							<!-- 상단 테이블 영역 -->
							<div class="divRefundBuyerList" id="divRefundBuyerList">
								<table class="col">
									<colgroup>
									    <col width="8%">
										<col width="15%">
										<col width="10%">
										<col width="10%">
									</colgroup>
					
									<thead>
										<tr>
										    <th scope="col">번호</th>
											<th scope="col">업체 명</th>
											<th scope="col">총액</th>
											<th scope="col">반품처리일</th>
										</tr>
									</thead>
									
									<!-- 상단테이블 DB데이터 출력 영역 -->
									<tbody id="listRefundBuyer">
									<!-- whInventoryvm에 담긴 items의 정보를 가져와 테이블에 뿌리는 코드 (Vue.js) -->
										<template v-for="(row, index) in items" v-if="items.length">
											<tr onclick="whInventoryvm.rowClick(this)">
											    <td>{{ row.no }}</td>
												<td>{{ row.user_company }}</td>
												<td>{{ row.refund_amount }}</td>
												<td>{{ row.refund_date }}</td>	
											</tr>
										</template>
									</tbody>
								</table>
							</div>	<!-- .divWhInventoryList 종료 -->
							
							<!-- 상단테이블 페이지 네비게이션 영역 -->
							<div class="pagingArea"  id="listRefundBuyerPagination"> </div>
							
							<p class="conTitle mt50">
								<span>반품 지시서_상세 내역</span> 
								<span class="fr"></span>
							</p>
							
							<!-- 하단 테이블 영역 -->
							<div class="divRefundBuyerDtlList" id="divRefundBuyerDtlList">
								<table class="col">
									<colgroup>
										<col width="8%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="15%">
										<col width="15%">
										<col width="10%">
									</colgroup>
		
									<thead>
										<tr>
										    <th scope="col">번호</th>
										    <th scope="col">장비 번호</th>
										    <th scope="col">장비 구분</th>
											<th scope="col">모델 번호</th>											
											<th scope="col">모델 명</th>
											<th scope="col">제조사</th>
											<th scope="col">판매 가격</th>
										</tr>
									</thead>
									
									<!-- 하단테이블 DB 데이터 출력 영역 -->
									<tbody id="listRefundBuyerDtlList">
										<template v-for="(row, index) in items" v-if="items.length">
											<tr>
												<td>{{ row.no }}</td>
												<td>{{ row.pro_no }}</td>
												<td>{{ row.pro_name }}</td>
												<td>{{ row.pro_detail }}</td>
												<td>{{ row.pro_model_name }}</td>					
												<td>{{ row.pro_manu_name }}</td>																	
												<td>{{ row.pro_price }}</td>																	
											</tr>
										</template>
									</tbody>
								</table>
							</div>
						<!-- 하단테이블 Pagenation 영역 -->
						<div class="pagingArea"  id="listRefundBuyerDtlListPagination"> </div>
						</div>	<!-- .content 종료 -->
					</li>	<!-- .content 종료 -->
				</ul>				
			</div>	<!-- #container 종료 -->
			
			<!-- footer Include -->
			<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
			
		</div>	<!-- #wrap_area 종료 -->
	</form>	
</body>
</html>