package kr.happyjob.chainmaker.dlm.service;

import java.util.List;

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
  
  // 반품 정보 생성
  public int refundInfoInit(List<DlmPurchaseAndRefundInfoDTO> resendList) throws Exception;

  
}