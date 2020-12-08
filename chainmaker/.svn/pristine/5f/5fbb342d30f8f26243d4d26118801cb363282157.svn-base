package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.scm.dao.WHInventoryFormDao;
import kr.happyjob.chainmaker.scm.model.WHInventoryFormModel;


@Service
public class WHInventoryFormServiceImpl implements WHInventoryFormService {

	@Autowired
	private WHInventoryFormDao whInventoryFormDao;
	
	@Override
	public List<WHInventoryFormModel> whInventoryList(Map<String, Object> paramMap) {
		
		return whInventoryFormDao.whInventoryList(paramMap);
	}

	@Override
	public int countWHInventoryList(Map<String, Object> paramMap) {
		
		return whInventoryFormDao.countWHInventoryList(paramMap);
	}

	@Override
	public List<WHInventoryFormModel> whProductList(Map<String, Object> paramMap) {
		
		return whInventoryFormDao.whProductList(paramMap);
	}

	@Override
	public int countWHProductList(Map<String, Object> paramMap) {
				
		return whInventoryFormDao.countWHProductList(paramMap);
	}
}
