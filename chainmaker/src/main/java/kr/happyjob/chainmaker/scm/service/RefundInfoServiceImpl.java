package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.scm.dao.RefundInfoDao;
import kr.happyjob.chainmaker.scm.model.RefundVO;

@Service
public class RefundInfoServiceImpl implements RefundInfoService {

	@Autowired
	RefundInfoDao refundInfoDao;

	// 반품리스트 
	@Override
	public List<RefundVO> selectRefundList(Map<String, Object> paramMap) throws Exception {
		
		List<RefundVO> selectRefundList = refundInfoDao.selectRefundList(paramMap);
		
		return selectRefundList;
	}

	//반품 리스트 갯수 
	@Override
	public int refundListCnt(Map<String, Object> paramMap) {
		
		int totalCnt = refundInfoDao.refundListCnt(paramMap);
		return totalCnt;
	}

	//검색한 리스트
	@Override
	public List<RefundVO> selectedRefundList(Map<String, Object> paramMap) {
		
		List<RefundVO> selectRefundList = refundInfoDao.selectRefundList(paramMap);
		
		return selectRefundList;
	}

	//검색한 리스트 갯수 
	@Override
	public int selectedRefundCnt(Map<String, Object> paramMap) {
		int totalCnt = refundInfoDao.refundListCnt(paramMap);
		return totalCnt;
	}
	
	
	
	
	
}
