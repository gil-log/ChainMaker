package kr.happyjob.chainmaker.ged.dao;

import java.util.List;

import kr.happyjob.chainmaker.ged.model.PurchaseInfoVO;
import kr.happyjob.chainmaker.ged.model.PurchaseRequestDTO;

public interface OrderConfirmDao {
	
	// 승인전 발주 리스트 가져오기
	public List<PurchaseInfoVO> selectBeforeApprovePurchaseList(PurchaseRequestDTO purchaseRequestDTO);

	// 승인전 발주 리스트 카운팅
	public int countBeforeApprovePurchaseList(PurchaseRequestDTO purchaseRequestDTO);
	
	// 발주 승인으로 승인 코드 1로 변경하기
	public void updatePurchaseInfoToConfirmByPurchaseNo(PurchaseRequestDTO purchaseRequestDTO);
}
