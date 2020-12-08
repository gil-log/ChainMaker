package kr.happyjob.chainmaker.dlm.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.dlm.model.DlmPurchaseAndRefundInfoDTO;
import kr.happyjob.chainmaker.dlm.model.DlmPurchaseOrderDTO;
import kr.happyjob.chainmaker.dlm.model.PurchaseOrderPgAndScKeyWordDTO;

public interface DlmPurchaseOrderService {
  
  // 담당자 별 발주 지시서 목록 정보
  public List<DlmPurchaseOrderDTO> purchaseOrderListByMng(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO) throws Exception;
  
  // 조회 목록 수
  public int purchaseOrderListTotal(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO) throws Exception;
  
  // 업체별 발주 상세 목록 조회
  public List<DlmPurchaseOrderDTO> purchaseOrderDtlListByCompany(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO) throws Exception;
  
  // 발주 리스트 상세 조회 목록 수
  public int purchaseOrderDtlListTotal(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO) throws Exception;
  
  // 반품 정보 처리 및 생성
  public Map<String, Object> refundInfoInit(List<DlmPurchaseAndRefundInfoDTO> refundList, String loginID) throws Exception;

  // 발주 처리 및 재고 관리 
  public Map<String, Object> purchaseAndMngStorage(List<DlmPurchaseAndRefundInfoDTO> purchaseList, String loginID) throws Exception;
  
}
