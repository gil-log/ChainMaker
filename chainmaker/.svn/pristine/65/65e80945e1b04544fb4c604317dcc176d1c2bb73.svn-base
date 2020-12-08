package kr.happyjob.chainmaker.scm.service;

import java.util.List;

import kr.happyjob.chainmaker.scm.model.DailyOrderListDTO;
import kr.happyjob.chainmaker.scm.model.OrderDetailByOrderNoAndProNoDTO;
import kr.happyjob.chainmaker.scm.model.OrdersRequestDTO;
import kr.happyjob.chainmaker.scm.model.ProductDetailDTO;
import kr.happyjob.chainmaker.scm.model.PurchaseAndShippingInfoDTO;
import kr.happyjob.chainmaker.scm.model.WHInfoByProNoDTO;

public interface DailyOrderHistoryService {

	/** 일별 주문 목록 조회 */
	public List<DailyOrderListDTO> getDailyOrderListByOrderCD(OrdersRequestDTO orderRequestDTO);
	
	// 주문 목록 개수 조회
	public int countDailyOrderListByOrderCD(OrdersRequestDTO orderRequestDTO);
	
	// 주문 번호, 제품 번호로 주문 상세 정보 조회
	public OrderDetailByOrderNoAndProNoDTO selectOrderDetailByOrderNoAndProNo(OrdersRequestDTO pageOrderInfoDTO);
	
	// 제품번호에 해당하는 제품이 있는 창고 정보 조회
	public List<WHInfoByProNoDTO> selectWHInfoByProNo(String pro_no);
	
	// 배송 테이블에 ship_no를 가지고 List들의 정보를 생성
	public int createShippingInfoReturnShipNo(List<PurchaseAndShippingInfoDTO> purchaseAndShippingInfoDTOList, String writerID);
	
	// 제품 번호에 해당하는 제품관련 제품 정보 조회
	public List<ProductDetailDTO> getProductDetailByProNo(String pro_no);
	
	// 발주 테이블에 생성, 발주 지시서 작성
	public int createPurchaseInfoReturnPurchaseNo(List<PurchaseAndShippingInfoDTO> purchaseAndShippingInfoDTOList);
	
	// 주문 코드, 날짜로 주문 리스트 조회
	public List<DailyOrderListDTO> getDailyOrderListByDateAndOrderCD(OrdersRequestDTO orderRequestDTO);

	// 주문 코드, 날짜로 주문 리스트 카운팅
	public int countDailyOrderListByDateAndOrderCD(OrdersRequestDTO orderRequestDTO);
}
