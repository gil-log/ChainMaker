<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>잡코리아 dashboard</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<!-- D3 -->
<style>
//
click-able rows
	.clickable-rows {tbody tr td { cursor:pointer;
	
}

.el-table__expanded-cell {
	cursor: default;
}
}
</style>
<script type="text/javascript">



// 페이징 설정 
var noticePageSize = 10;    	// 화면에 뿌릴 데이터 수 
var noticePageSizevue = 10;
var noticePageBlock = 10;		// 블럭으로 잡히는 페이징처리 수

var vm;
var svm;
var ved;


//var isM = isMobile();
var isM = false;
var popperProps = {
		  popperOptions: {
		    modifiers: {
		      preventOverflow: {
		        padding: 20
		      }
		    },
		    onUpdate: function (data) {
		      console.log(JSON.stringify(data.attributes))
		    }
		  }
		};
		
/* onload 이벤트  */
$(function(){
	// 자유게시판 리스트 뿌리기 함수 
	init();
	selectNoticeList();
	selectNoticeListvue();
});



function init() {
	
	new Vue({
	     el: '#searcharea2',
	     name: 'date-picker',
	     props: {
	      date: String
	     },
	     mounted: function() {
										      var that = this;
										      $(this.$el).datepicker({
										          'autoclose':true,
										          'minViewMode':0, //day까지 선택할수 있게 선언
										          'maxViewMode':2,
										          'format':'yyyy.mm.dd' //날짜 포맷
										      }).on('changeDate', function(e){
														       var year = e.date.getFullYear();
														       var month = e.date.getMonth() + 1;
														       if(month < 10) month = '0' + month;
														       var day = e.date.getDate();
														       that.$emit('change',String(year)+'.'+String(month)+'.'+day);
										      });
	     },
	     updated: function(){
	            $(this.$el).datepicker('update', this.date);
	     }   
	});		
	//변수에 넣어서 가져다 쓰기 위해서 변수를 사용한거다.
	svm = new Vue({
	                           el: '#searcharea',  
	                         data: {
	                        	    stitle: ''
	                               }
	            });
    
	ved = new Vue({
                                el: '#editvue',  
                              data: {
                            	      loginID_vue: ''
                            	     ,write_date_vue: ''
                            	     ,nt_title_vue: ''
                            	     ,nt_note_vue: ''
                                   }
                 });
	 
	 //items = 넥사크로 dataSet과 같다.
    vm = new Vue({
		  el: '#vuetable',
		  components: {
		    'bootstrap-table': BootstrapTable
		  },
		  data: {
		    items: [],
		    options: {
		    	//  paginated:"paginated"
		    }			    
		  },
		  methods: {
		      rowClicked(row) {
		    	 //alert("1111111111111111");
		        //this.$refs.tableData.toggleRowExpansion(row);
		        
		        var str = "";
                var tdArr = new Array();    // 배열 선언
                    
                // 현재 클릭된 Row(<tr>)
                
                var tr = $(row);
                var td = tr.children();

		        console.log("row : " + $(row) + " tr : " + tr);
                
                td.each(function(i){
                    tdArr.push(td.eq(i).text());
                });
                        
                fNoticeModal2(tdArr[1]);
                //console.log("배열에 담긴 값 : "+tdArr[1]);
		        
		      }
		  }		      
		});	  
    
        $("#vuedatatable tr").click(function(){  
        	var str = "";
            var tdArr = new Array();    // 배열 선언
                
            // 현재 클릭된 Row(<tr>)
            var tr = $(this);
            var td = tr.children();
            
            //console.log("td : " + td);
    	});    
    
    
};

/* 공지사항 리스트 불러오기  */
function selectNoticeList(currentPage){
	
	currentPage = currentPage || 1;   // or		
	
    //alert("지금 현재 페이지를 찍어봅시다. " + currentPage);
	
	var param = {
			currentPage : currentPage ,
			pageSize : noticePageSize 
	}
	
	var resultCallback = function(data){  // 데이터를 이 함수로 넘깁시다. 
		noticeListResult(data, currentPage); 
	}
	
	callAjax("/supportD/noticeList.do","post","text", true, param, resultCallback);
	
}

/* callAjax 공통 common.js 에서 퍼옴  -> 이렇게 생긴 함수입니다.  

function fOnloadImg(param){
	var resultCallback = function(data) {
		fOnloadImgResult(data);
	};
	callAjax("/image/selectImgSize.do", "post", "json", false, param, resultCallback);
 } */


 /* 공지사항 리스트 data를 콜백함수를 통해 뿌려봅시당   */
 function noticeListResult(data, currentPage){
	 
	 // 일단 기존 목록을 삭제합니다. (변경시 재부팅 용)
	 $("#noticeList").empty();
	 //alert("데이터!!! " + data);
	 //console.log("data !!!! " +  data);
	 
	 //var $data = $( $(data).html() ); // data의 .html()통해서 html구문을 끌어온다.
	 //alert("데이터 찍어보자!!!! " +  $data); // object
	 
	 $("#noticeList").append(data);

	 
	 // 리스트의 총 개수를 추출합니다. 
	 //var totalCnt = $data.find("#totalCnt").text();
	 var totalCnt = $("#totalCnt").val();  // qnaRealList() 에서보낸값 
     //alert("totalCnt 찍어봄!! " + totalCnt);
	 
	 // * 페이지 네비게이션 생성 (만들어져있는 함수를 사용한다 -common.js)
	 // function getPaginationHtml(currentPage, totalCount, pageRow, blockPage, pageFunc, exParams)
	 // 파라미터를 참조합시다. 
     var list = $("#tmpList").val();
	 //var listnum = $("#tmpListNum").val();
     var pagingnavi = getPaginationHtml(currentPage, totalCnt, noticePageSize,noticePageBlock, 'selectNoticeList',[list]);
	 
     //console.log("pagingnavi : " + pagingnavi);
	 // 비운다음에 다시 append 
     $("#pagingnavi").empty().append(pagingnavi); // 위에꺼를 첨부합니다. 
	 
	 // 현재 페이지 설정 
    $("#currentPage").val(currentPage);
 }
 
 
 /* 공지사항 모달창(팝업) 실행  */
 function fNoticeModal(nt_seq) {
	 
	 // 신규저장 하기 버튼 클릭시 (값이 null)
	 if(nt_seq == null || nt_seq==""){
		// Tranjection type 설정
		//alert("넘을 찍어보자!!!!!!" + nt_seq);
		
		$("#action").val("I"); // insert 
		frealPopModal(nt_seq); // 공지사항 초기화 
		
		//모달 팝업 모양 오픈! (빈거) _ 있는 함수 쓰는거임. 
		gfModalPop("#notice");
		
	 }else{
		// Tranjection type 설정
		$("#action").val("U");  // update
		fdetailModal(nt_seq); //번호로 -> 공지사항 상세 조회 팝업 띄우기
	 }

 }
 
 
 /*공지사항 상세 조회*/
 function fdetailModal(nt_seq){
	 //alert("공지사항 상세 조회  ");
	 
	 var param = {nt_seq : nt_seq};
	 var resultCallback2 = function(data){
		 fdetailResult(data);
	 };
	 
	 callAjax("/supportD/detailNoticeList.do", "post", "json", true, param, resultCallback2);
	 //alert("공지사항 상세 조회  22");
 }
 
 /*  공지사항 상세 조회 -> 콜백함수   */
 function fdetailResult(data){

	 //alert("공지사항 상세 조회  33");
	 if(data.resultMsg == "SUCCESS"){
		 //모달 띄우기 
		 gfModalPop("#notice");
		 
		// 모달에 정보 넣기 
		frealPopModal(data.result);
	 
	 }else{
		 alert(data.resultMsg);
	 }
 }
 
 /* 팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기  */
 function frealPopModal(object){
	 
	 if(object == "" || object == null || object == undefined){
		 var writer = $("#swriter").val();
		 //var Now = new Date();
		 
		 $("#loginID").val(writer);
		 $("#loginID").attr("readonly", true);
		 
		 $("#write_date").val();
		 
		 $("#nt_title").val("");
		 $("#nt_note").val("");
		 
		 $("#btnDeleteNotice").hide(); // 삭제버튼 숨기기
		 $("#btnUpdateNotice").hide();
		 $("#btnSaveNotice").show();
		
		 
	 }else{
		 
		 //alert("숫자찍어보세 : " + object.wno);// 페이징 처리가 제대로 안되서 
		 $("#loginID").val(object.loginID);
		 $("#loginID").attr("readonly", true); // 작성자 수정불가 
		 
		 $("#write_date").val(object.write_date);
		 $("#write_date").attr("readonly", true); // 처음 작성된 날짜 수정불가 
		 
		 $("#nt_title").val(object.nt_title);
		 $("#nt_title").attr("readonly", true);
		 
		 $("#nt_note").val(object.nt_note);
		 $("#nt_note").attr("readonly", true);

		 
		 $("#nt_seq").val(object.nt_seq); // 중요한 num 값도 숨겨서 받아온다. 
		 
		 $("#btnDeleteNotice").show(); // 삭제버튼 보이기 
		 $("#btnSaveNotice").hide();
		 $("#btnUpdateNotice").css("display","");
		 //if문써서 로그인 아이디 == 작성자 아이디 일치시  --- 추가하기 
		 //$("#grp_cod").attr("readonly", false);  // false, true(읽기만)로 수정
		
		 
	 }
 }
 
 /* 공지사항 리스트 불러오기  */
 function selectNoticeListvue(currentPage){
 	
	currentPage = currentPage || 1;   // or		
	//svm.stitle = "55555555555";
	//console.log("selectNoticeListvue currentPage : " + currentPage);
 	var stitle = $("#stitle").val();
 	var searchType = 'nt_title';
 	
 	var param = {
 			currentPage : currentPage ,
 			pageSize : noticePageSizevue,
 			searchType : searchType,
 			searchkeyword : svm.stitle
 	}
 	
 	var resultCallback = function(data){  // 데이터를 이 함수로 넘깁시다. 
 		gridinit(data,currentPage); 
 	}
 	
 	callAjax("/supportD/noticeListvue.do","post","json", true, param, resultCallback);
 	
 }
 

 /* 공지사항 리스트 data를 콜백함수를 통해 뿌려봅시당   */
 function gridinit(data,currentPage){
	 //console.log("noticeListResult2 data : " + JSON.stringify(noticeList));
	 //console.log("noticeListResult2 noticeList : " + JSON.stringify(data.noticeList));
	 
	 vm.items=[];
	 vm.items=data.noticeList;
	 
	 console.log(data.totalCnt + " : " + currentPage);
	 
	// 리스트의 총 개수를 추출합니다. 
	 //var totalCnt = $data.find("#totalCnt").text();
	 var totalCnt = data.totalCnt;  // qnaRealList() 에서보낸값 
     //alert("totalCnt 찍어봄!! " + totalCnt);
	 
	 // * 페이지 네비게이션 생성 (만들어져있는 함수를 사용한다 -common.js)
	 // function getPaginationHtml(currentPage, totalCount, pageRow, blockPage, pageFunc, exParams)
	 // 파라미터를 참조합시다. 
     //var list = $("#tmpList").val();
	 var listnum = $("#tmpListNum").val();
     var pagingnavi = getPaginationHtml(currentPage, totalCnt, noticePageSizevue,noticePageBlock, 'selectNoticeListvue');
	 
     //console.log("pagingnavi : " + pagingnavi);
	 // 비운다음에 다시 append 
     $("#pagingnavi2").empty().append(pagingnavi); // 위에꺼를 첨부합니다. 
	 
	 // 현재 페이지 설정 
    $("#currentPagevue").val(currentPage);
 }
 
 
 /* 공지사항 모달창(팝업) 실행  */
 function fNoticeModal2(nt_seq) {
	 
	 console.log("fNoticeModal2 nt_seq : " + nt_seq);
	 
	 // 신규저장 하기 버튼 클릭시 (값이 null)
	 if(nt_seq == null || nt_seq==""){
		// Tranjection type 설정
		//alert("넘을 찍어보자!!!!!!" + nt_seq);
		
		$("#action").val("I"); // insert 
		frealPopModal2(); // 공지사항 초기화 
		
		//모달 팝업 모양 오픈! (빈거) _ 있는 함수 쓰는거임. 
		gfModalPop("#noticevue");
		
	 }else{
		// Tranjection type 설정
		$("#action").val("U");  // update
		fdetailModal2(nt_seq); //번호로 -> 공지사항 상세 조회 팝업 띄우기
	 }

 }
 
 
 /*공지사항 상세 조회*/
 function fdetailModal2(nt_seq){
	 //alert("공지사항 상세 조회  ");
	 
	 var param = {nt_seq : nt_seq};
	 var resultCallback2 = function(data){
		 fdetailResult2(data);
	 };
	 
	 callAjax("/supportD/detailNoticeList.do", "get", "json", true, param, resultCallback2);
	 //alert("공지사항 상세 조회  22");
 }
 
 /*  공지사항 상세 조회 -> 콜백함수   */
 function fdetailResult2(data){

	 //alert("공지사항 상세 조회  33");
	 if(data.resultMsg == "SUCCESS"){
		 //모달 띄우기 
		 gfModalPop("#noticevue");
		 
		// 모달에 정보 넣기 
		frealPopModal2(data.result);
	 
	 }else{
		 alert(data.resultMsg);
	 }
 }
	 

 /* 팝업 _ 초기화 페이지(신규) 혹은 내용뿌리기  */
 function frealPopModal2(object){
	 
	 if(object == "" || object == null || object == undefined){
		 var writer = $("#swriter_vue").val();
		 //var Now = new Date();
		 // ****************************
		 
		 ved.loginID_vue = writer;
		 ved.write_date_vue = writer;
		 ved.nt_title_vue = "";
		 ved.nt_note_vue = "";
		 
	 }else{
		 console.log("frealPopModal2 object.loginID : " + object.loginID);
		 
		 ved.loginID_vue = object.enr_user;
		 
		 console.log("frealPopModal2 ved.loginID_vue : " + ved.loginID_vue);
		 $("#loginID_vue").attr("readonly", true); // 작성자 수정불가 
		 ved.write_date_vue = object.write_date;
		 $("#write_date").attr("readonly", true); // 처음 작성된 날짜 수정불가 
		 ved.nt_title_vue = object.nt_title;
		 $("#nt_title_vue").attr("readonly", true);
		 ved.nt_note_vue = object.nt_contents;
		 $("#nt_note_vue").attr("readonly", true);
		 
		 $("#nt_no_vue").val(object.nt_seq); // 중요한 num 값도 숨겨서 받아온다. 
		 
		 //$("#btnDeleteNotice").show(); // 삭제버튼 보이기 
		 //$("#btnSaveNotice").hide();
		 //$("#btnUpdateNotice").css("display","");
		 //if문써서 로그인 아이디 == 작성자 아이디 일치시  --- 추가하기 
		 //$("#grp_cod").attr("readonly", false);  // false, true(읽기만)로 수정
		
		 
	 }
 }
 
</script>

</head>
<body>
	<!-- 모달 배경 -->
	<div id="mask"></div>

	<div id="wrap_area">


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
							<a href="#" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">메인</span> <a href="#"
								class="btn_set refresh">새로고침</a>
						</p>


<!--                         <input type="text" id="EMP_ID" name="lgn_Id" placeholder="아이디" onkeypress="if(event.keyCode==13) {fLoginProc(); return false;}" style="ime-mode:inactive;" /> -->
                        <div id="searcharea">
                                       제목 : <input id="stitle" name="stitle"  v-model="stitle" placeholder="제목 검색조건">
                             <a href="javascript:selectNoticeListvue();" id="btn_prelogin2" ><strong>조회</strong></a>	
                             <p>메시지: {{ stitle }}</p>
                        </div>
                        <div>
	                        <template id="searcharea2">
	                             <div class="input-group date" style="width:150px;">
	                                      <input id="indate" name="indate" type="text" class="form-control" v-model="date" />
	                                     <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
	                            </div>                            
	                       </template>
                       </div>


						<div>
							<template id="searcharea2">
							<div class="input-group date" style="width: 150px;">
								<input id="indate" name="indate" type="text"
									class="form-control" v-model="date" /> <span
									class="input-group-addon"><i class="fa fa-calendar"></i></span>
							</div>
							</template>
						</div>

						<input type="hidden" id="currentPage" value="1"> <input
							type="hidden" id="currentPagevue" value="1">
						<div class="dashboard2 mt30 mb20">

							<ul>
								<li>
									<div class="col">
										<p class="tit">
											<em>공 지 사 항</em>
										</p>
										<table class="col2 mb10" style="width: 1000px;">

											<colgroup>
												<col width="50px">
												<col width="200px">
												<col width="60px">
												<col width="50px">
											</colgroup>

											<thead>
												<tr>
													<th>공지 번호</th>
													<th>공지 사항</th>
													<th>작성일</th>
													<th>관리자</th>

												</tr>
											</thead>
											<tbody id="noticeList"></tbody>

										</table>
									</div>
								</li>
							</ul>

							<!-- 페이징 처리  -->
							<div class="paging_area" id="pagingnavi"></div>

						</div>
						<div id="vuetable">
							<div class="bootstrap-table">
								<div class="fixed-table-toolbar">
									<div class="bs-bars pull-left"></div>
									<div class="columns columns-right btn-group pull-right">
									</div>
								</div>
								<div class="fixed-table-container" style="padding-bottom: 0px;">
									<div class="fixed-table-body">

										<table id="vuedatatable" class="col2 mb10"
											style="width: 1000px;">
											<colgroup>
												<col width="25px">
												<col width="25px">
												<col width="200px">
												<col width="60px">
												<col width="50px">
											</colgroup>
											<thead>
												<tr>
													<th data-field="index">번호</th>
													<th data-field="nt_seq">공지 번호</th>
													<th data-field="nt_title">공지 사항</th>
													<th data-field="loginID">작성일</th>
													<th data-field="write_date">관리자</th>
												</tr>
											</thead>
											<tbody>
												<template v-for="(row, index) in items" v-if="items.length">
												<tr onclick="vm.rowClicked(this)">
													<td>{{ index + 1}}</td>
													<td>{{ row.nt_seq }}</td>
													<td>{{ row.nt_title }}</td>
													<td>{{ row.write_date }}</td>
													<td>{{ row.loginID }}</td>
												</tr>
												</template>
											</tbody>
										</table>
										<div>
											<div>
												<div class="clearfix" />
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="paging_area" id="pagingnavi2"></div>
					</div>
				</li>
			</ul>

		</div>
	</div>

	<!-- 모달팝업 -->
	<div id="notice" class="layerPop layerType2" style="width: 600px;">
		<input type="hidden" id="nt_seq" name="nt_seq">
		<!-- 수정시 필요한 num 값을 넘김  -->

		<dl>
			<dt>
				<strong>공지사항 상세보기 </strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<table class="row">
					<caption>caption</caption>

					<tbody>
						<tr>
							<th scope="row">작성자 <span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="loginID"
								id="loginID" /></td>
							<!-- <th scope="row">작성일<span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" name="write_date" id="write_date" /></td> -->
						</tr>
						<tr>
							<th scope="row">제목 <span class="font_red">*</span></th>
							<td colspan="3"><input type="text" class="inputTxt p100"
								name="nt_title" id="nt_title" /></td>
						</tr>
						<tr>
							<th scope="row">내용</th>
							<td colspan="3"><textarea class="inputTxt p100"
									name="nt_note" id="nt_note">
								</textarea></td>
						</tr>

					</tbody>
				</table>

				<div class="btn_areaC mt30">

					<a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a>
				</div>
			</dd>

		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

	<!-- 모달팝업 -->
	<div id="noticevue" class="layerPop layerType2" style="width: 600px;">
		<input type="hidden" id="nt_novue" name="nt_novue">
		<!-- 수정시 필요한 num 값을 넘김  -->

		<dl>
			<dt>
				<strong>공지사항 상세보기 </strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
				<div id="editvue">
					<table class="row">
						<caption>caption</caption>

						<tbody>
							<tr>
								<th scope="row">작성자 <span class="font_red">*</span></th>
								<td><input type="text" class="inputTxt p100"
									v-model="loginID_vue" name="loginID_vue" id="loginID_vue" /></td>
								<!-- <th scope="row">작성일<span class="font_red">*</span></th>
							<td><input type="text" class="inputTxt p100" v-model="write_date_vue" name="write_date_vue" id="write_date_vue" /></td> -->
							</tr>
							<tr>
								<th scope="row">제목 <span class="font_red">*</span></th>
								<td colspan="3"><input type="text" class="inputTxt p100"
									v-model="nt_title_vue" name="nt_title_vue" id="nt_title_vue" /></td>
							</tr>
							<tr>
								<th scope="row">내용</th>
								<td colspan="3"><textarea class="inputTxt p100"
										v-model="nt_note_vue" name="nt_note_vue" id="nt_note_vue">
								</textarea></td>
							</tr>

						</tbody>
					</table>
				</div>
				<div class="btn_areaC mt30">

					<a href="" class="btnType gray" id="btnClose_vue" name="btn"><span>취소</span></a>
				</div>
			</dd>

		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>

</body>
</html>