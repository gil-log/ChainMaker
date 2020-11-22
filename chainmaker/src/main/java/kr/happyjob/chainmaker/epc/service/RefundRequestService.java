package kr.happyjob.chainmaker.epc.service;

import java.util.List;

import kr.happyjob.chainmaker.epc.model.OrderDetailDTO;
import kr.happyjob.chainmaker.epc.model.OrderListWithQtyAndDateDTO;
import kr.happyjob.chainmaker.epc.model.OrdersRequestDTO;
import kr.happyjob.chainmaker.epc.model.RefundInfoDTO;
import kr.happyjob.chainmaker.epc.model.RefundUserInfoDTO;

public interface RefundRequestService {
	
	public List<OrderListWithQtyAndDateDTO> getOrderListWithQtyAndDateByDate(OrdersRequestDTO ordersRequestDTO);

	// 주문 정보 날짜로 개수 세주기
	public int countOrderListByDate(OrdersRequestDTO ordersRequestDTO);

	// 주문번호로 주문 디테일 제품 정보 가져오기
	public List<OrderDetailDTO> getOrderDetailProductInfoByOrderNo(OrdersRequestDTO ordersRequestDTO);
	
	// 반품 지시서 작성
	public int putRefundDirection(List<RefundInfoDTO> refundInfoDTO);
	
	// 반품 사용자 정보 조회
	public RefundUserInfoDTO getRefundUserInfo(RefundUserInfoDTO refundUserInfoDTO);
}
