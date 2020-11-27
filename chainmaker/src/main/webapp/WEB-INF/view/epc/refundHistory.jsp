<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>RefundHistory</title>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<script type="text/javascript">
	/*반품 현황 페이징 처리*/
	var pageSizeRefundHistory = 5;
	var pageBlockSizeRefundHistory = 5;
	/*반품 디테일 페이징 처리*/
	var PageSizeRefundDetail = 5;
	var PageBlockSizeRefundDeatil = 5;
	
	/*Onload event*/
	$(function(){
		fListRefund();
		
	})
	/*반품 목록 조회*/
	function fListRefund(currentPage){
		currentPage = currentPage || 1;

		console.log("currentPage :" + currentPage);
		
		var param = {
/* 				refund_no : refund_no,
				pro_no : pro_no, */
				currentPage : currentPage,
				pageSize : pageSizeRefundHistory				
		};
		var resultCallback = function(data){
			fListRefundResult(data, currentPage);
		};
		callAjax("/epc/listRefundHistory.do", "post", "text", true, param, resultCallback);
	}
	
	
	function fListRefundResult(data, currentPage){
		$('#listRefundHistory').empty();
		/* var $data = $($(data).html()); */
		
		$('#listRefundHistory').append(data);
		
		var totalRefundHistory = $("#totalRefundHistory").val();
		
		var paginationHtml = getPaginationHtml(currentPage, totalRefundHistory, pageSizeRefundHistory, pageBlockSizeRefundHistory, 'fListRefund');
		
		console.log("paginationHtml : " + paginationHtml);

		  $("#refundHistoryPagination").empty().append(paginationHtml);

		  // 현재 페이지 설정
		  $("#currentPageRefundHistory").val(currentPage);
	}
</script>
</head>
<body>
	<form id="myForm" action="" method="">
		<input type="hidden" id="currentPageRefundHistory" value="1"> 
		<!-- <input type="hidden" id="currentPageProduct" value="1">  -->
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
								<a href="/dashboard/dashboard.do" class="btn_set home">메인으로</a> <a 
									class="btn_nav">반품</a> <span class="btn_nav bold">반품 현황</span>
								<a href="" class="btn_set refresh">새로고침</a>
							</p>
							<p class="conTitle">
								<span>반품 현황</span> <span class="fr"> </span>
							</p>
							<div class="refundHistoryList">
								<div class="conTitle"
									style=" float: right;">
									<table class="col">
										<caption>caption</caption>
										<colgroup>
											<col width="6%">
											<col width="6%">
 											<col width="20%">
											<col width="13%">
											<col width="10%">
											<col width="9%">
										</colgroup>

										<thead>
											<tr>
												<th scope="col">반품 번호</th>
												<th scope="col">주문 번호</th>
 												<th scope="col">제품명</th>
 												<th scope="col">반품 날짜</th>
												<th scope="col">반품 상태</th>
											</tr>
											
										</thead>
										<tbody id="listRefundHistory"></tbody>
									</table>
								</div>
								<div class="paging_area" id="refundHistoryPagination"></div>
							</div>
						</div>
						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>
		<!--모달 영역-->
		<div>
		</div>
	</form>
</body>
</html>