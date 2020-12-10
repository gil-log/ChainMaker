<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>



<!DOCTYPE html>
<html>
<head>
<!-- 혜원담당 12p-->
<title>Chain Maker :: SCM 담당자 반품 신청 목록</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>


<!-- duDatePicker import css-->
<link rel="stylesheet" type="text/css" href="${CTX_PATH}/css/duDatePicker/duDatepicker.css">
<!-- duDatePicker import js -->
<script type="text/javascript" src="${CTX_PATH}/js/duDatePicker/duDatepicker.js"></script>

<script type="text/javascript">

	// 페이징 설정 
	var refundPageSize = 5;    	// 화면에 뿌릴 데이터 수 
	var refundPageBlock = 3;		// 하단에 블럭으로 잡히는 페이징처리 수  
	
			
	/* onload 이벤트  */
	$(document).ready(function(){
		// 반품 리스트 뿌리기 함수 
		fSelectRefundList();  
		// 버튼 이벤트 등록 
		fButtonClickEvent();
		
		//duDatepicker init() 이쁜데이터피커
		$('#daterange').duDatepicker({
			format: 'yyyy/mm/dd', // 날짜 형식
			range: true, // 다중 데이터로 할 것인가 true / or false 
			theme: 'blue', // theme 색 : red, blue, green, purple, indigo, teal, and dark 
			clearBtn : true, // date clear 버튼 유무
			maxDate : 'today' // 오늘까지만 선택 가능
			});
	
	});
	


	/* 버튼 이벤트 모음 */
	function fButtonClickEvent(){
		$('a[name=btn]').click(function(e){
			e.preventDefault();   // ?? 
					
			var btnId = $(this).attr('id');			
			//alert("btnId : " + btnId);
			
			switch(btnId){
			
				case 'btnSearch' : fSelectRefundList(); // 검색버튼 
					break; 

				/* case 'btnSaveUpdate' : btnSaveUpdate();	// 모달 창 내에 _저장,수정 
					break; */
				
				case 'btnGoToCEO' : btnGoToCEO();	// 모달 창 내에 _임원승인누르는 버튼 sweetalert 창 떠짐
					break;
				
				case 'btnClose' : gfCloseModal();  // 모달닫기 ->하면 refresh 되어야~~~ 
					//fSelectRefundList(); // 첫페이지 다시 로딩 
					break;
				
				

			}
		});
	}
	
	
	/* 반품 목록 전체 리스트 불러오기  */
	function fSelectRefundList(currentPage){
		
		currentPage = currentPage || 1;   
		
		var searchKey = $('#searchKey').val(); /* 선택박스 */
		var sname = $('#sname').val(); /* 인풋박스  */
		const fromDate = $("#daterange").attr('data-range-from');
		const toDate = $("#daterange").attr('data-range-to');
		/* var from_date = $('#from_date').val();
		var to_date = $('#to_date').val(); */	
	
		/* console.log("searchCompany : " + searchCompany); */
		console.log("searchKey : " + searchKey);
		console.log("sname : " + sname);  
		console.log("pro_name : " + pro_name);
		/* console.log("from_date : " + from_date);
		console.log("to_date : " + to_date); */
					
		var param = {
				searchKey : searchKey,
				sname : sname,
				fromDate : fromDate,
				toDate : toDate,
				currentPage : currentPage ,
				pageSize : refundPageSize 				
		}
		
		var resultCallback = function(data){ 
			refundListResult(data, currentPage);  
		}		
		callAjax("/scm/refundList.do","post","text", true, param, resultCallback);
	}
	
	
	 /* 반품 리스트 data를 콜백함수를 통해 뿌려봅시당   */
	 function refundListResult(data, currentPage){

		 $("#refundList").empty();    
		 console.log("data !!!! " +  data);
	 
		 $("#refundList").append(data);		 

	    var totalCnt = $("#totalCnt").val();  
	     
 		var list = $("#tmpList").val();

	    var pagingnavi = getPaginationHtml(currentPage, totalCnt, refundPageSize, refundPageBlock, 'fSelectRefundList',[list]);
		 
	    console.log("pagingnavi : " + pagingnavi);
		 
	    $("#pagingnavi").empty().append(pagingnavi); //   

	    $("#currentPage").val(currentPage);
	    
	 }
	 

	//모달창 띄우는것(가져와서씀)
	function gfModalPop(id) {

		//var id = $(this).attr('href');
		
		var maskHeight = $(document).height();
		var maskWidth = $(document).width();

		$('#mask').css({'width':maskWidth,'height':maskHeight});

		$('#mask').fadeIn(200);
		$('#mask').fadeTo("fast", 0.5);

		var winH = $(window).height();
		var winW = $(window).width();
		var scrollTop = $(window).scrollTop();

		$(id).css('top', winH/2-$(id).height()/2+scrollTop);
		$(id).css('left', winW/2-$(id).width()/2);

		$(".layerPop").hide();
		$(id).fadeIn(100); //페이드인 속도..숫자가 작으면 작을수록 빨라집니다.
	}
 	 


/* 모달창(반품지시서) 띄우기 여기부터 */


/* 반품지시서 클릭하면 지시서 안에서 반품지시서 내용 뿌려야함  */
	function RDocModal(refund_no, pro_no, ware_no){
	//밑에 모달 폼이 만들어져 있으므로, list.jsp 같은거 또 만들 필요 없다! 
	
			var param = { /* refund 에 pk가 3개다.  */
					refund_no : refund_no ,
					ware_no : ware_no,
					pro_no : pro_no  /* 창고리스트를위해서 */
			}

			var resultCallback2 = function(data){  	  //여기서 data는 json형태 오브젝트
				/* ResultRDoc(data[1]); 
				makeSelectBox(data[0]);	 */	
				
				//console.log("resultCallback2 !!!! " +  JSON.stringify(data));
				console.log("resultCallback2333 !!!! " +  data.rDocModal.refund_no);   //undefined였던것 질문함! 타고타고해야함! 벨류값이 배열이라서! 
				
				ResultRDoc(data.rDocModal); 
				makeSelectBox(data.wareInfo);
			}			
			
			callAjax("/scm/selectRefundDocModal.do","post","json", true, param, resultCallback2);	//text 형태로 받아오면 안된다! 
 	
}

 	
/* 모달 콜백2-1  모달창에 작업지시서(사실은 tb_refund) 뿌려주는 콜백함수. */ 	
		function ResultRDoc(object) {
		
			//모달 팝업 모양 오픈! (빈거) _ 팀장님이 만들어 놓으신 함수 쓰는거임. 
			gfModalPop("#refundDoc"); /*  밑에있는 div를 띄우는것*/
			 
			 console.log("data !!!! " +  JSON.stringify(object));
		 
			 $("#refund_no").val(object.refund_no);
			 $("#refund_date").val(object.refund_date);
			 $("#pro_no").val(object.pro_no);
			 $("#pro_name").val(object.pro_name);
			 $("#origin_ware_no").val(object.origin_ware_no);  //기존창고 정보도 가지고 있음 
			 
			 $("#refund_qty").val(object.refund_qty);
			 $("#total_price").val(object.total_price.toLocaleString());    // toLocalString() 메서드 3자리씩 나눠주는거
			 
	}	


/* 모달 콜백2-2 창고 셀렉트 박스 만들어줌! 팀장님! */
	function makeSelectBox(object){
	
		var targetObj = document.getElementById("pick_warehouse");
		
		console.log("makeSelectBox !!!! " +  JSON.stringify(object));
		
		$("#pick_warehouse").empty();	
		
        
        for(var item in object){
        	
        	var item_ware_no = object[item].ware_no;
        	var item_ware_name = object[item].ware_name;
        	
        	console.log("wareName.ware_no ! " + object[item].ware_no);
        	console.log("wareName.ware_name ! " + object[item].ware_name);
        	
            //console.log("wareName.ware_no ! " + whinfoarr[i].ware_no);
			//console.log("wareName.ware_name ! " +  whinfoarr[i].ware_name);
			
			var option = document.createElement('option');
        	option.value = item_ware_no;
			option.text = item_ware_name;
			targetObj.options.add(option);  //계속 추가가 되서 창고가 같은게 여러개씀
            
        }

        
	}
	
/* 승인요청 버튼 누르면!! 
1. sweetalert 창이 뜬다.(반품 승인 요청하십니까?) 
2. 예라고 하면 승인요청하기(승인요청 시 refund테이블에 refund_confirm_cd변경-update , ware_no 를 저장할수 있어야한다. 
		근데 db에다 넣는건 나중에 하고싶다세션에다 바인딩? .. // refund에 ware_no저장한다면, pro_no에 따라 동적으로 저장할 수 있어야한다 ) */
	function  btnGoToCEO(){
	/* 3가지 값을 가져가야 할 것 같다. refund 테이블의 프라이머리키 3개,. 근데 값을 어떻게 가져가지?? ajax타야하나? */
	
		//jQuery API 검색해보기!  id로 값 가져오기!! 
		//var refund_no = document.getElementByID("refund_no").value
		var refund_no = $("#refund_no").val();
		var origin_ware_no = $("#origin_ware_no").val();
		var ware_no = $("#pick_warehouse :selected").val();
		var pro_no = $("#pro_no").val();

	
		var param =  {			 	 //기존창고와 새로운창고를 같이 보낸다. 
					refund_no : refund_no, /* refund 에 pk가 3개다.  */
					ware_no : ware_no,
					pro_no : pro_no,  /* 창고리스트를위해서 */		
					origin_ware_no : origin_ware_no /*  원래 선택했던것! 히든으로 html에 넣어놓음!! */
		}
		
		var resultCallback3 = function(data){
			swal("승인완료!");
			
			//처음화면으로 돌아가게끔
			fSelectRefundList(); 
			
			gfCloseModal(); // 모달 닫기	
		}			
	
	
	
	/* sweetalert 창에 대한 버튼 */
		swal("반품 승인 요청하시겠습니까?", {
			  buttons:{
				  yes : "예",
				  no : "아니오"
			  }
			}).then((value) => {  /* 이건 이클립스가 게을러서 뜨는 에러!  */
				
				switch(value){
				case "yes": 
					callAjax("/scm/updateRefundWareNo.do","post","text", true, param, resultCallback3);	
					break;
				case "no": 
					break;
				
				}
			});
	
			
	}
	
	
	
	
	 /* 팝업내 수정, 저장 validation   나중에 하기! 저장수정 생기면! */
	 function fValidatePopup(){
		 var chk = checkNotEmpty(
				 [
					 ["refund_no", "환불 번호를 입력해주세요!"],
					 ["refund_date", "환불 날짜를 입력해주세요!"],
	
					 ["company_name", "제품코드를 선택해주세요!"],
					 ["pro_no", "모델명을 입력해주세요!"],
					 ["pro_name", "제조사를 입력해주세요!"],
					 ["refund_qty", "제품 가격을 입력해주세요!"],

					 ["total_price", "납품단가를 입력해주세요!"],
					 ["refund_note", "반품사유를 입력하세요!"]
				 ]
		 );
		 	
	 	if(!chk){return;}
	 	return true;
	 }


	
</script>

<style>
select {
	background-color: white;
}
.ui-widget{
	text-align: center;
	height : 120%;
	readonly
}
</style>

</head>
<body>
	<!-- html 페이지 -->
	
	
	<c:if test="${sessionScope.userType ne 'A'}">  <!-- url 접근 session으로 막는다. scm은 A -->
		<c:redirect url="/dashboard/dashboard.do" />
	</c:if>

	<form id="refund action=" " method="">
		<input type="hidden" id="currentPage" value="1">
		<input type="hidden" id="tmpList" value="">
		<input type="hidden" id="tmpListNum" value="">
		<input type="hidden" name="action" id="action" value="">


		<div id="wrap_area">

			<h2 class="hidden">header 영역</h2>
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

			<h2 class="hidden">컨텐츠 영역</h2>
			<div id="container">
				<ul>
					<li class="lnb"><jsp:include
							page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
					</li>
					<li class="contents">
						<h3 class="hidden">contents 영역</h3> <!-- content -->
						<div class="content">

							<p class="Location">
								<a href="/dashboard/dashboard.do" class="btn_set home">메인으로</a>
								<span class="btn_nav">거래 내역</span> 
								<span class="btn_nav bold">반품 신청 목록</span> 
								<a onClick="top.location='javascript:location.reload()'" class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle" id="searcharea">
								<span>반품 신청 목록 </span> 
							
							<span class="fr">
						<!-- 	<label><input type="checkbox" id="delcheck" name="delcheck" value="del"> 삭제된 정보 표시</label>  -->
						
							
							<select id="searchKey" name="searchKey" style="width: 150px; height: 32px;" v-model="searchKey">
									<option value="refund_all" selected="selected">반품 전체</option>
									<option value="refund_no">반품 코드</option>
									<option value="pro_no">제품 번호</option>
									<option value="pro_name" >제품명</option>								
							</select> 
							
							<input type="text" id="daterange" name="daterange" class="daterange" placeholder="반품 신청일 기간 조회" style="width: 150px; height: 30px;">
							<input type="text" style="width: 200px; height: 30px;" id="sname" name="sname"> 
							<!--  
							데이터피커							
							<input type="date" style="width: 120px" id="from_date" name="from_date">                         
                            <input type="date" style="width: 120px" id="to_date" name="to_date"> -->
							
							<a href="" class="btnType blue" id="btnSearch" name="btn"><span>검색</span></a>
							</span> 
							</p>

							<!-- 화면에뿌려줄 목록 -->
							<div class="div">
								<table class="col">
									<caption>caption</caption>

									<thead>
										<tr>
											<th scope="col" width= "15%">기업명</th>
											<th scope="col">반품 코드</th>
											<th scope="col">반품 신청일</th>
											<th scope="col">제품 번호</th>
											<th scope="col">제품명</th>
											<th scope="col">주문 수량</th>
											<th scope="col">반품 수량</th>
											<th scope="col">반품 총 금액</th>
											<th scope="col">반품지시서</th>
										</tr>
									</thead>
									<tbody id="refundList"></tbody>
									<!-- 여기서 refundList.jsp 불러와서 바디에 뿌림. -->
								</table>

								<!-- 페이징 처리  -->
								<div class="paging_area" id="pagingnavi">
									<div class="paging">
										<a class="first" href="javascript:fSelectRefundList(1)"> <span
											class="hidden">맨앞</span></a> <a class="pre"
											href="javascript:fSelectRefundList(1)"> <span
											class="hidden">이전</span></a> <strong>1</strong> <a
											href="javascript:fSelectRefundList(2)">2</a> <a
											href="javascript:fSelectRefundList(3)">3</a> <a
											href="javascript:fSelectRefundList(4)">4</a> <a
											href="javascript:fSelectRefundList(5)">5</a> <a class="next"
											href="javascript:fSelectRefundList(5)"> <span
											class="hidden">다음</span></a> <a class="last"
											href="javascript:fSelectRefundList(5)"> <span
											class="hidden">맨뒤</span></a>
									</div>
								</div>

							</div>

						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>



		<!-- 반품지시서  모달 -->
		<div id="refundDoc" class="layerPop layerType2"
			style="width: 1000px; height: auto;">
			<input type="hidden" id="refund" name="modal">
			<!-- 수정시 필요한 refund_no 값을 넘김  -->
			<dl>
				<dt>
					<strong>반품 지시서</strong>
				</dt>
				<dd class="content">
					<table class="col">
						<caption>모달창첫줄</caption>
						<colgroup>
							<col width="10%">
							<col width="12%">
							<col width="10%">
							<col width="6%">
						</colgroup>

						<thead>
							<tr>
								<th scope="col">반품 코드</th>
								<th scope="col">반품 신청일</th>
								<th scope="col">제품번호</th>
								<th scope="col">제품명</th>
							</tr>
						</thead>
						<tbody>
							<tr>

								<td id=""><input type="text" name="refund_no" class="ui-widget ui-widget-content ui-corner-all" readonly
									id="refund_no" value="" /></td>
								<td id=""><input type="text" name="refund_date" class="ui-widget ui-widget-content ui-corner-all" readonly
									id="refund_date" value="" /></td>
								<!-- 나중에 데이트피커로 바꾸는것 고려 -->
								<td id=""><input type="text" name="pro_no" id="pro_no" class="ui-widget ui-widget-content ui-corner-all" readonly
									value="" /></td>
								<td id=""><input type="text" name="pro_name" id="pro_name" class="ui-widget ui-widget-content ui-corner-all" readonly
									value="" /></td>

							</tr>
						</tbody>
					</table>

					<table class="col">
						<caption>모달창둘째줄</caption>
						<colgroup>
							<col width="10%">
							<col width="12%">
						</colgroup>

						<thead>
							<tr>
								<th scope="col">반품 수량</th>
								<th scope="col">총금액</th>

							</tr>
						</thead>
						<tbody>
							<tr>
								<td id=""><input type="text" name="refund_qty" class="ui-widget ui-widget-content ui-corner-all" readonly
									id="refund_qty" value="" /></td>
								<td id=""><input type="text" name="total_price" class="ui-widget ui-widget-content ui-corner-all" readonly
									id="total_price" /></td>
								
							</tr>
						</tbody>
					</table>
	<input type="hidden" id="origin_ware_no" name="origin_ware_no" value="">	 		
					<table class="row">
						<caption>선택박스</caption>
						<colgroup>
							<col width="15%">
							<col width="5%">
							<col width="10%">
							<col width="15%">
						</colgroup>

						<tbody>
							<tr>
								<th scope="row">창고 선택</th>
								<td><select style="width: 200px" id="pick_warehouse"
									name="pick_warehouse">
								</select></td>
							</tr>

						</tbody>
					</table>



					<div class="btn_areaC mt30">
						<a href="javascript:btnGoToCEO()" class="btnType blue" ><span>승인요청</span></a>
						<a href="" class="btnType gray" id="btnClose" name="btn"><span>닫기</span></a>
					</div>
				</dd>
			</dl>
			<a href="" class="closePop"><span class="hidden">창닫기</span></a>
		</div>



	</form>

</body>
</html>
