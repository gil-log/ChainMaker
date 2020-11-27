<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<title>ShoppingCart</title>
<!-- common Include -->
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<!-- 빌립 페이지 vue로 작업 -->
<script>


	//상단테이블 페이징 설정
	var pageSize = 15;
	var pageBlockSize = 10;
	
	//Vue.js 사용 변수 설정
	var cartvm;
	var delvm;
	
	//페이지로드 작동 메서드
	$(document).ready(function(){
		
		init();
		//창고별 제품 목록 조회		
		CartList();
		
	});
	
	function init(){
		
		//alert("init 잘타나요");
			
		cartvm = new Vue({
			el:"#divCartList",
			components:{	
				"bootstrap-table":BootstrapTable
			},
			data:{
				items:[]
				, checks:[]
			},
			computed:{
				/*  computed :  template내부에 선언된 computed중에서 해당 함수와 연결된 값이 바뀔 때만 해당 함수만을 실행한다.
					methods :   template내부에 선언된 methods중에서 update라이프사이클이 동작한(=아무 변수나 바뀐)다면 함수를 모두 실행한다.
				*/
			}
			,
			methods:{
				  cartdel:function(no){	
					  	//alert("삭제 잘타나요?");
					  	console.log("cartdel의 no" + no);
						fcartdel(no); 
				  },
				  cartupd:function(no, date){
					  	//alert("업뎃 잘타나요?");
					  	//console.log("cartupd의 no : " + no);
					  	//console.log("cartupd의 date : " + date)
						fcartupd(no, date); 
				  },
				  changeTotalPrice:function(){
					  changeTotalPrice();
				  }
			}
		});
		
		vm2 = new Vue({
			el:"#cart_hap",
			data:{
				hap : 0
			},
			methods:{
				/* 
					  
				  } */
			}
			
		})
		
	}
	   
	//장바구니 조회
	function CartList(currentPage){
		   
		//alert("CartList 타나요?");
		currentPage=currentPage || 1;
		
		var param={
				currentPage : currentPage,
				pageSize : pageSize
		}
		
		var resultCallback = function(data){
			
			CartListResult(data, currentPage);
		}

		
		callAjax("/epc/ShoppingCartList.do", "post", "json", true, param, resultCallback);
	}
	//장바구니 조회 콜백
	function CartListResult(data, currentPage){
		console.log(data);
		
		cartvm.items=[];
		cartvm.items=data.listCart;
		
		//총 개수 추출
		var totalCount=data.totalCount;
		
		//페이지 네비게이션 생성
		var paginationHtml = getPaginationHtml(currentPage, totalCount, pageSize, pageBlockSize, "CartList");
		
		$("#CartPagination").empty().append( paginationHtml );
		
		$("#currentPageCart").val(currentPage);		
	}

		
		/** 장바구니 삭제 */
		function fcartdel(no) {
			console.log(" fcartdel의 no : " + no);
			//var no = $("#delCartno").val();	
			
			var param = {
					no : no
		    }
		
		    var resultCallback = function(data) {
			    	fCartResult(data);
			        };
			        //Ajax실행 방식
		    callAjax("/epc/delCart.do", "post", "json", true, param, resultCallback);
			
		}

		/**장바구니 삭제 Callback */
		function fCartResult(data) {
			
			if (data.result == "SUCCESS") {
				
				// 응답 메시지 출력
				alert(data.resultMsg);
	            
				// 목록 조회
				CartList();
				
			} else {
				// 오류 응답 메시지 출력
				alert(data.resultMsg);
			}
			
		}
		/** 장바구니 날짜 변경 */
		function fcartupd(no, date) {
			console.log(" fcartupd의 no : " + no);
			console.log(" fcartupd의 date : " + date);
			//var no = $("#delCartno").val();	
			
 			var param = {
					no : no,
					date : date
		    }
		
		    var resultCallback = function(data) {
			    	fCartResult(data);
			        };
			        //Ajax실행 방식
		    callAjax("/epc/updCart.do", "post", "json", true, param, resultCallback); 
			
		}

		
		function numCheck(obj){
			 var num_check=/^[0-9]*$/;
				if(!num_check.test(obj)){
				return false;
			}
			return true;
		}

		function changeTotalPrice() {
		
				var no = 0;
				var totalPrice = 0; 
		        var checks = $('input:checkbox[id="chked"]');
		        console.log('checks.length ==> ' + checks.length);
		        for(var i = 0; i < checks.length; i++) {
		            var check = checks[i];
		            if($(check).is(":checked") == true) {
		            	var no = $(check).parent().next().next().next().next().children().data("bno");
		                var price = $(check).parent().next().next().next().text(); // 행 별 가격
		                var numberInput = $(check).parent().next().next().next().next().children(); // 행 별 수량을 구하기 위한 input
		                var amount = $(numberInput).val() * 1;
		                if(amount <= 0){
		                	alert('1개 이상의 수량만 가능합니다.');
		                	($(numberInput).val(1));
		                	//numberInput = 1;
		                	return
		                }
		                if(!numCheck(amount)){
		            		alert("소숫점은 입력할 수 없습니다.");
		            		($(numberInput).val());
		            		return
		            	}
		                var total = $(check).parent().next().next().next().next().next(); // 총 금액 td 태그
		                $(total).text((parseInt(price) * parseInt($(numberInput).val()))); // 행 별 총 금액
		                totalPrice = totalPrice + (parseInt(price) * parseInt($(numberInput).val()));
		            }
		        }
		        console.log($(numberInput).val());
		        vm2.hap = totalPrice;
		        console.log("totalPrice ---------" + totalPrice);
		        console.log("no ==========" + no);
		        var param = {
		        		
		        		bas_qty : numberInput
		        		
		        }
		        
		    }



function fAdminBankModal(loginID) {
	//alert("모달");
	// 신규저장 하기 버튼 클릭시 (값이 null)

		fdetailModal();

}

function frealPopModal(object) {

	if (!(object == "" && object == null && object == undefined)) {
		//alert("??");
		console.log(object);

		$('#checkstaff option').each(function(){
			$(this).prop('disabled', false);
		}); 


		$("#rloginID").val("");
		$("#rloginID").attr("readonly", false);

		$("#name").text(object.name);
		$("#bank_name").text(object.bank_name);
		$("#user_account").text(object.user_account);
		$("#totalHap").text(vm2.hap);

		
		$("#btnSaveUser").show();
		$("#duplicate_check").show();
		

	}
}

function fdetailModal() {
	//alert("입금 조회  ");

	var param = {
	};
	var resultCallback2 = function(data) {
		fBankResult(data);
	};

	callAjax("/epc/adminBank.do", "post", "json", true, param,
			resultCallback2);
	//alert(" 상세 조회  22");

}

/* 콜백함수   */
function fBankResult(data) {

	//alert("admin bank  33");
	if (data.resultMsg == "SUCCESS") {
		//모달 띄우기 
		gfModalPop("#admin_bank");

		//alert(data.result);
		// 모달에 정보 넣기 
		frealPopModal(data.result);

	} else {
		alert(data.resultMsg);
	}
}

function deposit_click(){
	//alert("타나요...");
	var rowData = new Array();
	var tdArr = new Array();
	var checkbox = $("input[name ='chkbox[]']:checked");
	var hid = $("#basNo").val();
	   
	checkbox.each(function(i){
		var tr = checkbox.parent().parent().eq(i);
		var td = tr.children();
		var bas_qty = checkbox.parent().next().next().next().next().children().val(); // 수량 넘기기
		
		rowData.push(tr.text());
		
		tdArr.push($(this).data("bno")); // data-bno 값 담기
		tdArr.push(bas_qty);
		
	   });
	   
	   //console.log("tdArr" + tdArr);
	   
		var param={
				chbox : tdArr
		}
		
 		var resultCallback = function(data){
			fComplete(data);
			CartList();
		} 
	   
	   
	   callAjax("/epc/cartorder.do", "post", "json", true, param, resultCallback);
}

	function keyevent(){
		if(event.keyCode<48 || event.keyCode>57){
			event.returnValue=false;
		}
	}

</script>
<style>

/* input type = number 화살표 항상 보이게 */
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button {  

   opacity: 1;

}

.num
{
	width:40px; 
	text-align: center;
}

.date_pick
{
	width:100%;
	height:100%;
	text-align: center;
	outline:0;
}
</style>
</head>
<body>	
	<form id="myForm" action=""  method="">
		<input type="hidden" name="currentPageCart" id="currentPageCart" value="">
		<input type="hidden" name="delCartno" id="delCartno" value="">
		
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
								<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
								<a href="#" class="btn_nav">주문</a> <span class="btn_nav bold">장바구니 목록</span> 
								<a onClick="top.location='javascript:location.reload()'" class="btn_set refresh">새로고침</a>
							</p>
							
							<!-- 검색 영역 -->
							<p class="search">
	
							</p>
							<p class="conTitle" id="searchArea">
								 <span>장바구니</span>
								 <span class="fr"> 		
								</span>
							</p>
							
							
							<!-- 상단 테이블 영역 -->
							<div class="divCartList" id="divCartList">
								<table class="col" id="tbl">
									<colgroup>
									    <col width="10%">
										<col width="10%">
										<col width="15%">
										<col width="15%">
										<col width="8%">
										<col width="12%">
										<col width="25%">
										<col width="10%">
									</colgroup>
					
									<thead>
										<tr>
										    <th scope="col">선택</th>
											<th scope="col">사진</th>
											<th scope="col">모델명</th>
											<th scope="col">가격</th>
											<th scope="col">수량</th>
											<th scope="col">총 금액</th>
											<th scope="col">납품 희망일자</th>
											<th scope="col">삭제</th>
										</tr>
									</thead>
									
									<!-- 상단테이블 DB데이터 출력 영역 -->
									
									<tbody id="listCart">
									<!-- cartvm에 담긴 items의 정보를 가져와 테이블에 뿌리는 코드 (Vue.js) -->
										<template v-for="(row, index) in items" v-if="items.length">
											<tr>
												<td>
												<input type="checkbox" id="chked" name="chkbox[]" :value="row.bas_no" v-model="checks[index]" 
												onclick="changeTotalPrice()" class="chBox" :data-bno="row.bas_no">
												<!-- {{checks[index]}} items[index] -->
												</td>
											    <td><img alt="제품 이미지" src="{{ row.file_server_path}}" width="50" height="50"></td>
												<td>{{ row.pro_name }}</td>
												<td name="itemPrice">{{ row.pro_price }}</td>
												<td><input type="number" onchange="changeTotalPrice()" :value="row.bas_qty" v-model="row.bas_qty" 
												class="num" min="1" :data-bno="row.bas_no" onkeypress="keyevent();"/></td>
												<td>{{ row.pro_price * row.bas_qty }} </td>
												<td>
												     <input type="date" v-model="row.bas_date" :data-bdate="row.bas_date" name="b_date">
												     <a class="btnType3 color1" @click="cartupd(row.bas_no, row.bas_date)"><span id="searchEnter">변경</span></a>	
												</td>
												<td>
													<p class="btnType3 color1" @click="cartdel(row.bas_no)"><a class="btnType3 color1"><span id="searchEnter">삭제</span></a>	
												</td>						
											</tr>
										</template>
									</tbody>
								</table>
							</div>	<!-- .divWhInventoryList 종료 -->
							
							<!-- 상단테이블 페이지 네비게이션 영역 -->
							<div class="pagingArea"  id=CartPagination> </div> 
							
							<br /><br /><br />
							
							<div id="cart_hap" style="float:right; width:300px; font-size:20px;">
								<p>
									<span>장바구니 총액</span>
									<br />
									<hr />
									<span>합계 금액</span> 
									<sapn id="hap" name="hap"> &nbsp&nbsp&nbsp {{hap}}원  </sapn>
									<br /><br />
								</p>
								<div style="float:right;">
									<a class="btnType blue" href="javascript:fAdminBankModal(${null});" name="modal">
									<span>주문하기</span></a>
								</div>
							</div>   
					</li>	<!-- .content 종료 -->
				</ul>				
			</div>	<!-- #container 종료 -->
			
			<!-- footer Include -->
			<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
			
		</div>	<!-- #wrap_area 종료 -->
		
		<!-- admin bank 모달 -->
		<div id="admin_bank" class="layerPop layerType2" style="width: 500px; height: 400px;">
		<input type="hidden" id="loginID" name="loginID"> <!-- 수정시 필요한 num 값을 넘김  -->
           <dl>
			<dt>
				<strong>주문하기</strong>
			</dt>
			<dd class="content">
		
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
							<th style="width:70px" scope="row">은행명<span class="font_red">*</span></th>
						</tr>
						<tr>
							<td><span name="bank_name" id="bank_name"></span></td>
						</tr>
						<tr>
							<th style="width:70px" scope="row">계좌번호<span class="font_red">*</span></th>
						</tr>
						<tr>
							<td><span name="user_account" id="user_account"></span></td>
						</tr>
						<tr>
							<th style="width:70px" scope="row">예금주<span class="font_red">*</span></th>
						</tr>
						<tr>
							<td><span name="name" id="name"></span></td>
						</tr>
												<tr>
							<th style="width:70px" scope="row">결제금액<span class="font_red">*</span></th>
						</tr>
						<tr>
							<td><span name="totalHap" id="totalHap"></span></td>
						</tr>
						
							
					</tbody>
					
				</table>
				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnSaveUser" name="btn" onClick="deposit_click()"><span>주문하기</span></a>			
					<a href=""	class="btnType gray"  id="btnClose" name="btn"><span>취소</span></a>
				</div>
		    </dd>
          </dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
     </div>

	</form>
		
</body>
</html>