package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.scm.dao.PurchaseDirDao;
import kr.happyjob.chainmaker.scm.model.PurchaseDirectionModel;

@Service
public class PurchaseDirServiceImpl implements PurchaseDirService {
	
	@Autowired
	PurchaseDirDao dao;

	@Override
	public List<PurchaseDirectionModel> selectDirection(Map<String, Object> paramMap) {
		List<PurchaseDirectionModel> list = dao.selectDirection(paramMap);
		return list;
	}

	@Override
	public int countDirection(Map<String, Object> paramMap) {
		int count = dao.countDirection(paramMap);
		return count;
	}

}
