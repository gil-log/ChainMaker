package kr.happyjob.chainmaker.scm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.scm.model.DailyOrderListVO;
import kr.happyjob.chainmaker.scm.model.OrderDetailByOrderNoAndProNoVO;
import kr.happyjob.chainmaker.scm.model.OrdersRequestDTO;
import kr.happyjob.chainmaker.scm.model.ProductDetailVO;
import kr.happyjob.chainmaker.scm.model.PurchaseInfoDTO;
import kr.happyjob.chainmaker.scm.model.ShippingDirectionDTO;
import kr.happyjob.chainmaker.scm.model.WHInfoByProNoVO;

public interface DailyOrderHistoryDao {
	
	/** 일별 주문 목록 조회 */
	public List<DailyOrderListVO> selectDailyOrderListByOrderCD(OrdersRequestDTO pageDTO);
	
	// 일별 주문 총 개수
	public int countListDailyOrderByOrderCD(OrdersRequestDTO orderRequestDTO);
	
	// 주문 번호, 제품 번호로 해당 주문 상세 정보 조회
	public OrderDetailByOrderNoAndProNoVO selectOrderDetailByOrderNoAndProNo(OrdersRequestDTO pageDTO);
	
	// 제품번호에 해당하는 제품이 있는 창고 정보 조회
	public List<WHInfoByProNoVO> selectWHInfoByProNo(String pro_no);

	// 배송 테이블에 첫 배송 정보 생성
	public void insertShippingInfo(ShippingDirectionDTO shippingDirectionDTO);
	
	// 배송 테이블에 배송 정보들 생성
	public void insertShippingInfoList(Map<String, Object> map);
	
	// 배송 처리된 주문 상태 완료로 바꿔주기
	public void updateOrderCDtoComplete(ShippingDirectionDTO shippingDirectionDTO);
	
	// 배송 지시서 테이블에 지시서 내용 삽입
	public void insertShippingDirectionList(Map<String, Object> map);
	
	// 배송 지시서 테이블에 단일 지시서 내용 삽입
	public void insertShippingDirection(ShippingDirectionDTO shippingDirectionDTO);
	
	// 제품 상세 정보 제품 번호로 가져오기
	public List<ProductDetailVO> selectProductDetailByProNo(String pro_no);
	
	// 단일 발주 정보 삽입
	public void insertPurchaseInfo(PurchaseInfoDTO purchaseInfoDTO);
	
	// 다중 발주 정보 삽입
	public void insertPurchaseInfoList(Map<String, Object> map);
	
	// 단일 발주 지시서 삽입
	public void insertPurchaseDirection(PurchaseInfoDTO purchaseInfoDTO);

	// 다중 발주 지시서 삽입
	public void insertPurchaseDirectionList(Map<String, Object> map);
	
	// 주문 코드, 날짜로 수주 목록 리스트
	public List<DailyOrderListVO> selectDailyOrderListByDateAndOrderCD(OrdersRequestDTO pageDTO);
	
	// 주문 코드, 날짜 주문 목록 개수 카운팅
	public int countListDailyOrderByDateAndOrderCD(OrdersRequestDTO pageDTO);
	
	// product_io_warehouse insert
	public void insertProductIOWarehouse(Map<String, Object> map);
}
