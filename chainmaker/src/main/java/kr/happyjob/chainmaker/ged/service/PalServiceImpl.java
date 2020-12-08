package kr.happyjob.chainmaker.ged.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.chainmaker.ged.dao.PalDao;
import kr.happyjob.chainmaker.ged.model.PalVO;
import kr.happyjob.chainmaker.scm.model.RefundInsVO;

@Transactional
@Service
public class PalServiceImpl implements PalService {

	@Autowired
	PalDao palDao;

	@Override
	public List<PalVO> palList(Map<String, Object> paramMap) throws Exception {

		List<PalVO> palList = palDao.palList(paramMap);

		return palList;
	}

	@Override
	public List<PalVO> palDList(Map<String, Object> paramMap) throws Exception {

		List<PalVO> palDList = palDao.palDList(paramMap);

		return palDList;
	}

	@Override
	public int palTotalCnt(Map<String, Object> paramMap) throws Exception {

		int totalCnt = palDao.palTotalCnt(paramMap);
		return totalCnt;
	}

	@Override
	public int palDTotalCnt(Map<String, Object> paramMap) throws Exception {

		int totalCnt = palDao.palDTotalCnt(paramMap);
		return totalCnt;
	}
}