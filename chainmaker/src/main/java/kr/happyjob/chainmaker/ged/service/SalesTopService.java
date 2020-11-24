package kr.happyjob.chainmaker.ged.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.ged.model.SalesTopModel;

public interface SalesTopService {
	List<SalesTopModel>selectSalesList(Map<String, Object> paramMap);
}
