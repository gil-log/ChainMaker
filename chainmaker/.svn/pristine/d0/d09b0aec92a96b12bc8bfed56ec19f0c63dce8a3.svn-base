package kr.happyjob.chainmaker.pcm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.pcm.dao.OrderDepositProcessingDao;
import kr.happyjob.chainmaker.pcm.model.OrderDepositProcessingModel;

@Service
public class OrderDepositProcessingServiceImpl implements OrderDepositProcessingService {

	@Autowired
	private OrderDepositProcessingDao orderDepositProcessingDao;
	
	@Override
	public List<OrderDepositProcessingModel> orderDepositProcessingList(Map<String, Object> paramMap) {
		
		return orderDepositProcessingDao.orderDepositProcessingList(paramMap);
	}

	@Override
	public int countOrderDepositProcessingList(Map<String, Object> paramMap) {
		
		return orderDepositProcessingDao.countOrderDepositProcessingList(paramMap);
	}

	@Transactional
	@Override
	public int updateOrderDepositProcessing(Map<String, Object> paramMap) {
		
		return orderDepositProcessingDao.updateOrderDepositProcessing(paramMap);
	}

	@Override
	public OrderDepositProcessingModel orderDepositProcessingSelect(Map<String, Object> paramMap) {
		
		return orderDepositProcessingDao.orderDepositProcessingSelect(paramMap);
	}

	@Override
	public List<OrderDepositProcessingModel> orderDepositProcessingDtlList(Map<String, Object> paramMap) {
		
		return orderDepositProcessingDao.orderDepositProcessingDtlList(paramMap);
	}

	@Override
	public int countOrderDepositProcessingDtlList(Map<String, Object> paramMap) {
		
		return orderDepositProcessingDao.countOrderDepositProcessingDtlList(paramMap);
	}
}
