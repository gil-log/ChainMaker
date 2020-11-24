package kr.happyjob.chainmaker.ged.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.ged.model.SalesTopModel;

public interface SalesTopDao {
	
	List<SalesTopModel> selectSalesList(Map<String, Object> paramMap);

}
