package kr.happyjob.chainmaker.epc.dao;

import java.util.List;

import kr.happyjob.chainmaker.epc.model.OrderDetailVO;
import kr.happyjob.chainmaker.epc.model.OrderListWithQtyAndDateVO;
import kr.happyjob.chainmaker.epc.model.OrdersRequestDTO;

public interface RefundRequestDao {
	
	// date로 수량, 가격정보 , 날짜 정보 가진 orderList 출력
	public List<OrderListWithQtyAndDateVO> selectOrderListQtyAndDate(OrdersRequestDTO ordersRequestDTO);

	// Date로 orderList counting
	public int countOrderListByDate(OrdersRequestDTO ordersRequestDTO);
	
	// order_no로 Product 정보 가져오기
	public List<OrderDetailVO> selectOrderDetailProductInfoByOrderNo(OrdersRequestDTO ordersRequestDTO);
}
