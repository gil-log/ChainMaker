<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${sessionScope.userType ne 'A'}">
  <c:redirect url="/dashboard/dashboard.do"/>
</c:if>
<div id="wh" class="layerPop layerType2" style="width: 1000px; height: 400px;">
  <input type="hidden" id="modalCD" name="modalCD">
  <dl>
    <dt>
      <strong>창고 정보 등록</strong>
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
            <th scope="row" style="width: 70px;" id="ware_cd_th">창고 코드</th>
            <td id="ware_cd_td"><input type="text" name="ware_no" id="ware_no" readonly="readonly" /></td>
            <th scope="row" style="width: 70px">창고명 <span class="font_red">*</span></th>
            <td><input type="text" name="ware_name" id="ware_name" /></td>
          </tr>
          <tr>
            <th scope="row" style="width: 70px">담당자 <span class="font_red">*</span></th>
            <td style="display: flex;"><input type="text" name="mng_name" id="mng_name" readonly="readonly" />
              <div id="mngDiv">
                <select id="selectMng" name="selectMng" onchange="selectedMng(this.options[this.selectedIndex].value)">
                  <!-- option 자바스크립트로 동적 생성 -->
                </select>
              </div></td>
            <th scope="row">연락처</th>
            <td><input style="width: 200px" type="text" id="tel" name="tel" readonly="readonly"></td>
          </tr>
          <tr>
            <th scope="row">이메일</th>
            <td style='width: 30%'><input type="text" name="email" id="email" size="30" readonly="readonly"></td>
          </tr>
          <tr>
            <th style="width: 70px" scope="row">우편 번호<span class="font_red">*</span></th>
            <td colspan="4">
            <input type="text" name="zipcode" id="zipcode" /><input type="button" value="우편번호 찾기" onclick="execDaumPostcode()">
            </td>
          </tr>
          <tr>
            <th style="width: 70px" scope="row">주소<span class="font_red">*</span></th>
            <td colspan="4"><input type="text" name="address" id="address" size="100" /></td>
          </tr>
          <tr>
            <th style="width: 70px" scope="row">상세 주소<span class="font_red">*</span></th>
            <td colspan="4"><input type="text" name="dt_address" id="dt_address" size="100" /></td>
          </tr>
        </tbody>
      </table>
      <div class="btn_areaC mt30" id="btnBox">
        <%-- <c:set var="modalCD" value="${modalCD}" />
        <c:if test="${modalCD eq 'modify' }">
          <a href="" class="btnType blue" id="btnUpdateUser" name="btn"><span>수정</span></a>
          <a href="" class="btnType blue" id="btnUpdateUser" name="btn"><span>삭제</span></a>
        </c:if>
        <c:if test="${modalCD eq 'init' }">
          <a href="" class="btnType blue" id="btnSaveUser" name="btn"><span>등록</span></a>
        </c:if> --%>
        <!-- <a href="" class="btnType gray" id="btnClose" name="btn"><span>취소</span></a> -->
      </div>
    </dd>
  </dl>
  <a href="" class="closePop"><span class="hidden">닫기</span></a>
</div>