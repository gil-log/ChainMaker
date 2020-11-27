package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.scm.dao.RefundInsDao;
import kr.happyjob.chainmaker.scm.model.RefundInsVO;

@Transactional
@Service
public class RefundInsServiceImpl implements RefundInsService {

	@Autowired
	RefundInsDao refundInsDao;

	@Override
	public List<RefundInsVO> refundInsList(Map<String, Object> paramMap) throws Exception {

		List<RefundInsVO> refundInsList = refundInsDao.refundInsList(paramMap);

		return refundInsList;
	}

	@Override
	public int refundInsTotalCnt(Map<String, Object> paramMap) throws Exception {

		int totalCnt = refundInsDao.refundInsTotalCnt(paramMap);

		return totalCnt;
	}
}