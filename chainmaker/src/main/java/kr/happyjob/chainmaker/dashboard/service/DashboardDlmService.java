package kr.happyjob.chainmaker.dashboard.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.dlm.model.DeliveryBuyerModel;

public interface DashboardDlmService {
	
	List<DeliveryBuyerModel> deliveryBuyerList(Map<String, Object> paramMap);

}
