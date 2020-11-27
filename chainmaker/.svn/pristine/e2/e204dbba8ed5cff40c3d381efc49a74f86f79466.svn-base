package kr.happyjob.chainmaker.scm.service;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.scm.dao.ShippingDirectionDao;
import kr.happyjob.chainmaker.scm.model.ShippingOrderDTO;
import kr.happyjob.chainmaker.scm.model.ShippingOrderDetailDTO;
import kr.happyjob.chainmaker.scm.model.ShippingOrderDetailVO;
import kr.happyjob.chainmaker.scm.model.ShippingOrderVO;
import kr.happyjob.chainmaker.scm.model.ShippingRequestDTO;

@Transactional
@Service("ShippingDirectionServiceImpl")
public class ShippingDirectionServiceImpl implements ShippingDirectionService{

	private final Logger logger = LogManager.getLogger(this.getClass());
	
	@Autowired
	private ShippingDirectionDao shippingDirectionDao;

	@Override
	public List<ShippingOrderDTO> getShippingOrderList(ShippingRequestDTO shippingRequestDTO) {
		
		List<ShippingOrderVO> voList = shippingDirectionDao.selectShippingOrderList(shippingRequestDTO);
		
		List<ShippingOrderDTO> dtoList = new LinkedList<>();
		
		Iterator<ShippingOrderVO> iterator = voList.iterator();
		
		while(iterator.hasNext()) {
			ShippingOrderVO vo = iterator.next();
			ShippingOrderDTO dto = new ShippingOrderDTO(vo);
			
			dtoList.add(dto);
		}
		
		return dtoList;
	}

	@Override
	public int countShippingOrderList(ShippingRequestDTO shippingRequestDTO) {
		int totalCount = shippingDirectionDao.countShippingOrderList(shippingRequestDTO);
		return totalCount;
	}

	@Override
	public List<ShippingOrderDetailDTO> getShippingOrderDetailList(ShippingRequestDTO shippingRequestDTO) {
		
		List<ShippingOrderDetailVO> voList = shippingDirectionDao.selectShippingOrderDetailListByOrderNo(shippingRequestDTO);
		
		List<ShippingOrderDetailDTO> dtoList = new LinkedList<>();
		
		Iterator<ShippingOrderDetailVO> iterator = voList.iterator();
		
		while(iterator.hasNext()) {
			ShippingOrderDetailVO vo = iterator.next();
			ShippingOrderDetailDTO dto = new ShippingOrderDetailDTO(vo);
			dtoList.add(dto);
		}
		
		return dtoList;
	}
}
