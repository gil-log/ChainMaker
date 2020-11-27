package kr.happyjob.chainmaker.ged.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.ged.dao.SalesTopDao;
import kr.happyjob.chainmaker.ged.model.SalesTopModel;

@Service
public class SalesTopServiceImpl implements SalesTopService {

	@Autowired
	SalesTopDao dao;
	
	@Override
	public List<SalesTopModel> selectSalesList(Map<String, Object> paramMap) {
		List<SalesTopModel> list = dao.selectSalesList(paramMap);
		return list;
	}

}
