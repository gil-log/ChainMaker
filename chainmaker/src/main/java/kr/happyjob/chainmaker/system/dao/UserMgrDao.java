package kr.happyjob.chainmaker.system.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.chainmaker.system.model.UserMgrModel;

public interface UserMgrDao {

	public List<UserMgrModel> listUser(Map<String, Object> paramMap) throws Exception;

	public int userTotalCnt(Map<String, Object> paramMap) throws Exception;

	public UserMgrModel detailUser(Map<String, Object> paramMap) throws Exception;

	//public int numPlus() throws Exception;

	public int insertUser(Map<String, Object> paramMap) throws Exception;

	public int updateUser(Map<String, Object> paramMap) throws Exception;

	public int deleteUser(Map<String, Object> paramMap) throws Exception;

}
