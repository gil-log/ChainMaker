package kr.happyjob.chainmaker.dashboard.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.dashboard.dao.DashboardDlmDao;
import kr.happyjob.chainmaker.dlm.model.DeliveryBuyerModel;

@Service
public class DashboardDlmServiceImpl implements DashboardDlmService {

	@Autowired
	DashboardDlmDao dao;
	
	@Override
	public List<DeliveryBuyerModel> deliveryBuyerList(Map<String, Object> paramMap) {
		List<DeliveryBuyerModel> list = dao.deliveryBuyerList(paramMap);
		return list;
	}

}
