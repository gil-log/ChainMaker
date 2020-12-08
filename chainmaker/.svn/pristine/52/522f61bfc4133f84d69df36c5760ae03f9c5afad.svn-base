<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Chain Maker :: 반품지시서</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="${CTX_PATH}/js/view/scm/refundIns/refundIns.js"></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
	<style>
 		input[name=date].datetype{
 			padding:4px 2px 5px 25px; width:95px; border:1px solid #CACACA;
      font-size:11px; color:#666; 
      background:url('http://cfile23.uf.tistory.com/image/26100D4F5864C76827F535') no-repeat 2px 2px; background-size:15px
    } 
	</style>
</head>
<c:if test="${sessionScope.userType ne 'A'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<body>
	<form id="myNotice" action="" method="" enctype="multipart/form-data" >
		
		<input type="hidden" id="currentPage" value="1">
		<!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
	
		<div id="wrap_area">

			<h2 class="hidden">header 영역</h2>
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

			<h2 class="hidden">컨텐츠 영역</h2>
			<div id="container">
				<ul>
					<li class="lnb">
					<jsp:include page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> 
					</li>
					<li class="contents">
						<!-- contents -->
						<h3 class="hidden">contents 영역</h3> <!-- content -->
						<div class="content">
							<p class="Location">
								<a href="/dashboard/dashboard.do" class="btn_set home">메인으로</a> 
								<a href="/scm/refundIns.do"	class="btn_nav">시스템 관리</a> <span class="btn_nav bold">반품 지시서</span>
								<a href="/scm/refundIns.do" class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
								<span>반품 지시서 </span> <span class="fr">							
								<input class="datetype" style="width: 120px" id="from_date" name="date" readonly>
								<input class="datetype" style="width: 120px" id="to_date" name="date" readonly>
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
										<col width="10%">
										<col width="20%">
										<col width="30%">
										<col width="10%">
										<col width="10%">
										<col width="10%">
										<col width="10%">

									</colgroup>
									<thead>
										<tr>
											<th scope="col">반품번호</th>
											<th scope="col">[주문/발주] 일자</th>
											<th scope="col">제품명</th>
											<th scope="col">반품 개수</th>											
											<th scope="col">금액</th>
											<th scope="col">반품 종류</th>
											<th scope="col">승인</th>
										</tr>
									</thead>
									<tbody id="refundInsList"></tbody>
								</table>

								<!-- 페이징 처리  -->
								<div class="paging_area" id="pagingnavi">
									<div class="paging">
										<a class="first" href="javascript:selectrefundInsList(1)">
										<span class="hidden">맨앞</span></a> 
										<a class="pre" href="javascript:selectrefundInsList(1)"> 
										<span class="hidden">이전</span></a> <strong>1</strong> 
										<a href="javascript:selectrefundInsList(2)">2</a> 
										<a href="javascript:selectrefundInsList(3)">3</a>
										<a href="javascript:selectrefundInsList(4)">4</a>
										<a href="javascript:selectrefundInsList(5)">5</a> 
										<a class="next" href="javascript:selectrefundInsList(5)"> 
										<span class="hidden">다음</span></a> 
										<a class="last" href="javascript:selectrefundInsList(5)"> 
										<span class="hidden">맨뒤</span></a>
									</div>
								</div>
							</div>
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
