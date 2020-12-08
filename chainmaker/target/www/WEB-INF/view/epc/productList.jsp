<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.userType ne 'C'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Chain Maker :: 제품 목록</title>

<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>

<script type="text/javascript">
</script>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<script src="${CTX_PATH}/js/view/epc/productList/productList.js"></script>

</head>
<body>
<form id="myForm" action=""  method="">
	<input type="hidden" id="currentPageProductList" value="1">
	<input type="hidden" id="tmpProductList" value="">
	<input type="hidden" id="tmpProductListNm" value="">
	<input type="hidden" name="action" id="action" value="">
	<input type="hidden" id="exBasket" name = "exBasket" value="${exBasket}"/>
	
	<!-- 모달 배경 -->
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
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">주문</span> <span class="btn_nav bold">제품목록
								</span> <a href="../epc/productList.do" class="btn_set refresh">새로고침</a>
						</p>
						
					<!--검색창   -->
					
                     
						<p class="conTitle">
							<span>제품 목록</span> <span class="fr"> 
							</span>
						</p>
						
						<table width="100%" cellpadding="5" cellspacing="0" border="1" align="left"
                        style="border-collapse: collapse; border: 1px #50bcdf;">
                        <tr style="border: 0px; border-color: blue">
                           <td width="100" height="25" style="font-size: 120%">&nbsp;&nbsp;</td>
                           <td width="50" height="25" style="font-size: 100%; text-align:right;padding-right:25px;">
     	                       <select id="searchKey" name="searchKey" style="width: 150px;" v-model="searchKey" onchange="fSelect(this)">
									<option value =""></option>
								
							    </select> 
							   
     	                      	<select  style="width:150px; "id="good" >
									<option></option>					
							 	</select>
								
     	                       <input type="text" style="width: 150px; height: 25px;" id="sname" name="sname">                    
	                           <a href="" id = "btnSearch" class="btnType blue" name="btn"><span>검  색</span></a>
                           </td> 
                           
                        </tr>
                     </table> &nbsp;&nbsp;
						<div class="divProductListList">
							<table class="col">
								<caption>caption</caption>
								<colgroup>
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									<col width="10%">
									
								</colgroup>
	
								<thead>
									<tr>
										<th scope="col">장비번호</th>
										<th scope="col">장비구분</th>
										<th scope="col">모델명</th>
										<th scope="col">제조사</th>
										<th scope="col">판매가격</th>
									
									</tr>
								</thead>
								<tbody id="listProductList"></tbody>
							</table>
						</div>
	
						<div class="paging_area"  id="ProductListPagination"></div>
	
						
	
						
						

					</div> <!--// content -->

					<h3 class="hidden">풋터 영역</h3>
						<jsp:include page="/WEB-INF/view/common/footer.jsp"></jsp:include>
				</li>
			</ul>
		</div>
	</div>

<div id="layer1" class="layerPop layerType2" style="width: 600px;">
		<dl>
			<dt>
				<strong>제품 상세보기</strong>
			</dt>
			<dd class="content">
				<!-- s : 여기에 내용입력 -->
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
							<th scope="row">모델번호</th>
							<td><input type="text" maxlength="15" name="pro_num" id="pro_num" ></td>
							<th scope="row">제품이미지</th>
							<td colspan="2" style="text-align:center;">
								 	<img id="tempImg" style="object-fit: cover;max-width:100%" src="" alt="제품사진미리보기">
							</td>
						</tr>
						<tr>
							<th scope="row">제조사</th>
							<td><input type="text" maxlength="15" name="pro_manu_nm" id="pro_manu_nm" /></td>
								
							<th scope="row">주문수량</th>
							
							
							<!-- <input type="text"  name="od_qty" id="od_qty" value = "1"  /> -->
							
							<td><input type="number" id="od_qty" name = "od_qty" value="1" v-model="od_qty" class="num" min="1" /></td>
						</tr>
				
						<tr>
							<th scope="row">판매가격 </th>
							<td><input type="text" maxlength="10" name="pro_prc" id="pro_prc" ></td>
							
							<th scope="row">납품희망일</th>
							<td><input type="text" id="startDate" name = "startDate" readonly ></td>
                           	
						</tr>
						
						<tr>
							<th scope="row">상세정보</th>
								<td colspan="3">
							<textarea id="pro_det" maxlength="500" name="pro_det" style="height:130px;outline:none;resize:none;" placeholder="여기에 상세정보를 적어주세요.(500자 이내)"></textarea>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- e : 여기에 내용입력 -->

				<div class="btn_areaC mt30">
					<a href="" class="btnType blue" id="btnInBasket" name="btn"><span>장바구니</span></a> 
					<a class="btnType blue" href="javascript:fAdminBankModal(${null});" name="modal">
									<span>주문하기</span></a> 
					<a href=""	class="btnType gray"  id="btnCloseProductList" name="btn"><span>취소</span></a>
				</div>
			</dd>
		</dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
	</div>
	
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
					<a href="" class="btnType blue" id="btnInOrder" name="btn" ><span>주문하기</span></a>
					
					<!-- onClick="deposit_click()" -->			
					<a href=""	class="btnType gray"  id="btnCloseProductList" name="btn"><span>취소</span></a>
				</div>
		    </dd>
          </dl>
		<a href="" class="closePop"><span class="hidden">닫기</span></a>
     </div>
	
</form>
</body>
</html>