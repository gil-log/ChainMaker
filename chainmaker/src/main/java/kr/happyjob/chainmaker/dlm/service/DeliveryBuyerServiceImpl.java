package kr.happyjob.chainmaker.dlm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.dlm.dao.DeliveryBuyerDao;
import kr.happyjob.chainmaker.dlm.model.DeliveryBuyerModel;

@Service
public class DeliveryBuyerServiceImpl implements DeliveryBuyerService {

	@Autowired
	private DeliveryBuyerDao deliveryBuyerDao;

	@Override
	public List<DeliveryBuyerModel> deliveryBuyerList(Map<String, Object> paramMap) {
		
		return deliveryBuyerDao.deliveryBuyerList(paramMap);
	}

	@Override
	public int countDeliveryBuyerList(Map<String, Object> paramMap) {
		
		return deliveryBuyerDao.countDeliveryBuyerList(paramMap);
	}

	@Override
	public DeliveryBuyerModel deliveryBuyerSelect(Map<String, Object> paramMap) {
		
		return deliveryBuyerDao.deliveryBuyerSelect(paramMap);
	}

	@Override
	public List<DeliveryBuyerModel> deliveryBuyerDtlList(Map<String, Object> paramMap) {

		return deliveryBuyerDao.deliveryBuyerDtlList(paramMap);
	}

	@Override
	public int countDeliveryBuyerDtlList(Map<String, Object> paramMap) {
		
		return deliveryBuyerDao.countDeliveryBuyerDtlList(paramMap);
	}

	@Override
	public int updateDeliveryBuyerShipCD(Map<String, Object> paramMap) {
		
		return deliveryBuyerDao.updateDeliveryBuyerShipCD(paramMap);
	}

	@Override
	public int updateDeliveryBuyerProIOCD(Map<String, Object> paramMap) {

		return deliveryBuyerDao.updateDeliveryBuyerProIOCD(paramMap);
	}

	@Override
	public int updateDeliveryBuyerProWareQty(Map<String, Object> paramMap) {

		return deliveryBuyerDao.updateDeliveryBuyerProWareQty(paramMap);
	}

	@Override
	public int updateFinalDeliveryBuyerShipCD(Map<String, Object> paramMap) {

		return deliveryBuyerDao.updateFinalDeliveryBuyerShipCD(paramMap);
	}
}
