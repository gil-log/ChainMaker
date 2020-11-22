package kr.happyjob.chainmaker.ged.service;

import java.util.List;

import kr.happyjob.chainmaker.ged.model.PurchaseInfoDTO;
import kr.happyjob.chainmaker.ged.model.PurchaseRequestDTO;

public interface OrderConfirmService {

	// 승인전 발주 목록 가져오기
	public List<PurchaseInfoDTO> getBeforeApprovePurchaseList(PurchaseRequestDTO purchaseRequestDTO);
	
	// 승인전 발주 목록 개수 세기
	public int countBeforeApprovePurchaseList(PurchaseRequestDTO purchaseRequestDTO);
	
	// 발주 승인 해주기
	public void confirmPurchaseByPurchaseNo(PurchaseRequestDTO purchaseRequestDTO);
}
