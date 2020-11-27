package kr.happyjob.chainmaker.epc.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.epc.dao.RefundRequestDao;
import kr.happyjob.chainmaker.epc.model.OrderDetailDTO;
import kr.happyjob.chainmaker.epc.model.OrderDetailVO;
import kr.happyjob.chainmaker.epc.model.OrderListWithQtyAndDateDTO;
import kr.happyjob.chainmaker.epc.model.OrderListWithQtyAndDateVO;
import kr.happyjob.chainmaker.epc.model.OrdersRequestDTO;
import kr.happyjob.chainmaker.epc.model.RefundInfoDTO;
import kr.happyjob.chainmaker.epc.model.RefundUserInfoDTO;
import kr.happyjob.chainmaker.epc.model.RefundUserInfoVO;
import kr.happyjob.chainmaker.scm.dao.DailyOrderHistoryDao;

@Transactional
@Service("RefundRequestServiceImpl")
public class RefundRequestServiceImpl implements RefundRequestService {
	
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired
	private RefundRequestDao refundRequestDao;
	
	@Override
	public List<OrderListWithQtyAndDateDTO> getOrderListWithQtyAndDateByDate(OrdersRequestDTO ordersRequestDTO) {

		List<OrderListWithQtyAndDateVO> voList = refundRequestDao.selectOrderListQtyAndDate(ordersRequestDTO);
		
		Iterator<OrderListWithQtyAndDateVO> iterator = voList.iterator();
		
		List<OrderListWithQtyAndDateDTO> orderListWithQtyAndDateDTOList = new LinkedList<>();
		
		while(iterator.hasNext()) {
			OrderListWithQtyAndDateVO vo = iterator.next();
			
			OrderListWithQtyAndDateDTO orderListWithQtyAndDateDTO = new OrderListWithQtyAndDateDTO(vo);
			
			orderListWithQtyAndDateDTOList.add(orderListWithQtyAndDateDTO);
		}
		
		return orderListWithQtyAndDateDTOList;
	}

	@Override
	public int countOrderListByDate(OrdersRequestDTO ordersRequestDTO) {
		
		return refundRequestDao.countOrderListByDate(ordersRequestDTO);
	}

	@Override
	public List<OrderDetailDTO> getOrderDetailProductInfoByOrderNo(OrdersRequestDTO ordersRequestDTO) {

		List<OrderDetailVO> voList = refundRequestDao.selectOrderDetailProductInfoByOrderNo(ordersRequestDTO);
		
		Iterator<OrderDetailVO> iterator = voList.iterator();
		
		List<OrderDetailDTO> orderDetailDTOList = new LinkedList<>();
		while(iterator.hasNext()) {
			OrderDetailVO vo = iterator.next();
			OrderDetailDTO dto = new OrderDetailDTO(vo);
			orderDetailDTOList.add(dto);
		}
		
		return orderDetailDTOList;
	}

	@Override
	public int putRefundDirection(List<RefundInfoDTO> refundInfoDTOList){
		
		int refundNo = 0;
		int orderNo = 0;
		try {
			RefundInfoDTO firstRefundInfoDTO = refundInfoDTOList.remove(0);

			
			Map<String, Object> map = new HashMap<>();
			
			// 반품 정보가 하나인 상황
			if(refundInfoDTOList.isEmpty()) {

				refundRequestDao.insertOneRefundInfo(firstRefundInfoDTO);
				refundNo = firstRefundInfoDTO.getRefund_no();
				
				logger.info("refund_no : " + refundNo);
				refundRequestDao.updateOneOrderCDtoRefundByOrderNoAndProNo(firstRefundInfoDTO);
				
				
				// 반품 지시서 작성
				List<RefundInfoDTO> justOneList = new LinkedList<>();
				justOneList.add(firstRefundInfoDTO);
				map.put("refundInfoDTOList", justOneList);
				refundRequestDao.insertRefundDirection(map);
			} 
			// 반품 정보가 둘 이상인 상황
			else {

				// refund_no 가져오기위해
				refundRequestDao.insertOneRefundInfo(firstRefundInfoDTO);
				refundNo = firstRefundInfoDTO.getRefund_no();

				logger.info("refund_no : " + refundNo);
				
				// 리스트에 남아있는 DTO들에게 첫 삽입된 refund_no 삽입
				for(RefundInfoDTO refundInfoDTO : refundInfoDTOList) {
					refundInfoDTO.setRefund_no(refundNo);
				}
				
				// 삽입된 refund_no로 refund Direction List 삽입
				map.put("refundInfoDTOList", refundInfoDTOList);
				refundRequestDao.insertRefundInfoList(map);
				
				// 전체 정보 update 하기
				map.clear();
				
				refundInfoDTOList.add(firstRefundInfoDTO);

				orderNo = firstRefundInfoDTO.getOrder_no();

				map.put("order_no", orderNo);
				map.put("refundInfoDTOList", refundInfoDTOList);
				refundRequestDao.updateListOrderCDtoRefundByOrderNoAndProNo(map);
				
				// 반품 지시서 작성
				refundRequestDao.insertRefundDirection(map);
				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			refundNo = -1;
		}
		
		return refundNo;
	}

	@Override
	public RefundUserInfoDTO getRefundUserInfo(RefundUserInfoDTO refundUserInfoDTO) {
		
		RefundUserInfoVO vo = refundRequestDao.selectRefundUserInfo(refundUserInfoDTO);
		
		RefundUserInfoDTO dto = new RefundUserInfoDTO(vo);
		
		return dto;
	}

}
