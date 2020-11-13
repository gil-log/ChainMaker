package kr.happyjob.chainmaker.scm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.scm.model.DailyOrderListVO;
import kr.happyjob.chainmaker.scm.model.OrderDetailByOrderNoAndProNoVO;
import kr.happyjob.chainmaker.scm.model.PageAndOrderInfoDTO;
import kr.happyjob.chainmaker.scm.model.WHInfoByProNoVO;

public interface DailyOrderHistoryDao {
	
	/** 일별 주문 목록 조회 */
	public List<DailyOrderListVO> listDailyOrder(PageAndOrderInfoDTO pageDTO);
	
	// 일별 주문 총 개수
	public int countListDailyOrder();
	
	// 주문 번호, 제품 번호로 해당 주문 상세 정보 조회
	public OrderDetailByOrderNoAndProNoVO selectOrderDetailByOrderNoAndProNo(PageAndOrderInfoDTO pageDTO);
	
	// 제품번호에 해당하는 제품이 있는 창고 정보 조회
	public List<WHInfoByProNoVO> selectWHInfoByProNo(String pro_no);
}
