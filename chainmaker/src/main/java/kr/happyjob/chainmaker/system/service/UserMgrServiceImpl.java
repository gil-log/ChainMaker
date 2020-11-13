package kr.happyjob.chainmaker.system.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.system.dao.UserMgrDao;
import kr.happyjob.chainmaker.system.model.NoticeModel;
import kr.happyjob.chainmaker.system.model.UserMgrModel;

@Service
public class UserMgrServiceImpl implements UserMgrService {

	@Autowired
	UserMgrDao userMgrDao;

	// 회원 목록 조회
	@Override
	public List<UserMgrModel> listUser(Map<String, Object> paramMap) throws Exception {
		List<UserMgrModel> listUser = userMgrDao.listUser(paramMap);

		return listUser;
	}

	// 회원 수 조회
	@Override
	public int countListUser(Map<String, Object> paramMap) throws Exception {

		int totalCnt = userMgrDao.userTotalCnt(paramMap);

		return totalCnt;
	}

	// 회원 상세 정보 조회
	@Override
	public UserMgrModel detailUser(Map<String, Object> paramMap) throws Exception {
		// 상세정보 가져오기
		UserMgrModel detailUser = userMgrDao.detailUser(paramMap);

		return detailUser;
	}

	@Override
	public int insertUser(Map<String, Object> paramMap) throws Exception {
		//int numResult = userMgrDao.numPlus();
		//paramMap.put("mem_no", numResult); // 번호 여기에 추가
		int resultCnt = userMgrDao.insertUser(paramMap);

		return resultCnt;
	}

	@Override
	public int updateUser(Map<String, Object> paramMap) throws Exception {
		int resultCnt = userMgrDao.updateUser(paramMap);

		return resultCnt;
	}

	@Override
	public int deleteUser(Map<String, Object> paramMap) throws Exception {
		int resultCnt = userMgrDao.deleteUser(paramMap);

		return resultCnt;
	}

}
