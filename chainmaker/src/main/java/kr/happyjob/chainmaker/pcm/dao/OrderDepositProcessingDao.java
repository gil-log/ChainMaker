package kr.happyjob.chainmaker.pcm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.pcm.model.OrderDepositProcessingModel;

public interface OrderDepositProcessingDao {

	//구매담당자_기업고객_주문내역 목록 조회 및 카운트
	public List<OrderDepositProcessingModel> orderDepositProcessingList(Map<String, Object> paramMap);
	public int countOrderDepositProcessingList(Map<String, Object> paramMap);
	
	//구매담당자_기업고객_주문내역 단건 조회
	public OrderDepositProcessingModel orderDepositProcessingSelect(Map<String, Object> paramMap);
	
	//구매담당자_기업고객_주문내역 디테일 목록 조회 및 카운트
	public List<OrderDepositProcessingModel> orderDepositProcessingDtlList(Map<String, Object> paramMap);
	public int countOrderDepositProcessingDtlList(Map<String, Object> paramMap);
	
	//구매담당자_기업고객_주문내역 목록 입금확인
	public int updateOrderDepositProcessing(Map<String, Object> paramMap);
}
