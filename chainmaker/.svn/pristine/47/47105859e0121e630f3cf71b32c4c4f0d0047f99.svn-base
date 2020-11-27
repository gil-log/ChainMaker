package kr.happyjob.chainmaker.epc.service;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

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

}
