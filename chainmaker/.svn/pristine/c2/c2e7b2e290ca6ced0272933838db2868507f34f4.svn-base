package kr.happyjob.chainmaker.scm.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.chainmaker.scm.dao.UserInfoDao;
import kr.happyjob.chainmaker.scm.model.UserInfoModel;

@Service
public class UserInfoServiceImpl implements UserInfoService {
	//빌립담당
	
	@Autowired
	UserInfoDao userInfoDao;

	// 회원 목록 조회
	@Override
	public List<UserInfoModel> listUser(Map<String, Object> paramMap) throws Exception {
		
		List<UserInfoModel> listUser = userInfoDao.listUser(paramMap);
		
		return listUser;
	}
	
	
	// 회원 수 조회
	@Override
	public int countListUser(Map<String, Object> paramMap) throws Exception {
		
		int totalCnt = userInfoDao.userTotalCnt(paramMap);
		
		return totalCnt;
	}
	
	//상세 정보 조회
	@Override
	public UserInfoModel detailUser(Map<String, Object> paramMap) throws Exception {
		UserInfoModel detailUser = userInfoDao.detailUser(paramMap);
		
		return detailUser;
	}

}
