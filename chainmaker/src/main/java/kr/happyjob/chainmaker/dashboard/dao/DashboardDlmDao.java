package kr.happyjob.chainmaker.dashboard.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.dlm.model.DeliveryBuyerModel;

public interface DashboardDlmDao {
	
	List<DeliveryBuyerModel> deliveryBuyerList(Map<String, Object> paramMap);

}
