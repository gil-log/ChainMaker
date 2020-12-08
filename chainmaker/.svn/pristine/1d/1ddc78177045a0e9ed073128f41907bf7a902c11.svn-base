package kr.happyjob.chainmaker.pcm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.pcm.model.ReturnPurchaseModel;

public interface ReturnPurchseDao {	
	
	//구매담당자_반품 지시서 조회 및 카운트
	public List<ReturnPurchaseModel> returnPurchaseList(Map<String, Object> paramMap);
	public int countReturnPurchaseList(Map<String, Object> paramMap);
	
	//구매담당자_반품 지시서 단건 조회
	public List<ReturnPurchaseModel> returnPurchaseSelect(Map<String, Object> paramMap);
	
	//구매담당자_반품 지시서 디테일 조회 및 카운트
	public List<ReturnPurchaseModel> returnPurchaseDtlList(Map<String, Object> paramMap);
	public int countReturnPurchaseDtlList(Map<String, Object> paramMap);	
	
	//구매담당자_반품 지시서 전송 및 입금확인에 대한 refund_cd 변경
	public int updateSendRefundDirection(Map<String, Object> paramMap);
	public int updateConfirmRefundPrice(Map<String, Object> paramMap);
}
