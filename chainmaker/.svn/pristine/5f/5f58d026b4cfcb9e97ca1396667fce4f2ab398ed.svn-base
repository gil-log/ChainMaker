package kr.happyjob.chainmaker.pcm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.pcm.dao.RefundFinalProcessingDao;
import kr.happyjob.chainmaker.pcm.model.RefundFinalProcessingModel;

@Service
public class RefundFinalProcessingServiceImpl implements RefundFinalProcessingService {

	@Autowired
	private RefundFinalProcessingDao refundFinalProcessingDao;
	
	@Override
	public List<RefundFinalProcessingModel> refundFinalProcessingList(Map<String, Object> paramMap) {
		
		return refundFinalProcessingDao.refundFinalProcessingList(paramMap);
	}

	@Override
	public int countRefundFinalProcessingList(Map<String, Object> paramMap) {

		return refundFinalProcessingDao.countRefundFinalProcessingList(paramMap);
	}

	@Override
	public RefundFinalProcessingModel refundFinalProcessingSelect(Map<String, Object> paramMap) {
		
		return refundFinalProcessingDao.refundFinalProcessingSelect(paramMap);
	}

	@Override
	public List<RefundFinalProcessingModel> refundFinalProcessingDtlList(Map<String, Object> paramMap) {
		
		return refundFinalProcessingDao.refundFinalProcessingDtlList(paramMap);
	}

	@Override
	public int countRefundFinalProcessingDtlList(Map<String, Object> paramMap) {
		
		return refundFinalProcessingDao.countRefundFinalProcessingDtlList(paramMap);
	}

	@Transactional
	@Override
	public int updateRefundComplete(Map<String, Object> paramMap) {

		return refundFinalProcessingDao.updateRefundComplete(paramMap);
	}
}
