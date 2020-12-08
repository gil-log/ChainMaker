package kr.happyjob.chainmaker.pcm.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.pcm.model.PurchaseOrderModel;

public interface PurchaseOrderService {

	//구매담당자_발주 지시서 조회
	public List<PurchaseOrderModel> purchaseOrderList(Map<String, Object> paramMap);		
	//구매담당자_발주 지시서 조회 카운트
	public int countPurchaseOrderList(Map<String, Object> paramMap);
	
	//구매담당자_발주 지시서 조회
	public PurchaseOrderModel purchaseOrderSelect (Map<String, Object> paramMap);
	public List<PurchaseOrderModel> purchaseDtlList(Map<String, Object> paramMap);
	//구매담당자_발주 지시서 조회 카운트
	public int countPurchaseDtlList(Map<String, Object> paramMap);
	//구매담당자_반품 지시서 전송 및 입금확인에 대한 purchase_cd 변경
	public int updatePurchaseCD(Map<String, Object> paramMap);	
}
