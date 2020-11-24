package kr.happyjob.chainmaker.dashboard.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.dashboard.model.PcmModel;

public interface DashboardPcmDao {
	
	List<PcmModel> purchaseOrderList(Map<String, Object> paramMap);

}
