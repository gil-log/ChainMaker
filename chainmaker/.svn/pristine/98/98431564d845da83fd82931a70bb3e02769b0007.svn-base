package kr.happyjob.chainmaker.scm.dao;

import java.util.List;

import kr.happyjob.chainmaker.scm.model.ShippingOrderDetailVO;
import kr.happyjob.chainmaker.scm.model.ShippingOrderVO;
import kr.happyjob.chainmaker.scm.model.ShippingRequestDTO;

public interface ShippingDirectionDao {
	
	// 배송관련 상태인 주문 리스트 조회
	public List<ShippingOrderVO> selectShippingOrderList(ShippingRequestDTO shippingRequestDTO);

	// 배송관련 주문 카운팅
	public int countShippingOrderList(ShippingRequestDTO shippingRequestDTO);
	
	// 주문 번호로 주문 상세 목록 조회
	public List<ShippingOrderDetailVO> selectShippingOrderDetailListByOrderNo(ShippingRequestDTO shippingRequestDTO);
	
}
