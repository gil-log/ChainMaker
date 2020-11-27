package kr.happyjob.chainmaker.dlm.dao;

import java.util.List;

import kr.happyjob.chainmaker.dlm.model.DlmPurchaseOrderDTO;
import kr.happyjob.chainmaker.dlm.model.DlmPurchaseOrderVO;
import kr.happyjob.chainmaker.dlm.model.PurchaseOrderPgAndScKeyWordDTO;

public interface DlmPurchaseOrderDao {
  
  // 담당자 별 발주 리스트 목록 조회
  public List<DlmPurchaseOrderVO> purchaseOrderListByMng(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO);
  
  // 조회 목록 수
  public int totalCnt(PurchaseOrderPgAndScKeyWordDTO purchaseOrderPgAndKeyWordDTO);
}
