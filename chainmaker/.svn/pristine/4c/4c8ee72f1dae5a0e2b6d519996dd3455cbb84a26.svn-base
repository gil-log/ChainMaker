<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Chain Maker :: 공지사항</title>
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="${CTX_PATH}/js/view/scm/notice/notice.js"></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
	<style>
 		input[name=date].datetype{
 			padding:4px 2px 5px 25px; width:95px; border:1px solid #CACACA;
      font-size:11px; color:#666; 
      background:url('http://cfile23.uf.tistory.com/image/26100D4F5864C76827F535') no-repeat 2px 2px; background-size:15px
    }   
	textarea.autosize { min-height: 50px; }
	</style>
</head>
<body>
<c:if test="${sessionScope.userType ne 'A'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
	<form id="myNotice" action="" method="" enctype="multipart/form-data" >
		
		<input type="hidden" id="currentPage" value="1">
		<!-- 현재페이지는 처음에 항상 1로 설정하여 넘김  -->
		<input type="hidden" name="action" id="action" value=""> 
		<input type="hidden" id="swriter" value="${writer}">
		<!-- 작성자 session에서 java에서 넘어온값 -->
		<input type="hidden" name="notice_no" id="notice_no" value=""> 
		<input type="hidden" name="file_no" id="file_no" value=""> 
	
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
						<h3 class="hidden">contents 영역</h3> 
						<div class="content">
							<p class="Location">
								<a href="/dashboard/dashboard.do" class="btn_set home">메인으로</a> 
								<a href="/scm/noticeMgr.do"	class="btn_nav">시스템 관리</a> <span class="btn_nav bold">공지사항</span>
								<a href="/scm/noticeMgr.do" class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
								<span>공지 사항 </span> <span class="fr">							
								<input class="datetype" style="width: 120px" id="from_date" name="date" readonly>
								<input class="datetype" style="width: 120px" id="to_date" name="date" readonly>
							</p></span>

							<!--검색창  -->
							
							<div style = "float:right;">				
							<select id="searchKey" name="searchKey" style="width: 80px; height: 30px;">
									<option value="all" selected>전체</option>
									<option value="title">제목</option>
									<option value="content">내용</option>
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
										<col width="50px">
										<col width="200px">
										<col width="60px">
										<col width="60px">										
										<col width="50px">
									</colgroup>
									<thead>
										<tr>
											<th scope="col">공지 번호</th>
											<th scope="col">공지 제목</th>
											<th scope="col">공지 날짜</th>											
											<th scope="col">작성자</th>
											<th scope="col">조회수</th>
										</tr>
									</thead>
									<tbody id="noticeList"></tbody>
								</table>

								<!-- 페이징 처리  -->
								<div class="paging_area" id="pagingnavi">
									<div class="paging">
										<a class="first" href="javascript:selectNoticeList(1)">
										<span class="hidden">맨앞</span></a> 
										<a class="pre" href="javascript:selectNoticeList(1)"> 
										<span class="hidden">이전</span></a> <strong>1</strong> 
										<a href="javascript:selectNoticeList(2)">2</a> 
										<a href="javascript:selectNoticeList(3)">3</a>
										<a href="javascript:selectNoticeList(4)">4</a>
										<a href="javascript:selectNoticeList(5)">5</a> 
										<a class="next" href="javascript:selectNoticeList(5)"> 
										<span class="hidden">다음</span></a> 
										<a class="last" href="javascript:selectNoticeList(5)"> 
										<span class="hidden">맨뒤</span></a>
									</div>
								</div>
							</div>
							</div>						
							
							<div style = "float:right;"></div>
							<span class="fr">
								<div class="container" style="margin-top: 10px"></div>
								<c:set var="nullNum" value=""></c:set> 
								<a class="btnType blue" href="javascript:fNoticeModal(${nullNum});" name="modal"><span>신규등록</span></a>
							</span>
																
						</div>		
						 <!--// content -->
						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>

		<!-- 모달팝업 -->
		<div id="notice" class="layerPop layerType2" style="width: 600px;">
			
			<dl>
				<dt>
					<strong>공지사항</strong>
				</dt>
				
				<dd class="content">

					<table class="row">
						<caption>caption</caption>
						<tbody>
							<tr>
								<th scope="row">제목 </th>
								<td colspan="3">
								<input type="text" class="inputTxt p100"
									   name="notice_title" id="notice_title" /></td>
							</tr>
							<tr>
								<th scope="row">작성자 </th>
								<td>
								<input type="text" class="inputTxt p100" 
								       name="loginID" id="loginID" /></td>
							</tr>
							<tr>
								<th scope="row">작성일 </th>
								<td>
								<input type="text" class="inputTxt p100" 
								       name="notice_moddate" id="notice_moddate" /></td>
							</tr>														
							<tr>
								<th scope="row">내용</th>
								<td>
								<textarea class="autosize" onkeydown="resize(this)" onkeyup="resize(this)"
								 name="notice_content" id="notice_content"></textarea></td>
							</tr>
							<tr>
								<th scope="row">파일</th>
								<td>
								<input type="file" id="file" name="file" /></td>
							</tr>
							<tr>
								<th scope="row">첨부 파일 </th>
								<td>
								    <div id="filedown"></div>
								</td>
							</tr>
						</tbody>
					</table>

					<div class="btn_areaC mt30">
						<a href="" class="btnType blue" id="btnSaveNotice" name="btn"><span>저장</span></a>
						<a href="" class="btnType blue" id="btnUpdateNotice" name="btn" style="display: none"><span>수정</span></a> 
						<a href="" class="btnType blue" id="btnDeleteNotice" name="btn"><span>삭제</span></a>
						<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden"></span></a>
		</div>
	</form>
</body>
</html>
