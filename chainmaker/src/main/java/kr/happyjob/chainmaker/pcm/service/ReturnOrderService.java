package kr.happyjob.chainmaker.pcm.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.pcm.model.ReturnOrderModel;

public interface ReturnOrderService {
	
	//구매담당자_반품 지시서 목록 조회 및 카운트
	public List<ReturnOrderModel> returnOrderList(Map<String, Object> paramMap);
	public int countReturnOrderList(Map<String, Object> paramMap);

	//구매담당자_반품 지시서 목록 단건 조회 및 카운트
	public ReturnOrderModel returnOrderSelect(Map<String, Object> paramMap);
	public int countReturnOrderSelect(Map<String, Object> paramMap);
	//구매담당자_반품 지시서 전송 및 입금확인에 대한 refund_cd 변경
	public int updateRefundCD(Map<String, Object> paramMap);
}
