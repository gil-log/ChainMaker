package kr.happyjob.chainmaker.scm.service;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.scm.dao.DailyOrderHistoryDao;
import kr.happyjob.chainmaker.scm.model.DailyOrderListVO;
import kr.happyjob.chainmaker.scm.model.OrderDetailByOrderNoAndProNoDTO;
import kr.happyjob.chainmaker.scm.model.OrderDetailByOrderNoAndProNoVO;
import kr.happyjob.chainmaker.scm.model.PageAndOrderInfoDTO;
import kr.happyjob.chainmaker.scm.model.WHInfoByProNoDTO;
import kr.happyjob.chainmaker.scm.model.WHInfoByProNoVO;

@Transactional
@Service("DailyOrderHistoryServiceImpl")
public class DailyOrderHistroyServiceImpl implements DailyOrderHistoryService{
	
	@Autowired
	private DailyOrderHistoryDao dailyOrderHistoryDao;

	@Override
	public List<DailyOrderListVO> listDailyOrder(PageAndOrderInfoDTO pageOrderInfoDTO) {
		return dailyOrderHistoryDao.listDailyOrder(pageOrderInfoDTO);
	}

	@Override
	public int countListDailyOrder() {
		return dailyOrderHistoryDao.countListDailyOrder();
	}

	@Override
	public OrderDetailByOrderNoAndProNoDTO selectOrderDetailByOrderNoAndProNo(PageAndOrderInfoDTO pageOrderInfoDTO) {
		
		int order_no = pageOrderInfoDTO.getOrder_no();
		String pro_no = pageOrderInfoDTO.getPro_no();
		System.out.println("service:"+order_no+" a"+pro_no);
		
		OrderDetailByOrderNoAndProNoVO orderDetailVO = dailyOrderHistoryDao.selectOrderDetailByOrderNoAndProNo(pageOrderInfoDTO);
		

		System.out.println("VO:"+orderDetailVO.getOrder_no()+" a"+orderDetailVO.getPro_no());
		
		
		OrderDetailByOrderNoAndProNoDTO orderDetailDTO = new OrderDetailByOrderNoAndProNoDTO(orderDetailVO);
		
		
		return orderDetailDTO;
	}

	@Override
	public List<WHInfoByProNoDTO> selectWHInfoByProNo(String pro_no) {
		
		List<WHInfoByProNoVO> whInfoByProNoVOList = dailyOrderHistoryDao.selectWHInfoByProNo(pro_no);
		
		Iterator<WHInfoByProNoVO> whInfoIterator = whInfoByProNoVOList.iterator();
		
		List<WHInfoByProNoDTO> whInfoByProNoDTOList = new LinkedList<>();
		
		while(whInfoIterator.hasNext()) {
			WHInfoByProNoVO whInfoByProNoVO = whInfoIterator.next();
			
			WHInfoByProNoDTO whInfoByProNoDTO = new WHInfoByProNoDTO(whInfoByProNoVO);
			
			whInfoByProNoDTOList.add(whInfoByProNoDTO);
			
		}
		
		return whInfoByProNoDTOList;
	}
	
}
