package kr.happyjob.chainmaker.scm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.scm.model.UserInfoModel;

public interface UserInfoDao {
	//빌립담당
	
	// 유저 정보 긁어오기
	public List<UserInfoModel> listUser(Map<String, Object> paramMap) throws Exception;
	
	// 유저 총 숫자 가져오기
	public int userTotalCnt(Map<String, Object> paramMap)throws Exception;
	
	// 상세정보 가져오기
	public UserInfoModel detailUser(Map<String, Object> paramMap) throws Exception;
	
	// 정보 업데이트
	public int updateUser(Map<String, Object> paramMap) throws Exception;
	
	// 정보 삭제
	public int deleteUser(Map<String, Object> paramMap) throws Exception;
	
	// 정보 복구
	public int comebackUser(Map<String, Object> paramMap) throws Exception;
	
	// 정보 삽입
	public int insertUser(Map<String, Object> paramMap) throws Exception;
	
	// 담당업무 select 리스트
	public List<UserInfoModel> listChaCD(Map<String, Object> paramMap) throws Exception;
	
	
	// 회원 등록시 id 체크
	public int check_loginID(UserInfoModel model) throws Exception;

}
