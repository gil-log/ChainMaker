package kr.happyjob.chainmaker.dlm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.dlm.model.DlmPurchaseAndRefundInfoDTO;
import kr.happyjob.chainmaker.dlm.model.DlmPurchaseOrderVO;
import kr.happyjob.chainmaker.dlm.model.PurchaseOrderPgAndScKeyWordDTO;

public interface DlmPurchaseOrderDao {
  
  // 담당자별 발주 리스트 목록 조회
  public List<DlmPurchaseOrderVO> purchaseOrderListByMng(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO);
  
  // 발주 리스트 조회 목록 수
  public int purchaseOrderListTotal(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO);
  
  // 업체별 발주 상세 목록 조회
  public List<DlmPurchaseOrderVO> purchaseOrderDtlListByCompany(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO);
  
  // 발주 리스트 상세 조회 목록 수
  public int purchaseOrderDtlListTotal(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO);
  
  // 반품 정보 단건 작성
  public int insertRefundInfoRequest(DlmPurchaseAndRefundInfoDTO dlmPurchaseAndRefundInfoDTO);
  
  // 반품 정보 작성 리스트
  public int insertRefundInfoRequestList(Map<String, Object> map);
  
  // 반품 지시서 단건 작성
  public int insertDirectionInfo(DlmPurchaseAndRefundInfoDTO dlmPurchaseAndRefundInfoDTO);
  
  // 반품 지시서 작성 리스트
  public int insertDirectionInfoList(Map<String, Object> map);
  
  // 반품으로 인한 발주 개수 감소
  public int updateProIoWhQty(Map<String, Object> map);
  
  // 반품으로 인한 purchase_cd 변경
  public int updatePurchaseCD(Map<String, Object>map);
  
  // 입고 처리로 인한 purchase_cd 변경
  public int updatePurchaseComplete(Map<String, Object>map);
  
  // 입고 처리로 인한 pro_io_cd 변경
  public int updateWarehousing(Map<String, Object>map);
  
  // 입고 처리로 인한 실재고 변경
  public int updateRealQuantity(Map<String, Object>map);

}
