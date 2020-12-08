package kr.happyjob.chainmaker.dlm.service;

import java.util.Collections;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.dlm.dao.DlmPurchaseOrderDao;
import kr.happyjob.chainmaker.dlm.model.DlmPurchaseAndRefundInfoDTO;
import kr.happyjob.chainmaker.dlm.model.DlmPurchaseOrderDTO;
import kr.happyjob.chainmaker.dlm.model.DlmPurchaseOrderVO;
import kr.happyjob.chainmaker.dlm.model.PurchaseOrderPgAndScKeyWordDTO;
import java.util.Comparator;
import java.util.HashMap;

@Service
public class DlmPurchaseOrderServiceImpl implements DlmPurchaseOrderService {
  
  @Autowired
  DlmPurchaseOrderDao dlmPurchaseOrderDao;
  
  @Override
  // 담당자 별 발주 리스트 목록 조회
  public List<DlmPurchaseOrderDTO> purchaseOrderListByMng(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO) throws Exception {
    // VO에서 DTO변환 과정
    List<DlmPurchaseOrderVO> purchaseOrderList = dlmPurchaseOrderDao.purchaseOrderListByMng(purchaseOrderPgAndKeyWordDTO);
    Iterator<DlmPurchaseOrderVO> iter = purchaseOrderList.iterator();
    
    List<DlmPurchaseOrderDTO> resultDTOList = new LinkedList<DlmPurchaseOrderDTO>();
    
    while (iter.hasNext()) {
      DlmPurchaseOrderVO dlmPurchaseOrderVO = iter.next();
      DlmPurchaseOrderDTO resultDTO = new DlmPurchaseOrderDTO(dlmPurchaseOrderVO);
      resultDTOList.add(resultDTO);
    }
    return resultDTOList;
  }
  
  @Override
  // 발주 리스트 조회 목록 수
  public int purchaseOrderListTotal(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO) throws Exception {
    return dlmPurchaseOrderDao.purchaseOrderListTotal(purchaseOrderPgAndKeyWordDTO);
  }
  
  @Override
  // 업체별 발주 상세 목록 조회
  public List<DlmPurchaseOrderDTO> purchaseOrderDtlListByCompany(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO) throws Exception {
    // VO에서 DTO변환 과정
    List<DlmPurchaseOrderVO> purchaseOrderDtlList = dlmPurchaseOrderDao.purchaseOrderDtlListByCompany(purchaseOrderPgAndKeyWordDTO);
    Iterator<DlmPurchaseOrderVO> iter = purchaseOrderDtlList.iterator();
    
    List<DlmPurchaseOrderDTO> resultDTOList = new LinkedList<DlmPurchaseOrderDTO>();
    
    while (iter.hasNext()) {
      DlmPurchaseOrderVO dlmPurchaseOrderVO = iter.next();
      DlmPurchaseOrderDTO resultDTO = new DlmPurchaseOrderDTO(dlmPurchaseOrderVO);
      resultDTOList.add(resultDTO);
    }
    return resultDTOList;
  }
  
  // 정렬을 위한 comparator 익명 클래스
  Comparator<DlmPurchaseAndRefundInfoDTO> purchaseComparator = new Comparator<DlmPurchaseAndRefundInfoDTO>() {
    @Override
    public int compare(DlmPurchaseAndRefundInfoDTO dto1, DlmPurchaseAndRefundInfoDTO dto2) {
      
      int result = 0;
      if (dto1.getPurchase_no() > dto2.getPurchase_no()) { // 오름차순 정렬
        result = 1;
      } else if (dto1.getPurchase_no() == dto2.getPurchase_no()) {
        result = 0;
      } else if (dto1.getPurchase_no() < dto2.getPurchase_no()) {
        result = -1;
      }
      
      return result;
    }
  };
  
  
  @Override
  // 발주 리스트 상세 조회 목록 수
  public int purchaseOrderDtlListTotal(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO) throws Exception {
    return dlmPurchaseOrderDao.purchaseOrderDtlListTotal(purchaseOrderPgAndKeyWordDTO);
  }
  
  // 반품 정보 생성
  @Override
  @Transactional
  public Map<String, Object> refundInfoInit(List<DlmPurchaseAndRefundInfoDTO> refundList, String loginID) throws Exception {
    
    List<DlmPurchaseAndRefundInfoDTO> orderByPurchaseNoDTOList = new LinkedList<>();
    Map<String, Object> map = new HashMap<String, Object>();
    
    int tempPurchaseNo = 0;
    int nowRefundNo = 0;
    int nowPurchaseNo = 0;
    int refundResult = 0;
    int directionResult = 0;
    int proIoQtyResult = 0;
    int purchaseCDResult = 0;
    
    Collections.sort(refundList, purchaseComparator);
    
    for (Object obj : refundList) {
      System.out.println("------------sortedRefundList : " + obj);
    }
    
    DlmPurchaseAndRefundInfoDTO firstBeforeOrderByPurchaseNoDTO = refundList.get(0);
    firstBeforeOrderByPurchaseNoDTO.setLoginID(loginID);
    
    refundResult += dlmPurchaseOrderDao.insertRefundInfoRequest(firstBeforeOrderByPurchaseNoDTO);
    directionResult += dlmPurchaseOrderDao.insertDirectionInfo(firstBeforeOrderByPurchaseNoDTO);
    
    int firstPurchaseNo = firstBeforeOrderByPurchaseNoDTO.getPurchase_no();
    nowRefundNo = firstBeforeOrderByPurchaseNoDTO.getRefund_no();
    
    tempPurchaseNo = firstPurchaseNo;
    for (int i = 1; i < refundList.size(); i++) {
      
      DlmPurchaseAndRefundInfoDTO nowBeforeOrderByPurchaseNoDTO = refundList.get(i);
      nowBeforeOrderByPurchaseNoDTO.setLoginID(loginID);
      nowPurchaseNo = nowBeforeOrderByPurchaseNoDTO.getPurchase_no();
      
      if (nowPurchaseNo == tempPurchaseNo) {
        nowBeforeOrderByPurchaseNoDTO.setRefund_no(nowRefundNo);
        orderByPurchaseNoDTOList.add(nowBeforeOrderByPurchaseNoDTO);
        
      } else {
        tempPurchaseNo = nowPurchaseNo;
        
        if (!orderByPurchaseNoDTOList.isEmpty()) {
          map.put("orderByPurchaseNoDTOList", orderByPurchaseNoDTOList);
          refundResult += dlmPurchaseOrderDao.insertRefundInfoRequestList(map);
          directionResult += dlmPurchaseOrderDao.insertDirectionInfoList(map);
          
          map.clear();
          orderByPurchaseNoDTOList.clear();
        }
        refundResult += dlmPurchaseOrderDao.insertRefundInfoRequest(nowBeforeOrderByPurchaseNoDTO);
        directionResult += dlmPurchaseOrderDao.insertDirectionInfo(nowBeforeOrderByPurchaseNoDTO);
        nowRefundNo = nowBeforeOrderByPurchaseNoDTO.getRefund_no();
        
      }
      if (i == (refundList.size() - 1) && !orderByPurchaseNoDTOList.isEmpty()) {
        map.put("orderByPurchaseNoDTOList", orderByPurchaseNoDTOList);
        refundResult += dlmPurchaseOrderDao.insertRefundInfoRequestList(map);
        directionResult += dlmPurchaseOrderDao.insertDirectionInfoList(map);
        
        map.clear();
        orderByPurchaseNoDTOList.clear();
      }
    }
    for (DlmPurchaseAndRefundInfoDTO dto : refundList) {
      System.out.println("----------------------------dto : " + dto);
      orderByPurchaseNoDTOList.add(dto);
    }
    map.put("orderByPurchaseNoDTOList", orderByPurchaseNoDTOList);
    
    proIoQtyResult = dlmPurchaseOrderDao.updateProIoWhQty(map);
    purchaseCDResult = dlmPurchaseOrderDao.updatePurchaseCD(map);
    
    map.clear();
    
    map.put("refundResult", refundResult);
    map.put("directionResult", directionResult);
    map.put("proIoQtyResult", proIoQtyResult);
    map.put("purchaseCDResult", purchaseCDResult);
    
    return map;
  }
  
  @Override
  @Transactional
  // 입고 처리 및 재고 관리
  public Map<String, Object> purchaseAndMngStorage(List<DlmPurchaseAndRefundInfoDTO> purchaseList, String loginID) throws Exception {
    
    List<DlmPurchaseAndRefundInfoDTO> orderByPurchaseNoDTOList = new LinkedList<>();
    Map<String, Object> map = new HashMap<String, Object>();
    
    int purchaseResult = 0;
    int proIoWarehouseResult = 0;
    int realQuantityResult = 0;
    
    Collections.sort(purchaseList, purchaseComparator);
    
    for (Object obj : purchaseList) {
      System.out.println("------------sortedRefundList : " + obj);
    }
    
    for (DlmPurchaseAndRefundInfoDTO dto : purchaseList) {
      System.out.println("----------------------------dto : " + dto);
      orderByPurchaseNoDTOList.add(dto);
    }
    
    map.put("orderByPurchaseNoDTOList", orderByPurchaseNoDTOList);
    
    proIoWarehouseResult = dlmPurchaseOrderDao.updateWarehousing(map);
    if (proIoWarehouseResult > 0) {
      purchaseResult = dlmPurchaseOrderDao.updatePurchaseComplete(map);
    }
    realQuantityResult = dlmPurchaseOrderDao.updateRealQuantity(map);
    
    map.clear();
    
    map.put("purchaseResult", purchaseResult);
    map.put("proIoWarehouseResult", proIoWarehouseResult);
    map.put("realQuantityResult", realQuantityResult);
    
    return map;
  }
}
