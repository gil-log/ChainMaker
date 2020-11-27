<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="refundModal" class="layerPop layerType2" style="width: 1000px; height: 400px;">
  <input type="hidden" id="modalCD" name="modalCD">
  <dl>
    <dt>
      <strong>반품 정보</strong>
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
              </td>
            <th scope="row">연락처</th>
            <td><input style="width: 200px" type="text" id="tel" name="tel" readonly="readonly"></td>
          </tr>
          <tr>
            <th scope="row">이메일</th>
            <td style='width: 30%'><input type="text" name="email" id="email" size="30" readonly="readonly"></td>
          </tr>
          <tr>
            <th style="width: 70px" scope="row">우편 번호<span class="font_red">*</span></th>
            <td colspan="4"><input type="text" name="zipcode" id="zipcode" />
              <input type="button" value="우편번호 찾기" onclick="execDaumPostcode()"></td>
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
        <a href="" class="btnType blue" id="btnRefund" name="btn">
          <span>반품</span>
        </a>
        <a href="javascript:gfCloseModal()" class="btnType gray" id="btnClose" name="btn">
          <span>취소</span>
        </a>
      </div>
    </dd>
  </dl>
  <a href="" class="closePop">
    <span class="hidden">닫기</span>
  </a>
</div>