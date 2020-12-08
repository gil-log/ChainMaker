<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Chain Maker :: 손익조회</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="${CTX_PATH}/js/view/ged/pal/pal.js"></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
	<style>
 		input[name=date].datetype{
 			padding:4px 2px 5px 25px; width:95px; border:1px solid #CACACA;
      font-size:11px; color:#666; 
      background:url('http://cfile23.uf.tistory.com/image/26100D4F5864C76827F535') no-repeat 2px 2px; background-size:15px
    } 
	</style>
</head>
<c:if test="${sessionScope.userType ne 'E'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<body>
	<form id="myNotice" action="" method="" enctype="multipart/form-data" >
		
		<!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
		<input type="hidden" id="palcurrentPage" value="1">
		<input type="hidden" id="palDcurrentPage" value="1">
		<input type="hidden" id="palD" value="">
		<input type="hidden" id="palDate" value="">
	
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
								<a href="/dashboard/dashboard.do" class="btn_set home">메인으로</a> 
								<a href="/ged/profitAndLoss.do"	class="btn_nav">시스템 관리</a> <span class="btn_nav bold">손익조회</span>
								<a href="/ged/profitAndLoss.do" class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
								<span>손익 조회 </span> <span class="fr">							
								<input class="datetype" style="width: 120px" id="from_date" name="date">
								<input class="datetype" style="width: 120px" id="to_date" name="date">
							</p></span>

							<!--검색창  -->
							
							<div style = "float:right;">				
							<select id="searchKey" name="searchKey" style="width: 80px; height: 30px;">
									<option value="title">제품명</option>
							</select>
							
						    <!-- enter입력하면 검색실행   -->
							<input type="text" style="width: 160px; height: 30px;" id="sname" name="sname" onkeypress="if( event.keyCode == 13 ){board_search();}">  
							<a href="javascript:board_search()" class="btnType blue" id="searchBtn" name="btn" ><span>검  색</span></a>
							</div>
							<div class="container" style="margin-top: 60px">
							
							<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="40%">
										<col width="30%">
										<col width="30%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">기업명</th>
											<th scope="col">수익금액</th>
											<th scope="col">환불금액</th>										
										</tr>
									</thead>
									<tbody id="palList"></tbody>
								</table>

								<!-- 페이징 처리  -->
								<div class="paging_area" id="pagingnavi">
								</div>
							</div>
							</div>		
							<p class="conTitle">
								<span>상세 내역 </span> <span class="fr"></span>								
							</p>				
									<div class="divComGrpCodList">
								<table class="col">
									<caption>caption</caption>
									<colgroup>
										<col width="40%">
										<col width="20%">
										<col width="20%">
										<col width="20%">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">기업명</th>
											<th scope="col">수익금액</th>
											<th scope="col">환불금액</th>
											<th scope="col">거래날짜</th>											
										</tr>
									</thead>
									<tbody id="palDList"></tbody>
								</table>

								<!-- 페이징 처리  -->
								<div class="paging_area" id="pagingnaviD">
								</div>
						</div>		
						 <!--// content -->
						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>
	</form>
</body>
</html>
