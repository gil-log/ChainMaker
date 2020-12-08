package kr.happyjob.chainmaker.ged.dao;

import java.util.List;
import java.util.Map;



import kr.happyjob.chainmaker.ged.model.RefundConfirmInfoVO;

public interface RefundConfirmDao {
	
	// 승인전 반품 리스트 가져오기
	public List<RefundConfirmInfoVO> selectBeforeApproveRefundList(Map<String, Object> paramMap);

	// 승인전 반품 리스트 카운팅
	public int countBeforeApprovePurchaseList(Map<String, Object> paramMap);
	
	//임원이 반품 승인 버튼 누르면
	public void updateRefundConfirm(Map<String, Object> paramMap);

	
	
	// 발주 승인으로 승인 코드 1로 변경하기
	//public void updatePurchaseInfoToConfirmByPurchaseNo(PurchaseRequestDTO purchaseRequestDTO);

}
