package kr.happyjob.chainmaker.epc.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.epc.model.RefundHistoryDTO;
/*import kr.happyjob.chainmaker.epc.model.RefundHistoryVO;*/
import kr.happyjob.chainmaker.epc.model.RefundHistoryVO;

public interface RefundHistoryDao {
	/*반품 목록 조회*/
	public List<RefundHistoryVO> selectRefundHistory(Map<String, Object> paramMap);
	/*반품 목록 카운트*/
	public int totalRefundHistory(Map<String, Object> paramMap);
	/*반품 단건 조회*/
	public List<RefundHistoryVO> detailRefundHistory(Map<String, Object> parmaMap);
	/*반품 단건 조회 카운트*/
	public int totalDetailRefundHistory(Map<String, Object> paramMap);
}
