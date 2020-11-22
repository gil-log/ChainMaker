package kr.happyjob.chainmaker.ged.service;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.ged.dao.OrderConfirmDao;
import kr.happyjob.chainmaker.ged.model.PurchaseInfoDTO;
import kr.happyjob.chainmaker.ged.model.PurchaseInfoVO;
import kr.happyjob.chainmaker.ged.model.PurchaseRequestDTO;

@Transactional
@Service("OrderConfirmServiceImpl")
public class OrderConfirmServiceImpl implements OrderConfirmService{

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	private OrderConfirmDao orderConfirmDao;
	
	
	@Override
	public List<PurchaseInfoDTO> getBeforeApprovePurchaseList(PurchaseRequestDTO purchaseRequestDTO) {
		
		List<PurchaseInfoVO> voList = orderConfirmDao.selectBeforeApprovePurchaseList(purchaseRequestDTO);
		
		Iterator<PurchaseInfoVO> iterator = voList.iterator();
		
		List<PurchaseInfoDTO> dtoList = new LinkedList<>();
		
		while(iterator.hasNext()) {
			PurchaseInfoVO vo = iterator.next();
			PurchaseInfoDTO dto = new PurchaseInfoDTO(vo);
			dtoList.add(dto);
		}
		
		return dtoList;
	}


	@Override
	public int countBeforeApprovePurchaseList(PurchaseRequestDTO purchaseRequestDTO) {
		
		int totalCount = orderConfirmDao.countBeforeApprovePurchaseList(purchaseRequestDTO);
		
		return totalCount;
	}


	@Override
	public void confirmPurchaseByPurchaseNo(PurchaseRequestDTO purchaseRequestDTO) {
		orderConfirmDao.updatePurchaseInfoToConfirmByPurchaseNo(purchaseRequestDTO);
	}

}
