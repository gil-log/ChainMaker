package kr.happyjob.chainmaker.scm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.scm.model.RefundInsVO;

public interface RefundInsDao {

	public List<RefundInsVO> refundInsList(Map<String, Object> paramMap) throws Exception;

	public int refundInsTotalCnt(Map<String, Object> paramMap) throws Exception;

}
