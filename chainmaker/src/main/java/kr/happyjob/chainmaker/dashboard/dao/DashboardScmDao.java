package kr.happyjob.chainmaker.dashboard.dao;

import java.util.List;

import kr.happyjob.chainmaker.dashboard.model.DashboardScmModel;


public interface DashboardScmDao {

	// main tree map 
	public List<DashboardScmModel> getCurdateData();
	
	
	// main bar map
	public List<DashboardScmModel> getBardateData();
	
}
