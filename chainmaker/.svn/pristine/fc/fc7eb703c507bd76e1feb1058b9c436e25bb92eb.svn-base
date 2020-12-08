<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:if test="${sessionScope.userType ne 'C'}">
    <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>Chain Maker :: 정보수정</title>

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
        
</script>
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<script src="${CTX_PATH}/js/view/epc/myPage/myPage.js"></script>

<script
src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<form id="myUser" action=""  method="">

	<input type="hidden" id="selectedInfNo" value="">
	<input type="hidden" name="action" id="action" value="">
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
							<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a> <span
								class="btn_nav bold">마이페이지</span> <span
								class="btn_nav bold">정보 변경</span> <a href="../epc/mypage"
								class="btn_set refresh">새로고침</a>
						</p>
						
					<p class="conTitle">
                        <span>마이 페이지 </span> 
                        
                        <span class="fr">
                        <a href="" class="btnType blue" id="btnDeleteUser" name="btn">
                        <span>회원 탈퇴</span>
                        </a></span>
					</p>
											
					<div>
					<input type="hidden" id="loginID" name="loginID" /> <!-- 수정시 필요한 num 값을 넘김  -->
          			 <dl>
			
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
							<th scope="row" style="width:70px">아이디 <span class="font_red">*</span></th>
							<td><input type="text" name="rloginID" id="rloginID" />
							</td>
							
							<th style="width:70px" scope="row">비밀번호<span class="font_red">*</span></th>
							<td><input type="password" name="password" id="password" /></td>
						</tr>
						
						<tr>
							<th scope="row">연락처 <span class="font_red">*</span></th>
							<td>
								<input style="width:50px" type="text" id="tel1" name="tel1">
								-
								<input style="width:50px" type="text" id="tel2" name="tel2">
								-
								<input style="width:50px" type="text" id="tel3" name="tel3" >									
							</td>
							<th style="width:70px" scope="row">비밀번호 확인<span class="font_red">*</span></th>
							<td><input type="password" name="repassword" id="repassword" /></td>
									
						</tr>
						
						<tr>
							<th scope="row" style="width:70px">이름<span class="font_red">*</span></th>
							<td><input type="text" name="name" id="name"/></td>
							
							<th scope="row">이메일 </th>
							<td style='width:30%'>
								<input type="text"  name="email" id="email" size="30">
							</td>					
						</tr>
						
						<tr id="outstaff">
							<th scope="row" style="width:70px">회사명<span class="font_red">*</span></th>
							<td colspan="4"><input type="text" name="company" id="company"/></td>
							
						</tr>
						
						<tr>
							<th style="width:70px" scope="row">우편번호<span class="font_red">*</span></th>
							<td colspan="4"><input type="text" name="zipcode" id="zipcode"/>
							<input type="button" value="우편번호 찾기"
								onclick="execDaumPostcode()"
								style="width: 130px; height: 20px;" />
							</td>
						</tr>
						<tr>
							<th style="width:70px" scope="row">주소<span class="font_red">*</span></th>
							<td colspan="4"><input type="text" name="address" id="address" size="100"/></td>
						</tr>
						<tr>
							<th style="width:70px" scope="row">상세주소<span class="font_red">*</span></th>
							<td colspan="4"><input type="text" name="dt_address" id="dt_address" size="100"/></td>
						</tr>
							
					</tbody>
					
				</table>
				<div class="btn_areaC mt30">
					
					<a href="" class="btnType blue" id="btnUpdateUser" name="btn"><span>정보 수정</span></a>			
					
				</div>
		    	</dd>
          		</dl>
				<!-- <a href="" class="closePop"><span class="hidden">닫기</span></a> -->
     			</div>
					</div>
			
				</li>
				</ul>
				
		</div>
	</div>

	
</form>
</body>
</html>