<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>발주 지시서</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- duDatePicker import css-->
<link rel="stylesheet" type="text/css" href="${CTX_PATH}/css/duDatePicker/duDatepicker.css">

<!-- duDatePicker import js -->
<script type="text/javascript" src="${CTX_PATH}/js/duDatePicker/duDatepicker.js"></script>
<!-- excel export import -->


<script type="text/javascript">

	// 과정 페이징 설정
	var pageListSize = 10;
	var pageBlockSize = 5;
	
	var svm;
	var vm;

	var unstsearch = true;;
	
	/** OnLoad event */ 
	$(document).ready(function() {
		


	    
		init();
		
		// 강의목록 조회
		fPurchasedirList();
		
		//duDatepicker init()
		$('#daterange').duDatepicker({
			format: 'yyyy/mm/dd',
			range: true,
			theme: 'blue',
			clearBtn : true,
			maxDate : 'today'
			});
		
	});
	

	function init() {
		
		//변수에 넣어서 가져다 쓰기 위해서 변수를 사용한거다.
		svm = new Vue({
		                           el: '#searcharea',  
		                         data: {
		                        	      searchKey : 'all'
		                        	     ,searchWord : ''
		                               }
		            });
	    
		vm = new Vue({
			  el: '#divPurchaseList',
			  components: {
			    'bootstrap-table': BootstrapTable
			  },
			  data: {
			    items: []
			   ,no: ''
			  },
			  methods:{					
				  rowClicked:function(row){
					  
					  var tdArr = new Array(); // 배열
						
					  //현재 클릭된 Row(<tr>)
					  var tr = $(row);
					  var td = tr.children();
					
					  td.each(function(i){
						tdArr.push(td.eq(i).text());
					  });
					
					  console.log(tdArr);
					  
					  console.log("tdArr[0] : " + tdArr[0]);
					  
					  this.no = tdArr[0];
					  
					  unstsearch =true;
					  
					  fListstudent();
					  
					  
	                  //console.log("배열에 담긴 값 : "+tdArr[1]);	 
				  },  			  
			  }
			});	  

	};	
	
	
	/** 과정 조회 */
	function fPurchasedirList(currentPage) {
		
		currentPage = currentPage || 1;
		
		console.log("currentPage : " + currentPage + " svm.searchKey : " + svm.searchKey + " svm.searchWord : " + svm.searchWord);
		
		const fromDate = $("#daterange").attr('data-range-from');
		const toDate = $("#daterange").attr('data-range-to');
		console.log("fromDate :" + fromDate);
		console.log("toDate :" + toDate);
		console.log("svm.searchKey : " + svm.searchKey);
		console.log("svm.searchWord : " + svm.searchWord);
		
		var param = {
					currentPage : currentPage
				,	pageSize : pageListSize
				,	fromDate : fromDate
				,	toDate : toDate
				,   searchKey : svm.searchKey
				,   searchWord : svm.searchWord
		}
		
		
		
		var resultCallback = function(data) {
			fPurchasedirListResult(data, currentPage);
		};
		//Ajax실행 방식
		//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
		callAjax("/scm/directionList.do", "post", "json", true, param, resultCallback);
	}
	
	
	/** 발주 지시서 조회 콜백 함수 */
	function fPurchasedirListResult(data, currentPage) {
		
		//alert(data);
		console.log(data);
		
		vm.items=[];
		vm.items=data.dirList;
		
		// 총 개수 추출
		var totalCntCourse = data.totalCount;

		// 페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCntCourse, pageListSize, pageBlockSize, 'fPurchasedirList');
		
		console.log("paginationHtml : " + paginationHtml);
		//alert(paginationHtml);
		$("#listPagination").empty().append( paginationHtml );
		
		$("#currentPage").val(currentPage);
		
	}
	

</script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" name="action" id="action" value="">
	<input type="hidden" name="currentPage" id="currentPage" value="">
	
	

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
								class="btn_nav">작업지시서</a> <span class="btn_nav bold">발주지시서</span> 
								<a onClick="top.location='javascript:location.reload()'" class="btn_set refresh">새로고침</a>
						</p>
						<p class="search">

						</p>
						<p class="conTitle" id="searcharea">
							<span>발주 지시서 목록</span> 

							 <span class="fr"> 
								<select id="searchKey" name="searchKey"  v-model="searchKey">
								    <option value="all" id="all" selected="selected">전체</option>
									<option value="manu_nm" id="manu_nm">업체명</option>
									<option value="pro_type" id="pro_type">제품종류</option>
									<option value="pro_nm" id="pro_nm">제품명</option>
								</select>
								<input type="text" id="daterange" name="daterange" class="daterange">
								<input type="text" id="searchWord" name="searchWord" v-model="searchWord"
									placeholder="" style="height:27px"> 
									<a class="btnType blue" href="javascript:fPurchasedirList()" 
									onkeydown="enterKey()" name="search">
									<span id="searchEnter">검색</span></a>							 
							</span>
						</p>
						
						<div class="divPurchaseList" id="divPurchaseList">
							<table class="col" id="TableToExcel">
								<caption>caption</caption>

	
								<thead>
									<tr>
										<th scope="col"></th>
									    <th scope="col">발주번호</th>
										<th scope="col">발주업체</th>
										<th scope="col">발주제품종류</th>
										<th scope="col">발주제품명</th>
										<th scope="col">발주수량</th>
										<th scope="col">저장창고</th>
										<th scope="col">날짜</th>
										<th scope="col">발주진행상태</th>
									</tr>
								</thead>
								<tbody id="listCourse">
									<template v-for="(row, index) in items" v-if="items.length">
									<tr onclick="vm.rowClicked(this)">
									    <td>{{ row.row_num }}</td>
										<td>{{ row.purchase_no }}</td>
										<td>{{ row.deli_company }}</td>
										<td>{{ row.pro_cd_name }}</td>
										<td>{{ row.pro_name }}</td>
										<td>{{ row.purchase_qty }}</td>
										<td>{{ row.ware_name }}</td>
										<td>{{ row.purchase_date }}</td>
										<td>{{ row.purchase_cd_name }}</td>
									</tr>
									</template>
								</tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="listPagination"> </div>
						<a id="btnExport" href="#" download="">
							<button style="float:right; margin:10px"type='button' disabled>Export to Excel</button>
						</a>
	
						


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