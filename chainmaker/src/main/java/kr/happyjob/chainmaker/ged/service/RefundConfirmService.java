package kr.happyjob.chainmaker.ged.service;

import java.util.List;
import java.util.Map;



import kr.happyjob.chainmaker.ged.model.RefundConfirmInfoVO;

public interface RefundConfirmService {

	// 승인전 발주 목록 가져오기
	public List<RefundConfirmInfoVO> selectBeforeApproveRefundList(Map<String, Object> paramMap) throws Exception;

	// 승인전 발주 목록 개수 세기
	public int countBeforeApprovePurchaseList(Map<String, Object> paramMap);

	//임원이 반품 승인해주기 
	public void clickCeoRefundConfirm(Map<String, Object> paramMap);
	
	
	// 발주 승인 해주기
	//public void confirmPurchaseByPurchaseNo(PurchaseRequestDTO purchaseRequestDTO);
}
