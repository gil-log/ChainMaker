package kr.happyjob.chainmaker.pcm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.pcm.dao.ReturnPurchseDao;
import kr.happyjob.chainmaker.pcm.model.ReturnPurchaseModel;


@Service
public class ReturnPurchseServiceImpl implements ReturnPurchaseService {

	@Autowired
	private ReturnPurchseDao returnPurchseDao;
	
	@Override
	public List<ReturnPurchaseModel> returnPurchaseList(Map<String, Object> paramMap) {
		
		return returnPurchseDao.returnPurchaseList(paramMap);
	}

	@Override
	public int countReturnPurchaseList(Map<String, Object> paramMap) {
		
		return returnPurchseDao.countReturnPurchaseList(paramMap);
	}

	@Override
	public List<ReturnPurchaseModel> returnPurchaseSelect(Map<String, Object> paramMap) {
		
		return returnPurchseDao.returnPurchaseSelect(paramMap);
	}

	@Override
	public List<ReturnPurchaseModel> returnPurchaseDtlList(Map<String, Object> paramMap) {

		return returnPurchseDao.returnPurchaseDtlList(paramMap);
	}

	@Override
	public int countReturnPurchaseDtlList(Map<String, Object> paramMap) {

		return returnPurchseDao.countReturnPurchaseDtlList(paramMap);
	}
	
	@Override
	public int updateSendRefundDirection(Map<String, Object> paramMap) {

		return returnPurchseDao.updateSendRefundDirection(paramMap);
	}

	@Transactional
	@Override
	public int updateConfirmRefundPrice(Map<String, Object> paramMap) {

		return returnPurchseDao.updateConfirmRefundPrice(paramMap);
	}
}
