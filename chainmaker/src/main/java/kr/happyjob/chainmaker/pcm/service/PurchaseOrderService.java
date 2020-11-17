package kr.happyjob.chainmaker.pcm.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.pcm.model.PurchaseOrderModel;

public interface PurchaseOrderService {

	//구매담당자_발주 지시서 목록 조회
	public List<PurchaseOrderModel> purchaseOrderList(Map<String, Object> paramMap);
		
	//구매담당자_발주 지시서 목록 조회 카운트
	public int countPurchaseOrderList(Map<String, Object> paramMap);
	
	//구매담당자_발주 지시서 목록 조회
	public PurchaseOrderModel purchaseOrderSelect(int purchase_no);
}