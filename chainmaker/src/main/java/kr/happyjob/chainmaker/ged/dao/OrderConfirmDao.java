package kr.happyjob.chainmaker.ged.dao;

import java.util.List;

import kr.happyjob.chainmaker.ged.model.PurchaseInfoVO;
import kr.happyjob.chainmaker.ged.model.PurchaseRequestDTO;

public interface OrderConfirmDao {
	
	// 승인전 발주 리스트 가져오기
	public List<PurchaseInfoVO> selectBeforeApprovePurchaseList(PurchaseRequestDTO purchaseRequestDTO);

	// 승인전 발주 리스트 카운팅
	public int countBeforeApprovePurchaseList(PurchaseRequestDTO purchaseRequestDTO);
}
