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

}
