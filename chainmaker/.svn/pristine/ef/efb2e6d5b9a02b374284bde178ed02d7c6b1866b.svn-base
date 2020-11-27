package kr.happyjob.chainmaker.pcm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.pcm.dao.PurchaseOrderDao;
import kr.happyjob.chainmaker.pcm.model.PurchaseOrderModel;

@Service
public class PurchaseOrderServiceImpl implements PurchaseOrderService {

	@Autowired
	PurchaseOrderDao purchaseOrderDao; 
	
	@Override
	public List<PurchaseOrderModel> purchaseOrderList(Map<String, Object> paramMap) {
		
		List<PurchaseOrderModel> purchaseOrderList=purchaseOrderDao.purchaseOrderList(paramMap);
		
		return purchaseOrderList;
	}

	@Override
	public int countPurchaseOrderList(Map<String, Object> paramMap) {
		
		int total=purchaseOrderDao.countPurchaseOrderList(paramMap);
		
		return total;
	}

	@Override
	public PurchaseOrderModel purchaseOrderSelect(Map<String, Object> paramMap) {
		
		PurchaseOrderModel purchaseOrderSelect=purchaseOrderDao.purchaseOrderSelect(paramMap);
		
		return purchaseOrderSelect;
	}

}
