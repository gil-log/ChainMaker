package kr.happyjob.chainmaker.pcm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.pcm.dao.PurchaseOrderDao;
import kr.happyjob.chainmaker.pcm.model.PurchaseOrderModel;

@Service
public class PurchaseOrderServiceImpl implements PurchaseOrderService {

	@Autowired
	private PurchaseOrderDao purchaseOrderDao; 
	
	@Override
	public List<PurchaseOrderModel> purchaseOrderList(Map<String, Object> paramMap) {
		
		return purchaseOrderDao.purchaseOrderList(paramMap);
	}

	@Override
	public int countPurchaseOrderList(Map<String, Object> paramMap) {
				
		return purchaseOrderDao.countPurchaseOrderList(paramMap);
	}
	
	@Override
	public PurchaseOrderModel purchaseOrderSelect(Map<String, Object> paramMap) {

		return purchaseOrderDao.purchaseOrderSelect(paramMap);
	}

	@Override
	public List<PurchaseOrderModel> purchaseDtlList(Map<String, Object> paramMap) {

		return purchaseOrderDao.purchaseDtlList(paramMap);
	}

	@Override
	public int countPurchaseDtlList(Map<String, Object> paramMap) {

		return purchaseOrderDao.countPurchaseDtlList(paramMap);
	}

	@Transactional
	@Override
	public int updatePurchaseCD(Map<String, Object> paramMap) {
		
		return purchaseOrderDao.updatePurchaseCD(paramMap);
	}

}
