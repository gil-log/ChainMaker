package kr.happyjob.chainmaker.scm.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

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

	//회원 정보 업데이트
	@Override
	public int updateUser(Map<String, Object> paramMap) throws Exception {
		
		int resultCnt = userInfoDao.updateUser(paramMap);
		
		return resultCnt;
	}
	
	//회원 정보 삭제
	@Override
	public int deleteUser(Map<String, Object> paramMap) throws Exception {
		
		int resultCnt = userInfoDao.deleteUser(paramMap);
		
		return resultCnt;
	}
	
	
	@Override
	public int comebackUser(Map<String, Object> paramMap) throws Exception {
		int resultCnt = userInfoDao.comebackUser(paramMap);
		
		return resultCnt;
	}
	
	// 회원 정보 삽입
	@Override
	public int insertUser(Map<String, Object> paramMap) throws Exception {

		int resultCnt = userInfoDao.insertUser(paramMap);
		
		return resultCnt;
	}
	
	// 담당업무 select하기
	@Override
	public List<UserInfoModel> listChaCD(Map<String, Object> paramMap) throws Exception {
		List<UserInfoModel> listChaCD = userInfoDao.listChaCD(paramMap);
		return listChaCD;
	}
	
	// loginID 체크
	@Override
	public int check_loginID(UserInfoModel model) throws Exception {
		int result = userInfoDao.check_loginID(model);
		return result;
	}
		
}
