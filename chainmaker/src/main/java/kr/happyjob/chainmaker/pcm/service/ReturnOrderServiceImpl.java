package kr.happyjob.chainmaker.pcm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.pcm.dao.ReturnOrderDao;
import kr.happyjob.chainmaker.pcm.model.ReturnOrderModel;

@Service
public class ReturnOrderServiceImpl implements ReturnOrderService {

	@Autowired
	private ReturnOrderDao returnOrderDao;
	
	@Override
	public List<ReturnOrderModel> returnOrderList(Map<String, Object> paramMap) {
		
		return returnOrderDao.returnOrderList(paramMap);
	}

	@Override
	public int countReturnOrderList(Map<String, Object> paramMap) {
		
		return returnOrderDao.countReturnOrderList(paramMap);
	}

	@Override
	public ReturnOrderModel returnOrderSelect(Map<String, Object> paramMap) {
		
		return returnOrderDao.returnOrderSelect(paramMap);
	}

	@Override
	public int countReturnOrderSelect(Map<String, Object> paramMap) {
		
		return returnOrderDao.countReturnOrderSelect(paramMap);
	}

	@Override
	public int updateRefundCD(Map<String, Object> paramMap) {
		return returnOrderDao.updateRefundCD(paramMap);
	}


}
