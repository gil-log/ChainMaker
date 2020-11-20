package kr.happyjob.chainmaker.epc.service;

import java.util.List;

import kr.happyjob.chainmaker.epc.model.OrderDetailDTO;
import kr.happyjob.chainmaker.epc.model.OrderListWithQtyAndDateDTO;
import kr.happyjob.chainmaker.epc.model.OrdersRequestDTO;

public interface RefundRequestService {
	
	public List<OrderListWithQtyAndDateDTO> getOrderListWithQtyAndDateByDate(OrdersRequestDTO ordersRequestDTO);

	// 주문 정보 날짜로 개수 세주기
	public int countOrderListByDate(OrdersRequestDTO ordersRequestDTO);

	// 주문번호로 주문 디테일 제품 정보 가져오기
	public List<OrderDetailDTO> getOrderDetailProductInfoByOrderNo(OrdersRequestDTO ordersRequestDTO);
}
