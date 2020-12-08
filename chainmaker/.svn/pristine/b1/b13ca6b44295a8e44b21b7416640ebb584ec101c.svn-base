package kr.happyjob.chainmaker.scm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.scm.model.DetailCdVO;
import kr.happyjob.chainmaker.scm.model.DirectionVO;
import kr.happyjob.chainmaker.scm.model.RefundVO;
import kr.happyjob.chainmaker.scm.model.WarehouseVO;

public interface RefundInfoDao {
	
	public List<RefundVO> selectRefundList(Map<String, Object> paramMap);

	public int countRefundList(Map<String, Object> paramMap);
	
	
	public RefundVO selectRDocModal(Map<String, Object> paramMap);
	
	public List<WarehouseVO> selectWareInfo(Map<String, Object> paramMap); //list로 써줄것!! 
	
	//임원버튼 누르면 2개 테이블로 들어감! 
	public void updateRefundWareNo(Map<String, Object> paramMap);
	public void updateDirectionRefundWareNo(Map<String, Object> paramMap);
	public void insertProductIoWarehouse(Map<String, Object> paramMap);

	

	/*public void updateRefundConfirmCd(Map<String, Object> paramMap);*/
	/*
	public DirectionVO insertDirectionWareNo(Map<String, Object> paramMap);
	

	public RefundVO insertRefundWareNo(Map<String, Object> paramMap);
	*/
	
	
	/*
	public List<RefundVO> selectedRefundList(Map<String, Object> paramMap);
	
	public int selectedRefundCnt(Map<String, Object> paramMap);
*/
	
	
}
