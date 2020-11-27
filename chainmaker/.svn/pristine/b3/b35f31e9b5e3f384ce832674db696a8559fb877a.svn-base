package kr.happyjob.chainmaker.scm.service;

import java.util.List;

import kr.happyjob.chainmaker.scm.model.ShippingOrderDTO;
import kr.happyjob.chainmaker.scm.model.ShippingOrderDetailDTO;
import kr.happyjob.chainmaker.scm.model.ShippingRequestDTO;

public interface ShippingDirectionService {

	// 배송 관련 상태인 주문 리스트 가져오기
	public List<ShippingOrderDTO> getShippingOrderList(ShippingRequestDTO shippingRequestDTO);
	
	// 배송 관련 주문 리스트 카운팅
	public int countShippingOrderList(ShippingRequestDTO shippingRequestDTO);
	
	// 주문번호로 주문 디테일 리스트 조회
	public List<ShippingOrderDetailDTO> getShippingOrderDetailList(ShippingRequestDTO shippingRequestDTO);
	
}
