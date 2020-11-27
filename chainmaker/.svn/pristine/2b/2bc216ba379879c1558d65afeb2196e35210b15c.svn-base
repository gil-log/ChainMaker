package kr.happyjob.chainmaker.epc.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.epc.model.OrderDetailVO;
import kr.happyjob.chainmaker.epc.model.OrderListWithQtyAndDateVO;
import kr.happyjob.chainmaker.epc.model.OrdersRequestDTO;
import kr.happyjob.chainmaker.epc.model.RefundInfoDTO;
import kr.happyjob.chainmaker.epc.model.RefundUserInfoDTO;
import kr.happyjob.chainmaker.epc.model.RefundUserInfoVO;

public interface RefundRequestDao {
	
	// date로 수량, 가격정보 , 날짜 정보 가진 orderList 출력
	public List<OrderListWithQtyAndDateVO> selectOrderListQtyAndDate(OrdersRequestDTO ordersRequestDTO);

	// Date로 orderList counting
	public int countOrderListByDate(OrdersRequestDTO ordersRequestDTO);
	
	// order_no로 Product 정보 가져오기
	public List<OrderDetailVO> selectOrderDetailProductInfoByOrderNo(OrdersRequestDTO ordersRequestDTO);
	
	// 반품 정보 하나 삽입
	public void insertOneRefundInfo(RefundInfoDTO refundInfoDTO) throws Exception;

	// 주문 테이블 반품 상태로 order_no, pro_no로 단일 변경
	public void updateOneOrderCDtoRefundByOrderNoAndProNo(RefundInfoDTO refundInfoDTO) throws Exception;
	
	// 주문 테이블 반품 상태로 order_no, pro_no로 다중 변경
	public void updateListOrderCDtoRefundByOrderNoAndProNo(Map<String, Object> map) throws Exception;

	// 반품 정보 List 삽입
	public void insertRefundInfoList(Map<String, Object> map) throws Exception;
	
	// 반품 사용자 정보 검색
	public RefundUserInfoVO selectRefundUserInfo(RefundUserInfoDTO refundUserInfoDTO);
	
	// 반품 지시서 작성
	public void insertRefundDirection(Map<String, Object> map) throws Exception;
}
