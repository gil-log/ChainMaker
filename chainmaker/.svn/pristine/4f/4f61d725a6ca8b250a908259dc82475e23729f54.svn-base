package kr.happyjob.chainmaker.pcm.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.pcm.model.RefundFinalProcessingModel;

public interface RefundFinalProcessingService {
	
	//구매담당자_기업고객_반품내역 조회 및 카운트
	public List<RefundFinalProcessingModel> refundFinalProcessingList(Map<String, Object> paramMap);	
	public int countRefundFinalProcessingList(Map<String, Object> paramMap);
	
	
	//구매담당자_기업고객_반품내역 단건 조회
	public RefundFinalProcessingModel refundFinalProcessingSelect (Map<String, Object> paramMap);
	
	//구매담당자_기업고객_반품내역 디테일 조회 및 카운트
	public List<RefundFinalProcessingModel> refundFinalProcessingDtlList(Map<String, Object> paramMap);
	public int countRefundFinalProcessingDtlList(Map<String, Object> paramMap);
	
	//구매담당자_기업고객_반품내역 최종처리 
	public int updateRefundComplete(Map<String, Object> paramMap);
}
