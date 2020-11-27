package kr.happyjob.chainmaker.dlm.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.dlm.model.DeliveryBuyerModel;

public interface DeliveryBuyerService {

	//배송담당자_기업고객_배송 지시서 목록 조회 및 카운트
	public List<DeliveryBuyerModel> deliveryBuyerList(Map<String, Object> paramMap);
	public int countDeliveryBuyerList(Map<String, Object> paramMap);
	
	//배송담당자_기업고객_배송 지시서 목록 단건 조회
	public DeliveryBuyerModel deliveryBuyerSelect(Map<String, Object> paramMap);
	
	//배송담당자_기업고객_배송지시서 디테일 목록 조회 및 카운트
	public List<DeliveryBuyerModel> deliveryBuyerDtlList(Map<String, Object> paramMap);
	public int countDeliveryBuyerDtlList(Map<String, Object> paramMap);
	
	//배송담당자_기업고객_배송 상태 변경
	public int updateDeliveryBuyerShipCD(Map<String, Object> paramMap);	
	public int updateDeliveryBuyerProIOCD(Map<String, Object> paramMap);
	public int updateDeliveryBuyerProWareQty(Map<String, Object> paramMap);
	
	public int updateFinalDeliveryBuyerShipCD(Map<String, Object> paramMap);
}
