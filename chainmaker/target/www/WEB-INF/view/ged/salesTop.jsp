<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>매출 상위</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- duDatePicker import css-->
<link rel="stylesheet" type="text/css" href="${CTX_PATH}/css/duDatePicker/duDatepicker.css">

<!-- duDatePicker import js -->
<script type="text/javascript" src="${CTX_PATH}/js/duDatePicker/duDatepicker.js"></script>

<!-- chart import -->
<script type="text/javascript" src="${CTX_PATH}/js/apexcharts/apexcharts.js"></script>

<!-- chart import css-->
<link rel="stylesheet" type="text/css" href="${CTX_PATH}/css/apexcharts/apexcharts.css">

<!-- font awesome css -->
<link rel="stylesheet" type="text/css" href="${CTX_PATH}/js/statistics/css/font-awesome.min.css">



<script type="text/javascript">

	
	var vm;
	var unstsearch = true;
	//차트 옵션
	var options = {
            series: [],
            chart: {
            width: 430,
            type: 'pie',
            toolbar: {
                show: true,
                offsetX: 0,
                offsetY: 0,
                tools: {
                  download: true | '<i class="fas fa-cloud-download-alt" width="20"></i>',
                  selection: true,
                  zoom: true,
                  zoomin: true,
                  zoomout: true,
                  pan: true,
                  reset: true | '<i class="fas fa-redo-alt" width="20"></i>',
                  customIcons: []
                },
                export: {
                  csv: {
                    filename: undefined,
                    columnDelimiter: ',',
                    headerCategory: 'category',
                    headerValue: 'value',
                    dateFormatter(timestamp) {
                      return new Date(timestamp).toDateString()
                    }
                  }
                },
                autoSelected: 'zoom' 
              },
	
          },
          labels: [],
          };
	
	var chart;

	
	/** OnLoad event */ 
	$(document).ready(function() {
		
		init();
		
		// 매출 목록 조회
		fSalesList();
		
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
	    
		vm = new Vue({
			  el: '#divSalesList',
			  components: {
			    'bootstrap-table': BootstrapTable
			  },
			  data: {
			    items: []
			   ,no: ''
			  },
			});	  

	};	
	
	
	/** 매출 상위 조회 */
	function fSalesList(currentPage) {
		
		const fromDate = $("#daterange").attr('data-range-from');
		const toDate = $("#daterange").attr('data-range-to');
		
		var param = {	
					fromDate : fromDate
				,	toDate : toDate
		}
		
		var resultCallback = function(data) {
			fSalesListResult(data);
		};
		//Ajax실행 방식
		//callAjax("Url",type,return,async or sync방식,넘겨준거,값,Callback함수 이름)
		callAjax("/ged/salesList.do", "post", "json", true, param, resultCallback);
	}
	
	
	/** 매출 상위 조회 콜백 함수 */
	function fSalesListResult(data) {
		//alert(data);
		console.log(data);
		vm.items=[];
		vm.items=data.salesList;
		
		fRedrawChart(data);

	}
	
	/** 매출 상위 차트 그리기 함수 */
	function fRedrawChart(data) {
		// chart option에 데이터 추가
		options.series = [];
		options.labels = [];
		
		for(var i = 0; i< data.salesList.length; i++){
			options.series.push(data.salesList[i].top_sales_price);
			options.labels.push(data.salesList[i].top_sales_user_company);
		}
		
		// div 비운 뒤 에이펙스 차트 렌더링
		document.querySelector("#chart").innerHTML = ' ';
		chart = new ApexCharts(document.querySelector("#chart"), options);
		chart.render();
		
	}

</script>

</head>
<body>
<c:if test="${sessionScope.userType ne 'E'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
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
							<a href="/dashboard/dashboard.do" class="btn_set home">메인으로</a> <a href="#"
								class="btn_nav">매출 현황</a> <span class="btn_nav bold">매출 상위</span> 
								<a onClick="top.location='javascript:location.reload()'" class="btn_set refresh">새로고침</a>
						</p>

						<p class="conTitle" id="searcharea">
							<span>매출 상위 기업 고객 TOP 10</span> 

						</p>
						<p class="search" style="margin-bottom:80px">
							<span class="fr"> 
								<input type="text" id="daterange" name="daterange" class="daterange" v-model="searchDate">

									<a class="btnType blue" href="javascript:fSalesList()" 
									onkeydown="enterKey()" name="search">
									<span id="searchEnter">검색</span></a>							 
							</span>
							
						</p>
						
						
						<div id="chart" style="width:40%;float:right;">
						</div>	
								
						<div id="divSalesList" style="width:50%">
							<table class="col" id="TableToExcel">
								<caption>caption</caption>
								<thead>
									<tr>
									    <th scope="col">순위</th>
										<th scope="col">기업명</th>
										<th scope="col">매출액</th>
									</tr>
								</thead>
								<tbody id="listCourse">
									<template v-for="(row, index) in items" v-if="items.length">
									<tr onclick="vm.rowClicked(this)">
									    <td>{{ index + 1 }}</td>
										<td>{{ row.top_sales_user_company }}</td>
										<td>{{ row.top_sales_price }}</td>
									</tr>
									</template>
									<template  v-if="!items.length">
									<tr>
									<td colspan="3">
										해당 일자에 검색되는 데이터가 없습니다.
									</td>
									</tr>
									</template>
									
								</tbody>
							</table>
						</div>
						
						

						
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